
//common
Drone_fnc_isSaveToFire = { 
	params["_turret","_saveAngleMin","_saveAngleMax",["_saveAngleDown",90]]; 
	private _drone = attachedTo _turret;

	_vector = (_turret weaponDirection currentWeapon _turret); 

	_dir = (1-(vectordir _drone vectorcos  _vector))*90; //0-180 
	
	_elevation = -(_vector vectorcos vectorUp _drone) * 90;

	(_dir > _saveAngleMin) && (_dir < _saveAngleMax) && (_elevation < _saveAngleDown );
};

Drone_fnc_random_target = {
	selectRandom(allUnits select {side _x == EAST});
};

Drone_fnc_screenTarget = {
	params["_turret"];
	private _pos = terrainIntersectAtASL [
		getPosASL _turret,
		(getPosASL _turret) vectorAdd ((_turret weaponDirection currentWeapon _turret) vectorMultiply 5000)
	];

	_pos set [2,0];
	_pos
};

//vls
Drone_fnc_VLS_init = {
	params["_vls"];
	_vls addEventHandler ["Fired", {
		params ["_vls", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

		

		//set starting speed
		
		//_projectile setVelocity ((vectorDir _projectile vectorMultiply 30) vectorAdd (velocity _vls vectorMultiply 5));

		private _pos = (getpos _projectile) vectorAdd (vectorDir _projectile vectorMultiply 10);
		_projectile setpos _pos; 
		cc= _projectile;
		_vls setWeaponReloadingTime [_gunner, _muzzle, 0];
		//_torpedo setVehicleAmmo 1;

	}];

	_vls addEventHandler ["Killed", {
		params ["_vls", "_killer", "_instigator", "_useEffects"];
		detach _vls;
	}];

	_vls disableAI "AUTOTARGET";

};


Drone_fnc_VLS_fire = {

	params ["_base",["_target",objNull,[objNull]]];
	vlss = _base getVariable ["vlss",[]];

	if(!alive _target)exitWith{};
	{
		_vls = _x;

		_vls setVariable ["target",_target];
		west reportRemoteTarget [_target, 3600];  
		_target confirmSensorTarget [west, true]; 
		_vls fireAtTarget [_target, "weapon_vls_01"];
	}forEach vlss;

	
};

//hammer
Drone_fnc_Hammer_init = {
	params ["_hammer"];

	private _drone = attachedto _hammer;
	private _first =  count (_drone getVariable ["hammers",[]]) == 1;//first turret can shoot forward

	//disable turrent if its aiming at other guns
	[_hammer,_first] spawn {
		params["_hammer","_first"];
		
		private _rearmed = false;
		while{alive _hammer}do{
			if([_hammer,[15,0] select _first,165] call Drone_fnc_isSaveToFire)then{
				if(!_rearmed)then{
					_rearmed = true;
					_hammer setWeaponReloadingTime [gunner _hammer, "cannon_120mm_long", 0];
					_hammer setWeaponReloadingTime [gunner _hammer, "weapon_ShipCannon_120mm", 0];
				}
			}else{
				_rearmed = false;
				_hammer setWeaponReloadingTime [gunner _hammer, "cannon_120mm_long", 1];
				_hammer setWeaponReloadingTime [gunner _hammer, "weapon_ShipCannon_120mm", 1];
			};
			sleep 0.1;
		};
	};

	_hammer loadMagazine [[0],"weapon_ShipCannon_120mm","magazine_ShipCannon_120mm_HE_cluster_shells_x2"];//set default mag
	_hammer setWeaponReloadingTime [gunner _hammer, currentMuzzle (gunner _hammer), 0];

	_hammer addWeaponTurret ["cannon_120mm_long",[0]];
	_hammer addMagazineTurret ["12Rnd_120mm_HE_shells_Tracer_Red",[0]];

	_hammer disableAI "AUTOTARGET";
	_hammer addEventHandler ["Fired", {
		params ["_hammer", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

		hint "reload!";
		_hammer setWeaponReloadingTime [_gunner, _muzzle, 0.1];
		_hammer setVehicleAmmo 1;

		_velocity = velocity _projectile vectordiff velocity _hammer;

		if(_weapon == "weapon_ShipCannon_120mm")then{_velocity = _velocity vectorMultiply 4};//make slow mortar round move a bit faster
		_projectile setVelocity _velocity;
	}];
};

Drone_fnc_Hammer_changeType = {
	params ["_hammer","_magName"];


};

Drone_fnc_Hammer_Artillery = {
	params ["_drone","_pos",["_amount",1],["_type",0]];

	if(_pos isEqualType objNull)then{_pos = getpos _pos};

	private _type = ["magazine_ShipCannon_120mm_HE_shells_x32","magazine_ShipCannon_120mm_HE_cluster_shells_x2"] select _type;
	private _hammers = _drone getVariable ["hammers",[]];
	private _amountFired = 0;
	{
		private _hammer = _x;
		if(_amountFired > _amount)exitWith{};
		_hammer doArtilleryFire [_pos, _type, 1];
		_hammer setWeaponReloadingTime [gunner _hammer, currentMuzzle (gunner _hammer), 0];
		_amountFired = _amountFired +1;
	}forEach _hammers;

	
	

	
};

Drone_fnc_Hammer_fire = {
	params [["_drone",objNull,[objNull]],["_pos",objNull,[[],objNull]],["_type",0,[0]]];

	if(_pos isEqualType objNull)then{_pos = getpos _pos};

	[_drone,_pos,_type] spawn {
		params["_drone","_pos","_type"];
		private _hammers = _drone getVariable ["hammers",[]];
		{
			private _hammer = _x;
			_magazine = ["12Rnd_120mm_HE_shells_Tracer_Red","magazine_ShipCannon_120mm_HE_cluster_shells_x2"] select _type;
			[_hammer, _magazine] call Drone_fnc_Hammer_changeType;//fast change
			_hammer doWatch _pos;
		}forEach _hammers;

		sleep 2;//wait for weapon to aim

		{
			private _hammer = _x;
			_hammer fire (["cannon_120mm_long","weapon_ShipCannon_120mm"] select _type);
			sleep 0.5;
		}forEach _hammers;


	};

};

//torpedo
Drone_fnc_Torpedo_init = {
	params ["_torpedo"];

	_torpedo addEventHandler ["Fired", {
		params ["_torpedo", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

		hint "reload!";
		_torpedo setWeaponReloadingTime [_gunner, _muzzle, 0];
		_torpedo setVehicleAmmo 1;
		gunner _torpedo disableAI "ALL";

		//_velocity = velocity _projectile vectordiff velocity _sam;
		//_projectile setVelocity _velocity;
	}];
};

Drone_fnc_Torpedo_fire = {
	params [["_drone",objNull,[objNull]],["_target",objNull,[objNull]],["_amount",1,[1]]];

	[_drone, _target, _amount] spawn {
		params [["_drone",objNull,[objNull]],["_target",objNull,[objNull]],["_amount",1,[1]]];

		private _torpedos =  _drone getVariable["torpedos", []];

		for "_1" from 1 to _amount do {
			private _side = _drone getVariable["torpedo_side", false];
			_torpedo = _torpedos select _side;

			private _missle = "M_Titan_AP" createVehicle (_torpedo modelToWorld [0,4,0]);
			_missle setVectorDir (vectorDir _drone vectorAdd [random 0.05-0.025,random 0.05-0.025,random 0.05-0.025]);
			_missle setVelocity (velocity _torpedo)vectorMultiply 1.5;

			//switch side for next time
			_drone setVariable ["torpedo_side", !_side];
			sleep 0.1;
		};
	};
};


//sam
Drone_fnc_SAM_init = {
	params ["_sam"];

	_sam disableAI "AUTOTARGET";

	//disable turrent if its aiming at other guns
	[_sam] spawn {
		params["_sam"];
		private _rearmed = false;
		while{alive _sam}do{
			if([_sam,10,175,18] call Drone_fnc_isSaveToFire)then{
				if(!_rearmed)then{
					_rearmed = true;
					_sam setWeaponReloadingTime [gunner _sam, "weapon_rim116Launcher", 0];
				}
			}else{
				_rearmed = false;
				_sam setWeaponReloadingTime [gunner _sam, "weapon_rim116Launcher", 1];
			};
			sleep 0.1;
		};
	};


	_sam addEventHandler ["Fired", {
		params ["_sam", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];


		private _pos  = _sam getVariable ["target",[0,0,0]];

		private _pos_projectile = (getpos _projectile) vectorAdd (vectorDir _projectile vectorMultiply 5);
		_projectile setpos _pos_projectile; 

		private _velocity = velocity _projectile vectorAdd velocity _sam;
		_projectile setVelocity _velocity;	

		//if you shoot manualy;
		if(isplayer (UAVControl _sam select 0))then{
			_pos = terrainIntersectAtASL   [
				getPosASL _sam,
				(getPosASL _sam) vectorAdd ((_sam weaponDirection currentWeapon _sam) vectorMultiply 2000)
			];
		};

		//shooting automaticly at planes and helies so target is not set;
		if(_pos isEqualTo [0,0,0])exitWith{};

		_sam setWeaponReloadingTime [_gunner, _muzzle, 0];
		_sam setVehicleAmmo 1;

		[_projectile,_pos]spawn {


			params["_projectile","_pos"];

			_p = 0;
			_y = 0;

			while {alive _projectile}do{
				_yT = ([_pos,_projectile] call BIS_fnc_DirTo) + 180;
				_yC = direction _projectile;
				_yD = _yT - _yC;
				if(_yD > 180)then{_yD = _yD - 360}else{
					if(_yD < -180)then{_yD = _yD + 360};
				};
				_y = _yC;
				if(_yD < 0)then{_y = _y - 4}else{_y = _y + 4};
				_y = _y + (random 10) -5;

				_pT = -atan (((getPosWorld _projectile vectorDiff _pos) select 2) / (_pos distance2d getPosWorld _projectile));
				_pD = _p - _pT;
				if(_pD < 0)then{_p = _p + 15}else{_p = _p - 15};

				_p = _p + (random 10) -5;
				_r = 0;
				_projectile setVectorDirAndUp [
					[ sin _y * cos _p,cos _y * cos _p,sin _p],
					[ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D
				];

				sleep (0.2);
			};
		};//end missle guildence 


	}];
};

Drone_fnc_SAM_fire = {

	params [["_drone",objNull,[objNull]],["_pos",[0,0,0],[[],objNull]],["_amount",1,[1]]];

	if(_pos isEqualType objNull)then{_pos = getpos _pos};
	private _sams = _drone getVariable ["sams",[]];
	private _sam = _sams#0;//we only have one
	diag_log str ["_pos",_pos];
	_sam setVariable ["target",_pos];

	[_sam,_pos,_amount]spawn {
		params["_sam","_pos","_amount"];
		
		_sam doWatch _pos;
		sleep 2;
		for "_i" from 1 to _amount do{
			_sam fire "weapon_rim116Launcher";
			sleep 0.2;
		};
		_sam setVariable ["target",objNull];
	};
};

//miniguns
Drone_fnc_Minigun_init = {
	params ["_minigun"];
	private _drone = attachedTo _minigun;
	private _first =  count (_drone getVariable ["miniguns",[]]) == 1;//first turret can shoot forward

	if(_first)then{
		_minigun addAction ["VLS", {params ["_target"]; [aa, call Drone_fnc_random_target] call Drone_fnc_VLS_fire;}];
		_minigun addAction ["Sam", {params ["_target"];[aa, _target call Drone_fnc_screenTarget,20] call Drone_fnc_SAM_fire}];
		_minigun addAction ["Hammer", {params ["_target"];[aa, _target call Drone_fnc_screenTarget,0] call Drone_fnc_Hammer_fire;}];
		_minigun addAction ["Hammer Cluster", {params ["_target"];[aa, _target call Drone_fnc_screenTarget,1] call Drone_fnc_Hammer_fire;}];
	};


	[_minigun] spawn {
		params["_minigun"];

		_rearmed = false;

		while{alive _minigun}do{
			if([_minigun,15,165] call Drone_fnc_isSaveToFire)then{
				if(!_rearmed)then{
					_rearmed = true;
					_minigun addMagazineTurret ["magazine_Cannon_Phalanx_x1550",[0]];
					_minigun setWeaponReloadingTime [gunner _minigun, "weapon_Cannon_Phalanx", 0];
				}
			}else{
				if(_rearmed)then{
					_rearmed = false;
					_minigun removeMagazineTurret ["magazine_Cannon_Phalanx_x1550",[0]];
					_minigun removeMagazineTurret ["magazine_Cannon_Phalanx_x1550",[0]];
					_minigun removeMagazineTurret ["magazine_Cannon_Phalanx_x1550",[0]];
				};
			};
			sleep 0.1;
		};
	};
};

Drone_fnc_Minigun_fire = {
	params [["_drone",objNull,[objNull]],["_target",objNull,[objNull]]];

	_miniguns = _drone getVariable ["miniguns",[]];

	{
		_minigun = _x;

		_minigun doSuppressiveFire  _target;
	}forEach _miniguns;
	 
};



//events

Drone_fnc_damage_event = {
	params["_obj"];

	_obj addEventHandler ["FiredNear", {
		params ["_obj", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];

		private _drone = attachedto _obj;
		hint "Dammage";
		//[_drone,_firer] call Drone_fnc_Miniguns_fire;
	}];
};

Drone_fnc_IncomingMissile_event = {
	params["_obj"];
	_obj addEventHandler ["IncomingMissile", { 
		params ["_target", "_ammo", "_vehicle", "_instigator"]; 

		private _missle = _vehicle nearObjects ["MissileBase",10] select 0;

		hint str [_missle];

		private _target = "O_UAV_02_F" createVehicle [0,0,0];
		createVehicleCrew _target;  

		_target attachto [_missle, [0,0,3]];

	}];
};

droneData = [
	["B_UAV_02_dynamicLoadout_F",[0,1,0],[0,0,1]],
	[
		["Submarine_01_F",[0,-0.0518756,1.9469],[-8.74228e-008,-1,0],[0,0,1]],
		["B_Ship_MRLS_01_F",[5.32176,-11.2801,3.19051],[0.5,-4.37114e-008,-0.866025],[0.866025,0,0.5]],
		["B_SAM_System_02_F",[-5.008,41.457,-1.05034],[0.258819,0.965926,1.48943e-009],[-0.965926,0.258819,-1.13133e-008]],
		["B_Ship_Gun_01_F",[0,34.9014,6.11816],[0,1,0],[0,0,1]],
		["B_SAM_System_01_F",[0,-17.3679,6.90189],[1,-4.37114e-008,0],[0,0,1]],
		["B_SAM_System_02_F",[5.008,41.457,-1.05034],[-0.258819,0.965926,-5.41468e-008],[0.965926,0.258819,-1.13133e-008]],
		["B_Ship_Gun_01_F",[0,25.945,6.4919],[0,1,0],[0,0,1]],
		["B_AAA_System_01_F",[0,18.695,11.1488],[0,1,0],[0,0,1]],
		["B_AAA_System_01_F",[0,9.91799,11.1488],[-8.74228e-008,-1,0],[0,0,1]],
		["B_Ship_MRLS_01_F",[-5.43206,-11.2801,3.19051],[-0.5,1.19249e-008,-0.866025],[-0.866025,0,0.5]],
		["B_Ship_Gun_01_F",[0,-3.23976,6.7991],[0,1,0],[0,0,1]]
	]
];


Drone_fnc_spawn = {
	params ["_baseType","_attached"];

	_base = createVehicle [ (_baseType#0), getpos player, [],0,"fly"];
	//_base = createVehicle [ (_baseType#0), [100,0,0], [],0];

	_base setVectorDirAndUp [_baseType#1,_baseType#2];
	createVehicleCrew _base;
	_base call Drone_fnc_IncomingMissile_event;
	{
		_obj = _x#0 createVehicle [0,0,0];
		_obj attachTo [_base,_x#1];
		_obj setVectorDirAndUp [_x#2,_x#3];
		

		if(typeof _obj != "B_SAM_System_02_F")then{
			createVehicleCrew _obj;
		};


		_obj call Drone_fnc_IncomingMissile_event;
		_obj call Drone_fnc_damage_event;

		switch (typeof _obj) do {
			case "B_Ship_MRLS_01_F": {
				_old = _base getVariable ["vlss",[]];
				_old pushBack _obj;
				_base setVariable ["vlss", _old];
				_obj call Drone_fnc_VLS_init;
			};
			case "B_Ship_Gun_01_F": {
				_old = _base getVariable ["hammers",[]];
				_old pushBack _obj;
				_base setVariable ["hammers", _old];
				_obj call Drone_fnc_Hammer_init;
			};
			case "B_SAM_System_02_F": {
				_old = _base getVariable ["torpedos",[]];
				_old pushBack _obj;
				_base setVariable ["torpedos", _old];
				_obj call Drone_fnc_Torpedo_init;
			};	
			case "B_SAM_System_01_F": {
				_old = _base getVariable ["sams",[]];
				_old pushBack _obj;
				_base setVariable ["sams", _old];
				_obj call Drone_fnc_SAM_init;
			};
			case "B_AAA_System_01_F": {
				_old = _base getVariable ["miniguns",[]];
				_old pushBack _obj;
				_base setVariable ["miniguns", _old];
				_obj call Drone_fnc_Minigun_init
			};			
			default { };
		};
		

	}foreach _attached;

	_base setVelocity [0,110,0];
	aa = _base;
};

Drone_fnc_delete = {
	params ["_base"];
	private _objects = attachedObjects _base; 
	_objects pushBack _base;
	{
		deleteVehicle _x;
	}foreach _objects;

};




aa call Drone_fnc_delete;

droneData call Drone_fnc_spawn;
player allowDamage false;



removeAllActions player;
player addAction ["VLS cursor", {
	private _target = "ArtilleryTargetE" createVehicle (player call Drone_fnc_screenTarget);
	[aa, _target] call Drone_fnc_VLS_fire;
}];
player addAction ["VLS random target", {
	[aa, call Drone_fnc_random_target] call Drone_fnc_VLS_fire;
}];
player addAction ["Minigun", {
	private _target = "ArtilleryTargetE" createVehicle (player call Drone_fnc_screenTarget);
	[aa, _target] call Drone_fnc_Minigun_fire;
}];
player addAction ["Sam", {params ["_target"];[aa, _target call Drone_fnc_screenTarget,20] call Drone_fnc_SAM_fire}];
player addAction ["Hammer", {params ["_target"];[aa, _target call Drone_fnc_screenTarget,0] call Drone_fnc_Hammer_fire;}];
player addAction ["Hammer Cluster", {params ["_target"];[aa, _target call Drone_fnc_screenTarget,1] call Drone_fnc_Hammer_fire;}];


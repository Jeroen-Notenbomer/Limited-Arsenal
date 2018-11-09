if(!isserver)exitWith{};

_data = _this select 0;
_index = _this select 1;
_object = _this select 2;

_name = _data select 0;

with missionNamespace do{
	private _jng_vehicleList = _object getVariable "jng_vehicleList";
	_array = _jng_vehicleList select _index;

	_nr = 1;
	_newName = (_name + " nr:"+ str _nr);

	//check if name is already in the list
	_nameExist = {
		_return = false;
		{
			_nameCheck = _x select 0;
			if(_newName isEqualTo _nameCheck)exitWith{
				_return = true;
			};
		} forEach _array;
		_return
	};

	//find a name that doesnt exist yet

	while {call _nameExist} do {
		 _nr = _nr + 1;
		 _newName = (_name + " nr:" + str _nr);
	};

	//update name and save
	_data set [0, _newName];

	_array pushback _data;
	_jng_vehicleList set [_index,_array];
	diag_log str [_object,"jng_vehicleList"];
	_object setVariable ["jng_vehicleList",_jng_vehicleList];
};

//update all clients that are looking in the garage
_clients = missionnamespace getVariable ["jng_playersInGarage",[]];
if!(_clients isEqualTo [])then{
	["addVehicle",[_data,_index]] remoteExecCall ["jn_fnc_garage",_clients];
};

params["_vehicle"];
private _turretsArrayName = [typeof _vehicle, true] call BIS_fnc_allTurrets;
private _turretCfgs = ([_vehicle] call BIS_fnc_getTurrets);
if(count _turretsArrayName != count _turretCfgs)then{	_turretsArrayName = [[-1]] + _turretsArrayName;};//add driver
private _turrets = [];
private _totalLoadout = [];

{
	private _turretLoadout = [];
	_x params ["_cfgTurret"];
	private _magazineArray = getArray (_cfgTurret >> "magazines");
	
	{
		_x params["_magClass"];
		private _ammoCount = getNumber(configfile >> "CfgMagazines" >> _magClass >> "count");
		private _inserted = false;
		{
			_x params ["_magClassList","_ammoCountList"];
			if(_magClassList isEqualTo _magClass) then
			{
				_x set [1, (_ammoCountList + _ammoCount)];
				_inserted = true;
			};
		} forEach _turretLoadout;

		if (!_inserted) then
		{
			_turretLoadout pushBack [_magClass, _ammoCount];
		};
	}forEach _magazineArray;
	if(count _turretLoadout != 0)then{
		_turrets pushBack (_turretsArrayName select _forEachIndex);
		_totalLoadout pushBack _turretLoadout;
	};
} forEach _turretCfgs;

[_turrets,_totalLoadout];
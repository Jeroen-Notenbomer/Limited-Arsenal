params[["_vehicle",objNull,[objNull]]];

private _turrets = [];
private _totalLoadout = [];
private _magDetail = magazinesAllTurrets _vehicle;

private "_turretLoadout";
{
	_x params ["_magClass","_turretPath","_ammoCount"];
	if!(_turretPath in _turrets)then{
		_turrets pushBack _turretPath;
		if(!isNil "_turretLoadout")then{_totalLoadout pushBack _turretLoadout;};//skip first one
		_turretLoadout = [];
	};

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

} forEach _magDetail;

_totalLoadout pushBack _turretLoadout;

[_turrets,_totalLoadout];



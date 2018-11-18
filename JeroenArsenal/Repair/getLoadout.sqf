

params["_vehicle"];

private _currentLoadout = [];
private _magDetail = magazinesAllTurrets _vehicle;
private _pylonList = getPylonMagazines _vehicle;
private _pylonRun = 1;
{
	private _magClass = _x select 0;
	private _turretPath = _x select 1;
	private _ammoCount = _x select 2;
	private _pylon = -1;
	if (_magclass in _pylonList) then 
	{_pylon = _pylonRun;_pylonRun = _pylonRun + 1;
	_currentLoadout pushBack [_turretPath, _pylon, _magClass, _ammoCount];
	} else
	{
	private ["_tempAmmo", "_inserted"];
	private _inserted = false;
		{
			if ((_x select 0) isEqualTo _turretPath && (_x select 2) isEqualTo _magClass) then
			{
				_tempAmmo = (_x select 3); 
				_x set [3, (_tempAmmo + _ammoCount)];
				_inserted = true;
			};
		} forEach _currentLoadout;

		if (!_inserted) then
		{
			_currentLoadout pushBack [_turretPath, _pylon, _magClass, _ammoCount];
		};
	};
} forEach _magDetail;

_currentLoadout;
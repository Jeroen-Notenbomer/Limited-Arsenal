params["_vehicle"];

private _loadoutCfg = _vehicle call jn_fnc_garage_rearm_getLoadoutCfg; 
private _loadoutCurrent = _vehicle call jn_fnc_garage_rearm_getLoadoutCurrent;
private _loadoutMissing = [];
private _turrets = [];
{
	private _turret = _x;
	private _loadoutCurrentIndex = _forEachIndex;
	{

		if(_turret isEqualTo _x)exitWith{

			private _missing = [
				(_loadoutCfg select 1 select _forEachIndex),
				(_loadoutCurrent select 1 select _loadoutCurrentIndex)
			] call jn_fnc_common_array_remove;
			if!(_missing isEqualTo [])then{

				_turrets pushBack _turret;
				_loadoutMissing pushBack _missing;
			}
			
		};
	}forEach (_loadoutCfg select 0);	
}forEach (_loadoutCurrent select 0);

[_turrets, _loadoutMissing]

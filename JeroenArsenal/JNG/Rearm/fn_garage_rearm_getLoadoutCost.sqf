/*
	Author: Jeroen Notenbomer

	Description:
	Get loadout cost per turrets

	Parameter(s):
	Object

	Returns: [[[0]],[[["RHS_48Rnd_40mm_MK19",5]]]]
	
	Usage: No use for end user, use  garage_init instead
	
*/

params ["_vehicle"];

_missingAmmoTurrets = _vehicle call jn_fnc_garage_rearm_getLoadoutMissing;

_costTotal = [];
{
	private _missingAmmoTurret = _x;
	private _cost = 0;
	{
		_x params ["_magClass","_amount"];
		_cost = _cost + (([_magClass] call jn_fnc_garage_rearm_getCost) * _amount);
		
	}forEach _missingAmmoTurret;
	_costTotal pushBack _cost;
}forEach (_missingAmmoTurrets select 1);

[_missingAmmoTurrets select 0, _costTotal];
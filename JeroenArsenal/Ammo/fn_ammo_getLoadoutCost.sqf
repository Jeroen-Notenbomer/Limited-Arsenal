/*
	Author: Jeroen Notenbomer

	Description:
	Get loadout cost per turrets

	Parameter(s):
	Object

	Returns: 
	
	Usage: No use for end user, use  garage_init instead
	
*/

params ["_vehicle"];

private _missingAmmoTurrets = _vehicle call JN_fnc_ammo_getLoadoutMissing;

private _turretCost = [];
{
	private _missingAmmoTurret = _x;
	private _cost = 0;
	{
		_x params ["_magClass","_amount"];
		_cost = _cost + (([_magClass] call JN_fnc_ammo_getCost) * _amount);
		
	}forEach _missingAmmoTurret;
	_turretCost pushBack _cost;
}forEach (_missingAmmoTurrets select 1);

private _pylonCost = [];
{
	_x params ["_magClass","_amount"];
	_pylonCost pushback (([_magClass] call JN_fnc_ammo_getCost) * _amount);
}foreach (_vehicle call JN_fnc_ammo_getPylonLoadoutMissing);

[_missingAmmoTurrets select 0, _turretCost, _pylonCost];
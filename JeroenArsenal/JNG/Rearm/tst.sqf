_vehicle = cursorObject;

_missingAmmoTurrets = _vehicle call jn_fnc_garage_rearm_getLoadoutMissing;

_costTotal = [];
{
	private _missingAmmoTurret = _x;
	private _cost = 0;
	{
		_x params ["_magClass","_amount"];
		private _ammoClass = getText(configfile >> "CfgMagazines" >> _magClass >> "ammo");
		_cost = _cost + (getNumber (configfile >> "CfgAmmo" >> _ammoClass >> "cost") * _amount); 
		
	}forEach _missingAmmoTurret;
	_costTotal pushBack _cost;
}forEach (_missingAmmoTurrets select 1);

[_missingAmmoTurrets select 0, _costTotal];
/*
	Author: Jeroen Notenbomer

	Description:
	Get cost of ammo in a magazine

	Parameter(s):
	String: magazine class name

	Returns:
	[_magClass] call jn_fnc_garage_rearm_getCost;
	
*/

params ["_magClass"];


private _ammoClass = getText(configfile >> "CfgMagazines" >> _magClass >> "ammo");

getNumber (configfile >> "CfgAmmo" >> _ammoClass >> "cost"); 
		
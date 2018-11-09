/*
	Author: Jeroen Notenbomer

	Description:
	increasses fuel consumption for a unit while driving a vehicle.
	unit must be local in order for the script to be presistent after respawn

	Parameter(s):
	unit object

	Returns:
	
	Usage: "player call jn_fnc_garage_fuel_consumsion_init;"
	
*/

params["_unit"];

diag_log ("JNG_FUEL start for player:" + name _unit);

_unit addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	if(_role isEqualTo "driver")then{
		_unit call jn_fnc_garage_fuel_consumsion_start;
	};
}];

_unit addEventHandler ["GetOutMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	if(_role isEqualTo "driver")then{
		_unit call jn_fnc_garage_fuel_consumsion_stop;
	};
}];

_unit addEventHandler ["SeatSwitchedMan", {
	params ["_unit1", "_unit2", "_vehicle"];
	if((assignedVehicleRole _unit1 select 0) isEqualTo "driver")then{
		_unit call jn_fnc_garage_fuel_consumsion_start;
	}else{
		_unit call jn_fnc_garage_fuel_consumsion_stop;
	};
}];



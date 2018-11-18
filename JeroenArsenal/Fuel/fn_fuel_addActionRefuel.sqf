#include "defineCommon.inc"
/*
	Author: Jeroen Notenbomer

	Description:
	adds refuel button to object

	Parameter(s):
		Object: to add action to
		int: total amount of fuel that object can store in liters
		(int): starting amount of fuel in object [default: 0]

	Returns:
		Nil
		
	Usage: [this,1000] call jn_fnc_fuel_addActionRefuel
	
*/

params["_vehicle","_fuelCargoCapacity",["_fuelCargo",0]];

//check if it already has a action
if !isnil(_vehicle getVariable "refuelAction_id")exitWith{diag_log ("JN_fuel already init for object: "+str _vehicle)};

private _id = _vehicle addaction [
	"place holder",
	{
		private _vehicle = _this select 0;
		diag_log ["test1",_vehicle];
		//check if object has still fuel
		private _fuelCargo = _vehicle getVariable ["jn_fuel_cargo",0];
		if(_fuelCargo == 0)exitWith{hint "No fuel in object"};
		
		//create select action
		private _script =  {
			params ["_vehicle"];
			private _vehicle2 = cursorObject;
			[_vehicle2,_vehicle] call jn_fnc_fuel_refuel2;
		};
		
		private _conditions = {
			params ["_vehicle"];
			!isnull cursorObject&&{_vehicle distance cursorObject < INT_MAX_DISTANCE_TO_REFUEL}
		};
					
		[_script,_conditions,_vehicle] call jn_fnc_common_addActionSelect;
	},
	[],
	4,
	true,
	false,
	"",
	"alive _target && {_target distance _this < 5} && {player == vehicle player}"
		
];
_vehicle setVariable ["refuelAction_id",_id];

_vehicle setFuelCargo 0; //disable Armas shit because its broken
[_vehicle, _fuelCargoCapacity]	call JN_fnc_fuel_setCargoCapacity;//call this before setting fuel value
[_vehicle, _fuelCargo]			call JN_fnc_fuel_setCargo;//need actionId so we need to run it after we create the action



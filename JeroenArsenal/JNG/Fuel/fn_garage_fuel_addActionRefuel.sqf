/*
	Author: Jeroen Notenbomer

	Description:
	adds refuel button to object

	Parameter(s):
	Object: to add action to
	int: total amount of fuel that object can store in liters
	(int): custom amount of fuel in object [default: 0]

	Returns:
	
	Usage: [this,1000] call jn_fnc_garage_fuel_addActionRefuel
	
*/

#include "..\defineCommon.inc"

params["_object","_fuelCargoCapacity",["_fuelCargo",0]];

_object setFuelCargo 0; //disable Armas shit because its broken
_object setVariable ["jng_fuelCargo",_fuelCargo];
_object setVariable ["jng_fuelCargoCapacity",_fuelCargoCapacity];

_object addaction [
	format ["<img size='1.75' image='\A3\ui_f\data\IGUI\Cfg\Actions\refuel_ca.paa' />%1",localize "STR_JNG_ACT_REFUEL"],
	{
		private _object = _this select 0;
		diag_log ["test1",_object];
		//check if object has still fuel
		private _fuelCargo = _object getVariable ["jng_fuelCargo",0];
		if(_fuelCargo == 0)exitWith{hint "No fuel in object"};
		
		hint format ["%1 liters left. Select vehicle to refuel",_fuelCargo];
		
		//create select action
		private _script =  {
			params ["_object"];
			diag_log ["test2",_object];
			private _vehicle = cursorObject;
			[_vehicle,_object] call jn_fnc_garage_fuel_refuel;
		};
		
		private _conditions = {
			params ["_object"];
			!isnull cursorObject && {!(_object isEqualTo cursorObject)}&&{_object distance cursorObject < MAX_DISTANCE_TO_REFUEL}
		};
					
		[_script,_conditions,_object] call jn_fnc_common_addActionSelect;
	},
	[],
	6,
	true,
	false,
	"",
	"alive _target && {_target distance _this < 5} && {player == vehicle player}"
		
];
#include "defineCommon.inc"
/*
	Author: Jeroen Notenbomer

	Description:
	adds repair button to object

	Parameter(s):
		Object: to add action to
		int: total amount of points that object can store
		(int): starting amount of points in object [default: 0]

	Returns:
		Nil
		
	Usage: [this,1000] call JN_fnc_repair_addActionRepair
	
*/

params[["_vehicle",objNull,[objNull]],["_repairCargoCapacity",0,[0]],["_repairCargo",0,[0,nil]]];

//check if it already has a action
if !isnil(_vehicle getVariable "repairAction_id")exitWith{diag_log ("JN_repair already init for object: "+str _vehicle)};

private _id = _vehicle addaction [
	STR_ACTION_REPAIR(_repairCargo,_repairCargoCapacity),
	{
		private _vehicle = _this select 0;

		//check if object has still repair
		private _repairCargo = _vehicle call JN_fnc_repair_getCargo;
		if(_repairCargo == 0)exitWith{hint "No repair in object"};
		
		//create select action
		private _script =  {
			params ["_vehicle"];
			diag_log ["test2",_vehicle];
			private _vehicle2 = cursorObject;
			[_vehicle2,_vehicle] call JN_fnc_repair_repair;
			private _id = _vehicle getVariable "repairAction_id";
		};
		
		private _conditions = {
			params ["_vehicle"];
			!isnull cursorObject&&{_vehicle distance cursorObject < INT_MAX_DISTANCE_TO_REPAIR}
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
_vehicle setVariable ["repairAction_id",_id];

_vehicle setAmmoCargo 0; //disable Armas shit because its broken
[_vehicle, _repairCargoCapacity]	call JN_fnc_repair_setCargoCapacity;//call this before setting repair value
[_vehicle, _repairCargo]			call JN_fnc_repair_setCargo;//need actionId so we need to run it after we create the action

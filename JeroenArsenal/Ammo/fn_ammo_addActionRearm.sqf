#include "defineCommon.inc"
/*
	Author: Jeroen Notenbomer

	Description:
	adds rearm button to object

	Parameter(s):
		Object: to add action to
		int: total amount of points that object can store
		(int): starting amount of points in object [default: 0]

	Returns:
		Nil
		
	Usage: [this,1000] call JN_fnc_ammo_addActionRearm
	
*/

params["_vehicle","_rearmCargoCapacity",["_rearmCargo",0]];

//check if it already has a action
if !isnil(_vehicle getVariable "rearmAction_id")exitWith{diag_log ("JN_ammo already init for object: "+str _vehicle)};

private _id = _vehicle addaction [
	STR_ACTION_REARM(_rearmCargo,_rearmCargoCapacity),
	{
		private _vehicle = _this select 0;

		//check if object has still ammo
		private _rearmCargo = _vehicle call JN_fnc_ammo_getCargo;
		if(_rearmCargo == 0)exitWith{hint "No ammo in object"};
		
		//create select action
		private _script =  {
			params ["_vehicle"];
			diag_log ["test2",_vehicle];
			private _vehicle2 = cursorObject;
			[_vehicle2,_vehicle] call JN_fnc_ammo_rearm;
			private _id = _vehicle getVariable "rearmAction_id";
		};
		
		private _conditions = {
			params ["_vehicle"];
			!isnull cursorObject&&{_vehicle distance cursorObject < INT_MAX_DISTANCE_TO_REREARM}
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
_vehicle setVariable ["rearmAction_id",_id];

_vehicle setAmmoCargo 0; //disable Armas shit because its broken
[_vehicle, _rearmCargoCapacity]	call JN_fnc_ammo_setCargoCapacity;//call this before setting rearm value
[_vehicle, _rearmCargo]			call JN_fnc_ammo_setCargo;//need actionId so we need to run it after we create the action

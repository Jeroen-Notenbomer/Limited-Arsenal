#include "defineCommon.inc"


params ["_script",{}];

private _id = player addAction [
	"place holder",
	{
		private _script = _this select 3 select 0;
		
		private _id = _this select 2;
		player removeAction _id;
		player setVariable ["jn_cancelAction_id",nil];
		
		call _script;
	},
	[_script],
	7, 
	true,
	false,
	"",
	"alive _target"

];

player setVariable ["jn_cancelAction_id",_id];

call JN_fnc_common_updateActionCancel;
#define UPDATEINTERVAL 0.1
#define REMOVEAFTER 10
#define TEXTGOOD format["<t color='#FFA500'>%1",localize "STR_JNC_ACT_SELECT"]
#define TEXTBAD format["<t color='#808080'>%1",localize "STR_JNC_ACT_SELECT"]


params ["_script","_condition","_object"];

//remove previuse action if existing
private _id = player getVariable "jn_selectAction_id";
if(!isNil "_id")then{
	player removeAction _id;
	player setVariable ["jn_selectAction_id",nil];
};

//add select action
private _id = player addAction [
	TEXTBAD,
	{
		private _object = _this select 3 select 0;
		private _script = _this select 3 select 1;
		
		private _id = _this select 2;
		player removeAction _id;
		player setVariable ["jn_selectAction_id",nil];
		
		if(isNil "_object")exitwith{hint localize "STR_JNC_ACT_SELECT_NO_OBJECT"};
		
		[_object] call _script;
	},
	[_object,_script],
	7, 
	true,
	false,
	"",
	"alive _target"

];

//check if we need to remove action(after REMOVEAFTER secs)
[_id, _object,_condition] spawn {
	params["_id","_object","_condition"];
	private _timer = REMOVEAFTER;
	while {_timer > 0} do{
		sleep UPDATEINTERVAL;
		_timer = _timer - UPDATEINTERVAL;
		player setUserActionText [_id, [TEXTBAD,TEXTGOOD] select ([_object] call _condition)];
		
	};
	player removeAction _id;
	player setVariable ["jn_selectAction_id",nil];
};

player setVariable ["jn_selectAction_id",_id];


hint localize "STR_JNC_ACT_SELECT_HINT";
params["_text",""];

_id = player getVariable "jn_cancelAction_id";

if(isnil "_id")exitWith{};

player setUserActionText [_id,  format["<t color='#FFA500'>%1 (%2)",localize "STR_JNC_ACT_CANCEL",_text]];


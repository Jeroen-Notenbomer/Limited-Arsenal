
params[["_name","",[""]],["_index",-1,[1]],["_locked",-1,[1]],"_object"];

private _jng_vehicleList = _object getVariable "jng_vehicleList";

private _array = _jng_vehicleList select _index;
{
	private _data  = _x;
	private _name2 = _x select 0;
	if(_name2 isEqualTo _name)exitWith{
		_data set [2,_locked];
		_array set [_foreachindex,_data];
	};
} forEach _array;

_jng_vehicleList set [_index,_array];
_object setVariable ["jng_vehicleList", _vehicleList];

//update all clients that are looking in the garage
["updateVehicleSingleData",[_name,_index,nil,_locked]] remoteExecCall ["jn_fnc_garage",missionnamespace getVariable ["jng_playersInGarage",[]]];

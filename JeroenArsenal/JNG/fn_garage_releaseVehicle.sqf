#include "defineCommon.inc"

if(!isserver)exitWith{};

params["_data","_index","_object"];

private _jng_vehicleList = _object getVariable "jng_vehicleList";
private _name = _data select 0;
private _data set [1,""];//set beingChanged to non so others can edit it

private _array = _jng_vehicleList select _index;

{
	private _name2 = _x select 0;
	if(_name2 isEqualTo _name)exitWith{
		_array set [_foreachindex,_data];
	};
} forEach _array;

_jng_vehicleList set [_index,_array];
_object setVariable ["jng_vehicleList", _vehicleList];

//update all clients that are looking in the garage
["updateVehicle",[_data,_index]] remoteExecCall ["jn_fnc_garage",missionnamespace getVariable ["jng_playersInGarage",[]]];

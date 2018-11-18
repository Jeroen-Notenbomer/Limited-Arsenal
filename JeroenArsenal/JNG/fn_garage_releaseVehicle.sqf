#include "defineCommon.inc"

if(!isserver)exitWith{};

params["_data","_index","_object"];

private _vehicleLists = _object getVariable "jng_vehicleLists";
private _vehicleList = (_vehicleLists select _index);

private _name = _data select 0;
_data set [1,""];//set beingChanged to non so others can edit it

{
	private _name2 = _x select 0;
	if(_name2 isEqualTo _name)exitWith{
		_vehicleList set [_foreachindex,_data];
	};
} forEach _vehicleList;

_vehicleLists set [_index,_vehicleList];
_object setVariable ["jng_vehicleLists", _vehicleLists];

//update all clients that are looking in the garage
["updateVehicle",[_data,_index]] remoteExecCall ["jn_fnc_garage",missionnamespace getVariable ["jng_playersInGarage",[]]];

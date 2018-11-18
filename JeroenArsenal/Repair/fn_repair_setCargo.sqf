#include "defineCommon.inc"

params [["_vehicle",objNull,[objNull]],["_amount",0,[0]],["_global",false]];

private _cap = [_vehicle] call JN_fnc_repair_getCargoCapacity;
if(_cap==0 || {_amount > _cap} || {_amount < 0})exitWith{false};

_vehicle setVariable ["jn_repair_cargo",_amount];

//update vehicle mass
private _mass = _vehicle getVariable ["jn_mass", getmass _vehicle];//save default mass
_vehicle setVariable ["jn_mass", _mass];
_vehicle setMass (_mass * (1+((FLOAT_MASSMULTIPLIER-1)*_amount/_cap)));

private _id = _vehicle getVariable "repairAction_id";//error here? you need to initilise action first
if(!isNil "_id")then{
	_vehicle setUserActionText [_id, STR_ACTION_REPAIR(_amount,_cap)];
};

true;
#include "defineCommon.inc"

params [["_vehicle",objNull,[objNull]],["_amount",0,[0]],["_global",false]];

private _cap = [_vehicle] call JN_fnc_fuel_getCapacity;
if(_cap==0 || {_amount > _cap} || {_amount < 0})exitWith{};

_vehicle setVariable ["jn_fuel_cargo",_amount];

if(_global)then{
	_vehicle setFuel (_amount/_cap);
};
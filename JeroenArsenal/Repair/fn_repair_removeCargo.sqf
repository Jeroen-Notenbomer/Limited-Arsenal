#include "defineCommon.inc"

params [["_vehicle",objNull,[objNull]],["_amount",0,[0]]];

private _cargo = (_vehicle call JN_fnc_repair_getCargo) - _amount;

private _error = [_vehicle,_cargo] call JN_fnc_repair_setCargo;

_error;
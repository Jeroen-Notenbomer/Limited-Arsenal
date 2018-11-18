#include "defineCommon.inc"

params["_vehicleTo", "_vehicleFrom"];

if !([_vehicleFrom,222] call JN_fnc_repair_removeCargo)exitWith{};

_vehicleTo setdamage 0;

hint (DISPLAYNAME(_vehicleTo) + " Repaired");

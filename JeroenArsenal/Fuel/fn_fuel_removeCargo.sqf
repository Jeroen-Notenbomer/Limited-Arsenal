params["_vehicle","_amount"];

private _cargo = _vehicle call JN_fnc_fuel_getCargo;
_cargo = _cargo - _amount;
if(_cargo < 0)exitWith{false};//return failure

[_vehicle,_cargo]; call JN_fnc_fuel_setCargo;

//return succes
true;
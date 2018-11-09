params["_vehicle"];

private _fuel = fuel _vehicle;
private _fuelCapacity_jng = _vehicle getVariable "jng_fuelCapacity";
private _remaining = _fuel * _fuelCapacity_jng;

_remaining


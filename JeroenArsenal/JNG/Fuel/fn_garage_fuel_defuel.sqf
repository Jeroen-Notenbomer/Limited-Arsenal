params["_vehicle", "_object", ["_amount",999999]];

//check if object can store fuel
private _fuelTransportCapacity_jng = _object getVariable ["jng_fuelCargoCapacity",0];
if(_fuelTransport_jng == 0)exitWith{hint "object cant store fuel"};

//check how much fuel the transport objects has(fuel truck/tankstation)
private _fuelTransport_jng = _object getVariable ["jng_fuelCargo",0];
if(_fuelTransport_jng == 0)exitWith{hint "No fuel in object"};

//check how much fuel the vehicle can carry
private _fuelCapacity_jng = _vehicle getVariable ["jng_fuelCapacity",0];
if(_fuelCapacity_jng == 0)exitWith{hint "cant refuel vehicle"};

//check how many liters are remaining in vehicle
private _fuel = fuel _vehicle; //0 to 1

//check how much we need to fill up in liters
private _required = (1 - _fuel) * _fuelCapacity_jng;
if(_required == 0)exitwith{hint "vehicle is already full"};

//check if optinal _amount was used
if(_amount > _required)then{_amount = _required};
if(_amount > _fuelTransport_jng)then{_amount = _fuelTransport_jng;};

//update fuel(0-1)
_fuel = _fuel + (_amount/_required);
_fuelTransport_jng = _fuelTransport_jng - _amount;

//updated both Transport and vehicle
_object setVariable ["jng_fuelCargo", _fuelTransport_jng];
_vehicle setfuel _fuel;

hint "refueled vehicle";
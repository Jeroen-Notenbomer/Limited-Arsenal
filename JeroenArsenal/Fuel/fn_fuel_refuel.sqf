#include "defineCommon.inc"

/*
	Author: Jeroen Notenbomer

	Description:
	refuel vehicle with objects fuelCargo.
	used by addActionRefuel

	Parameter(s):
	_object: object to refuel
	_object: object to refuel from
	_amount: custom amount of liters to be transfert
	
	Returns:

	
*/

//we open dialog so we probebly want to spawn this
_this spawn {

	params["_vehicleTo", "_vehicleFrom", ["_amount",999999]];
	private "_anserMsg";//true refuel fuelTank, false refuel fuelCargo
	
	//nil check is done in addactionselect.sqf
	//_vehicleFrom has fuel check is already done in addActionRefuel

	if(_vehicleTo distance _vehicleFrom > INT_MAX_DISTANCE_TO_REFUEL)exitwith{hint "vehicle to far away"};

	//check the options we have where fuel needs to go to and select one
	private _fuelCargoCapacity = _vehicleTo  call jn_fnc_fuel_getCargoCapacity;
	private _fuelCapacity = _vehicleTo call jn_fnc_fuel_getCapacity;

	
	if(_fuelCargoCapacity == 0 && {_fuelCapacity == 0})exitWith{hint "cant refuel vehicle"};
	private _hasBoth = (_fuelCargoCapacity != 0 && {_fuelCapacity != 0});
	if _hasBoth then{
		if(_vehicleTo isEqualTo _vehicleFrom)then{
			_anserMsg = true
		}else{
			_anserMsg = [
				localize "STR_JN_FUEL_ACT_REFUELOPTION", localize "STR_JN_FUEL_ACT_REFUEL", localize "STR_JN_FUEL_ACT_FUELTANK", localize "STR_JN_FUEL_ACT_FUELCARGO"
			] call BIS_fnc_guiMessage;
		};
	};
	
	//exit when object is for example a fuelstation
	if(_vehicleTo isEqualTo _vehicleFrom && !_hasBoth)exitwith{hint "object has no fuel tank"};
	
	if(isNil "_anserMsg")then{
		_anserMsg = (_fuelCargoCapacity == 0);
	};

	private ["_fuel","_fuelCargo","_required"];

	//check how much we need to fill up in liters
	if(_anserMsg)then{
		//refuel tank
		_fuel = fuel _vehicleTo; //0 to 1
		_required = (1 - _fuel) * _fuelCapacity;
	}else{
		//refuel cargo
		_fuelCargo = _vehicleTo call jn_fnc_fuel_getCargo;
		_required = _fuelCargoCapacity - _fuelCargo;
	};

	//check if tank is already full
	if(_required == 0)exitwith{hint "vehicle is already full"};

	//check if optinal _amount was used
	_obj_fuelCargo = _vehicleFrom call jn_fnc_fuel_getCargo;
	if(_amount > _required)then{_amount = _required};
	if(_amount > _obj_fuelCargo)then{_amount = _obj_fuelCargo;};

	//update _vehicleTo
	if(_anserMsg)then{
		_vehicleTo setfuel (_fuel + (_amount/_required));
	}else{
		[_vehicleTo,(_fuelCargo + _amount)] call jn_fnc_fuel_setCargo;
	};

	//updated _vehicleFrom
	[_vehicleFrom,(_obj_fuelCargo - _amount)] call jn_fnc_fuel_setCargo;
	
	hint "Vehicle refueled";


};//spawn
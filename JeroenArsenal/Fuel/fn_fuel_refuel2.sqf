#include "defineCommon.inc"

/*
	Author: Jeroen Notenbomer

	Description:
	refuel vehicle with objects fuelCargo.
	used by addActionRefuel

	Parameter(s):
	_object: object to refuel
	_object: object to refuel from
	
	Returns:

	
*/
_this spawn {
	params[["_vehicleTo",objNull,[objNull]], ["_vehicleFrom",objNull,[objNull]]];

	if(_vehicleTo distance _vehicleFrom > INT_MAX_DISTANCE_TO_REFUEL)exitwith{hint "vehicle to far away"};

	//check the options we have where fuel needs to go to and select one
	private _cargoCapacity = _vehicleTo  call jn_fnc_fuel_getCargoCapacity;
	private _capacity = _vehicleTo call jn_fnc_fuel_getCapacity;

	if(_cargoCapacity == 0 && {_capacity == 0})exitWith{hint "cant refuel vehicle"};

	private _hasBoth = (_cargoCapacity != 0 && {_capacity != 0});
	private "_anserMsg";	
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
		_anserMsg = (_cargoCapacity == 0);
	};


	private _get = 		[jn_fnc_fuel_get, jn_fnc_fuel_getCargo] select _anserMsg;
	private _set = 		[jn_fnc_fuel_set, jn_fnc_fuel_setCargo] select _anserMsg;
			_capacity = [_capacity, _cargoCapacity] select _anserMsg;

	private _amount = _vehicleTo call _get;
	private _amountFrom = _vehicleFrom call jn_fnc_fuel_getCargo;

	//check if tank is already full
	if(_capacity == _amount)exitwith{hint "vehicle is already full"};

	private _refuelAmount = _capacity - _amount; //required for full refuel
	if(_refuelAmount > _amountFrom)then{_refuelAmount= _amountFrom};

	call JN_fnc_common_addActionCancel;
	
	while{_refuelAmount > 0}do{
		if (isNil {player getVariable "jn_cancelAction_id"})exitWith{};
		
		//update
		private _d = 10;
		if(_d > _refuelAmount)then{_d = _refuelAmount};
		[_vehicleTo,(_vehicleTo call _get)+_d] call _set;
		[_vehicleFrom,(_vehicleTo call jn_fnc_fuel_getCargo)-_d] call jn_fnc_fuel_setCargo;
		(str((1-(_refuelAmount/_capacity))*100)) call JN_fnc_common_updateActionCancel;
		sleep 0.5;
	};
	
	//update Global
	[_vehicleTo,(_vehicleTo call _get),true] call _set;
	[_vehicleFrom,(_vehicleTo call jn_fnc_fuel_getCargo),true] call jn_fnc_fuel_setCargo;
	
	hint "Vehicle refueled";


};//spawn
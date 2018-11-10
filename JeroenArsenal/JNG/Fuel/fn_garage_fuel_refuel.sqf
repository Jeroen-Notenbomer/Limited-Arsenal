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
	
	Usage: No use for end user, use  addActionRefuel instead
	
*/

#include "..\defineCommon.inc"

//we open dialog so we probebly want to spawn this
_this spawn {

	params["_objectTo", "_objectFrom", ["_amount",999999]];
	private "_anserMsg";//true refuel fuelTank, false refuel fuelCargo
	
	//nil check is done in addactionselect.sqf
	//_objectFrom has fuel check is already done in addActionRefuel

	if(_objectTo distance _objectFrom > MAX_DISTANCE_TO_REFUEL)exitwith{hint "vehicle to far away"};

	//check the options we have where fuel needs to go to and select one
	private _fuelCargoCapacity = _objectTo getVariable ["jng_fuelCargoCapacity",0];
	private _fuelCapacity = _objectTo getVariable ["jng_fuelCapacity",0];

	
	if(_fuelCargoCapacity == 0 && {_fuelCapacity == 0})exitWith{hint "cant refuel vehicle"};
	private _hasBoth = (_fuelCargoCapacity != 0 && {_fuelCapacity != 0});
	if _hasBoth then{
		if(_objectTo isEqualTo _objectFrom)then{
			_anserMsg = true
		}else{
			_anserMsg = [
				localize "STR_JNG_ACT_REFUELOPTION", localize "STR_JNG_ACT_REFUEL", localize "STR_JNG_ACT_FUELTANK", localize "STR_JNG_ACT_FUELCARGO"
			] call BIS_fnc_guiMessage;
		};
	};
	
	//exit when object is for example a fuelstation
	if(_objectTo isEqualTo _objectFrom && !_hasBoth)exitwith{hint "object has no fuel tank"};
	
	if(isNil "_anserMsg")then{
		_anserMsg = (_fuelCargoCapacity == 0);
	};

	private ["_fuel","_fuelCargo","_required"];

	//check how much we need to fill up in liters
	if(_anserMsg)then{
		//refuel tank
		_fuel = fuel _objectTo; //0 to 1
		_required = (1 - _fuel) * _fuelCapacity;
	}else{
		//refuel cargo
		_fuelCargo = _objectTo getVariable ["jng_fuelCargo",0];
		_required = _fuelCargoCapacity - _fuelCargo;
	};

	//check if tank is already full
	if(_required == 0)exitwith{hint "vehicle is already full"};

	//check if optinal _amount was used
	_obj_fuelCargo = _objectFrom getVariable ["jng_fuelCargo",0];
	if(_amount > _required)then{_amount = _required};
	if(_amount > _obj_fuelCargo)then{_amount = _obj_fuelCargo;};

	//update _objectTo
	if(_anserMsg)then{
		_objectTo setfuel (_fuel + (_amount/_required));
	}else{
		_objectTo setVariable ["jng_fuelCargo", _fuelCargo + _amount];
	};

	//updated _objectFrom
	_objectFrom setVariable ["jng_fuelCargo", (_obj_fuelCargo - _amount)];


	hint "refueled vehicle";


};//spawn
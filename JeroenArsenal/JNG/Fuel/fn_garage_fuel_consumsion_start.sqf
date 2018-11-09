#include "..\defineCommon.inc"

params["_unit"];
_handle = [_unit]spawn {
	params["_unit"];
	private _vehicle = vehicle _unit;
	private _fuelOld = fuel _vehicle;
	while {alive _vehicle} do{
		private _fuelNew = fuel _vehicle;
		if(isengineon _vehicle)then{
			private _delta = _fuelOld - _fuelNew;
			if(_delta>0)then{
				_fuelNew = _fuelNew - (_delta * INT_FUELCONSUMTION_MULTIPLIER);
				_vehicle setfuel _fuelNew;
			};
			_fuelOld = _fuelNew;
		};
		sleep 1;
	};
};
_unit setVariable ["fuelConsumtion_handle",_handle];








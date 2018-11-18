//returns [["PylonRack_12Rnd_missiles",12],["PylonRack_12Rnd_missiles",12]]

params["_veh"];

private _array = [];
{
	private _name = _x;
	private _amountCurrent = _veh ammoOnPylon (_forEachIndex + 1);
	private _amountCfg = getNumber(configfile >> "cfgMagazines">> _name >>"count");
	_array pushBack [_name,(_amountCfg-_amountCurrent)];
}forEach (getPylonMagazines _veh);

_array;
_vehicle = cursorObject;
{
	
	_veh = "Sign_Sphere25cm_F" createVehicle position player; 
	_veh attachTo [_vehicle, [0, -1, 0], _x]; 

}forEach selectionNames _vehicle;
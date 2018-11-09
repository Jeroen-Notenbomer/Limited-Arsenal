params["_vehicle"];
_fuelCapacity = getNumber(configfile >> "CfgVehicles" >> typeOf _vehicle >> "fuelCapacity");

_configs = configProperties [configFile >> "CfgVehicles"];
_names = [];
{
	if(isnumber (_x >> "fuelCapacity")&&{getNumber(_x >> "fuelCapacity") > 0})then{_names = _names + [gettext(_x >> "displayName"), getNumber(_x >> "fuelCapacity")]};
}forEach _configs;



_names
//_transportFuel = getNumber(configfile >> "CfgVehicles" >> typeOf cursorObject>> "fuelCapacity")
//_transportFuel = getNumber(configfile >> "CfgVehicles" >> typeOf _vehicle>> "fuelCapacity")
/*
["Car",100,"Motorcycle",50,"Motorcycle",50,"Tank",700,"APC",700,"Helicopter",1000,"Helicopter",1000,"Plane",1000,"Ship",100,"Small Ship",700,"Big Ship",100,"Car",100,"Paper Car",100,"APC",700,"APC",100,"Car",100,"Car",100,"Helicopter",1000,"Helicopter",1000,"UAV",1000,"Plane",1000,"Plane",1000,"Plane",1000,"A-164 Wipeout",1000,"Tank",700,"Tank",20,"T-100 Varsuk",15,"Tank",20,"Tank",18,"Tank",18,"Tank",24,"Car",100,"Truck",100,"Truck",18,"Hatchback",16,"SUV",16,"Hatchback",16,"Truck",28,"Zamak Transport (Covered)",28,"Tempest",28,"MB 4WD",16,"Offroad",16,"Hunter",26,"$str_A3_cfgvehicles_o_mrap_02_f0",26,"Strider",26,"Prowler",20,"Qilin",20,"Quad Bike",10,"Kart",6,"APC",100,"AMV",24,"MSE-3 Marid",24,"AFV-4 Gorgon",24,"Helicopter",1000,"Helicopter",1000,"MH-9 Hummingbird",242,"MH-9 Hummingbird",242,"M-900",242,"AH-9 Pawnee",242,"AH-9 Pawnee",242,"MH-9 Hummingbird",242,"AH-9 Pawnee",242,"AH-9 Pawnee",242,"M-900",242,"M-900 (Blue)",242,"M-900 (Red)",242,"M-900 (ION)",242,"M-900 (BlueLine)",242,"M-900 (Digital)",242,"M-900 (Elliptical)",242,"M-900 (Furious)",242,"M-900 (GrayWatcher)",242,"M-900 (Jeans)",242,"M-900 (Light)",242,"M-900 (Shadow)",242,"M-900 (Sheriff)",242,"M-900 (Speedy)",242,"M-900 (Sunset)",242,"M-900 (VRANA)",242,"M-900 (Wasp)",242,"M-900 (Wave)",242,"M-900 (Stripped)",242,"M-900 (Luxe)",242,"MH-9 Hummingbird (Stripped)",242,"PO-30 Orca",800,"PO-30 Orca",800,"PO-30 Orca",800,"PO-30 Orca",800,"PO-30 Orca",800,"PO-30 Orca (Unarmed)",800,"PO-30 Orca (Black & White)",800,"AH-99 Blackfoot",500,"AH-99 Blackfoot",500,"AH-99 Blackfoot",500,"AH-99 Blackfoot",500,"Mi-48 Kajman",2500,"Mi-48 Kajman",2500,"Mi-48 Kajman",2500,"Mi-48 Kajman (Black)",2500,"Mi-48 Kajman",2500,"Mi-48 Kajman (Black)",2500,"UH-80 Ghost Hawk",1360,"UH-80 Ghost Hawk",1360,"UH-80 Ghost Hawk (Camo)",1360,"CH-49 Mohawk",2500,"CH-49 Mohawk",2500,"A-143 Buzzard",1000,"A-143 Buzzard",1000,"A-143 Buzzard (CAS)",1000,"A-143 Buzzard (AA)",1000,"A-143 Buzzard (CAS)",1000,"Tank",18,"IFV-6c Panther",18,"CRV-6e Bobcat",18,"IFV-6a Cheetah",18,"Tank",18,"BTR-K Kamysh",18,"ZSU-39 Tigris",18,"Tank",20,"M2A1 Slammer",20,"M4 Scorcher",20,"M4 Scorcher",20,"M4 Scorcher",20,"M5 Sandstorm MLRS",20,"M5 Sandstorm MLRS",20,"M5 Sandstorm MLRS",20,"2S9 Sochor",15,"T-100 Varsuk",15,"T-100 Varsuk",15,"2S9 Sochor",15,"2S9 Sochor",15,"Ship",12,"Ship",12,"Speedboat",12,"Speedboat Minigun",12,"Speedboat Minigun",12,"Speedboat HMG",12,"Assault Boat",12,"Assault Boat",12,"Assault Boat",12,"Rescue Boat",12,"Rescue Boat",12,"Rescue Boat",12,"Rescue Boat",12,"Speedboat Minigun",12,"Assault Boat",12,"SDV",120,"SDV",120,"SDV",120,"SDV",120,"Motorboat",12,"Motorboat",12,"Motorboat (Rescue)",12,"Motorboat (Police)",12,"Assault Boat",12,"Assault Boat",12,"Assault Boat",12,"Hunter GMG",26,"Hunter HMG",26,"Hunter",26,"Hunter GMG",26,"Hunter HMG",26,"$str_A3_cfgvehicles_o_mrap_02_f0",26,"$str_A3_cfgvehicles_o_mrap_02_gmg_f0",26,"Ifrit",26,"Ifrit HMG",26,"Ifrit GMG",26,"Offroad",16,"Offroad",16,"Offroad",16,"Offroad (Repair)",16,"Offroad (Repair)",16,"Offroad (Services)",16,"Offroad (Repair)",16,"Offroad (Repair)",16,"Offroad (Repair)",16,"Offroad",16,"Offroad",16,"Offroad (HMG)",16,"Offroad (AT)",16,"Offroad (AT)",16,"Offroad (HMG)",16,"Offroad",16,"Offroad",16,"Offroad (HMG)",16,"Offroad (HMG)",16,"Offroad (AT)",16,"Offroad (AT)",16,"Offroad (Red)",16,"Offroad (Beige)",16,"Offroad (White)",16,"Offroad (Blue)",16,"Offroad (Dark Red)",16,"Offroad (Blue Custom)",16,"Offroad (Luxe)",16,"Offroad",16,"Offroad (Stripped-down)",16,"Quad Bike",10,"Quad Bike",10,"Quad Bike",10,"Quad Bike",10,"Quad Bike",10,"Quad Bike",10,"Quad Bike",10,"Quad Bike (Black)",10,"Quad Bike (Blue)",10,"Quad Bike (Red)",10,"Quad Bike (White)",10,"Strider HMG",26,"Strider GMG",26,"Strider",26,"Strider HMG",26,"Strider GMG",26,"HEMTT Transport",28,"HEMTT Transport (Covered)",28,"Zamak Transport (Covered)",28,"Zamak Transport (Covered)",28,"Zamak Transport",28,"Zamak Transport (Covered)",28,"Zamak Transport",28,"Zamak Transport (Covered)",28,"Zamak Transport",28,"Hatchback",16,"Hatchback (Sport)",16,"Hatchback (Grey)",16,"Hatchback (Green)",16,"Hatchback (Blue)",16,"Hatchback (Custom Blue)",16,"Hatchback (Custom Beige)",16,"Hatchback (Yellow)",16,"Hatchback (White)",16,"Hatchback (Black)",16,"Hatchback (Dark)",16,"Hatchback (Sport, Red)",16,"Hatchback (Sport, Blue)",16,"Hatchback (Sport, Orange)",16,"Hatchback (Sport, White)",16,"Hatchback (Sport, Grey)",16,"Hatchback (Sport, Green)",16,"SUV",16,"SUV (Red)",16,"SUV (Black)",16,"SUV (Grey)",16,"SUV (Orange)",16,"HEMTT",28,"HEMTT Box",28,"HEMTT Repair",28,"HEMTT Ammo",28,"HEMTT Fuel",28,"HEMTT Medical",28,"Zamak Transport (Covered)",28,"Zamak Transport (Covered)",28,"Zamak Transport (Covered)",28,"Zamak Transport (Covered)",28,"Zamak Repair",28,"Zamak Medical",28,"Zamak Ammo",28,"Zamak Fuel",28,"Zamak Ammo",28,"Zamak Repair",28,"Zamak Medical",28,"Zamak Fuel",28,"Zamak Transport (Covered)",28,"Zamak MRL",28,"Zamak Fuel",28,"Zamak Repair",28,"Truck",18,"Truck",18,"Truck",18,"Truck",18,"Truck",18,"Truck Boxer",18,"Fuel Truck",18,"Fuel Truck",18,"Truck",18,"Truck",18,"Fuel Truck",18,"Fuel Truck",18,"Truck (White)",18,"Truck (Red)",18,"Truck Boxer (White)",18,"Truck Boxer (Red)",18,"Fuel Truck (White)",18,"Fuel Truck (Red, White Tank)",18,"Fuel Truck (White, Red Tank)",18,"Fuel Truck (Red)",18,"GAZ-233011",17.5,"GAZ-233011",17.5,"GAZ-233011",17.5,"GAZ-233011",17.5,"GAZ-233011",17.5,"GAZ-233011 (Camo)",17.5,"GAZ-233011 (Camo)",17.5,"GAZ-233011 (Camo)",17.5,"GAZ-233011 (Camo)",17.5,"GAZ-233011 (Hatch)",17.5,"GAZ-233011 (Hatch)",17.5,"GAZ-233011 (Hatch)",17.5,"GAZ-233011 (Hatch)",17.5,"GAZ-233011 (Camo/Hatch)",17.5,"GAZ-233011 (Camo/Hatch)",17.5,"GAZ-233011 (Camo/Hatch)",17.5,"GAZ-233011 (Camo/Hatch)",17.5,"GAZ-233014",17.5,"GAZ-233014",17.5,"GAZ-233014",17.5,"GAZ-233014",17.5,"GAZ-233014 (Camo)",17.5,"GAZ-233014 (Camo)",17.5,"GAZ-233014 (Camo)",17.5,"GAZ-233014 (Camo)",17.5,"GAZ-233114",32.5,"GAZ-233114",32.5,"GAZ-233114",32.5,"GAZ-233114",32.5,"GAZ-233114 (Camo)",32.5,"GAZ-233114 (Camo)",32.5,"GAZ-233114 (Camo)",32.5,"GAZ-233114 (Camo)",32.5,"WY-55 Hellcat",742,"WY-55 Hellcat",742,"WY-55 Hellcat (Unarmed)",742,"WY-55 Hellcat",742,"WY-55 Hellcat",742,"WY-55 Hellcat (Unarmed)",742,"WY-55 Hellcat",742,"WY-55 Hellcat (Unarmed)",742,"A-164 Wipeout",1000,"A-164 Wipeout (CAS)",1000,"A-164 Wipeout (CAS)",1000,"To-199 Neophron",1000,"To-199 Neophron",1000,"To-199 Neophron (CAS)",1000,"To-199 Neophron (CAS)",1000,"AMV",24,"AMV-7 Marshall",24,"MSE-3 Marid",24,"MSE-3 Marid",24,"MSE-3 Marid",24,"MSE-3 Marid",24,"Tank",24,"FV-720 Mora",24,"Tank",20,"MBT-52 Kuma",20,"M2A4 Slammer UP",20,"AFV-4 Gorgon",24,"AFV-4 Gorgon",24,"AFV-4 Gorgon",24,"AFV-4 Gorgon",24,"AR-2 Darter",100,"AR-2 Darter",100,"Tayran AR-2",100,"AR-2 Darter",100,"MQ-4A Greyhawk",1000,"MQ-4A Greyhawk (CAS)",1000,"MQ-4A Greyhawk",1000,"K40 Ababil-3",1000,"K40 Ababil-3",1000,"MQ-4A Greyhawk (CAS)",1000,"K40 Ababil-3 (CAS)",1000,"K40 Ababil-3 (CAS)",1000,"MQ-4A Greyhawk",1000,"MQ-4A Greyhawk",1000,"K40 Ababil-3",1000,"K40 Ababil-3",1000,"UGV Stomper",14,"UGV Stomper RCWS",14,"UGV Stomper",14,"UGV Saif",14,"UGV Stomper",14,"UGV Stomper RCWS",14,"UGV Saif RCWS",14,"UGV Stomper RCWS",14,"Tempest Transport",28,"Tempest Transport (Covered)",28,"Tempest Repair",28,"Tempest Ammo",28,"Tempest Fuel",28,"Tempest Medical",28,"Tempest (Device)",28,"UAZ-3151",30,"UAZ-3151 (Open)",30,"UAZ-3151 (DShKM)",30,"UAZ-3151 (AGS-30)",30,"UAZ-3151 (SPG-9)",30,"UAZ-3151",30,"UAZ-3151 (Open)",30,"UAZ-3151",30,"UAZ-3151",30,"UAZ-3151",30,"UAZ-3151",30,"UAZ-3151 (Open)",30,"UAZ-3151 (Open)",30,"UAZ-3151 (Open)",30,"UAZ-3151 (Open)",30,"Ural-4320",40,"Ural-4320",40,"Ural-4320",40,"Ural-4320",40,"Ural-4320",40,"Ural-4320",40,"Ural-4320",40,"Ural-4320 (Flatbed)",40,"Ural-4320 (Flatbed)",40,"Ural-4320 (Flatbed)",40,"Ural-4320 (Flatbed)",40,"Ural-4320 (Open)",40,"Ural-4320 (Open)",40,"Ural-4320 (Open)",40,"Ural-4320 (Open)",40,"Ural-4320 (Open/Flatbed)",40,"Ural-4320 (Open/Flatbed)",40,"Ural-4320 (Open/Flatbed)",40,"Ural-4320 (Open/Flatbed)",40,"Ural-4320",40,"Ural-4320 (Fuel)",40,"Ural-4320 (Fuel)",40,"Ural-4320 (Fuel)",40,"Ural-4320 (Fuel)",40,"Ural-4320 (Repair)",40,"Ural-4320 (Repair)",40,"Ural-4320 (Repair)",40,"Ural-4320 (Repair)",40,"BM-21",40,"BM-21",40,"BM-21",40,"BM-21",40,"Ural-4320 (ZU-23-2)",40,"Ural-4320 (ZU-23-2)",40,"Ural-4320 (ZU-23-2)",40,"Ural-4320 (ZU-23-2)",40,"Ural-4320 (ZU-23-2)",40,"Ural-4320",40,"Ural-4320 (Blue)",40,"Ural-4320 (Yellow)",40,"Ural-4320 (Worker)",40,"Ural-4320 (Blue/Open)",40,"Ural-4320 (Yellow/Open)",40,"Ural-4320 (Worker/Open)",40,"Zamak Transport (Covered)",28,"Zamak Transport",28,"Kart",6,"Kart",6,"Kart (Fuel)",6,"Kart (Bluking)",6,"Kart (Redstone)",6,"Kart (Vrana)",6,"Kart (Green)",6,"Kart (Orange)",6,"Kart (White)",6,"Kart (Yellow)",6,"Kart (Black)",6,"CH-67 Huron",1360,"CH-67 Huron",1360,"CH-67 Huron (Unarmed)",1360,"CH-67 Huron (Unarmed)",1360,"CH-67 Huron (Black)",1360,"CH-67 Huron Unarmed (Green)",1360,"CH-67 Huron",1360,"CH-67 Huron",1360,"Mi-290 Taru",2500,"Mi-290 Taru",2500,"Mi-290 Taru (Ammo)",2500,"Mi-290 Taru (Bench)",2500,"Mi-290 Taru (Cargo)",2500,"Mi-290 Taru (Transport)",2500,"Mi-290 Taru (Fuel)",2500,"Mi-290 Taru (Medical)",2500,"Mi-290 Taru (Repair)",2500,"Mi-280 Taru (Black)",2500,"Mi-280 Taru (Ammo, Black)",2500,"Mi-280 Taru (Bench, Black)",2500,"Mi-280 Taru (Cargo, Black)",2500,"Mi-280 Taru (Transport, Black)",2500,"Mi-280 Taru (Fuel, Black)",2500,"Mi-280 Taru (Medical, Black)",2500,"Mi-280 Taru (Repair, Black)",2500,"Prowler (HMG)",20,"Prowler (Unarmed)",20,"Prowler (Light)",20,"Prowler (AT)",20,"Prowler (HMG)",20,"Prowler (AT)",20,"Prowler (HMG)",20,"Prowler (Unarmed)",20,"Prowler (Unarmed)",20,"Prowler (HMG)",20,"Prowler (AT)",20,"Prowler (Unarmed)",20,"Prowler (Light)",20,"Prowler (HMG)",20,"Prowler (HMG)",20,"Prowler (HMG)",20,"Prowler (Unarmed)",20,"Prowler (Unarmed)",20,"Prowler (Unarmed)",20,"Prowler (HMG)",20,"Prowler (HMG)",20,"Prowler (HMG)",20,"Prowler (Unarmed)",20,"Prowler (Unarmed)",20,"Prowler (Unarmed)",20,"Qilin (Minigun)",20,"Qilin (Unarmed)",20,"Qilin (AT)",20,"Qilin (Minigun)",20,"Qilin (Minigun)",20,"Qilin (Unarmed)",20,"Qilin (AT)",20,"Qilin (Unarmed)",20,"Qilin (Minigun)",20,"Qilin (Minigun)",20,"Qilin (Unarmed)",20,"Qilin (AT)",20,"Qilin (Unarmed)",20,"Qilin (Minigun)",20,"Qilin (Minigun)",20,"Qilin (Minigun)",20,"Qilin (Unarmed)",20,"Qilin (Unarmed)",20,"Qilin (Unarmed)",20,"Qilin (Minigun)",20,"Qilin (Minigun)",20,"Qilin (Minigun)",20,"Qilin (Unarmed)",20,"Qilin (Unarmed)",20,"Qilin (Unarmed)",20,"Hunter",26,"Hunter GMG",26,"Hunter HMG",26,"Ifrit",26,"Ifrit HMG",26,"Ifrit GMG",26,"Offroad",16,"MB 4WD",16,"MB 4WD",16,"MB 4WD",16,"MB 4WD",16,"MB 4WD (Black)",16,"MB 4WD (Blue)",16,"MB 4WD (Green)",16,"MB 4WD (Orange)",16,"MB 4WD (Red)",16,"MB 4WD (White)",16,"MB 4WD",16,"MB 4WD (Brown)",16,"MB 4WD (Olive)",16,"MB 4WD (LMG)",16,"MB 4WD (AT)",16,"Quad Bike",10,"Quad Bike",10,"HEMTT",28,"HEMTT Ammo",28,"HEMTT Box",28,"HEMTT Fuel",28,"HEMTT Medical",28,"HEMTT Repair",28,"HEMTT Transport",28,"HEMTT Transport (Covered)",28,"Tempest Transport",28,"Tempest Transport (Covered)",28,"Tempest Repair",28,"Tempest Ammo",28,"Tempest Fuel",28,"Tempest Medical",28,"Tempest (Device)",28,"UGV Saif",14,"UGV Saif RCWS",14,"Truck",18,"Truck (Brown)",18,"Truck (Olive)",18,"Plane",1000,"M-900",242,"UH-80 Ghost Hawk (Sand)",1360,"UH-80 Ghost Hawk (Tropic)",1360,"Caesar BTT",1000,"Caesar BTT",1000,"Caesar BTT (Racing)",1000,"Caesar BTT",1000,"MQ-12 Falcon",100,"MQ-12 Falcon",100,"MQ-12 Falcon",100,"MQ-12 Falcon",100,"KH-3A Fenghuang",1000,"KH-3A Fenghuang",1000,"V-44 X Blackfish",1000,"V-44 X Blackfish (Armed)",1000,"V-44 X Blackfish (Unarmed)",1000,"V-44 X Blackfish (Infantry Transport)",1000,"V-44 X Blackfish (Vehicle Transport)",1000,"V-44 X Blackfish (Infantry Transport)",1000,"V-44 X Blackfish (Vehicle Transport)",1000,"V-44 X Blackfish (Armed)",1000,"V-44 X Blackfish (Infantry Transport)",1000,"V-44 X Blackfish (Infantry Transport)",1000,"V-44 X Blackfish (Vehicle Transport)",1000,"V-44 X Blackfish (Vehicle Transport)",1000,"V-44 X Blackfish (Armed)",1000,"V-44 X Blackfish (Armed)",1000,"Y-32 Xi'an",1000,"Y-32 Xi'an (Infantry Transport)",1000,"Y-32 Xi'an (Vehicle Transport)",1000,"Y-32 Xi'an (Infantry Transport)",1000,"Y-32 Xi'an (Vehicle Transport)",1000,"Y-32 Xi'an (Infantry Transport)",1000,"Y-32 Xi'an (Vehicle Transport)",1000,"Y-32 Xi'an (Infantry Transport)",1000,"Y-32 Xi'an (Vehicle Transport)",1000,"Y-32 Xi'an (Infantry Transport)",1000,"Y-32 Xi'an (Infantry Transport)",1000,"Y-32 Xi'an (Infantry Transport)",1000,"Y-32 Xi'an (Vehicle Transport)",1000,"Y-32 Xi'an (Vehicle Transport)",1000,"Y-32 Xi'an (Vehicle Transport)",1000,"IFV-6a Cheetah",18,"CRV-6e Bobcat",18,"IFV-6c Panther",18,"BTR-K Kamysh",18,"ZSU-39 Tigris",18,"AMV-7 Marshall",24,"MSE-3 Marid",24,"MSE-3 Marid",24,"M4 Scorcher",20,"M5 Sandstorm MLRS",20,"M2A1 Slammer",20,"M2A4 Slammer UP",20,"T-100 Varsuk",15,"2S9 Sochor",15,"Speedboat Minigun",12,"Speedboat HMG",12,"Assault Boat",12,"Assault Boat",12,"Assault Boat",12,"Rescue Boat",12,"Rescue Boat",12,"RHIB",12,"RHIB",12,"RHIB",12,"RHIB",12,"RHIB",12,"RHIB",12,"Water Scooter",12,"Water Scooter",12,"F/A-181 Black Wasp II",1550,"F/A-181 Black Wasp II",1550,"F/A-181 Black Wasp II (Stealth)",1550,"To-201 Shikra",2540,"To-201 Shikra",2540,"To-201 Shikra (Stealth)",2540,"A-149 Gryphon",1550,"A-149 Gryphon",1550,"UCAV Sentinel",1000,"UCAV Sentinel",1000,"Tank",18,"MSE-3 Marid",24,"Offroad",16,"MB 4WD",16,"Zamak Transport (Covered)",28,"Zamak Transport (Covered)",28,"Zamak Transport",28,"Zamak Water",28,"UGV",14,"Truck",18,"Van Transport",18,"Van (Cargo)",18,"Van (Ambulance)",18,"Van (Services)",18,"Van Transport",18,"Van Transport",18,"Van Transport",18,"Van Transport",18,"Van Transport",18,"Van Transport",18,"Van Transport",18,"Van (Cargo)",18,"Van (Cargo)",18,"Van (Cargo)",18,"Van (Cargo)",18,"Van (Cargo)",18,"Van (Cargo)",18,"Van (Cargo)",18,"Van (Ambulance)",18,"Van (Ambulance)",18,"Van (Services)",18,"A-164 Wipeout (Cluster)",1000,"To-199 Neophron (Cluster)",1000,"A-143 Buzzard (Cluster)",1000,"F/A-181 Black Wasp II (Cluster)",1550,"To-201 Shikra (Cluster)",2540,"A-149 Gryphon (Cluster)",1550,"EH302",2500,"Drone",100,"Helicopter",100,"Helicopter",100,"Helicopter",100,"AL-6 Pelican",100,"Jinaah AL-6",100,"AL-6 Pelican",100,"Utility Drone",100,"Utility Drone",100,"Demining Drone",100,"AL-6 Pelican (Medical)",100,"Jinaah AL-6 (Medical)",100,"AL-6 Pelican (Medical)",100,"Utility Drone (Medical)",100,"Utility Drone (Medical)",100,"Tank",20,"Tank",25,"Rhino MGS",24,"Rhino MGS UP",24,"Rhino MGS",24,"Rhino MGS",24,"Rhino MGS UP",24,"Rhino MGS UP",24,"AWC 301 Nyx (AT)",25,"AWC 303 Nyx (Recon)",25,"AWC 302 Nyx (AA)",25,"AWC 304 Nyx (Autocannon)",25,"AWC 301 Nyx (AT)",25,"AWC 303 Nyx (Recon)",25,"AWC 302 Nyx (AA)",25,"AWC 304 Nyx (Autocannon)",25,"Tank",20,"Tank",20,"T-140 Angara",20,"T-140 Angara",20,"T-140K Angara",20,"T-140K Angara",20,"KamAZ-5350",40,"KamAZ-5350",40,"KamAZ-5350",40,"KamAZ-5350",40,"KamAZ-5350",40,"KamAZ-5350 (Open)",40,"KamAZ-5350 (Open)",40,"KamAZ-5350 (Open)",40,"KamAZ-5350 (Open)",40,"KamAZ-5350 (Open)",40,"KamAZ-5350 (Open/Flatbed)",40,"KamAZ-5350 (Open/Flatbed)",40,"KamAZ-5350 (Open/Flatbed)",40,"KamAZ-5350 (Open/Flatbed)",40,"KamAZ-5350 (Open/Flatbed)",40,"KamAZ-5350 (Flatbed)",40,"KamAZ-5350 (Flatbed)",40,"KamAZ-5350 (Flatbed)",40,"KamAZ-5350 (Flatbed)",40,"KamAZ-5350 (Flatbed)",40,"Cannon",20,"P-37",20,"P-37",20,"PRV-13",20,"PRV-13",20,"ZiL-131",30,"ZiL-131",30,"ZiL-131",30,"ZiL-131",30,"ZiL-131",30,"ZiL-131 (Open)",30,"ZiL-131 (Open)",30,"ZiL-131 (Open)",30,"ZiL-131 (Open)",30,"ZiL-131 (Open)",30,"ZiL-131 (Open/Flatbed)",30,"ZiL-131 (Open/Flatbed)",30,"ZiL-131 (Open/Flatbed)",30,"ZiL-131 (Open/Flatbed)",30,"ZiL-131 (Open/Flatbed)",30,"ZiL-131 (Flatbed)",30,"ZiL-131 (Flatbed)",30,"ZiL-131 (Flatbed)",30,"ZiL-131 (Flatbed)",30,"ZiL-131 (Flatbed)",30,"F-22A",1000,"GAZ-66",40,"GAZ-66",40,"GAZ-66",40,"GAZ-66",40,"GAZ-66",40,"GAZ-66 (Flatbed)",40,"GAZ-66 (Flatbed)",40,"GAZ-66 (Flatbed)",40,"GAZ-66 (Flatbed)",40,"GAZ-66 (Open)",40,"GAZ-66 (Open)",40,"GAZ-66 (Open)",40,"GAZ-66 (Open)",40,"GAZ-66 (Open/Flatbed)",40,"GAZ-66 (Open/Flatbed)",40,"GAZ-66 (Open/Flatbed)",40,"GAZ-66 (Open/Flatbed)",40,"GAZ-66 (R-142N)",40,"GAZ-66 (R-142N)",40,"GAZ-66 (R-142N)",40,"GAZ-66 (R-142N)",40,"GAZ-66 (R-142N)",40,"GAZ-66-ESB-8IM",40,"GAZ-66-ESB-8IM",40,"GAZ-66-ESB-8IM",40,"GAZ-66-ESB-8IM",40,"GAZ-66-ESB-8IM",40,"GAZ-66-AP-2",40,"GAZ-66-AP-2",40,"GAZ-66-AP-2",40,"GAZ-66-AP-2",40,"GAZ-66-AP-2",40,"GAZ-66 (Ammo)",40,"GAZ-66 (Ammo)",40,"GAZ-66 (Ammo)",40,"GAZ-66 (Ammo)",40,"GAZ-66 (Ammo)",40,"GAZ-66 (ZU-23-2)",40,"GAZ-66 (ZU-23-2)",40,"GAZ-66 (ZU-23-2)",40,"GAZ-66 (ZU-23-2)",40,"GAZ-66 (ZU-23-2)",40,"BRDM-2",60,"BRDM-2 (9P148)",60,"BRDM-2UM",60,"BRDM-2UM (Armed)",60,"BRDM-2",60,"BRDM-2 (9P148)",60,"BRDM-2UM",60,"BRDM-2UM (Armed)",60,"BRDM-2",60,"BRDM-2 (9P148)",60,"BRDM-2UM",60,"BRDM-2UM (Armed)",60,"BRDM-2",60,"BRDM-2 (9P148)",60,"BRDM-2UM",60,"BRDM-2UM (Armed)",60,"BRDM-2",60,"BRDM-2 (9P148)",60,"BRDM-2UM",60,"BRDM-2UM (Armed)",60,"BRDM-2",60,"BRDM-2 (9P148)",60,"BRDM-2UM",60,"BRDM-2UM (Armed)",60,"BRDM-2",60,"BRDM-2 (9P148)",60,"BRDM-2UM",60,"BRDM-2UM (Armed)",60,"UH1H",781,"UH-1H",781,"UH-1H Gunship",781,"UH-1H Unarmed",781,"UH-1H",781,"UH-1H",781,"L-159 ALCA",1000,"L-159 ALCA",1000,"L-159 (Plamen)",1000,"L-159 (CAP)",1000,"L-159 (CAS)",1000,"L-39C Albatros",1000,"L-39C Albatros",1000,"L-159 ALCA",1000,"L-159 (Plamen)",1000,"L-159 (CAP)",1000,"L-159 (CAS)",1000,"L-39C Albatros",1000,"Plane",1000,"Antonov An-2",1000,"Antonov An-2",1000,"Poseidon II",12,"Poseidon II",12,"Poseidon II",12,"AH-64",1423,"AH-64D",1423,"AH-64D (Ground-Suppression)",1423,"AH-64D (Close-Support)",1423,"AH-64D (AA)",1423,"AH-64D (no radar)",1423,"AH-64D (Ground-Suppression/no radar)",1423,"AH-64D (Close-Support/no radar)",1423,"AH-64D (AA/no radar)",1423,"AH-64D",1423,"AH-64D (Ground-Suppression)",1423,"AH-64D (Close-Support)",1423,"AH-64D (AA)",1423,"AH-64D (no radar)",1423,"AH-64D (Ground-Suppression/no radar)",1423,"AH-64D (Close-Support/no radar)",1423,"AH-64D (AA/no radar)",1423,"AH-64D (OIF Grey)",1423,"AH-1Z",500,"AH-1Z",500,"AH-1Z (Ground-Suppression)",500,"AH-1Z (Close-Support)",500,"AH-1Z",500,"AH-1Z (Ground-Suppression)",500,"AH-1Z (Close-Support)",500,"CH-47F",3200,"CH-47F",3200,"CH-47F",3200,"CH-47F (D)",3200,"UH-80 Ghost Hawk",1360,"UH-60",1372,"UH-60",1372,"UH-60M",1372,"UH-60M MEV (ESSS)",1367,"UH-60M",1372,"UH-60M MEV (ESSS)",1367,"UH-60M (Unarmed)",1372,"UH-60M (Unarmed)",1372,"UH-60M (ESSS)",1372,"UH-60M (EWS)",1372,"UH-60M (ESSS)",1372,"UH-60M (EWS)",1372,"UH-60M MEV",1367,"UH-60M MEV",1367,"WY-55 Hellcat",742,"UH-1Y (MG)",600,"UH-1Y (MG)",600,"UH-1Y (MG)",600,"UH-1Y (MG)",600,"UH-1Y",600,"UH-1Y",600,"UH-1Y (Ground-Suppression)",600,"UH-1Y (Ground-Suppression)",600,"UH-1Y (Unarmed)",600,"UH-1Y (Unarmed)",600,"Plane",1000,"C-130J",1000,"A-10A",1000,"A-10A (AT)",1000,"A-10A (Cluster)",1000,"Cruise Missile",1000,"Cruise Missile 2",14,"M2 Bradley",24.15,"M2A2ODS",24.15,"M2A2",24.15,"M2A2ODS (BUSK I)",24.15,"M2A3",24.15,"M2A3 (BUSK I)",24.15,"M2A3 (BUSK III)",24.15,"M2A3 (BUSK III)",24.15,"M6A2",24.15,"M2A2ODS",24.15,"M2A2ODS (BUSK I)",24.15,"M2A3 (BUSK I)",24.15,"M2A3",24.15,"M6A2",24.15,"Caiman",20,"M1220",20,"Caiman",20,"M1220 (M2)",20,"M1220 (Mk19)",20,"M1220 (M2 CROWS)",20,"M1230 (M2)",20,"M1230 (Mk19)",20,"M1230A1 (MEDEVAC)",20,"M1220",20,"M1220 (M2)",20,"M1220 (Mk19)",20,"M1230 (M2)",20,"M1230 (Mk19)",20,"M1220 (M2 CROWS)",20,"M1230A1 (MEDEVAC)",20,"CH-53E",2500,"CH-53E",2500,"Cougar",20,"CGR CAT1A2",20,"Cougar",20,"CGR CAT1A2 (M2)",20,"CGR CAT1A2 (Mk 19)",20,"CGR CAT1A2",20,"CGR CAT1A2 (M2)",20,"CGR CAT1A2 (Mk 19)",20,"FMTV",24,"M1078A1P2",24,"M1078A1P2 (Open)",24,"M1078A1P2 (Flatbed)",24,"M1078A1P2-B",24,"M1078A1P2-B (Open)",24,"M1078A1P2-B (Flatbed)",24,"M1078A1P2-B (M2)",24,"M1078A1P2-B (M2/Open)",24,"M1078A1P2-B (M2/Flatbed)",24,"M1083A1P2",24,"M1083A1P2-B",24,"M1083A1P2-B (M2)",24,"M1083A1P2 (Open)",24,"M1083A1P2 (Flatbed)",24,"M1083A1P2-B (Open)",24,"M1083A1P2-B (Flatbed)",24,"M1083A1P2-B (M2/Open)",24,"M1083A1P2-B (M2/Flatbed)",24,"M1084A1P2",24,"M1084A1P2-B",24,"M1084A1P2-B (M2)",24,"M1078A1P2-B CP Box",24,"M1085A1P2B (CBPS)",24,"M1078A1P2-B (M2)",24,"M1078A1P2-B",24,"M1078A1P2",24,"M1078A1P2-B CP Box",24,"M1078A1P2-B (M2/Open)",24,"M1078A1P2-B (Open)",24,"M1078A1P2 (Open)",24,"M1078A1P2-B (M2/Flatbed)",24,"M1078A1P2-B (Flatbed)",24,"M1078A1P2 (Flatbed)",24,"M1083A1P2-B",24,"M1083A1P2-B (M2)",24,"M1083A1P2",24,"M1083A1P2-B (Open)",24,"M1083A1P2-B (M2/Open)",24,"M1083A1P2 (Open)",24,"M1083A1P2-B (Flatbed)",24,"M1083A1P2-B (M2/Flatbed)",24,"M1083A1P2 (Flatbed)",24,"M1084A1P2",24,"M1084A1P2-B (M2)",24,"M1084A1P2-B",24,"M1085A1P2B (CBPS)",24,"M1078A1P2-B (M2)",24,"M1078A1P2-B",24,"M1078A1P2",24,"M1078A1P2-B CP Box",24,"M1078A1P2-B (M2/Open)",24,"M1078A1P2-B (Open)",24,"M1078A1P2 (Open)",24,"M1078A1P2-B (M2/Flatbed)",24,"M1078A1P2-B (Flatbed)",24,"M1078A1P2 (Flatbed)",24,"M1083A1P2-B",24,"M1083A1P2-B (M2)",24,"M1083A1P2",24,"M1083A1P2-B (Open)",24,"M1083A1P2-B (M2/Open)",24,"M1083A1P2 (Open)",24,"M1083A1P2-B (Flatbed)",24,"M1083A1P2-B (M2/Flatbed)",24,"M1083A1P2 (Flatbed)",24,"M1084A1P2",24,"M1084A1P2-B (M2)",24,"M1084A1P2-B",24,"M1085A1P2B (CBPS)",24,"M1078A1R SOV (M2)",24,"M1084A1R SOV (M2)",24,"M1084A1R SOV (M2)",24,"M1078A1R SOV (M2)",24,"M1078A1P2-B CP Box",24,"M1085A1P2B (CBPS)",24,"M1078A1P2-B CP Box",24,"M1085A1P2B (CBPS)",24,"M977A4",24,"M977A4",24,"M977A4-B",24,"M977A4-B (M2)",24,"M977A4-B (M2/Ammo)",24,"M977A4 (Ammo)",24,"M977A4-B (Ammo)",24,"M977A4 (Repair)",24,"M977A4-B (Repair)",24,"M977A4-B  (M2/Repair)",24,"M978A4",24,"M978A4-B",24,"M977A4",24,"M977A4-B",24,"M977A4-B (M2)",24,"M977A4 (Repair)",24,"M977A4-B (Repair)",24,"M977A4-B  (M2/Repair)",24,"M977A4 (Ammo)",24,"M977A4 B-KIT (Ammo) D",24,"M977A4 B-KIT (M2-Ammo) D",24,"M978A4",24,"M978A4 B-KIT D",24,"M142 HIMARS",24,"M142 HIMARS",24,"M142 HIMARS",24,"M142 HIMARS",24,"M142 HIMARS",24,"Hunter",26,"M1097A2 (2D/Open)",24,"M1097A2 (2D/Open)",24,"M1123 (2D/Open/Snorkel)",24,"M1123 (2D/Open/Snorkel)",24,"M1097A2 (2D/Half)",24,"M1097A2 (2D/Half)",24,"M1123 (2D/Half/Snorkel)",24,"M1123 (2D/Half/Snorkel)",24,"M1097A2 (2D)",24,"M1097A2 (2D)",24,"M1123 (2D/Snorkel)",24,"M1123 (2D/Snorkel)",24,"M1097A2 (4D/Open)",24,"M1097A2 (4D/Open)",24,"M1123 (4D/Open/Snorkel)",24,"M1123 (4D/Open/Snorkel)",24,"M1097A2 (4D/Half)",24,"M1097A2 (4D/Half)",24,"M1123 (4D/Half/Snorkel)",24,"M1123 (4D/Half/Snorkel)",24,"M1097A2 (4D)",24,"M1097A2 (4D)",24,"M1123 (4D/Snorkel)",24,"M1123 (4D/Snorkel)",24,"M1025A2 (Unarmed)",22.5,"M1025A2 (Unarmed)",22.5,"M1025A2 (Unarmed/Snorkel)",22.5,"M1025A2 (Unarmed/Snorkel)",22.5,"M1025A2 (M2)",22.5,"M1025A2 (M2)",22.5,"M1025A2 (M2/Snorkel)",22.5,"M1025A2 (M2/Snorkel)",22.5,"M1025A2 (Mk19)",22.5,"M1025A2 (Mk19)",22.5,"M1025A2 (Mk19/Snorkel)",22.5,"M1025A2 (Mk19/Snorkel)",22.5,"M966A1 (M220A2)",22.5,"M966A1 (M220A2)",22.5,"M1043A2 (Unarmed)",22.5,"M1043A2 (Unarmed)",22.5,"M1043A2 (Unarmed/Snorkel)",22.5,"M1043A2 (Unarmed/Snorkel)",22.5,"M1043A2 (M2)",22.5,"M1043A2 (M2)",22.5,"M1043A2 (M2/Snorkel)",22.5,"M1043A2 (M2/Snorkel)",22.5,"M1043A2 (Mk19)",22.5,"M1043A2 (Mk19)",22.5,"M1043A2 (Mk19/Snorkel)",22.5,"M1043A2 (Mk19/Snorkel)",22.5,"M1045A2 (M220A2)",22.5,"M1045A2 (M220A2)",22.5,"M1045A2 (M220A2/Snorkel)",22.5,"M1045A2 (M220A2/Snorkel)",22.5,"M109A6",19.5,"M109A6",19.5,"M109A6",19.5,"M1117 ASV",35,"M1117 ASV",35,"M1117 ASV",35,"M1117 ASV (OD)",35,"M113A3 (M2)",24,"M113A3 (M2)",24,"M113A3 (Ammo)",24,"M113A3 (Unarmed)",24,"M113A3 (MEV)",24,"M113A3 (M240)",24,"M113A3 (Mk19)",24,"M113A3 (M2)",24,"M113A3 (Ammo)",24,"M113A3 (Unarmed)",24,"M113A3 (MEV)",24,"M113A3 (M240)",24,"M113A3 (Mk19)",24,"M113A3 (M2/Early)",24,"M113A3 (Mk19/Early)",24,"M1A1SA",20,"M1A1SA",20,"M1A1SA",20,"M1A1SA (TUSK I)",20,"M1A1SA (TUSK I)",20,"M1A1FEP",20,"M1A1FEP",20,"M1A1FEP (O)",20,"M1A1HC",20,"M1A2SEPv1",20,"M1A2SEPv1",20,"M1A2SEPv1",20,"M1A2SEPv1 (TUSK I)",20,"M1A2SEPv1 (TUSK I)",20,"M1A2SEPv1 (TUSK II)",20,"M1A2SEPv1 (TUSK II)",20,"Ship",12,"Mk.V SOC",1000,"MRZR 4",28,"MRZR 4",28,"MRZR 4 (mud)",28,"MRZR 4 (W)",28,"MRZR 4 (W, mud)",28,"MTVR",78,"Mk23 MTVR",78,"RG-33 (Unarmed)",78,"RG-33",78,"RG-33",78,"RG-33 (M2)",78,"RG-33 (M2)",78,"RG-33",78,"RG-33",78,"RG-33 (M2)",78,"RG-33 (M2)",78,"RG33L",20,"M1232",20,"RG33L",20,"M1232 (M2)",20,"M1232 (Mk19)",20,"M1237 (M2)",20,"M1237 (Mk19)",20,"M1232 (M2)",20,"M1232 (M2)",20,"M1232 (Mk19)",20,"M1232 (Mk19)",20,"M1232",20,"M1232 (M2)",20,"M1232 (Mk19)",20,"M1237 (M2)",20,"M1237 (Mk19)",20,"2S3M1",25,"2S3M1",25,"Mi-24P",2130,"Mi-24V",2130,"Mi-24D",2130,"Mi-24D (early)",2130,"Mi-24P",2130,"Mi-24P",2130,"Mi-24P",2130,"Mi-24P (CAS)",2130,"Mi-24P (CAS)",2130,"Mi-24P (CAS)",2130,"Mi-24P (CAS)",2130,"Mi-24P (AT)",2130,"Mi-24P (AT)",2130,"Mi-24P (AT)",2130,"Mi-24P (AT)",2130,"Mi-24P",2130,"Mi-24V",2130,"Mi-24V",2130,"Mi-24V",2130,"Mi-24V (FAB)",2130,"Mi-24V (FAB)",2130,"Mi-24V (FAB)",2130,"Mi-24V (FAB)",2130,"Mi-24V (UPK)",2130,"Mi-24V (UPK)",2130,"Mi-24V (UPK)",2130,"Mi-24V (UPK)",2130,"Mi-24V (AT)",2130,"Mi-24V (AT)",2130,"Mi-24V (AT)",2130,"Mi-24V (AT)",2130,"Mi-24VT",2130,"Mi-24VT",2130,"Mi-24V",2130,"Mi-8",1870,"Mi-8MTV-3",1870,"Mi-8MTV-3 (Heavy)",1870,"Mi-8AMTSh",1870,"Mi-8AMT",1870,"Mi-8",1870,"Mi-8MTV-3",1870,"Mi-8MTV-3 (Heavy)",1870,"Mi-8AMTSh",1870,"Mi-8AMT",1870,"Mi-8MT",1870,"Mi-8MT",1870,"Mi-8MT",1870,"Mi-8MT",1870,"Mi-8MT (Cargo)",1870,"Mi-8MT (Cargo)",1870,"Mi-8MT (Cargo)",1870,"Mi-8MT (Cargo)",1870,"Mi-8MTV-3",1870,"Mi-8MTV-3",1870,"Mi-8MTV-3",1870,"Mi-8MTV-3 (UPK)",1870,"Mi-8MTV-3 (UPK)",1870,"Mi-8MTV-3 (UPK)",1870,"Mi-8MTV-3 (FAB)",1870,"Mi-8MTV-3 (FAB)",1870,"Mi-8MTV-3 (FAB)",1870,"Mi-8MTV-3 (Cargo)",1870,"Mi-8MTV-3 (Cargo)",1870,"Mi-8MTV-3 (Cargo)",1870,"Mi-8MTV-3 (Heavy)",1870,"Mi-8MTV-3 (Heavy)",1870,"Mi-8MTV-3 (Heavy)",1870,"Mi-8AMT",1870,"Mi-8AMT",1870,"Mi-8AMT",1870,"Mi-8AMTSh",1870,"Mi-8AMTSh",1870,"Mi-8AMTSh (UPK)",1870,"Mi-8AMTSh (UPK)",1870,"Mi-8AMTSh (FAB)",1870,"Mi-8AMTSh (FAB)",1870,"Mi-8AMT",1870,"Su-25",1000,"Su-25",1000,"Su-25",1000,"Su-25 (KH29)",1000,"Su-25 (CAS)",1000,"Su-25 (Cluster)",1000,"Su-25",1000,"Su-25 (KH29)",1000,"Su-25 (CAS)",1000,"Su-25 (Cluster)",1000,"Ka-52",1870,"Ka-52",1870,"Ka-52",1870,"Ka-52",1870,"Ka-52 (UPK)",1870,"Ka-52 (UPK)",1870,"Pchela-1T",500,"Pchela-1T",500,"Pchela-1T",500,"KAMAZ-63968",250,"KAMAZ-63968",250,"Ka-60",800,"Ka-60",800,"T-50 obr. 2011",1000,"T-50 obr. 2011 (external pylons)",1000,"T-50 obr. 2011 (051)",1000,"T-50 obr. 2011 (052)",1000,"T-50 obr. 2011 (053)",1000,"T-50 obr. 2012 (054)",1000,"T-50 obr. 2013 (055)",1000,"Tu-95MS6 Bear",1000,"Tu-95MS6 Bear",1000,"Tu-95MS6 Bear 'Dubna'",1000,"Tu-95MS6 Bear 'Irkutsk'",1000,"Tu-95MS6 Bear 'Tambov'",1000,"Tu-95MS6 Bear 'Chelyabinsk'",1000,"BMD-2",30,"BMD-2",30,"BMD-1",30,"BMD-1",30,"BMD-1K",30,"BMD-1P",30,"BMD-1PK",30,"BMD-1R",30,"BMD-2",30,"BMD-2M",30,"BMD-2K",30,"BMP-3 (early)",30,"BMP-3 (early)",30,"BMP-3 (late)",30,"BMP-3 (Vesna-K)",30,"BMP-3 (Vesna-K/A)",30,"BMP-1",29.5,"BMP-1",29.5,"BMP-1",29.5,"BMP-1",29.5,"BMP-1",29.5,"BMP-1",29.5,"BMP-1",29.5,"BMP-1P",29.5,"BMP-1P",29.5,"BMP-1P",29.5,"BMP-1P",29.5,"BMP-1P",29.5,"BMP-1K",29.5,"BMP-1K",29.5,"BMP-1K",29.5,"BMP-1K",29.5,"BMP-1K",29.5,"BMP-1D",29.5,"BMP-1D",29.5,"BMP-1D",29.5,"BMP-1D",29.5,"BMP-1D",29.5,"PRP-3",29.5,"PRP-3",29.5,"PRP-3",29.5,"PRP-3",29.5,"PRP-3",29.5,"BMP-2 (obr. 1980g.)",29.5,"BMP-2 (obr. 1980g.)",29.5,"BMP-2 (obr. 1980g.)",29.5,"BMP-2 (obr. 1980g.)",29.5,"BMP-2 (obr. 1980g.)",29.5,"BMP-2 (obr. 1986g.)",29.5,"BMP-2 (obr. 1986g.)",29.5,"BMP-2 (obr. 1986g.)",29.5,"BMP-2 (obr. 1986g.)",29.5,"BMP-2 (obr. 1986g.)",29.5,"BMP-2K",29.5,"BMP-2K",29.5,"BMP-2K",29.5,"BMP-2K",29.5,"BMP-2K",29.5,"BMP-2D",29.5,"BMP-2D",29.5,"BMP-2D",29.5,"BMP-2D",29.5,"BMP-2D",29.5,"Obyekt-681-2",29.5,"BRM-1K",29.5,"BRM-1K",29.5,"BRM-1K",29.5,"BRM-1K",29.5,"BRM-1K",29.5,"BRM-1K",29.5,"BTR-70",25,"BTR-70",25,"BTR-70",25,"BTR-70",25,"BTR-70",25,"BTR-80",30,"BTR-80",30,"BTR-80",30,"BTR-80",30,"BTR-80A",30,"BTR-80A",30,"BTR-80A",30,"BTR-80A",30,"Mi-28N",2130,"Mi-28N",2130,"Mi-28N (S-13)",2130,"Mi-28N",2130,"Mi-28N",2130,"Mi-28N (S-13)",2130,"Mi-28N (S-13)",2130,"MiG-29S",500,"MiG-29SM",500,"MiG-29S",500,"MiG-29S",500,"MiG-29S",500,"MiG-29SM",500,"MiG-29SM",500,"MiG-29SM",500,"PTS-M",672,"PTS-M",672,"9P129-1M (9M79-1-F)",20,"9P129-1M (9M79-1-F)",20,"9P129-1M (9M79-1-K)",20,"9P129-1M (9M79B)",20,"2S25",25,"2S25",25,"BMD-4",560,"BMD-4M",560,"BMD-4M (A)",560,"T-72B (obr. 1984g.)",29.5,"T-72B (obr. 1984g.)",29.5,"T-72B (obr. 1985g.)",29.5,"T-72B (obr. 1989g.)",29.5,"T-72B3 (obr. 2012g.)",29.5,"T-72B3 (obr. 2016g.)",29.5,"T-90 (obr. 1992g.)",29.5,"T-90A (obr. 2006g.)",29.5,"T-80B",19.5,"T-80B",19.5,"T-80BK",19.5,"T-80BV",19.5,"T-80BVK",19.5,"T-80",19.5,"T-80A",19.5,"T-80U",19.5,"T-80UK",19.5,"T-80U (45M)",19.5,"T-80UE-1",19.5,"T-80UM",19.5,"Mi-24V",2130,"Mi-24V",2130,"Mi-24G",2130,"Mi-24G (UPK)",2130,"Mi-24G (FAB)",2130,"Mi-24G",2130,"Mi-24G (UPK)",2130,"Mi-24G (FAB)",2130,"Helicopter",236,"OH-6M",236,"AH-6M Little Bird",436,"AH-6M-L Little Bird",436,"AH-6M-M Little Bird",436,"AH-6M-H Little Bird",436,"MH-6M Little Bird",436,"BTR-60PB",22.5,"BTR-60PB",22.5,"BTR-60PB",22.5,"BTR-60PB",22.5,"BTR-60PB",22.5,"ZSU-23-4V",30,"ZSU-23-4V",30,"UAZ-3151",30,"UAZ-3151 (Open)",30,"UAZ-3151",30,"UAZ-3151 (Open)",30,"UAZ-3151 (DShKM)",30,"UAZ-3151 (AGS-30)",30,"UAZ-3151 (SPG-9)",30,"Ural-4320",40,"Ural-4320 (Open)",40,"Ural-4320 (Worker/Open)",40,"Ural-4320 (Worker/Open)",40,"BM-21",40,"Mi-8AMT",1870,"ZSU-23-4V",30,"BMP-1",29.5,"BMP-1P",29.5,"BMP-1D",29.5,"BMP-1K",29.5,"BMP-2 (obr. 1986g.)",29.5,"BMP-2 (obr. 1980g.)",29.5,"BMP-2K",29.5,"BMP-2D",29.5,"BMD-2",30,"BMD-1",30,"BTR-70",25,"BTR-60PB",22.5,"T-72B (obr. 1985g.)",29.5,"UAZ-3151",30,"UAZ-3151 (Open)",30,"UAZ-3151 (DShKM)",30,"UAZ-3151 (AGS-30)",30,"UAZ-3151 (SPG-9)",30,"Ural-4320",40,"Ural-4320 (Open)",40,"Ural-4320 (Fuel)",40,"Ural-4320 (Repair)",40,"Ural-4320 (ZU-23-2)",40,"BM-21",40,"GAZ-66",40,"GAZ-66 (Open)",40,"GAZ-66 (Flatbed)",40,"GAZ-66 (Open/Flatbed)",40,"GAZ-66-AP-2",40,"GAZ-66-ESB-8IM",40,"GAZ-66 (R-142N)",40,"GAZ-66 (Ammo)",40,"GAZ-66 (ZU-23-2)",40,"BTR-60PB",22.5,"BTR-70",25,"BMP-1",29.5,"BMP-1P",29.5,"BMP-1D",29.5,"BMP-1K",29.5,"BMP-2 (obr. 1986g.)",29.5,"BMP-2 (obr. 1980g.)",29.5,"BMP-2K",29.5,"BMP-2D",29.5,"BMD-1",30,"BMD-1K",30,"BMD-1PK",30,"BMD-1P",30,"BMD-2",30,"BMD-2K",30,"ZSU-23-4V",30,"T-72B (obr. 1984g.)",29.5,"T-72B (obr. 1985g.)",29.5,"T-80B",19.5,"T-80BV",19.5,"Mi-8AMT",1870,"Mi-8AMTSh",1870,"Mi-8AMTSh (UPK)",1870,"Mi-8AMTSh (FAB)",1870,"Mi-24V (UPK)",2130,"Mi-24V (AT)",2130,"Mi-24D",2130,"Mi-24D (early)",2130,"Su-25",1000,"MiG-29S",500,"UAZ-3151",30,"UAZ-3151 (Open)",30,"UAZ-3151 (DShKM)",30,"UAZ-3151 (AGS-30)",30,"UAZ-3151 (SPG-9)",30,"Ural-4320",40,"Ural-4320 (Open)",40,"Ural-4320 (Fuel)",40,"Ural-4320 (Repair)",40,"Ural-4320 (ZU-23-2)",40,"BM-21",40,"GAZ-66",40,"GAZ-66 (Open)",40,"GAZ-66 (Flatbed)",40,"GAZ-66 (Open/Flatbed)",40,"GAZ-66-AP-2",40,"GAZ-66-ESB-8IM",40,"GAZ-66 (R-142N)",40,"GAZ-66 (Ammo)",40,"GAZ-66 (ZU-23-2)",40,"BTR-60PB",22.5,"BTR-70",25,"BMP-1",29.5,"BMP-1P",29.5,"BMP-1D",29.5,"BMP-1K",29.5,"BMP-2 (obr. 1986g.)",29.5,"BMP-2 (obr. 1980g.)",29.5,"BMP-2K",29.5,"BMP-2D",29.5,"BMD-1",30,"BMD-1K",30,"BMD-1P",30,"BMD-1PK",30,"BMD-2",30,"BMD-2K",30,"T-72B (obr. 1984g.)",29.5,"T-72B (obr. 1985g.)",29.5,"T-80B",19.5,"T-80BV",19.5,"ZSU-23-4V",30,"Mi-8AMT",1870,"Mi-8AMTSh",1870,"Mi-8AMTSh (UPK)",1870,"Mi-8AMTSh (FAB)",1870,"Mi-24V",2130,"Mi-24V (UPK)",2130,"Mi-24V (AT)",2130,"Mi-24D",2130,"Mi-24D (early)",2130,"Su-25",1000,"MiG-29S",500,"Truck",18,"Fuel Truck",18,"UAZ-3151",30,"UAZ-3151 (Open)",30,"UAZ-3151 (DShKM)",30,"UAZ-3151 (AGS-30)",30,"UAZ-3151 (SPG-9)",30,"Ural-4320",40,"Ural-4320 (Open)",40,"Ural-4320 (Worker)",40,"Ural-4320 (Worker/Open)",40,"Ural-4320 (ZU-23-2)",40,"BTR-70",25,"UAZ-3151",30,"UAZ-3151 (Open)",30,"UAZ-3151 (DShKM)",30,"UAZ-3151 (AGS-30)",30,"UAZ-3151 (SPG-9)",30,"Ural-4320",40,"Ural-4320 (Open)",40,"Ural-4320 (Worker)",40,"Ural-4320 (Worker/Open)",40,"Ural-4320 (Repair)",40,"Ural-4320 (ZU-23-2)",40,"BM-21",40,"GAZ-66",40,"GAZ-66 (Open)",40,"GAZ-66 (Flatbed)",40,"GAZ-66 (Open/Flatbed)",40,"GAZ-66-AP-2",40,"GAZ-66-ESB-8IM",40,"GAZ-66 (R-142N)",40,"GAZ-66 (Ammo)",40,"GAZ-66 (ZU-23-2)",40,"BTR-60PB",22.5,"BTR-70",25,"BMP-1",29.5,"BMP-1P",29.5,"BMP-1D",29.5,"BMP-1K",29.5,"BMP-2 (obr. 1986g.)",29.5,"BMP-2 (obr. 1980g.)",29.5,"BMP-2K",29.5,"BMP-2D",29.5,"ZSU-23-4V",30,"BMD-1",30,"BMD-1P",30,"BMD-2",30,"T-72B (obr. 1984g.)",29.5,"T-72B (obr. 1985g.)",29.5,"T-72B (obr. 1989g.)",29.5,"Mi-8AMT",1870,"UAZ-3151",30,"UAZ-3151 (Open)",30,"UAZ-3151 (DShKM)",30,"UAZ-3151 (AGS-30)",30,"UAZ-3151 (SPG-9)",30,"Ural-4320",40,"Ural-4320 (Open)",40,"Ural-4320 (Worker)",40,"Ural-4320 (Worker/Open)",40,"Ural-4320 (Repair)",40,"Ural-4320 (ZU-23-2)",40,"GAZ-66",40,"GAZ-66 (Open)",40,"GAZ-66 (Flatbed)",40,"GAZ-66 (Open/Flatbed)",40,"GAZ-66-AP-2",40,"GAZ-66-ESB-8IM",40,"GAZ-66 (R-142N)",40,"GAZ-66 (Ammo)",40,"GAZ-66 (ZU-23-2)",40,"BM-21",40,"BTR-60PB",22.5,"BMP-1",29.5,"BMP-1P",29.5,"BMP-1D",29.5,"BMP-1K",29.5,"BMP-2 (obr. 1986g.)",29.5,"BMP-2 (obr. 1980g.)",29.5,"BMP-2K",29.5,"BMP-2D",29.5,"ZSU-23-4V",30,"BMD-1",30,"BMD-1P",30,"BMD-2",30,"BTR-70",25,"T-72B (obr. 1984g.)",29.5,"T-72B (obr. 1985g.)",29.5,"T-72B (obr. 1989g.)",29.5,"Mi-8AMT",1870,"UAZ-3151",30,"Ural-4320",40,"M1117 ASV (UN)",35,"BTR-70",25,"Mi-8AMT",1870,"Mi-24V",2130,"Mi-24V (UPK)",2130,"M998A1 (2D/Open)",24,"M998A1 (2D/Half)",24,"M998A1 (2D/Covered)",24,"M998A1 (4D/Open)",24,"M998A1 (4D/Half)",24,"M998A1 (4D/Covered)",24,"M1025A1 (Unarmed)",22.5,"M1025A1 (M2)",22.5,"M1025A1 (Mk19)",22.5,"M113A3 (Unarmed)",24,"M113A3 (M2)",24,"M113A3 (Mk19/Early)",24,"O-3A",1000,"RHIB",12,"Assault Boat",12]
*/


//_transportFuel = getNumber(configfile >> "CfgVehicles" >> typeOf _vehicle>> "transportFuel")
/*
Gas Station (Sun Oil, Pump)",50000
Gas Station (Fuel, Pump)",50000
Bomb",50000
CRV-6e Bobcat",1e+012
HEMTT Fuel",1e+012
Zamak Transport (Covered)",1e+012
Zamak Fuel",1e+012
Zamak Fuel",1e+012
Zamak Fuel",1e+012
Fuel Truck",1e+012
Fuel Truck",1e+012
Fuel Truck",1e+012
Fuel Truck",1e+012
Fuel Truck (White)",1e+012
Fuel Truck (Red, White Tank)",1e+012
Fuel Truck (White, Red Tank)",1e+012
Fuel Truck (Red)",1e+012
Tempest Fuel",3000
Ural-4320 (Fuel)",10000
Ural-4320 (Fuel)",10000
Ural-4320 (Fuel)",10000
Ural-4320 (Fuel)",10000
Liquid Bladder",60000
Fuel Bladder (Forest)",60000
Fuel Bladder (Sand)",60000
",300
Flexible Fuel Tank (Forest)",300
Flexible Fuel Tank (Sand)",300
Huron Fuel Container",1e+012
Mi-290 Taru (Fuel)",1e+012
Taru Fuel Pod",3000
Mi-280 Taru (Fuel, Black)",1e+012
Taru Fuel Pod (Black)",3000
HEMTT Fuel",1e+012
Tempest Fuel",3000
Gas Station (Tanoil, Pump)",50000
Gas Station (Tucan Oil, Pump)",50000
CRV-6e Bobcat",1e+012
Gas Station (Malevil, Pump)",50000
M1078A1R SOV (M2)",150000
M1078A1R SOV (M2)",150000
M978A4",300000
M978A4-B",300000
M978A4",300000
M978A4 B-KIT D",300000
Ural-4320 (Fuel)",10000
Ural-4320 (Fuel)",10000
Fuel Truck",1e+012
*/
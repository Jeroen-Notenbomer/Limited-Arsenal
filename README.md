# Limited-Arsenal
Arma 3
-------------------------ARSENAL-----------------------
This is the Arsenal system which i wrote for Antistasi.
Its basicly the default arsenal but all weapons are limited in amount. 
You can add weapons by de-equiping them while inside the arsenal(selecting other weapon or non).
The amount of items inside the arsenal is shown next to the name.

Included a indicators on every weapon to indicate how much ammo is available for it.

To use it place all files in the your mission(merge/incl. description.extand stringtable with own if needed)
In the editor place a object with "this call jn_fnc_arsenal_init" inside init field.

-------------------------GARAGE------------------------

- Garage part is still WIP, but working
- TODO explain how to use it!

Allows vehicles to be stored in its current state.
When taking the vehicle out of the garage it comes out the why you placed it in(same damgage, fuel, ammo and attachments).
There is options to change color, pylon loadout, repair individual parts, refuel and rearm.
When a static weapon and a truck/pickup is stored you have the ability to weld them together!

------------------------LOGISTICS----------------------

- Mostly done 
- Maybe rewrite it to use more realisic loading bahavior based on boundingboxes.
- TODO explain how to use it!

Load boxes in vehicles with animation in a visable way(not like ace).

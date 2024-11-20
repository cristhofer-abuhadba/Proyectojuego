function scrPlayerWeaponSwitch(){
	if (keyboard_check_pressed(ord("1"))) {
		weapon.index = 0;
	} else if (keyboard_check_pressed(ord("2"))) {
		weapon.index = 1;
	}
}
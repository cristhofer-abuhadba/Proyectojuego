function scrPlayerWeaponSwitch() {
    if (keyboard_check_pressed(ord("1"))) {
        weapon.index = 0; // Cambiar a la primera arma
    } else if (keyboard_check_pressed(ord("2"))) {
        weapon.index = 1; // Cambiar a la segunda arma
    }
}

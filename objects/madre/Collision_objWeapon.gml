if (keyboard_check_pressed(ord("E"))) {
    // Reemplazar el arma en el índice actual del array "guns"
    if (guns[weapon.index] != noone) {
        // Si ya hay un arma equipada, destruirla
        instance_destroy(guns[weapon.index]);
    }

    // Equipar el arma nueva en el índice actual
    guns[weapon.index] = other.weapon;

    // Destruir el arma en el suelo (se recolectó)
    instance_destroy(other);
}

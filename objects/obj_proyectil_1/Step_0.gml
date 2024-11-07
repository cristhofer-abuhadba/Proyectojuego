// Movimiento del proyectil
x += lengthdir_x(velocidad, direction);
y += lengthdir_y(velocidad, direction);

// Colisión con un lanzador
var obj_colision_lanzador = instance_place(x, y, obj_lanzador);
if (obj_colision_lanzador != noone) {
    // Reducir la vida del lanzador individualmente
    obj_colision_lanzador.cant_vida -= 1;
    show_debug_message("El lanzador ha recibido 1 punto de daño.");
    instance_destroy(); // Destruir el proyectil después de aplicar el daño
}

// Colisión con un hostil
var obj_colision_hostil = instance_place(x, y, obj_hostil);
if (obj_colision_hostil != noone) {
    // Reducir la vida del hostil individualmente
    obj_colision_hostil.cant_vida -= 1;
    show_debug_message("El hostil ha recibido 1 punto de daño.");
    instance_destroy(); // Destruir el proyectil después de aplicar el daño
}

// Colisión con paredes
if (place_meeting(x, y, obj_pared)) {
    instance_destroy(); // Destruir el proyectil al colisionar con una pared
}

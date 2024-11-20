
right = 0;
left = 0;
up = 0;
down = 0;
run = 0;
velocidad = 0;

h_move = 0;
v_move = 0;


colision = velocidad + 3.5;


right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
run = keyboard_check(vk_shift);


h_move = 0;
v_move = 0;


if (run && CantidadEstamina > 0) {
    velocidad = 8;
} else {
    velocidad = 4;
}

// Comprobación de movimiento y colisiones
if (right && place_free(x + colision * 2, y)) {
    h_move = 1;
}
if (left && place_free(x - colision * 2, y)) {
    h_move = -1;
}
if (up && place_free(x, y - colision * 2)) {
    v_move = -1;
}
if (down && place_free(x, y + colision * 2)) {
    v_move = 1;
}

// Aplicación de movimiento
x += h_move * velocidad;
y += v_move * velocidad;

// Manejo de sprites y estamina
if (h_move != 0 || v_move != 0) {
    if (h_move == -1) {
        sprite_index = SPRelfoleft; 
    } else {
        sprite_index = SPRelforun; 
    }
    if (velocidad == 4) {
        image_speed = 1;
    } else if (velocidad == 8 && CantidadEstamina > 0) {
        CantidadEstamina -= 1;
        image_speed = 2;
    }
} else {
    sprite_index = sprelfo; 
    image_speed = 0.5;
}


if (velocidad == 4) {
    CantidadEstamina += 0.35;
}


CantidadEstamina = clamp(CantidadEstamina, -1, EstaminaMaxima);

if(CantidadVida <= 0){
	show_debug_message("El personaje ha muerto. Juego pausado");
	room_goto(Inicioo);
}

// Buscar el hostil más cercano
var hostil_cercano = instance_nearest(x, y, obj_hostil);
var lanzador_cercano = instance_nearest(x, y, obj_lanzador);

// Verificar si el hostil cercano existe
if (hostil_cercano != noone || lanzador_cercano != noone) {
	
    // Obtener las coordenadas del hostil cercano
	if(hostil_cercano != noone){
		var x_hostil = hostil_cercano.x;
		var y_hostil = hostil_cercano.y;
	} else {
		var x_hostil = lanzador_cercano.x;
		var y_hostil = lanzador_cercano.y;
	}
    
    // Calcular la distancia entre el personaje y el hostil cercano
    var distancia = point_distance(x, y, x_hostil, y_hostil);
    
    // Si la distancia es menor o igual a 100 px
    if (distancia <= 100) {
        // Verificar si se ha hecho clic izquierdo
        if (mouse_check_button_pressed(mb_left)) {
            // Aplicar daño al hostil cercano
			if(hostil_cercano != noone){
				hostil_cercano.cant_vida -= 1; // O el valor de daño que desees
				show_debug_message("El hostil más cercano ha recibido 1 punto de daño.");
			}
			else if(lanzador_cercano != noone){
				lanzador_cercano.cant_vida -= 1; // O el valor de daño que desees
				show_debug_message("El lanzador más cercano ha recibido 1 punto de daño.");
			}
        }
    }
}
scrPlayerWeaponUpdate();
scrPlayerWeaponSwitch();
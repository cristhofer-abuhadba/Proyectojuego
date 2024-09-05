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

x += h_move * velocidad;
y += v_move * velocidad;


if (h_move != 0 || v_move != 0) {
    if (h_move == -1) {
        sprite_index = sprhumanleft; 
    } else {
        sprite_index = sprhumanrun; 
    }
    if (velocidad == 4) {
        image_speed = 1;
    } else if (velocidad == 8 && CantidadEstamina > 0) {
        CantidadEstamina -= 1;
        image_speed = 2;
    }
} else {
    sprite_index = sprhuman; 
    image_speed = 0.2;
}


if (velocidad == 4) {
    CantidadEstamina += 0.35;
}


CantidadEstamina = clamp(CantidadEstamina, 2, EstaminaMaxima);

if(CantidadVida == 0){
	show_debug_message("El personaje ha muerto. Juego pausado");
	room_goto(Inicioo);
}
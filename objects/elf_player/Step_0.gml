
right = 0;
left = 0;
up = 0;
down = 0;
run = 0;
velocidad = 0;

h_move = 0;
v_move = 0;

colision = velocidad + 2;


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
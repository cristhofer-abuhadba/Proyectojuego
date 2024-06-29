right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
run = keyboard_check(vk_shift);
x += h_move * velocidad;
y += v_move * velocidad;

h_move = 0;
v_move = 0;

if (!run) {
    velocidad = 4;
} else {
    velocidad = 8;
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

if (h_move != 0 || v_move != 0) {
    if (h_move == -1) {
        sprite_index = sprhumanleft; 
    } else {
        sprite_index = sprhumanrun; 
    }
    if (!run) {
        image_speed = 1;
    } else {
        image_speed = 2;
    }
} else {
    sprite_index = sprhuman; 
    image_speed = 0.3;
}
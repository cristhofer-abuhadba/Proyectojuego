mouse_over_index = -1; // Reiniciar el índice del slot bajo el mouse

if (open) {
    var gui_x_base = 4;  
    var gui_y_base = 22; 
    var slot_scale = 0.75;

    var slot_width = sprite_get_width(Slots) * slot_scale;
    var slot_height = sprite_get_height(Slots) * slot_scale;

    var mouse_gui_x = device_mouse_x_to_gui(0);
    var mouse_gui_y = device_mouse_y_to_gui(0);

    for (var i = 0; i < SloT; i++) {
        var slot_x = gui_x_base + (i mod 2) * (slot_width + 4);
        var slot_y = gui_y_base + (i div 2) * (slot_height + 4);

        if (mouse_gui_x >= slot_x && mouse_gui_x <= slot_x + slot_width &&
            mouse_gui_y >= slot_y && mouse_gui_y <= slot_y + slot_height) {
            mouse_over_index = i; 
            show_debug_message("Mouse sobre el slot: " + string(i));
        }
    }

    if (mouse_check_button_pressed(mb_left) && mouse_over_index != -1) {
        if (slot[mouse_over_index][0] == spr_pocion) { 
            if (player != noone) {
                player.CantidadVida = min(player.VidaMaxima, player.CantidadVida + 5);
                show_debug_message("Vida aumentada a: " + string(player.CantidadVida));
            } else {
                show_debug_message("Error: Jugador no encontrado.");
            }
            slot[mouse_over_index][0] = 0; // Vaciar el slot después de usar la poción
        } else if (slot[mouse_over_index][0] == spr_pocion_mana) { 
            if (player != noone) {
                player.CantidadEstamina = min(player.EstaminaMaxima, player.CantidadEstamina + 10);
                show_debug_message("Estamina aumentada a: " + string(player.CantidadEstamina));
            } else {
                show_debug_message("Error: Jugador no encontrado.");
            }
            slot[mouse_over_index][0] = 0; // Vaciar el slot después de usar la poción
        }
    }
}

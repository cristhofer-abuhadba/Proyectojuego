mouse_over_index = -1; // Reiniciar el índice del slot bajo el mouse

if (open) {
    // Posición inicial fija del inventario en el sistema GUI
    var gui_x_base = 4;  // Coordenada X base
    var gui_y_base = 22; // Coordenada Y base
    var slot_scale = 0.75;

    var slot_width = sprite_get_width(Slots) * slot_scale;
    var slot_height = sprite_get_height(Slots) * slot_scale;

    // Obtener la posición del mouse en el sistema GUI
    var mouse_gui_x = device_mouse_x_to_gui(0);
    var mouse_gui_y = device_mouse_y_to_gui(0);

    for (var i = 0; i < SloT; i++) {
        // Calcular posición del slot
        var slot_x = gui_x_base + (i mod 2) * (slot_width + 4);
        var slot_y = gui_y_base + (i div 2) * (slot_height + 4);

        // Verificar si el mouse está sobre el slot
        if (mouse_gui_x >= slot_x && mouse_gui_x <= slot_x + slot_width &&
            mouse_gui_y >= slot_y && mouse_gui_y <= slot_y + slot_height) {
            mouse_over_index = i; // Guardar el índice del slot bajo el mouse
        }
    }

    // Detectar clic izquierdo en un slot
    if (mouse_check_button_pressed(mb_left) && mouse_over_index != -1) {
        slot[mouse_over_index][0] = 0; // Vaciar el slot
    }
}

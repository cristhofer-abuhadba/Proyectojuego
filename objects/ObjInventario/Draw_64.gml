if (open) {
    var gui_x_base = 4;  // Coordenada X base
    var gui_y_base = 22; // Coordenada Y base
    var slot_scale = 0.75;

    var slot_width = sprite_get_width(Slots) * slot_scale;
    var slot_height = sprite_get_height(Slots) * slot_scale;

    for (var i = 0; i < SloT; i++) {
        // Calcular posición del slot
        var slot_x = gui_x_base + (i mod 2) * (slot_width + 4);
        var slot_y = gui_y_base + (i div 2) * (slot_height + 4);

        // Cambiar color si el mouse está sobre el slot
        var color = (i == mouse_over_index) ? c_white : c_gray;

        // Dibujar el slot
        draw_sprite_ext(Slots, 0, slot_x, slot_y, slot_scale, slot_scale, 0, color, 1);

        // Dibujar el objeto si el slot no está vacío
        if (slot[i][0] != 0) {
            var obj_sprite = slot[i][0];

            var object_scale = 0.8;
            var obj_width = sprite_get_width(obj_sprite);
            var obj_height = sprite_get_height(obj_sprite);

            var scale = min(slot_width / obj_width, slot_height / obj_height) * object_scale;

            var obj_x = slot_x + (slot_width - (obj_width * scale)) / 2;
            var obj_y = slot_y + (slot_height - (obj_height * scale)) / 2;

            draw_sprite_ext(obj_sprite, 0, obj_x, obj_y, scale, scale, 0, c_white, 1);
        }
    }
}

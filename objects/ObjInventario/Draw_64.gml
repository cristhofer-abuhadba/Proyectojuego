if (open) {
    var x_base = 2.5; // Posición inicial en X para dibujar los slots
    var y_base = 24;  // Posición inicial en Y para dibujar los slots

    var slot_scale = 0.75; // Escala del slot
    var l = 12.5;          // Distancia entre los slots

    // Dimensiones del sprite de la casilla (slot)
    var slot_width = sprite_get_width(Slots) * slot_scale;
    var slot_height = sprite_get_height(Slots) * slot_scale;

    // Parámetro para ajustar el escalado del objeto
    var custom_object_scale = 1.3; // Puedes ajustar esta variable para escalar los objetos dentro del slot

    // Efecto de vibración si el inventario está lleno
    var vibracion_x = 0;
    var vibracion_y = 0;

    if (vibracion_timer > 0) {
        vibracion_x = irandom_range(-3, 3); // Movimientos aleatorios en X
        vibracion_y = irandom_range(-3, 3); // Movimientos aleatorios en Y
        vibracion_timer -= 1;
    } else {
        inventario_lleno = false; // Desactivar el estado de inventario lleno
    }

    // Dibujar los slots
    for (var i = 0; i < SloT; i++) {
        var slot_x = x_base + (i mod 2) * l + vibracion_x;  // Organizar en 2 columnas con vibración
        var slot_y = y_base + (i div 2) * l + vibracion_y;  // Organizar en filas hacia abajo con vibración

        // Si el inventario está lleno, coloreamos las casillas de rojo
        var color = inventario_lleno ? c_red : c_white;

        // Dibujar el sprite del slot escalado con el color
        draw_sprite_ext(Slots, 0, slot_x, slot_y, slot_scale, slot_scale, 0, color, 1);

        // Si el slot tiene un objeto válido (una instancia válida), lo dibujamos encima del slot
        if (slot[i][0] != 0 && is_undefined(slot[i][0]) == false) {
            var obj_sprite = slot[i][0]; // Obtener el sprite del objeto directamente

            // Obtener dimensiones del sprite del objeto
            var obj_width = sprite_get_width(obj_sprite);
            var obj_height = sprite_get_height(obj_sprite);

            // Escala del objeto, ajustable con la variable custom_object_scale
            var object_scale = min(slot_width / obj_width, slot_height / obj_height) * custom_object_scale;

            // Calcular la posición centrada del objeto en el slot
            var offset_y = 1; // Cantidad de píxeles para bajar el objeto
            var object_x = slot_x + (slot_width - (obj_width * object_scale)) / 2;
            var object_y = slot_y + (slot_height - (obj_height * object_scale)) / 2 + offset_y;

            // Dibujar el sprite del objeto centrado y escalado
            draw_sprite_ext(obj_sprite, 0, object_x, object_y, object_scale, object_scale, 0, c_white, 1);
        }
    }
}

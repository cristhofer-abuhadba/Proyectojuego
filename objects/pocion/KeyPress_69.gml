if (mouse_check_button_pressed(mb_left)) {
    // Verifica si el mouse está sobre la instancia actual (poción u otro ítem)
    if (position_meeting(mouse_x, mouse_y, id)) {
        // Llamar a la función en la instancia de ObjInventario
        var inventario = instance_find(ObjInventario, 0); // Busca la primera instancia de ObjInventario
        if (inventario != noone) {
            inventario.agregar_al_inventario(id); // Llama a la función pasando la instancia del objeto
        }
    }
}

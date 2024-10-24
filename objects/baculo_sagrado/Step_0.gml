
sprite_index = spr_baculo_sagrado; // AQUI VA EL SPRITE CORRESPONDIENTE DEL OBJETO
image_alpha = 1; // Asegúrate de que el objeto no esté invisible

if (distance_to_object(player) < 32) { // Radio de 32 píxeles alrededor del objeto
    // Si está dentro del radio y se presiona la tecla 'E'
    if (keyboard_check_pressed(69)) { // 69 es el valor ASCII de la tecla 'E'
        // Llamar a la función en la instancia de ObjInventario
        var inventario = instance_find(ObjInventario, 0); // Busca la primera instancia de ObjInventario
        if (inventario != noone) {
            inventario.agregar_al_inventario(id); // Llama a la función pasando la instancia del objeto
        }
    }
}

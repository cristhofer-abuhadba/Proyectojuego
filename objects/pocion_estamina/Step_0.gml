
sprite_index = spr_pocion_mana; 
image_alpha = 1; 

if (distance_to_object(player) < 32) { 
    if (keyboard_check_pressed(69)) {
        var inventario = instance_find(ObjInventario, 0); // Busca la primera instancia de ObjInventario
        if (inventario != noone) {
            inventario.agregar_al_inventario(id); // Llama a la función pasando la instancia del objeto
        }
    }
}

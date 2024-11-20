// Evento Crear de ObjInventario
player = noone; // Inicializar como noone por seguridad

if (instance_exists(elf_player)) {
    player = instance_find(elf_player, 0);
} else if (instance_exists(enano_player)) {
    player = instance_find(enano_player, 0);
} else if (instance_exists(humano_player)) {
    player = instance_find(humano_player, 0);
}

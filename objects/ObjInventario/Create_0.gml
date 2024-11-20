// Evento Crear de ObjInventario
player = noone; // Inicialización por seguridad

if (instance_exists(elf_player)) {
    player = instance_find(elf_player, 0);
} else if (instance_exists(enano_player)) {
    player = instance_find(enano_player, 0);
} else if (instance_exists(humano_player)) {
    player = instance_find(humano_player, 0);
}

// Si el jugador no existe, mostrar un mensaje de error
if (player == noone) {
    show_debug_message("Error: No se encontró el jugador.");
}


display_set_gui_size(800, 600); // Ajusta esto según tu resolución deseada
display_set_gui_maximize(false, false); // Desactiva la maximización automática

// Configuración inicial del inventario
open = false; // El inventario comienza cerrado
SloT = 10; // Número de slots
slot = array_create(SloT); // Crear un array para almacenar los datos de los slots
l = 17; // Distancia entre los slots

// Inicializar cada slot vacío (0)
for (var i = 0; i < SloT; i++) {
    slot[i] = [0];
}

// Variables de control
vibracion_timer = 0; // Sin vibración inicial
inventario_lleno = false; // El inventario no está lleno inicialmente
mouse_over_index = -1; // Índice de slot sobre el que está el mouse

// Función agregar_al_inventario dentro de ObjInventario
function agregar_al_inventario(objeto) {
    for (var i = 0; i < SloT; i++) {
        if (slot[i][0] == 0) { // Si el slot está vacío
            slot[i][0] = objeto.sprite_index; // Asignamos el sprite del objeto al slot
            // Verificamos si el sprite se asignó correctamente
            show_debug_message("Objeto agregado al inventario: " + string(objeto.sprite_index));
            instance_destroy(objeto); // Desaparece el objeto del mundo
            return;
        }
    }
   
}



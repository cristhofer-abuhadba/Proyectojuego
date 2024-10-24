// Evento Crear de ObjInventario
display_set_gui_maximize(5, 5);
open = true;
l = 17; // Distancia entre los slots
SloT = 16; // Cantidad de slots
inventario_lleno = false; // Indica si el inventario está lleno
vibracion_timer = 0;      // Tiempo de vibración en frames
vibracion_duracion = 30;  // Duración de la vibración (por ejemplo, 30 frames)
// Inicialización de slots
slot = array_create(SloT, 0); // Inicializa el slot como un array de 0
for (var i = 0; i < SloT; i++) {
    slot[i] = [0, 0]; // Cada slot ahora tiene un array con [objeto, cantidad]
}

// Definir la función agregar_al_inventario
// Función agregar_al_inventario dentro de ObjInventario
// Función agregar_al_inventario dentro de ObjInventario
// Función en ObjInventario
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
    // Si llegamos aquí, el inventario está lleno
    inventario_lleno = true;
    vibracion_timer = 20; // Inicia la vibración
}



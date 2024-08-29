if (open) {
    var h = 0; // Contador para filas
    var k = 0; // Contador para columnas
    var vx = 2; // Posición X inicial (ajusta según necesidad)
    var vy = 40; // Posición Y inicial (ajusta según necesidad)
    var color = c_gray;
    
    for (var i = 0; i < SloT; i++) {
        var sx = vx + l * k; // Calcula la posición X
        var sy = vy + l * h; // Calcula la posición Y
        
        // Dibujar el slot vacío
        draw_sprite(Slots, 0, sx, sy);
        
        // Dibujar el contenido del slot si no está vacío
        if (slot[i] != 0) {
            draw_sprite(Spr_PocionBeta, slot[i], sx, sy);
        }
        
        k++; // Avanza en la columna
        
        // Si alcanzamos el final de una fila, pasamos a la siguiente
        if ((i + 1) % 2 == 0) {
            h++; // Avanza en la fila
            k = 0; // Reinicia la columna
        }
    }
}


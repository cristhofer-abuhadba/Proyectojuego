var count = instance_number(obj_hostil);

if(hostiles_generado < max_hostiles && hostiles_room < max_hostiles_room){
	if(count == 3){

		

	}
	else{

		sec +=	0.03;
	
		if(sec >= time){
			sec = 0;
			
			var radio_generacion = 300;
			var posicion_valida = false;
            var intentos = 0;
            var max_intentos = 10;
			
			var area_width = 64;  // Ancho del área de colisión
            var area_height = 128; // Alto del área de colisión

            while (!posicion_valida && intentos < max_intentos) {
				
				var angulo = random(360);
				var distancia = random(radio_generacion);
                var x_pos = x + lengthdir_x(distancia, angulo);
                var y_pos = y + lengthdir_y(distancia, angulo);

                if (!collision_rectangle(x_pos - area_width / 2, y_pos - area_height / 2, x_pos + area_width / 2, y_pos + area_height / 2, obj_pared, false, false) &&
				!collision_rectangle(x_pos - area_width / 2, y_pos - area_height / 2, x_pos + area_width / 2, y_pos + area_height / 2, obj_hostil, false, false)) {
                    posicion_valida = true;
                } else {
                    intentos += 1;
					show_debug_message("intento fallido");
                }
            }

            if (posicion_valida) {
                instance_create_layer(x_pos, y_pos, "Instances", obj_hostil);
                show_debug_message("se ha creado un nuevo hostil");
                hostiles_generado += 1;
                hostiles_room += 1;
            } else {
                show_debug_message("no se pudo encontrar una posición válida");
            }
		}
	
	}
}
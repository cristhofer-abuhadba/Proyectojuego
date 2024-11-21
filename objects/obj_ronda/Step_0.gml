var count_00 = instance_number(obj_spawn_hostil);
var count_01 = instance_number(obj_spawn_lanzador);
var hostiles = false;
var lanzadores = false;

if(spawn_hostiles_generado < max_spawn_hostiles && spawn_hostiles_room < max_spawn_hostiles_room){
	if(count_00 == 2){

		show_debug_message("2 spawn hostiles");

	}
	else{

		sec +=	0.03;
	
		if(sec >= time){
			sec = 0;
			
			var radio_generacion = 650;
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
				!collision_rectangle(x_pos - area_width / 2, y_pos - area_height / 2, x_pos + area_width / 2, y_pos + area_height / 2, obj_lanzador, false, false)) {
                    posicion_valida = true;
                } else {
                    intentos += 1;
					show_debug_message("intento fallido");
                }
            }

            if (posicion_valida) {
                instance_create_layer(x_pos, y_pos, "Instances", obj_spawn_hostil);
                show_debug_message("se ha creado un nuevo hostil lanzador");
                spawn_hostiles_generado += 1;
                spawn_hostiles_room += 1;
				
            } else {
                show_debug_message("no se pudo encontrar una posición válida");
            }
		}
	
	}
} else {
	hostiles = true;
}
if(spawn_lanzadores_generado < max_spawn_lanzadores && spawn_lanzadores_room < max_spawn_lanzadores_room){
	if(count_01 == 1){

		show_debug_message("1 spawn lanzador");

	}
	else{

		sec +=	0.03;
	
		if(sec >= time){
			sec = 0;
			
			var radio_generacion = 650;
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
				!collision_rectangle(x_pos - area_width / 2, y_pos - area_height / 2, x_pos + area_width / 2, y_pos + area_height / 2, obj_lanzador, false, false)) {
                    posicion_valida = true;
                } else {
                    intentos += 1;
					show_debug_message("intento fallido");
                }
            }

            if (posicion_valida) {
				
				instance_create_layer(x_pos, y_pos, "Instances", obj_spawn_lanzador);
                show_debug_message("se ha creado un nuevo hostil lanzador");
                spawn_lanzadores_generado += 1;
                spawn_lanzadores_room += 1;
            } else {
                show_debug_message("no se pudo encontrar una posición válida");
            }
		}
	
	}
} else {
	lanzadores = true;
}
if(lanzadores == true && hostiles == true){
	instance_destroy();
	room_goto(Menu);
}
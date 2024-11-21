if(instance_exists(elf_player)){
	var x_personaje = elf_player.x;
	var y_personaje = elf_player.y;
	var direccion = point_direction(x, y, x_personaje, y_personaje);
	
	var distancia = point_distance(x, y, x_personaje, y_personaje);
	
	if(cant_vida == 0){
		show_debug_message("El Hostil ha muerto. Juego pausado");
		
		var rand = irandom(100); //numero aleatorio entre 0 y 100
		if(rand < 30){
			var sub_rand = irandom(1);
			
			if(sub_rand == 0){
				instance_create_layer(x, y, layer, pocion);
			}
			else{
				instance_create_layer(x, y, layer, pocion_estamina);
			}
		}
		else if(rand < 60){
			instance_create_layer(x, y, layer, arco);
		}
		
		instance_destroy();
	}
	
	if(distancia <= 300){
		
		var deslizar = true;
		var deslizamientos = [0, 90, 180, 270];
		var mejor_direccion = direccion;
		var mejor_distancia = distancia;
		
		var intento_x = x + lengthdir_x(velocidad, direccion);
        var intento_y = y + lengthdir_y(velocidad, direccion);
		
		if (place_meeting(intento_x, intento_y, obj_pared)) {
            deslizar = true;
			
			while(deslizar){
				
				deslizar = false;
			
				for(var i = 0; i < array_length(deslizamientos); i++){
					var dir_actual = deslizamientos[i];
					var nuevo_x_deslizar = x + lengthdir_x(velocidad, dir_actual);
					var nuevo_y_deslizar = y + lengthdir_y(velocidad, dir_actual);
					
					if(!place_meeting(nuevo_x_deslizar, nuevo_y_deslizar, obj_pared) && !place_meeting(nuevo_x_deslizar, nuevo_y_deslizar, obj_hostil)){
						var distancia_deslizar = point_distance(nuevo_x_deslizar, nuevo_y_deslizar, x_personaje, y_personaje);
                        if (distancia_deslizar < mejor_distancia) {
                            mejor_direccion = dir_actual;
                            mejor_distancia = distancia_deslizar;
                            deslizar = true;
                        }
					}
				}
				direccion = mejor_direccion;
                intento_x = x + lengthdir_x(velocidad, direccion);
                intento_y = y + lengthdir_y(velocidad, direccion);
			}
		}
		var nuevo_x = x + lengthdir_x(velocidad, direccion);
        var nuevo_y = y + lengthdir_y(velocidad, direccion);
		
		if (!place_meeting(nuevo_x, nuevo_y, obj_pared)) {
            x = nuevo_x;
            y = nuevo_y;
        } else {
            // Si no se puede mover en la dirección deseada, intentar deslizarse en la dirección alternativa
            move_contact_solid(direccion, velocidad);
        }
		
		if (place_meeting(x, y, obj_hostil)) {
            var desplazado = false;
            // Intentar mover el `obj_hostil` para evitar superposición
            for (var i = 0; i < 4; i++) {
                var dir_ajuste = i * 90;
                var x_ajustado = x + lengthdir_x(5, dir_ajuste);
                var y_ajustado = y + lengthdir_y(5, dir_ajuste);
                
                if (!place_meeting(x_ajustado, y_ajustado, obj_pared) && !place_meeting(x_ajustado, y_ajustado, obj_hostil)) {
                    x = x_ajustado;
                    y = y_ajustado;
                    desplazado = true;
                    break;
                }
            }
            // Si no se pudo ajustar, mover hacia atrás
            if (!desplazado) {
                x -= lengthdir_x(velocidad, direccion);
                y -= lengthdir_y(velocidad, direccion);
            }
        }
		
		if (place_meeting(x, y, obj_lanzador)) {
            var desplazado = false;
            // Intentar mover el `obj_hostil` para evitar superposición
            for (var i = 0; i < 4; i++) {
                var dir_ajuste = i * 90;
                var x_ajustado = x + lengthdir_x(5, dir_ajuste);
                var y_ajustado = y + lengthdir_y(5, dir_ajuste);
                
                if (!place_meeting(x_ajustado, y_ajustado, obj_pared) && !place_meeting(x_ajustado, y_ajustado, obj_lanzador)) {
                    x = x_ajustado;
                    y = y_ajustado;
                    desplazado = true;
                    break;
                }
            }
            // Si no se pudo ajustar, mover hacia atrás
            if (!desplazado) {
                x -= lengthdir_x(velocidad, direccion);
                y -= lengthdir_y(velocidad, direccion);
            }
        }
		
		if (place_meeting(x, y, elf_player)) {
            var corregido_x = x - lengthdir_x(velocidad, direccion);
            var corregido_y = y - lengthdir_y(velocidad, direccion);
            if (!place_meeting(corregido_x, corregido_y, obj_pared)) {
                x = corregido_x;
                y = corregido_y;
            }
        }

		
		var target_x = x + lengthdir_x(65, direccion);
		var target_y = y + lengthdir_y(129, direccion);

		
		if(collision_line(x, y, target_x, target_y, elf_player, true, false)){
			
			tiempo_dano += 1;
		
			show_debug_message("personaje");
			
			var direccion_01 = point_direction(x, y, x + lengthdir_x(1, direccion), lengthdir_y(1, direccion));
		
			if(abs(direccion_01 - direccion) > 0){
				show_debug_message("rozando con personaje");
				if(tiempo_dano >= intervalo_dano){
					elf_player.CantidadVida -= 1;
					show_debug_message("El personaje ha recibido 1 punto de daño.");
		
					tiempo_dano = 0;
				}	
			}
		}
	}
}
if(instance_exists(enano_player)){
	var x_personaje = enano_player.x;
	var y_personaje = enano_player.y;
	var direccion = point_direction(x, y, x_personaje, y_personaje);
	
	var distancia = point_distance(x, y, x_personaje, y_personaje);
	
	if(cant_vida == 0){
		show_debug_message("El Hostil ha muerto. Juego pausado");
		
		var rand = irandom(100); //numero aleatorio entre 0 y 100
		if(rand < 10){
			instance_create_layer(x, y, layer, escudo_lethor);
		}
		else if(rand < 30){
			var sub_rand = irandom(1);
			
			if(sub_rand == 0){
				instance_create_layer(x, y, layer, pocion);
			}
			else{
				instance_create_layer(x, y, layer, pocion_mana);
			}
		}
		else if(rand < 60){
			var sub_rand = irandom(1);
			
			if(sub_rand == 0){
				instance_create_layer(x, y, layer, espada_netherite);
			}
			else{
				instance_create_layer(x, y, layer, escudo_tortuga);
			}
		}
		
		instance_destroy();
	}
	
	if(distancia <= 300){
		
		var deslizar = true;
		var deslizamientos = [0, 90, 180, 270];
		var mejor_direccion = direccion;
		var mejor_distancia = distancia;
		
		var intento_x = x + lengthdir_x(velocidad, direccion);
        var intento_y = y + lengthdir_y(velocidad, direccion);
		
		if (place_meeting(intento_x, intento_y, obj_pared)) {
            deslizar = true;
			
			while(deslizar){
				
				deslizar = false;
			
				for(var i = 0; i < array_length(deslizamientos); i++){
					var dir_actual = deslizamientos[i];
					var nuevo_x_deslizar = x + lengthdir_x(velocidad, dir_actual);
					var nuevo_y_deslizar = y + lengthdir_y(velocidad, dir_actual);
					
					if(!place_meeting(nuevo_x_deslizar, nuevo_y_deslizar, obj_pared) && !place_meeting(nuevo_x_deslizar, nuevo_y_deslizar, obj_hostil)){
						var distancia_deslizar = point_distance(nuevo_x_deslizar, nuevo_y_deslizar, x_personaje, y_personaje);
                        if (distancia_deslizar < mejor_distancia) {
                            mejor_direccion = dir_actual;
                            mejor_distancia = distancia_deslizar;
                            deslizar = true;
                        }
					}
				}
				direccion = mejor_direccion;
                intento_x = x + lengthdir_x(velocidad, direccion);
                intento_y = y + lengthdir_y(velocidad, direccion);
			}
		}
		var nuevo_x = x + lengthdir_x(velocidad, direccion);
        var nuevo_y = y + lengthdir_y(velocidad, direccion);
		
		if (!place_meeting(nuevo_x, nuevo_y, obj_pared)) {
            x = nuevo_x;
            y = nuevo_y;
        } else {
            // Si no se puede mover en la dirección deseada, intentar deslizarse en la dirección alternativa
            move_contact_solid(direccion, velocidad);
        }
		
		if (place_meeting(x, y, obj_hostil)) {
            var desplazado = false;
            // Intentar mover el `obj_hostil` para evitar superposición
            for (var i = 0; i < 4; i++) {
                var dir_ajuste = i * 90;
                var x_ajustado = x + lengthdir_x(5, dir_ajuste);
                var y_ajustado = y + lengthdir_y(5, dir_ajuste);
                
                if (!place_meeting(x_ajustado, y_ajustado, obj_pared) && !place_meeting(x_ajustado, y_ajustado, obj_hostil)) {
                    x = x_ajustado;
                    y = y_ajustado;
                    desplazado = true;
                    break;
                }
            }
            // Si no se pudo ajustar, mover hacia atrás
            if (!desplazado) {
                x -= lengthdir_x(velocidad, direccion);
                y -= lengthdir_y(velocidad, direccion);
            }
        }
		
		if (place_meeting(x, y, obj_lanzador)) {
            var desplazado = false;
            // Intentar mover el `obj_hostil` para evitar superposición
            for (var i = 0; i < 4; i++) {
                var dir_ajuste = i * 90;
                var x_ajustado = x + lengthdir_x(5, dir_ajuste);
                var y_ajustado = y + lengthdir_y(5, dir_ajuste);
                
                if (!place_meeting(x_ajustado, y_ajustado, obj_pared) && !place_meeting(x_ajustado, y_ajustado, obj_lanzador)) {
                    x = x_ajustado;
                    y = y_ajustado;
                    desplazado = true;
                    break;
                }
            }
            // Si no se pudo ajustar, mover hacia atrás
            if (!desplazado) {
                x -= lengthdir_x(velocidad, direccion);
                y -= lengthdir_y(velocidad, direccion);
            }
        }
		
		if (place_meeting(x, y, enano_player)) {
            var corregido_x = x - lengthdir_x(velocidad, direccion);
            var corregido_y = y - lengthdir_y(velocidad, direccion);
            if (!place_meeting(corregido_x, corregido_y, obj_pared)) {
                x = corregido_x;
                y = corregido_y;
            }
        }

		
		var target_x = x + lengthdir_x(65, direccion);
		var target_y = y + lengthdir_y(129, direccion);

		
		if(collision_line(x, y, target_x, target_y, enano_player, true, false)){
			
			tiempo_dano += 1;
		
			show_debug_message("personaje");
			
			var direccion_01 = point_direction(x, y, x + lengthdir_x(1, direccion), lengthdir_y(1, direccion));
		
			if(abs(direccion_01 - direccion) > 0){
				show_debug_message("rozando con personaje");
				if(tiempo_dano >= intervalo_dano){
					enano_player.CantidadVida -= 1;
					show_debug_message("El personaje ha recibido 1 punto de daño.");
		
					tiempo_dano = 0;
				}	
			}
		}
	}
}
if(instance_exists(humano_player)){
	var x_personaje = humano_player.x;
	var y_personaje = humano_player.y;
	var direccion = point_direction(x, y, x_personaje, y_personaje);
	
	var distancia = point_distance(x, y, x_personaje, y_personaje);
	
	if(cant_vida == 0){
		show_debug_message("El Hostil ha muerto. Juego pausado");
		
		var rand = irandom(100); //numero aleatorio entre 0 y 100
		if(rand < 10){
			instance_create_layer(x, y, layer, escudo_lethor);
		}
		else if(rand < 30){
			var sub_rand = irandom(1);
			
			if(sub_rand == 0){
				instance_create_layer(x, y, layer, pocion);
			}
			else{
				instance_create_layer(x, y, layer, pocion_mana);
			}
		}
		else if(rand < 60){
			var sub_rand = irandom(1);
			
			if(sub_rand == 0){
				instance_create_layer(x, y, layer, espada_netherite);
			}
			else{
				instance_create_layer(x, y, layer, escudo_tortuga);
			}
		}
		
		instance_destroy();
	}
	
	if(distancia <= 300){
		
		var deslizar = true;
		var deslizamientos = [0, 90, 180, 270];
		var mejor_direccion = direccion;
		var mejor_distancia = distancia;
		
		var intento_x = x + lengthdir_x(velocidad, direccion);
        var intento_y = y + lengthdir_y(velocidad, direccion);
		
		if (place_meeting(intento_x, intento_y, obj_pared)) {
            deslizar = true;
			
			while(deslizar){
				
				deslizar = false;
			
				for(var i = 0; i < array_length(deslizamientos); i++){
					var dir_actual = deslizamientos[i];
					var nuevo_x_deslizar = x + lengthdir_x(velocidad, dir_actual);
					var nuevo_y_deslizar = y + lengthdir_y(velocidad, dir_actual);
					
					if(!place_meeting(nuevo_x_deslizar, nuevo_y_deslizar, obj_pared) && !place_meeting(nuevo_x_deslizar, nuevo_y_deslizar, obj_hostil)){
						var distancia_deslizar = point_distance(nuevo_x_deslizar, nuevo_y_deslizar, x_personaje, y_personaje);
                        if (distancia_deslizar < mejor_distancia) {
                            mejor_direccion = dir_actual;
                            mejor_distancia = distancia_deslizar;
                            deslizar = true;
                        }
					}
				}
				direccion = mejor_direccion;
                intento_x = x + lengthdir_x(velocidad, direccion);
                intento_y = y + lengthdir_y(velocidad, direccion);
			}
		}
		var nuevo_x = x + lengthdir_x(velocidad, direccion);
        var nuevo_y = y + lengthdir_y(velocidad, direccion);
		
		if (!place_meeting(nuevo_x, nuevo_y, obj_pared)) {
            x = nuevo_x;
            y = nuevo_y;
        } else {
            // Si no se puede mover en la dirección deseada, intentar deslizarse en la dirección alternativa
            move_contact_solid(direccion, velocidad);
        }
		
		if (place_meeting(x, y, obj_hostil)) {
            var desplazado = false;
            // Intentar mover el `obj_hostil` para evitar superposición
            for (var i = 0; i < 4; i++) {
                var dir_ajuste = i * 90;
                var x_ajustado = x + lengthdir_x(5, dir_ajuste);
                var y_ajustado = y + lengthdir_y(5, dir_ajuste);
                
                if (!place_meeting(x_ajustado, y_ajustado, obj_pared) && !place_meeting(x_ajustado, y_ajustado, obj_hostil)) {
                    x = x_ajustado;
                    y = y_ajustado;
                    desplazado = true;
                    break;
                }
            }
            // Si no se pudo ajustar, mover hacia atrás
            if (!desplazado) {
                x -= lengthdir_x(velocidad, direccion);
                y -= lengthdir_y(velocidad, direccion);
            }
        }
		
		if (place_meeting(x, y, obj_lanzador)) {
            var desplazado = false;
            // Intentar mover el `obj_hostil` para evitar superposición
            for (var i = 0; i < 4; i++) {
                var dir_ajuste = i * 90;
                var x_ajustado = x + lengthdir_x(5, dir_ajuste);
                var y_ajustado = y + lengthdir_y(5, dir_ajuste);
                
                if (!place_meeting(x_ajustado, y_ajustado, obj_pared) && !place_meeting(x_ajustado, y_ajustado, obj_lanzador)) {
                    x = x_ajustado;
                    y = y_ajustado;
                    desplazado = true;
                    break;
                }
            }
            // Si no se pudo ajustar, mover hacia atrás
            if (!desplazado) {
                x -= lengthdir_x(velocidad, direccion);
                y -= lengthdir_y(velocidad, direccion);
            }
        }
		
		if (place_meeting(x, y, humano_player)) {
            var corregido_x = x - lengthdir_x(velocidad, direccion);
            var corregido_y = y - lengthdir_y(velocidad, direccion);
            if (!place_meeting(corregido_x, corregido_y, obj_pared)) {
                x = corregido_x;
                y = corregido_y;
            }
        }

		
		var target_x = x + lengthdir_x(65, direccion);
		var target_y = y + lengthdir_y(129, direccion);

		
		if(collision_line(x, y, target_x, target_y, humano_player, true, false)){
			
			tiempo_dano += 1;
		
			show_debug_message("personaje");
			
			var direccion_01 = point_direction(x, y, x + lengthdir_x(1, direccion), lengthdir_y(1, direccion));
		
			if(abs(direccion_01 - direccion) > 0){
				show_debug_message("rozando con personaje");
				if(tiempo_dano >= intervalo_dano){
					humano_player.CantidadVida -= 1;
					show_debug_message("El personaje ha recibido 1 punto de daño.");
		
					tiempo_dano = 0;
				}	
			}
		}
	}
}

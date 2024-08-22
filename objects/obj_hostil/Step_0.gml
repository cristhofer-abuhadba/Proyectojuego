if(instance_exists(elf_player)){
	var x_personaje = elf_player.x;
	var y_personaje = elf_player.y;
	var direccion = point_direction(x, y, x_personaje, y_personaje);
	
	var distancia = point_distance(x, y, x_personaje, y_personaje);
	
	if(cant_vida == 0){
		show_debug_message("El Hostil ha muerto. Juego pausado");
		instance_deactivate_object(obj_hostil);
	}
	
	if(distancia <= 300){
		move_contact_solid(direccion, velocidad);
	
		var target_x = x + lengthdir_x(66, direccion);
		var target_y = y + lengthdir_y(130, direccion);

		
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
		else{
			tiempo_dano = 0;
			move_bounce_solid(false);
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
		instance_deactivate_object(obj_hostil);
	}
	
	if(distancia <= 300){
		move_contact_solid(direccion, velocidad);
	
		var target_x = x + lengthdir_x(66, direccion);
		var target_y = y + lengthdir_y(130, direccion);

		
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
		else{
			tiempo_dano = 0;
			move_bounce_solid(false);
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
		instance_deactivate_object(obj_hostil);
	}
	
	if(distancia <= 300){
		move_contact_solid(direccion, velocidad);
	
		var target_x = x + lengthdir_x(66, direccion);
		var target_y = y + lengthdir_y(130, direccion);

		
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
		else{
			tiempo_dano = 0;
			move_bounce_solid(false);
		}
	}
}
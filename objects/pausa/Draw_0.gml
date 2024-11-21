if (pause) {
	if (!surface_exists(pause_surface)) {
		pause_surface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
		surface_set_target(pause_surface);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		instance_deactivate_all(true);
	}
	draw_surface(pause_surface, 0, 0);
	
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width/2, room_height/2, "Juego Pausado" );
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
} 
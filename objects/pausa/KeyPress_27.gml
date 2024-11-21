pause = !pause;

if (pause) {

} else {
	surface_free(pause_surface);
	instance_activate_all();
}
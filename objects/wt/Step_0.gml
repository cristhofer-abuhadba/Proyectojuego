
if(state == 0){
	
timer++;

	if(timer>duracion){
		
		transition+= 0.02;
		image_alpha = transition;
		
		if(timer > 240){
		timer = 0;
		
		room_goto(Inicioo);
		}
	}

}




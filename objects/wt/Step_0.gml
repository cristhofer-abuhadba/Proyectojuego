
if(state == 0){
	
timer++;

	if(timer>duracion){
		
		transition+= 0.02;
		image_alpha = transition;
		
		if(timer > 295){
		timer = 0;
		room_goto(character_menu);
		}
	}

}




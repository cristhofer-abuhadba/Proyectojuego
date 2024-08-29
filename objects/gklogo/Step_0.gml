
if(state == 0){

image_speed = 0;

	timer++;
	
	if(timer > duration){
		
		image_speed = 1;
		image_alpha = 1;
		
		if(timer == 400){
			
			audio_play_sound(snd_glitch_gm,0,false);
			}
		
		if(timer > 750){
			
			fade-= 0.04;
			
			image_alpha = fade;
	
		} 

	}
}
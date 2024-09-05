
if(state == 0){
	
	
if(timer = 0){
audio_play_sound(snd_whoosh,0,false);

}

timer++;

	if(timer = 50){
	
	audio_play_sound(snd_slash,0,false);
	}
	if(timer > duration){
			fade-= 0.04;
			
			image_alpha = fade;
	
		} 
}

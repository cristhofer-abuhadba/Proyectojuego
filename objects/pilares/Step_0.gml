if(state == 0){
	
	timer++;
	
	if(timer == 1){

	audio_play_sound(snd_firesound,0,false,fade);
}
	

		if(timer > duration){
			
		fade=- 0.02;
		audio_stop_sound(snd_firesound);
	}
}
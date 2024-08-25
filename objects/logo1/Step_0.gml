if(timer == 0){
	audio_play_sound(snd_whoosh,0,false);
}


if(state == 0){

	timer++;
	if(timer == 30){
	
	audio_play_sound(snd_breaking,0,false);
	}
	if(timer == 50){
		
	audio_play_sound(snd_slash,0,false);	
	}
	
	if(timer>duration){
		
		fade -= 0.04;
		image_alpha = fade;
		
	}
	if(timer > 400){
		
		room_goto(Menu);
		timer = 0;
	}
}






if(state == 0){
timer++;

	if(timer == duration){
		audio_play_sound(snd_door_opening,0,false);
		}
	if(timer>duration){
		
		sprite_index = Puerta_intro;
	}


}
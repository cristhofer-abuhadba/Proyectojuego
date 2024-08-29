if(state == 0){
timer++;

	if(timer == duration){
		audio_play_sound(snd_door_opening,0,false);
		}
	if(timer>duration){
		image_speed = 1;
		sprite_index = Puerta_intro;
	}


}
if (global.playerSelect== "elf"){
	cam_main = camera_create_view(0,0,1280,640,0,elf_player, -1,-1,600,640);
}

if (global.playerSelect== "enano"){
cam_main = camera_create_view(0,0,1280,640,0,enano_player, -1,-1,600,640);
}

if (global.playerSelect== "humano"){
cam_main = camera_create_view(0,0,1280,640,0,humano_player, -1,-1,600,640);

}

view_camera[0]= cam_main;
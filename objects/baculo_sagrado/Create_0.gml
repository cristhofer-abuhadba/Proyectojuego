
if (global.playerSelect== "elf"){
	player = elf_player;
}

if (global.playerSelect== "enano"){
player = enano_player;
}

if (global.playerSelect== "humano"){
player = humano_player;


}

weapon = {
	sprite: sprite_index,
	object: object_index,
	ammo: 5,
	maxAmmo: 5,
	frequency: room_speed / 2
};
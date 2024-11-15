right=0;
left=0;
up=0;
down=0;
run=0;
velocidad=0;


h_move = 0;
v_move = 0;

colision= velocidad + 2;


if (global.playerSelect="elf"){

VidaMaxima=30;
}

if (global.playerSelect="enano"){

VidaMaxima=20;
}

if (global.playerSelect="humano"){

VidaMaxima=40;
}
CantidadVida = VidaMaxima;
if (global.playerSelect="elf"){

EstaminaMaxima=40;
}
if (global.playerSelect="enano"){

EstaminaMaxima=80;
}
if (global.playerSelect="humano"){

EstaminaMaxima=30;
}

CantidadEstamina = EstaminaMaxima;

weapon={
	sprite:spr_baculo_sagrado,
	angle:0
};
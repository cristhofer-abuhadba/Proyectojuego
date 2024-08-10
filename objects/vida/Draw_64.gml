var barra_espacio = 2; // Espacio entre barras
for (var i = 0; i < madre.VidaMaxima; i++) {
    if (i < madre.CantidadVida) {
        draw_sprite(SpriteVida, 0, 2 + barra_espacio * i, 8);
    }
}

draw_sprite_stretched(SpriteStamina,1,2,20,numLeghtestamina,1);

draw_sprite_stretched(SpriteStamina,0,2,20,numGaugeestammina,1);
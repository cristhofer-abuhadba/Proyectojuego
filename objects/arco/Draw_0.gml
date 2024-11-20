draw_self();

if (distance_to_object(player) < 32) {
    var e_sprite = Aprete_e; 
    
    var e_x = x + (sprite_width / 2) - (sprite_get_width(e_sprite) / 2); 
    var e_y = y - sprite_height - 10;

    // Dibujar el sprite de "presiona E" centrado y más arriba
    draw_sprite(e_sprite, 0, e_x, e_y);
}

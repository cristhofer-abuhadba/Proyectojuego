draw_self();
draw_set_color(c_white);
draw_text(x, y, "vida: " + string(cant_vida));

// Calcula la distancia
if (instance_exists(humano_player)) {
    var x_personaje = humano_player.x;
    var y_personaje = humano_player.y;
    var distancia = point_distance(x, y, x_personaje, y_personaje);

    // Dibuja la distancia en la pantalla
    draw_text(x, y - 20, "Distancia: " + string(distancia));
}
else if (instance_exists(elf_player)) {
    var x_personaje = elf_player.x;
    var y_personaje = elf_player.y;
    var distancia = point_distance(x, y, x_personaje, y_personaje);

    // Dibuja la distancia en la pantalla
    draw_text(x, y - 20, "Distancia: " + string(distancia));
}
else if (instance_exists(enano_player)) {
    var x_personaje = enano_player.x;
    var y_personaje = enano_player.y;
    var distancia = point_distance(x, y, x_personaje, y_personaje);

    // Dibuja la distancia en la pantalla
    draw_text(x, y - 20, "Distancia: " + string(distancia));
}
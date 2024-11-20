function scrPlayerWeaponUpdate(){
	if (guns[weapon.index] == noone) { exit; }
	
	weapon.angle = point_direction(x,y-4,mouse_x,mouse_y);
	
	weapon.frequency -= 1;
	if (mouse_check_button(mb_left) && guns[weapon.index].ammo > 0 && weapon.frequency <= 0) {
		var bx = x + lengthdir_x(13, weapon.angle);
		var by = y - 5 + lengthdir_y(13, weapon.angle);
		
		var bullet = instance_create_layer(bx,by,"Instances",obj_proyectil_1);
		bullet.speed = 5;
		bullet.direction = weapon.angle;
		
		guns[weapon.index].ammo -= 1;
		
		weapon.frequency = guns[weapon.index].frequency;
	}
}
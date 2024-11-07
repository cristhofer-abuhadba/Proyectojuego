draw_self();
if (weapon!= noone)	{
var WeaponScale=(weapon.angle >= 90 && weapon.angle < 270)?1:1;
var WeaponAngle=weapon.angle + ((weapon.angle >= 90 && weapon.angle < 270) ? 180: 0);
draw_sprite_ext(weapon.sprite,0,x,y-20,WeaponScale,1,WeaponAngle,c_white,1)
}
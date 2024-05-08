right=keyboard_check(ord("D"));
left=keyboard_check(ord("A"));
up=keyboard_check(ord("W"));
down=keyboard_check(ord("S"));
run=keyboard_check(vk_shift);



if (run= false){
        
velocidad=4;


}

else{
velocidad=8;

}

if right && place_free(x + colision * 2 ,y){
	h_move= right - left;
	x += h_move * velocidad;
	
}
if left && place_free(x - colision * 2,y){
	h_move= right - left;
	x += h_move * velocidad;
}
if up && place_free(x ,y- colision *2){
	v_move = down - up;
	y += v_move* velocidad;

}
if down && place_free(x,y + colision * 2){
	v_move = down - up;
	y += v_move* velocidad;

}
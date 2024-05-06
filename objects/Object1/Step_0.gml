right=keyboard_check(ord("D"));
left=keyboard_check(ord("A"));
up=keyboard_check(ord("W"));
down=keyboard_check(ord("S"));
run=keyboard_check(vk_shift);

h_move= right - left;
v_move = down - up;

x += h_move * velocidad;
y += v_move* velocidad;



if (run= false){
        
velocidad=4;

}

else{
velocidad=9;
}

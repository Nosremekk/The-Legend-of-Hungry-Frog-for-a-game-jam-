/// @description Insert description here
// You can write your code in this editor
if (global.pause) exit;


image_angle += .5;

var _replay = keyboard_check(vk_shift) or gamepad_button_check(global.controle,gp_face3)

if (_replay) and (bola_index > replay_vel)
{
	if (timer_lim > 0)
	{	
			bola_index -= replay_vel;
			x = bola[bola_index].x;	
			y = bola[bola_index].y;	
			image_index = bola[bola_index]._image_index;	
			sprite_index = bola[bola_index]._sprite_index;	
			image_xscale = bola[bola_index]._image_xscale;	
		
	}
}
else 
{
	bola_index++;
	bola[bola_index] = new UndoConst(x,y,image_index,sprite_index,image_xscale,false);
}

//Enconstei no player?
var _player = instance_place(x,y,obj_player);

if (_player) global.morte_real = true;








x += velh * vel;
y += velv * vel;


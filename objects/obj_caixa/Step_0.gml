/// @description Insert description here
// You can write your code in this editor
if (global.pause) exit;
//Sistema de replay
var _replay = keyboard_check(vk_shift) or gamepad_button_check(global.controle,gp_face3)

if (_replay) and (caixa_index > replay_vel)
{
	if (timer_lim > 0)
	{	
			caixa_index -= replay_vel;
			x = caixa[caixa_index].x;	
			y = caixa[caixa_index].y;	
			image_index = caixa[caixa_index]._image_index;	
			sprite_index = caixa[caixa_index]._sprite_index;	
			image_xscale = caixa[caixa_index]._image_xscale;	
		
	}
}
else 
{
	caixa_index++;
	caixa[caixa_index] = new UndoConst(x,y,image_index,sprite_index,image_xscale,false);
}




//Sistema de empurrar a caixa
if (player_exis)
{
if (obj_player.ta_empurrando == false) velh = 0;
}

var _ground = place_meeting(x,y+1,obj_chao);

if (!_ground) velv += grav;


x += velh;
y += velv;

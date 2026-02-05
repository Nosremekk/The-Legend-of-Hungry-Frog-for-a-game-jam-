/// @description Insert description here
// You can write your code in this editor

if (global.pause) exit;
//Sistema de replay
var _replay = keyboard_check(vk_shift) or gamepad_button_check(global.controle,gp_face3)

if (_replay) and (inimigo_index > replay_vel)
{
	if (timer_lim > 0)
	{	
			inimigo_index -= replay_vel;
			x = inimigo[inimigo_index].x;	
			y = inimigo[inimigo_index].y;	
			image_index = inimigo[inimigo_index]._image_index;	
			sprite_index = inimigo[inimigo_index]._sprite_index;	
			image_xscale = inimigo[inimigo_index]._image_xscale;	
		
	}
}
else 
{
	inimigo_index++;
	inimigo[inimigo_index] = new UndoConst(x,y,image_index,sprite_index,image_xscale,false);
}











//Garantindo que apos completar a animação eu volte para o idle
var _spr_imagens = sprite_get_number(spr)
if (spr != spr_inimigo_idle) and (image_index >= _spr_imagens-1) spr = spr_inimigo_idle;


if (ataque)
{
	timer_ataque--;
	if (timer_ataque <= 0)
	{
		vel = 10;
		timer_ataque = room_speed*1.5;
		ataque = false;
	}
}

//Enconstei no player?
var _player = instance_place(x,y,obj_player);
if (_player) 
{
	global.morte_persegue = true;
	x_player = _player.x;
	y_player = _player.y;
}

//Fazendo o player voltar a vida
if (instance_exists(obj_player)) and (global.morte_persegue)
{
	if (_replay) and (obj_player.x == x_player) and (y_player == obj_player.y) global.morte_persegue = false;
}






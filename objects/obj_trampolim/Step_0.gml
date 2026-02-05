/// @description Acontece a todo momento
if (global.pause) exit;
var _impulso = instance_place(x,y+1,obj_player);
var _jump = keyboard_check(ord("W")) or gamepad_button_check(global.controle,gp_face1);

if (_impulso) and (!check_anim)
{
	check_anim = true;
	audio_play_sound(snd_trampoline,3,false);
	_impulso.trampolim = true;
	
	var _shake = instance_create_layer(0,0,"instances",obj_shake);
	_shake.shake = true;
	
	
	if (_jump) 
	{
		boost = 2 
		_impulso.boost = boost;
	}
	else 
	{
		boost = 1.5;
		_impulso.boost = boost;
	}
	_impulso.velv = (-_impulso.maxvelv) * boost;	
}



if (check_anim)
{
	if (!botao_tramp)
	{
		image_index = 0;
		sprite_index = spr_trampolin_anim;
		botao_tramp = true;
	}
	
	if (image_index >= 7)
	{
		image_index = 0;
		sprite_index = spr_trampolin_idle;
		botao_tramp = false;
		check_anim = false;
	}
	
}

/// @description Sistemas e etc
// You can write your code in this editor

//Gamepad
var _slots = gamepad_get_device_count();
for (var _i = 0; _i < _slots; _i ++)
{
	if (gamepad_is_connected(_i))
	{
		global.controle = _i;	
	}
}

if (global.controle > 0) gamepad_set_axis_deadzone(global.controle,.25);
//Sistema de menu
if (room == rm_intro)
{
	if (keyboard_check_pressed(ord("W"))) or (keyboard_check_pressed(vk_up)) or (gamepad_button_check_pressed(global.controle,gp_padu))
	{
		audio_play_sound(snd_move,3,false);
		if (intro_index == 0) intro_index = 1;
		else intro_index = 0;
	}

	if (keyboard_check_pressed(ord("S"))) or (keyboard_check_pressed(vk_down)) or (gamepad_button_check_pressed(global.controle,gp_padd))
	{
		audio_play_sound(snd_move,3,false);
		if (intro_index == 0) intro_index = 1;
		else intro_index = 0;
	}
	
	//Verificando as coisa maluca com o controle
	if (gamepad_button_check_pressed(global.controle,gp_face1))
	{
	if (room == rm_intro)
	{
		if (intro_index == 0) 
			{
				audio_play_sound(snd_escolha,3,false);
				var _transicao = instance_create_layer(x,y,"instances",obj_transicao);
				_transicao.passa_fase = true;		
			}
	else game_end();
	}	
	}
}

if (room == rm_selecao)
{
	if (keyboard_check_pressed(ord("W"))) or (keyboard_check_pressed(vk_up)) or (gamepad_button_check_pressed(global.controle,gp_padu))
	{
		audio_play_sound(snd_move,3,false);
		nivel_index--;
		if (nivel_index < 0) nivel_index = 14;
	}

	if (keyboard_check_pressed(ord("S"))) or (keyboard_check_pressed(vk_down)) or (gamepad_button_check_pressed(global.controle,gp_padd))
	{
		audio_play_sound(snd_move,3,false);
		nivel_index++;
		if (nivel_index > 14) nivel_index = 0;
	}	
}







if (room != rm_intro) and (room != rm_selecao) and (room != rm_fim)
{
	//Mapeando as teclas
	keyboard_set_map(vk_left, ord("A"));
	keyboard_set_map(vk_right, ord("D"));
	keyboard_set_map(vk_down,ord("S"));
	keyboard_set_map(ord("Z"), ord("W"));
	keyboard_set_map(ord("X"), vk_shift);
	keyboard_set_map(vk_enter, vk_escape);
	//Sistema de pause
	
	if (global.contagem <= 0)
	{
		if (contando)
		{
		global.pause = false;
		contando = false;
		}
		
		if (keyboard_check_pressed(vk_escape)) or (gamepad_button_check_pressed(global.controle,gp_start))
		{
			global.pause = !global.pause;
		}
	}
	
	//Contagem regressiva
	
	else if (global.contagem > 0)
	{
		global.contagem--;
		if (global.contagem > 120) contagem_index = 0;
		else if (global.contagem > 60) contagem_index = 1;
		else 
		{
			contagem_index = 2;
		}
	}
	
	//Sistema de reiniciar
	if (keyboard_check_pressed(ord("R"))) or (gamepad_button_check_pressed(global.controle,gp_face4))
	{
		var _reinicio = instance_create_layer(0,0,"instances",obj_transicao);
		_reinicio.morte = true;
	}

}







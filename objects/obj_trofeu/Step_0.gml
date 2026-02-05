/// @description Insert description here
// You can write your code in this editor
if (global.pause) exit;
if (global.total_frutas == global.frutas_atuais)
{
	if (!botao)
	{
		if (!botao_som)
		{
			audio_play_sound(snd_win,2,false);
			botao_som = true;		
		}
		image_speed = 1;
		if (image_index >= 7)
		{
			botao = true;
			image_speed  = 0;
			pode_passar = true;
		}
	}
}

//jah podi passa?(humor)

if (pode_passar) and (instance_place(x,y,obj_player))
{
	var _transicao = instance_create_layer(x,y,"instances",obj_transicao);
	_transicao.passa_fase = true;
	if (!pode_tocar)
	{
		audio_play_sound(snd_trofeu,2,false);
		pode_tocar = true;
	}
}

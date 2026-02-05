/// @description Insert description here
// You can write your code in this editor
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




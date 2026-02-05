/// @description Insert description here
// You can write your code in this editor
sprite_index = spr_coletado;
if (!tocou_som)
{
	tocou_som = true;
	var _shake = instance_create_layer(0,0,"instances",obj_shake);
	_shake.shake = true;
	
	audio_play_sound(snd_fruta,3,false);
}
if (!troca_troca)
{
	global.frutas_atuais++;
	global.moedas++;
	show_debug_message(global.moedas);
	image_index = 0;
	troca_troca = true;
}
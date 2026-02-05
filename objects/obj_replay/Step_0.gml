/// @description voltando no tempo!
if (global.pause)
{
	if (audio_is_playing(snd_relogio)) 
	{	
		tocou_musica = false;
		audio_stop_sound(snd_relogio);	
	}
}


if (global.morte_real) exit;
if (global.pause) exit;
if (instance_exists(obj_transicao)) exit;


var _replay = keyboard_check(vk_shift) or gamepad_button_check(global.controle,gp_face3)

if (_replay) and (braid_index > replay_vel)
{
	//Limitando e aplicando o replay
	if (!player_morto) timer_lim--;//O player ta vivo e usando o replay
	else if (player_morto) and (timer_lim > 0) timer_lim += .5;//O player ta morto, entao eu adiciono uma gordura no replay para ele nao ser prejudicado
	
	if (timer_lim > 0)
	{
		braid_index-= replay_vel;	
		with (obj_player)
		{
			x = other.braid[braid_index].x;	
			y = other.braid[braid_index].y;	
			image_index = other.braid[braid_index]._image_index;	
			sprite_index = other.braid[braid_index]._sprite_index;	
			image_xscale = other.braid[braid_index]._image_xscale;	
			other.desconta_fome = other.braid[braid_index]._fome_scr;
		}
	}
	else timer_lim = 0;
}
else 
{
	braid_index++;
	braid[braid_index] = new UndoConst(obj_player.x,obj_player.y,obj_player.image_index,obj_player.sprite_index,obj_player.image_xscale,desconta_fome);
}

//Debug
show_debug_message(player_morto);

//Até morte tem limite
if (player_morto)
{
	timer_morte++;
	if (timer_morte >= room_speed*8)
	{
		var _reinicio = instance_create_layer(x,y,"instances",obj_transicao)
		_reinicio.morte = true;	
	}
}
else timer_morte = 0;

//Garantindo que o timer nao fique acima do limite
if (timer_lim > replay_lim) timer_lim = replay_lim;

//Sistema de fome
if (global.frutas_atuais > 0)
{
	desconta_fome--;
	if (desconta_fome == 0) global.morte_real = true;
}

//Som
if (_replay) and (braid_index > replay_vel) and (timer_lim > 0) and (!player_morto) and (!global.morte_real)
{
	if (tocou_musica == true)
	{
	tocou_musica = false;
	audio_play_sound(snd_relogio,1,false);	
	}
}

if ((!tocou_musica) and (!_replay)) or (timer_lim <= 0)
{
	audio_stop_sound(snd_relogio);
	tocou_musica = true;
}


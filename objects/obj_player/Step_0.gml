/// @description A qualquer(todo) momento


if (global.pause) exit;
//em transição num acontece nada!
if (instance_exists(obj_transicao)) exit;

//Checando chao
var _ground = place_meeting(x,y+1,obj_chao);


//Varaiaveis de movimento
var _left = keyboard_check(ord("A"))  or gamepad_axis_value(global.controle,gp_axislh) < -0.25;
var _right = keyboard_check(ord("D")) or gamepad_axis_value(global.controle,gp_axislh) > 0.25;
var _jump = keyboard_check(ord("W")) or gamepad_button_check(global.controle,gp_face1)
var _jump_released = keyboard_check_released(ord("W")) or gamepad_button_check_released(global.controle,gp_face1)
var _death = place_meeting(x,y,obj_fogo);
var _empurra = instance_place(x+image_xscale,y,obj_caixa);



//Checando se eu nao morri
if (_death) 
{
	player_morto = true;
	if (!grav_morte)
	{
		velv = 0;
		audio_play_sound(snd_morte,3,false);
		grav_morte = true;
		
		var _shake = instance_create_layer(0,0,"instances",obj_shake);
		_shake.shake = true;
		
	}
	
}
else if (!_death) and (!global.morte_persegue) player_morto = false;
//Mudando a sprite caso o player esteja morto


if (player_morto) and (!global.morte_real)
{
	sprite_index = spr_player_morte;
	velh = 0;
	velv += grav/5;
	if (controla_morte == false)
	{
		image_index = 0;
		controla_morte = true;
	}
	
	if (image_index >= 6)
	{
		image_speed = 0;	
		if (timer_lim <= 12)
		{
			var _reinicio = instance_create_layer(x,y,"instances",obj_transicao)
			_reinicio.morte = true;
		}
	}
}
else
{
	controla_morte = false;
	grav_morte = false;
	image_speed = 1;
}

if (global.morte_real)
{
	velh = 0;
	velv = 0;
	if (!check_morte)
	{
		sprite_index = spr_player_morte;
		image_index = 0;
		check_morte = true;
		audio_play_sound(snd_morte,3,false);
		
		var _shake = instance_create_layer(0,0,"instances",obj_shake);
		_shake.shake = true;
		
	}
	if (image_index >= 6) 
	{
		image_speed = 0;
		var _reinicio = instance_create_layer(x,y,"instances",obj_transicao)
		_reinicio.morte = true;	
	}
}

if ((_replay) and (timer_lim != 0)) or (player_morto) or (global.morte_real) exit;

//Aplicando os controles ao movimento(?)
velh = (_right - _left) * maxvelh;
if (!_ground) 
{
	velv += grav;
	//Diminuindo o corote timer
	corote_timer--;
	
	//Pulei no ar
	if (_jump)
	{
		buffer_timer = buffer_tempo;	
	}
	
}

//Aplicando o coyote e garantindo que meu boost esteja em 1, porque é impossivel eu estar em um trampolim
if (_ground) 
{
	tocou_som_pulo = false;
	boost = 1;
	corote_timer = corote_tempo;
}


//Pulando
if (_jump or buffer_timer > 0) and ((_ground) or corote_timer > 0)
{
	buffer_timer = 0;
	velv = -maxvelv;	
	if (!tocou_som_pulo) 
	{
		tocou_som_pulo = true;
		audio_play_sound(snd_jump,4,false);
	}
}

if (!_ground and velv < -maxvelv/2 and _jump_released) velv = -maxvelv/2; //Tirando o pulo


//Limitando a gravidade
if (trampolim) velv = clamp(velv, -maxvelv*boost, maxvelv*1.4);
else velv = clamp(velv, -maxvelv, maxvelv*1.4);


//Tirando o valor do buffer
if (buffer_timer > 0) buffer_timer--;

//Configurando as sprites
if (_ground) and (velh == 0) sprite_index = spr_player_idle;
else if (_ground) and (velh != 0) sprite_index = spr_player_walk;

if (!_ground) and (velv < 0) sprite_index = spr_player_jump;
else if (!_ground) and (velv > 0) sprite_index = spr_player_fall;

//Mudando a escala e fazendo o player olhar pro lado certo
if (_right) image_xscale = 1;
if (_left) image_xscale = -1;

//Verificando e aplicando o efeito de empurrar!
if (!_empurra) escalax = image_xscale;

if (_empurra) and (velh != 0)
{	 
	if (escalax == image_xscale) ta_empurrando = true;
	
	if (ta_empurrando)
	{
	
		with (_empurra)
		{
			velh = sign(other.velh);	
		}
	
	}
}
else ta_empurrando = false;




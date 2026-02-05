/// @description Insert description here
// You can write your code in this editor
if (global.pause) exit;
//Sistema de movimentação e ataque

x += velh * vel;
y += velv * vel;
sprite_index = spr;




var _volta = instance_place(x+sign(velh),y,obj_chao);

if (_volta) //verificando se eu colidi com o colisor que muda minha rota
{
	if (!pausando)
	{
		vel = 0;
		//Mudando
		velh *= -1;
		velv *= -1;
		
		//Tocando som
		audio_play_sound(snd_pedra,3,false);
		
		//Atacando
		ataque = true;
		
		pausando = true;
		image_index = 0;
			
	}
}
else pausando = false;




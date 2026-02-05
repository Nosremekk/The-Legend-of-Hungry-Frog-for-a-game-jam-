/// @description Insert description here
// You can write your code in this editor

//Sistema de colisao horizontal
repeat(abs(velh))
{
	var _velh = sign(velh);
	//Checando se eu vou bater na parede(xiiii)
	if (place_meeting(x+_velh,y,obj_chao))
	{
		//Pare!
		velh = 0;
		
		if (player_exis)
			{
				obj_player.ta_empurrando = false;
			}
		
		//Saindo do laço
		break;
	}
	else
	{
		//Eu posso me mover, 1 pixel por vez
		x += _velh;
	}
}

repeat(abs(velv))
{
	var _velv = sign(velv);
	//Checando se eu vou bater no chao
	if (place_meeting(x,y+_velv,obj_chao))
	{
		velv = 0;	
		
		if (player_exis)
		{
			obj_player.ta_empurrando = false;
		}
		
		break;
	}
	else y += _velv;
	
}

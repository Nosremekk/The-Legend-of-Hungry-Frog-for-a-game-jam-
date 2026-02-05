/// @description Colisão e movimento
if (_replay) and (timer_lim > 0) exit;
if (global.pause) exit;
//Sistema de colisao horizontal
repeat(abs(velh))
{
	var _velh = sign(velh);
	//Checando se eu vou bater na parede(xiiii)
	if (place_meeting(x+_velh,y,obj_chao))
	{
		//Pare!
		velh = 0;
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
		break;
	}
	else y += _velv;
	
}


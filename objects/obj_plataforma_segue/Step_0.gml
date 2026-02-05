/// @description Insert description here
// You can write your code in this editor
if (global.pause) exit;
//Aplicando o sistema de replay
var _replay = keyboard_check(vk_shift) or gamepad_button_check(global.controle,gp_face3)

if (_replay) and (plataforma_index > replay_vel)
{
	if (timer_lim > 0)
	{	
			plataforma_index -= replay_vel;
			x = plataforma[plataforma_index].x;	
			y = plataforma[plataforma_index].y;	
			image_index = plataforma[plataforma_index]._image_index;	
			sprite_index = plataforma[plataforma_index]._sprite_index;	
			image_xscale = plataforma[plataforma_index]._image_xscale;	
		
	}
}
else 
{
	plataforma_index++;
	plataforma[plataforma_index] = new UndoConst(x,y,image_index,sprite_index,image_xscale,false);
}









//Colisao
var _col = place_meeting(x+velh,y,obj_player) or (place_meeting(x,y-1,obj_player));

if (_col)
{
	with (obj_player)
	{
		if (!place_meeting(x+other.velh,y,obj_chao))
		{
			x += other.velh;
		}
	}
}

var _colisao = place_meeting(x, y + velv, obj_player) or place_meeting(x, y -1, obj_player) ;
if (_colisao)
{
	with(obj_player)
	{
		if (other.velv > 0) y += other.velv;
		if (!place_meeting(x, y + other.velv, obj_chao))
		{
			 y += other.velv
			 if (other.velv > 0) y -=grav;
		}
	}
}




x += velh;
y+= velv;


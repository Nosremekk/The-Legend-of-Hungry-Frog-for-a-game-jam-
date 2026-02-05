if (global.pause) exit;
// You can write your code in this editor
var _replay = keyboard_check(vk_shift) or gamepad_button_check(global.controle,gp_face3)

if (_replay) and (serra_index > replay_vel)
{
	if (timer_lim > 0)
	{	
			serra_index -= replay_vel;
			x = serra[serra_index].x;	
			y = serra[serra_index].y;	
			image_index = serra[serra_index]._image_index;	
			sprite_index = serra[serra_index]._sprite_index;	
			image_xscale = serra[serra_index]._image_xscale;	
		
	}
}
else 
{
	serra_index++;
	serra[serra_index] = new UndoConst(x,y,image_index,sprite_index,image_xscale,false);
}

//Enconstei no player?
var _player = instance_place(x,y,obj_player);
if (_player) 
{
	global.morte_persegue = true;
	x_player = _player.x;
	y_player = _player.y;
}

//Fazendo o player voltar a vida
if (instance_exists(obj_player)) and (global.morte_persegue)
{
	if (_replay) and (obj_player.x == x_player) and (y_player == obj_player.y) global.morte_persegue = false;
}








x += velh;
y += velv;
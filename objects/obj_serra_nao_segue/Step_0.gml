if (global.pause) exit;

x += velh;
y += velv;

var _replay = keyboard_check(vk_shift)

//Enconstei no player?
var _player = instance_place(x,y,obj_player);

if (_player) 
{
	if (!ja_matei)
	{
	global.morte_real = true;
	ja_matei = true;
	}
}
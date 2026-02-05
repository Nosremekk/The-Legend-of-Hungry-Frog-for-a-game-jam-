/// @description Insert description here
// You can write your code in this editor
if (global.pause) exit;
if (timer > 0)
{
	if (!keyboard_check(vk_shift)) or (!gamepad_button_check(global.controle,gp_face3))
	{
	timer--;
	}
	if (keyboard_check(vk_shift)) or (gamepad_button_check(global.controle,gp_face3)) timer = room_speed*3;
}


if (timer <= 0)
{
	var _bola = instance_create_layer(x,y,"instances",obj_bola)
	timer = room_speed * 3;
}





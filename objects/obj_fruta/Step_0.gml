/// @description Insert description here
// You can write your code in this editor
if (global.pause)
{
	image_speed = 0;	
}
else image_speed = 1;

if (global.pause) exit;

if (sprite_index == spr_coletado) and (image_index >= 5) instance_destroy();
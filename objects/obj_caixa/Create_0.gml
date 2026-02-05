/// @description Insert description here
// You can write your code in this editor

caixa_index = 0;

caixa[caixa_index] = new UndoConst(x,y,image_index,sprite_index,image_xscale,false);

replay_vel = 1;
velv = 0;
velh = 0;
grav = .2;

player_exis = instance_exists(obj_player)

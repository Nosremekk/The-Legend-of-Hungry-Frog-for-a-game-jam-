/// @description Insert description here
// You can write your code in this editor

inimigo_index = 0;

inimigo[inimigo_index] = new UndoConst(x,y,image_index,sprite_index,image_xscale,false);

replay_vel = 1;

global.morte_persegue = false;

x_player = 0;
y_player = 0;

velh = 0;
velv = 0;
vel = 10;
ataque = false;
pausando = false;
timer_ataque = room_speed*1.5;
spr = sprite_index;
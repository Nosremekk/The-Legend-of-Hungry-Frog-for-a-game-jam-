/// @description Insert description here
// You can write your code in this editor
bola_index = 0;

bola[bola_index] = new UndoConst(x,y,image_index,sprite_index,image_xscale,false);

replay_vel = 1;
velv = 1;
velh = 0;

global.morte_persegue = false;


vel = 5;

alarm[0] = room_speed * 20;

//oia o bicho vindo muluque
audio_play_sound(snd_canhao,3,false);







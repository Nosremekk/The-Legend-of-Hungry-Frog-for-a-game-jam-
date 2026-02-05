/// @description Iniciniando as variaveis

//Iniciando a mecanica de tempo ao pegar a primeira fruta
global.frutas_atuais = 0;
global.timer_fome = room_speed*10;
desconta_fome = global.timer_fome;

//Guardando minhas moedas
global.moedas_inicio = global.moedas;


//Sistema de replay
globalvar braid_index,timer_lim,replay_lim,player_morto;
replay_vel = 1;//Velocidade que o replay volta
braid_index = 0;//Garantindo o controle do index da array
braid[braid_index] = new UndoConst(obj_player.x,obj_player.y,obj_player.image_index,obj_player.sprite_index,obj_player.image_xscale,desconta_fome); // criando a array
replay_lim = 132;
timer_lim = replay_lim;

//Verificando a morte do player
player_morto = false;
timer_morte = 0;
_sub = 0;

//musica
tocou_musica = false;
primeiro_som = false;
segundo_som = false;

//Contagem regressiva
global.contagem = room_speed*3;
global.pause = true;

if (instance_exists(obj_control))
{
	obj_control.contagem_index = 0;
	obj_control.contando = true;
}

if (audio_is_playing(snd_relogio)) audio_stop_sound(snd_relogio);
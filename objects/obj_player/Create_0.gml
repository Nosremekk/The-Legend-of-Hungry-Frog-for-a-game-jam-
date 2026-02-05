/// @description iniciando variaveis e etc
// Varivaies
grav = .2;
velh = 0;
velv = 0;
maxvelh = 3;
maxvelv = 4;

global.controle = -1;

_replay = keyboard_check(vk_shift) or gamepad_button_check(global.controle,gp_face3)

//Configurando o corote pulo
corote_tempo = 5;
corote_timer = 0;

//Configurando o buffer do pulo
buffer_tempo = 5;
buffer_timer = 0;

//Botao para configurar a sprite certo porque eu sou burro
controla_morte = false;
grav_morte = false;
global.morte_persegue = false;
global.morte_real = false;
check_morte = false;

//Se eu estou em um trampolim eu posso pular mais alto
trampolim = false;
boost = 1;

//Variaveis de controle da barra e funcao
desenha_timer = function()
{
	
draw_set_color(c_black);
draw_rectangle(x-16,y-32,x+16,y-32,true);
draw_set_color(-1);
draw_set_color(c_blue);
draw_rectangle(x-16,y-32,x-16+(timer_lim/replay_lim * 32),y-32,false);
draw_set_color(-1);	
}

//Sons
tocou_som_pulo = false;

//Mecanica de empurrar
ta_empurrando = false;
escalax = image_xscale;



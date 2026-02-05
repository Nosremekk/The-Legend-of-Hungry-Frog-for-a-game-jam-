/// @description Insert description here
// You can write your code in this editor
if (global.pause) exit;
if (instance_exists(obj_transicao)) exit;
draw_self();

if (global.morte_real) exit;

var _desenha = keyboard_check(vk_shift) or gamepad_button_check(global.controle,gp_face3);

if (_desenha) and (timer_lim > 0) desenha_timer();






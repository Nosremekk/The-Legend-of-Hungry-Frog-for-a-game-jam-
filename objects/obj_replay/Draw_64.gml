/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_transicao)) exit;

var _x1,_y1,_x2,_y2,_spr_h,_spr_w;

_spr_h = sprite_get_height(spr_caveira)
_spr_w = sprite_get_width(spr_caveira)



_x1 = 20+_spr_w;
_x2 = 220+_spr_w;
_y1 = 20+_spr_h;
_y2 = 40;

//Configurando a sub_image
if (desconta_fome/global.timer_fome == 1) _sub = 0;	

if (desconta_fome/global.timer_fome <= .75) _sub = 1;
if (desconta_fome/global.timer_fome <= .5) 
{
	_sub = 2
	if (!segundo_som)
	{
		audio_play_sound(snd_alert,4,false);
		segundo_som = true;
	}
}
if (desconta_fome/global.timer_fome <= .25) 
{
	if (!primeiro_som)
	{
		audio_play_sound(snd_alert,4,false);
		primeiro_som = true;
	}
	_sub = 3;
}


//Desenhando o esqueletao

draw_sprite(spr_caveira,_sub,_x1-(_spr_w+1),_y1-(_spr_h/3))
draw_sprite(spr_caveira,_sub,_x2+2,_y1-(_spr_h/3))

//Desenhando a barra de fome
draw_set_color(c_black);

draw_rectangle(_x1,_y1,_x2,_y2,true);

draw_set_color(-1);
draw_set_color(c_orange);

draw_rectangle(_x1,_y1,_x1+(desconta_fome/global.timer_fome * 200),_y2,false);

draw_set_color(-1);

//Desenhando as frutas atuais
var _font = font_add_sprite_ext(spr_font,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,:?!()+-",true,5);
draw_set_font(_font);
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_orange)

var _x = room_width-75;

draw_text(_x,_y1,"FRUTAS:" + string(global.moedas))

draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_color(c_white);


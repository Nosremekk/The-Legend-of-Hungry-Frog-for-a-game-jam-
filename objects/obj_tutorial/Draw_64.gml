/// @description Desenhando as dicas
draw_self();

if (desenhando)  and (!global.pause)
{	
	var _dica = font_add_sprite_ext(spr_font,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,:?!()+-",true,5);
	draw_set_font(_dica);
	draw_set_color(c_orange);
	var _x = 64;
	var _y = 540;
	
	draw_text(_x,_y,dica) //desenhando a dica
	
	draw_set_font(-1);
	font_delete(_dica);
	draw_set_color(c_white);
	
}






/// @description Insert description here
// You can write your code in this editor

if (global.pause) and (room != rm_intro) and (room != rm_selecao)
{
draw_set_color(c_black)
draw_set_alpha(.25);
draw_rectangle(0,0,room_width,room_height,false);
//Desenhando um pause no centro
draw_set_alpha(1);	
draw_set_color(c_white)

if (!contando)
{
	
	
	
	var _pause = font_add_sprite_ext(spr_font,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,:?!()+-",true,5);
	draw_set_font(_pause);
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_white)	
	draw_text(room_width/2,room_height/2,"PAUSE")

	draw_set_font(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	font_delete(_pause);
}

draw_set_color(c_white)


if (contando)
{
	var _font = font_add_sprite_ext(spr_font,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,:?!()+-",true,5);
	draw_set_font(_font);
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_orange)	
	
	draw_text(room_width/2,36,"INICIO EM:" + string(contagem[contagem_index]))
	draw_set_color(c_white);
	
	draw_text(room_width/2-8,room_height/2,global.nome_nivel);
	
	draw_set_font(-1);
	draw_set_halign(-1);
	draw_set_valign(-1);
	font_delete(_font);
	
	//Tocando a contagem regressiva
	if (!audio_is_playing(snd_contagem))
	{
		audio_play_sound(snd_contagem,2,false);
	}
}

}

if (room == rm_intro) // Estou no menu inicial
{
	var _dist = 60;
	var _gui_x = display_get_gui_width();
	var _gui_y = display_get_gui_height();
	var _x = _gui_x/2
	var _y = _gui_y/2 + 80
	var _y_titulo = _gui_y/2;
	
	var _font = font_add_sprite_ext(spr_font,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,:?!()+-",true,5);
	draw_set_font(_font);
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	//desenhando o titulo do jogo
	draw_set_color(c_orange)
	draw_text(_x,_y_titulo,titulo);
	draw_set_color(c_white)
	
	//Desenhando as opçoes do player(só tem duas)
	
	for (var _i = 0; _i < op_max; _i++)
	{
		if (intro_index == _i) draw_set_color(c_orange)
		else draw_set_color(c_white)
		draw_text(_x,_y+(_dist*_i),opcoes_intro[_i]);	
	}
	
	//Creditos pro danonao
	draw_set_halign(-1)
	draw_set_valign(-1)
	draw_set_color(c_white)
	draw_text(64,520,"JOGO FEITO PARA NONEJAM 7")
	draw_set_font(-1)
	font_delete(_font);
	
	
}

//Seletor de niveis

if (room == rm_selecao)
{
	if (tampa_tela) exit;
	var _dist = 25;
	var _gui_x = display_get_gui_width();
	var _gui_y = display_get_gui_height();
	var _x = _gui_x/2
	var _y = _gui_y/2
	
	var _enter = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_escape) or (gamepad_button_check_pressed(global.controle,gp_face1)) 
	
	var _font = font_add_sprite_ext(spr_font,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,:?!()+-",true,5);
	draw_set_font(_font);
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	
	draw_set_color(c_orange);
	
	draw_text(_x,80,"FEIRA DE NIVEIS"); // "Titulo da room"
	//Desenhando o local do preço e o nome
	draw_set_halign(-1)
	draw_set_valign(-1)
	
	draw_text(100,110,"PRODUTO:");
	draw_text(800,110,"VALOR:");
	
	//Desenhando as opçoes de nivel
	var _nivel_font = font_add_sprite_ext(spr_font,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,:?!()+-",true,5);
	draw_set_font(_nivel_font);
	draw_set_color(c_white)
	draw_set_halign(-1)
	draw_set_valign(-1)
	
	
	var _tam = array_length(selecionar_niveis[0])
	
	for (var _i = 0; _i < _tam; _i++)
	{
		var _y_geral = 140+(_dist*_i)
		if (_i == nivel_index) draw_set_color(c_orange)
		else draw_set_color(c_white)
		
		draw_text(100,_y_geral,selecionar_niveis[2][_i])
		draw_text(800,_y_geral,string(selecionar_niveis[1][_i]) + "FRUTAS")
		
		//Selecionando o nivel
		if (_enter)
		{
			
			if (global.moedas >= selecionar_niveis[1][nivel_index]) //Posso "comprar"
			{
				if (selecionar_niveis[3][nivel_index] == false)
				{
					audio_play_sound(snd_escolha,3,false);
					var _destino = instance_create_layer(0,0,"instances",obj_transicao);
					_destino.destino = selecionar_niveis[0][nivel_index];
					tampa_tela = true;
					selecionar_niveis[3][nivel_index] = true;
				}
			}
			else 
			{
				if (!audio_is_playing(snd_sem_selecionar)) audio_play_sound(snd_sem_selecionar,5,false);
			}

		}
		
	}
	
	
	//Desenhando minhas frutas atuais
	draw_set_color(c_white)
	//Se eu posso comprar é laranja, se não é branco
	if (global.moedas >= selecionar_niveis[1][nivel_index]) and (selecionar_niveis[3][nivel_index] == false) 
	{
		draw_set_color(c_orange)
		draw_text(64,550,"DICA:APERTE 'ENTER' PARA COMPRAR")
	}
	else draw_set_color(c_white)
	
	draw_text(64,520,"FRUTAS:" + string(global.moedas))
	
	
	
	draw_set_font(-1)
	draw_set_color(c_white)
	
}

//Desenhando o fim
if (fim)
{
	timer_fim--;
	var _gui_x = display_get_gui_width();
	var _gui_y = display_get_gui_height();
	var _x_fim = _gui_x/2
	var _y_fim = _gui_y/2;
	
	var _fim = font_add_sprite_ext(spr_font,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,:?!()+-",true,5);
	draw_set_font(_fim);
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	//desenhando o titulo do jogo
	draw_set_color(c_orange)
	draw_text(_x_fim,_y_fim,"OBRIGADO POR JOGAR!");
	draw_set_color(c_white)
	font_delete(_fim)
	
	//Acabando o jogo
	if (timer_fim <= 0) game_end();
	
}


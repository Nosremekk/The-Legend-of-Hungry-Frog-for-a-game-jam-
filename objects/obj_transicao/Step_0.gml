/// @description Insert description here
// You can write your code in this editor

if (!inicio)
{

	if (opacidade < 1) opacidade += 0.05;

	if (opacidade >= 1)
	{
		if (passa_fase == true)	
		{
			if (room == rm_level1 or room == rm_level2 or room == rm_level3 or room == rm_intro or room == rm_levelz18)
			{
			room_goto_next();
			}
			else 
			{
				room_goto(rm_selecao)
				if (instance_exists(obj_control)) obj_control.tampa_tela = false;
			}
	
		}
		
		if (destino != false) 
		{
			room_goto(destino)
		}
	
		if (morte == true)
		{
			global.moedas = global.moedas_inicio;
			room_restart();	
		}
	
	}

}

else
{
	alpha -= .05;
	if (alpha <= 0) 
	{
		instance_destroy()	
	}
	
}


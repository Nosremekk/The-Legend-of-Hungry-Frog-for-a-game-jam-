/// @description Insert description here
// You can write your code in this editor

//Contagem regressiva
global.contagem = 0;
contando = true;



global.controle = -1;






//Criando o pause
global.pause = false;

//Menu inicial
if (room == rm_intro)
{
	font = noone;
	opcoes_intro = ["INICIAR JOGO", "SAIR DO JOGO"];
	op_max = array_length(opcoes_intro);
	intro_index = 0;
	titulo = "THE LEGEND OF THE HUNGRY FROG: ECONOMY OF TIME";
}

//Sistema de seletor de niveis(room,preço,nome)
selecionar_niveis = [
[rm_level4,rm_level5,rm_level6,rm_level7,rm_level8,rm_level9,rm_levelz10,rm_levelz11,
rm_levelz12,rm_levelz13,rm_levelz14,rm_levelz15,rm_levelz16,rm_levelz17,rm_levelz18], 
[30,20,30,7,15,7,7,25,15,15,10,25,65,55,75], 
["NOVOS DESAFIOS","SERRAS QUE DESAFIAM O TEMPO", "PLATAFORMAS", "TRAMPOLIM",
"CONQUISTA AUREA","PONTE PERIGOSA","HOBBIE: MOVER CAIXAS","PLATAFORMA + TRAMPOLIM","ZOMBANDO DA GRAVIDADE",
"O INIMIGO","CUIDADO POR ONDE ANDA","O INIMIGO E O ESPINHO","CEU DANOSO","ATAQUE AEREO","O FIM"],
[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]]

nivel_index = 0;

tampa_tela = false;


//Sistema de economia
global.moedas = 0;

//Contagem regrassiva
contagem = [3,2,1];
contagem_index = 0;
global.nome_nivel = ".";

//fim
fim = false;
timer_fim = room_speed * 51;

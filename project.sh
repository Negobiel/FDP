#!/bin/bash
USER="Raquitico"
PASS="132"
function CARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
> $NOME
dialog -- title "Informação" --msgbox "Arquivo Criado com sucesso" 0 0
GARQ
}
function AARQ(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do arquivo" 0 0)
rm $NOME
dialog -- title "Informação" --msgbox "Arquivo apagado com sucesso" 0 0
GARQ
}
function CDIR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do diretório" 0 0)
mkdir $NOME
dialog -- title "Informação" --msgbox "Diretório Criado com sucesso" 0 0
GARQ
}
function ADIR(){
NOME=$(dialog --stdout --title "Nome" --inputbox "Digite o nome do diretório" 0 0)
rmdir $NOME
dialog -- title "Informação" --msgbox "Diretório apagado com sucesso" 0 0
GARQ
}
function LDIR(){
dialog --stdout --title "Listar" --inputbox "Digite o nome do local:" 0 0
ls -la > /tmp/listar.txt
dialog -- title "Listar" --textbox /tmp/listar.txt 0 0
GARQ
}

function GARQ(){
OPCAO=$(dialog						\
	--stdout					\
	--title 'Gerenciador de Arquivos'		\
	--menu 'Escolha uma opção:'			\
	0 0 0						\
	1 "Criar arquivos"				\
	2 "Apagar arquivos"				\
	3 "Criar Diretórios"				\
	4 "Apagar Diretório"				\
	5 "Listar Diretórios"				\
	6 "Voltar")

	case $OPCAO in
		1) CARQ ;;
		2) AARQ ;;
		3) CDIR ;;
		4) ADIR ;;
		5) LDIR ;;
		6) MENU ;;
		*) dialog --title "Opção invalida" --msgbox "Digite Novamente" 0 0 ; GARQ ;;
	esac
}
function GUSR(){
	dialog --title "Construção" --msgbox "Estamos em construção." 5 40
	MENU
}
function GRED(){
	dialog --title "Construção" --msgbox "Estamos em construção." 5 40
	MENU
}
function GDIS(){
	dialog --title "Construção" --msgbox "Estamos em construção." 5 40
	MENU
}
function GREP(){
	dialog --title "Construção" --msgbox "Estamos em construção." 5 40
	MENU
}

function MENU(){	# Cria uma função chamada MENU
OPCAO=$(dialog						\
	--stdout					\
	--title 'MENU'					\
	--menu 'Escolha uma opção:'			\
	0 0 0						\
	1 "Gerenciar Arquivos"				\
	2 "Gerenciar Usuários"				\
	3 "Gerenciar Rede"				\
	4 "Gerenciar Dispositivos"			\
	5 "Gerenciar Repositório"			\
	6 "Sair")

	case $OPCAO in
		1) GARQ ;;
		2) GUSR ;;
		3) GRED ;;
		4) GDIS ;;
		5) GREP ;;
		6) FIM ;;
		*) dialog --title "Opção invalida" --msgbox "Digite Novamente" 0 0 ; MENU ;;
	esac
}
function FIM(){
	dialog --title 'Fim' --msgbox "Até breve" 0 0
	exit 0
}
clear
#read -p "Usuario: " USUARIO
USUARIO=$(dialog				\
		--stdout			\
		--title 'Login'			\
		--inputbox 'Digite seu usuario'	\
		0 0)

#read -s -p "Senha: " SENHA
SENHA=$(dialog					\
		--stdout			\
		--title 'Senha'			\
		--passwordbox 'Digite sua senha'	\
		0 0)

[ $USUARIO == $USER ] && [ $SENHA == $PASS ] && MENU || FIM # || -> se nada for verdadeiro execute tal feito

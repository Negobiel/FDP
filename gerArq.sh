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
LISTA=$(dialog --stdout --title "Listar" --inputbox "Digite o nome do local:" 0 0)
ls -lah $LISTA > /tmp/listar.txt
dialog -- title "Listar" --textbox /tmp/listar.txt 0 0
GARQ
}
function SESQ(){
NAME=$(dialog --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod 222 $NAME
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
PERM
}
function SLER(){
NAME=$(dialog --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod 444 $NAME
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
PERM
}
function SEXE(){
NAME=$(dialog --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod +x $NAME
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
PERM
}

function LEEX(){
NAME=$(dialog --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod 555 $NAME
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
PERM
}

function ESEX(){
NAME=$(dialog --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod 666 $NAME
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
PERM
}

function PETO(){
NAME=$(dialog --title 'Nome' --inputbox 'Insira o nome do Arquivo para "Permissionar" ' 0 0)
chmod 777 $NAME
dialog --title 'Informação' --msgbox 'Permissionado com sucesso' 0 0
PERM
}

function PERM(){
OPCAO=$(dialog						\
	--stdout					\
	--title 'Permissionamento'			\
	--menu 'Escolha uma opção de Permissionamento'	\
	0 0 0						\
	1 'Só Escrever'					\
	2 'Só Ler'					\
	3 'Só Executar'					\
	4 'Ler e Executar'				\
	5 'Ler e Escrever'				\
	6 'Escrever e Executar'				\
	7 'Permissão Total'				\
	8 'Voltar')

case $OPCAO in
	1) SESQ ;;
	2) SLER ;;
	3) SEXE ;;
	4) LEEX ;;
	5) LEES ;;
	6) ESEX ;;
	7) PETO ;;
	8) GARQ ;;
	*) dialog --title "Opção invalida" --msgbox "Digite Novamente" 0 0 ; PERM ;;
esac
}

function GARQ(){
OPCAO=$(dialog						\
	--stdout					\
	--title 'Gerenciador de Arquivos'		\
	--menu 'Escolha uma opção:'			\
	0 0 0						\
	1 "Criar arquivo"				\
	2 "Apagar arquivo"				\
	3 "Criar Diretório"				\
	4 "Apagar Diretório"				\
	5 "Listar Diretório"				\
	6 "Permissionamento"				\
	7 "Copiar Arquivo/Diretório"			\
	8 "Mover Arquivo/Diretório"			\
	9 "Voltar")

case $OPCAO in
	1) CARQ ;;
	2) AARQ ;;
	3) CDIR ;;
	4) ADIR ;;
	5) LDIR ;;
	6) PERM ;;
	7) CARD ;;
	8) MARQ ;;
	9) MENU ;;
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

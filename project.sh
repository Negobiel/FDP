#!/bin/bash
clear
USER=Alguem
PASS=1234
VOLTA=5
while (( $VOLTA != 0 )); do
	dialog --msgbox 'Olá usuário, por favor faça o seu Login'\
	QNT=1
	while (( $QNT <= 5 )); do
	LOGIN=$( dialog --stdout --inputbox 'Digite o seu login:' 0 0 )\
	SENHA=$( dialog --stdout --passwordbox 'Digite a sua Senha:' 0 0 )\
		if [ $LOGIN == $USER -a $SENHA == $PASS ];then
			dialog --msgbox 'Login e senha corretas'\
			QNT=6
			VOLTA=0
		else
			dialog --msgbox 'Login ou senha incorreto'\
		fi
	let QNT=(QNT=1)
	done
done

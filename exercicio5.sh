#!/bin/bash
SALARIO=1
SALARIO1=0
SALARIO2=0
SALARIO3=0
clear
while (( $SALARIO != 0 )); do
	echo "Digite um salário: "
	read SALARIO
	if (( $SALARIO > $SALARIO1 )); then
		SALARIO3=$SALARIO2
		SALARIO2=$SALARIO1
		SALARIO1=$SALARIO
	else
	 if (( $SALARIO != $SALARIO1 )); then
		if (( $SALARIO > $SALARIO2 )); then
			SALARIO3=$SALARIO2
			SALARIO2=$SALARIO
		else
		    if (( $SALARIO != $SALARIO2 )); then
			if (( $SALARIO > $SALARIO3 )); then
				SALARIO3=$SALARIO
			fi
		    fi
		fi
	 fi
	fi

done
echo "Os 3 maiores salários são:"
echo "Primeiro Maior Salário: $SALARIO1"
echo "O Segundo Maior Salário: $SALARIO2"
echo "O Terceiro Maior Salário: $SALARIO3"

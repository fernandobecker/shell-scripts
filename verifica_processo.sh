#!/bin/sh
##################################
# Script para monitorar processo #
##################################
# nome do processo a ser filtrado
PROCESSO="georreferenciamento.jar"
# intervalo que sera feita a checagem (em segundos)
INTERVALO=10
while true; do
    # numero de cópias do processo rodando
    OCORRENCIAS=`ps ax | grep $PROCESSO | grep -v grep| wc -l`
    if [ $OCORRENCIAS -eq 0 ]; then
               # Se o numero de processos rodando é 0, executa novamente
               # a aplicação.
               ./executa_processo.sh $PROCESSO
     fi
     # Aguarda o intervalo especificado na variável e executa novamente o script
     sleep $INTERVALO
done
# Fim do Script

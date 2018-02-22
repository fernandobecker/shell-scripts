#!/bin/sh
##################################
# Script para monitorar processo #
##################################
# nome do processo a ser filtrado
PROCESSO="georreferenciamento.jar"
# intervalo que sera feita a checagem (em segundos)
INTERVALO=10
while true; do
    # numero de c�pias do processo rodando
    OCORRENCIAS=`ps ax | grep $PROCESSO | grep -v grep| wc -l`
    if [ $OCORRENCIAS -eq 0 ]; then
               # Se o numero de processos rodando � 0, executa novamente
               # a aplica��o e notifica a area de TI
               ./executa_processo.sh $PROCESSO
     fi
     # Aguarda o intervalo especificado na vari�vel e executa novamente o script
     sleep $INTERVALO
done
# Fim do Script
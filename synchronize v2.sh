#!/bin/bash

# O objetivo do Script é usar o while para ficar verificando se existe uma arquivo numa determinada pasta e move-la oara outra

origem="/home/ramon/Dropbox/teste/*.jpg"       # variaveis com os endereços (só está funcionado quando passa o nome do arquivo)
destino="/home/ramon/Documentos/"

while :                                         # O while está sendo executado em modo loop infinito
echo "Rodando.."                                # Uma mensagem de teste para verificar se está rodando
do                                              # "do" indica que foi passo para "while" para verificar foi aceito
    if [ -n "$origem" ]; then                   # "if" está comparando se tem um arquivo usando "-f" com diretorio "origem"
        echo "Existe o Arquivo"                 # mensagem
        mv $origem $destino  
        if [ -z "$origem" ]; then
            echo "Existe o Arquivo 2"                 # mensagem
            mv $origem $destino                     # comando "mv" para mover o arquivo que está na variavel "origem" para a variavel "destino"
            echo "Funciona !! 2"                      # mensagem
            #exit                                   # caso encontre o arquivo fecha o programa
        else                                        # else está sendo usando caso a condição do "if" nao seja aceita
        echo "Não foi encotrado o Arquivo"           # mensagem
        fi
    fi                                          # finalizando o if e else
    sleep 10                                    # o programa aguardando 10 segundo
done                                            # finalizando o while

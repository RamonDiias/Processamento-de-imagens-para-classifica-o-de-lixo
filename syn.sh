#!/bin/bash

# Ramon David - 13/05/2018

# Variaveis:
# Origem: Tem o caminho onde a foto será salvada para fazer o treinamento
# Destino: Tem o caminho onde a foto será movida para ser utilizada
origem="/home/ramon/Dropbox/analise/*.jpg"  # verficar se existe um arquivo com a extenção .jpg no diretorio
destino="/home/ramon/Documentos/teste/tensorflow-for-poets-2-master" 

# começando com um While que ficar execultado um loop infinito
while :
do  
    # Començando com if dentro do paramentro "-n" serve para verificar se não pasta vazia no diretorio "Origem"
    # caso não esteja ele entra, caso contrario não entra no if
    if [ -n "$origem" ]; then 
        # Apos identificar o arquivo com a extensão ".jpg" vamos mover para o diretorio "Destino"
        mv $origem $destino 
        # renomeando o arquivo para um nome padrao para fazer a analisa da imagem para o TensorFlow
        mv *.jpg objeto.jpg  
        # chamando o segundo script 
        ./syn2.sh 
        sleep 5 # esperando 5 segundo 
        rm objeto.jpg # removendo a imagem 
        rm resultado.txt # removendo os resultados dos teste
        rm resultado2.txt
    fi
    sleep 10 # A cada 10 segundos o scrip verifica se tem um arquivo no diretorio Origem graças ao while
done

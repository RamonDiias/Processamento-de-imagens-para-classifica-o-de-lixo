#!/bin/bash

# Ramon David - 13/05/2018

# Continuando o script - Apos mover a imagem para o diretorio "Destino" iremos verificar se existe
# um arquivo com o nome: "objeto.jpg". Esse processo foi utilizado para ajudar na classificação da imagem 
# já que cada imagem tem um nome diferente, então o que fizemos foi colocar um nome padrão para todas as imagens
# assim que for identificado no script "syn.h na linha 16".

# A varivel "Validar" tem o diretorio onde contem o caminho a qual a foto será analisada 
validar="/home/ramon/Documentos/teste/tensorflow-for-poets-2-master/objeto.jpg"

# Dentro do paramentro If temos "-f" serve para validar se existe um arquivo no diretorio da variavel (Validar), assim que tiver um 
# arquivo nesse local entra no if, se não ele sai e volta para o script anterior para e esperar 10 segudos para fazer o processo novamente
if [ -f "$validar" ]; then
    #echo "analisando"
    # O comando mpg321 serve para executar musica pelo terminal, então o que estou fazendo é passar o caminho ontem tem um
    # arquivo .mp3 para ser executado.
    mpg321 /home/ramon/Documentos/teste/audios/analisando.mp3 # reproduzindo o audio 
    # O comando abaixo é para fazer a classificação da imagem usando o TensorFlow, como pode observar na linha: 27
    # temos a varialvel "Validar" e como dito temos o caminho da imagem que iremos classificar, e por isso que colocamos
    # um padrao nos nomes das imagens, para facilitar a detecção da imagem no if da linha: 15.
    # e utilizar ">"" para salvar o resultado da classificação num arquivo .txt (resultado.txt)

    python -m scripts.label_image \
    --graph=tf_files/retrained_graph.pb  \
    --image=$validar > resultado.txt 

    # Apos fazer a classificação da imagem, temos o resultado gerado e salvo num arquivo .txt
    # Agora vamos fazer com que o script chama um programa em python para ler esse arquivo .txt
    # para validar que tipo de objeto foi identificado na classificação.
    python classifier.py # chamando o classifier.py (rodando o software em python pelo terminal)
fi

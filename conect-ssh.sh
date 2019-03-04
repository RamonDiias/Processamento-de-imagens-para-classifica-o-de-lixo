#!/bin/bash

# O objetivo é conectar via ssh já passando a senha e realizar comandos automaticos no desktop conectado

# Ramon David 12/05/2018 

# Programa instalados
# sudo apt-get install ssh
# sudo apt-get install sshpass

ip="192.168.0.112" # ip da maquina que será conectada
user="ramon"   	   # passando o user da maquina
senha="123456" # passando a senha para variavel

# O que está entre "" é o comando que será utilizado na maquina conectada

# fazendo a conecao em ssh
sshpass -p $senha ssh $user@$ip "python ssh-py.py"



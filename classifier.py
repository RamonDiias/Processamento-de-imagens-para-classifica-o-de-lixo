# Ramon David - 13/05/2018

# O software em python irar ler os resultado gerados apos a classficação do TensorFLow, para assim fazer 
# o reconhecimento do objeto

import os # A biblioteca usa o python para utilizar comandos do shell script

# Lendo o que está no aquivo "resultado.txt" fornecido do tensorflow
arquivo = open("resultado.txt","r")
# Exibindo o que está escrito
print(arquivo.readline())# 1 - pulando linha apos linha
print(arquivo.readline())# 2
print(arquivo.readline())# 3
# Atribuindo para "resultado" o que está escrito na 4 linha do arquivo, essa linha tem o que precissamos para fazer a identificação do objeto
filtro = arquivo.readline()# 4 linha 

# O resultado2.txt tem o resultado filtrado, o necessario para fazer a distinção do objeto
# abrindo e crinado um arquivo para escrita 
file_read = open("resultado2.txt","w")
# gravando o que está escrito na variavel (filtro) no arquivo resultado2
file_read.write(str(filtro))

# fechando os arquivos "file" "file_read"
arquivo.close()
file_read.close()

# Lendo um arquivo(leitura) para fazer a leitura do "resultado2.txt"
leitura = open("resultado2.txt","r")

# atribuindo para variavel "verificador" o que está escrito em resultado2.txt
verificador = leitura.read()
#print (verificador)
aux = verificador.split(" ") # comando split separa as letras pelos os espaços 
# aux irar receber as palavras separadamente em um vertor
# Ex: linha escrita: maca 7.65658484
# aux[0]: maca e aux[1]: 7.65658484

# aux[0] -> Recebe o nome do objeto
# aux[1] -> Recebe o peço da classificação

# tranformar o string em numero float
numero = (float(aux[1])) # transformando a string em float e atribuindo para numero 

#----------Local onde irar selecionar os objetos identificados----------------
# analisando o resultado se for Banana 
if (aux[0] == "banana") and (numero == 1.0): # Verificando e a palavra e a confiabilidade do objeto classificado para uma resultado preciso
    os.system("mpg321 /home/ramon/Documentos/teste/audios/banana.mp3") # Irar reproduzir o som especifido do objeto passando o endereço do mp3
    # "os.system" utilizado os comandos do linux na linguagem python
    # Agora temos que fazer que o programa converse com a estera que está sendo prejetada
    print ("funcionou banana")

# analisando o resultado se for Maça
elif (aux[0] == "maca") and (numero == 1.0):    
    os.system("mpg321 /home/ramon/Documentos/teste/audios/maca.mp3")# Reproduzindo o som referente a maça
    # acionar a estera
    print("funcionou maca")

# analisando o resultado se for lapis
elif (aux[0] == "lapis") and (numero == 1.0):
    os.system("mpg321 /home/ramon/Documentos/teste/audios/lapis.mp3")# Reproduzindo o som referente ao lapis
    print("funcionou lapis")

# caso nao encontre o objeto 
else:
    print("Objeto não identificado !")
    os.system("mpg321 /home/ramon/Documentos/teste/audios/objeto-nao-identificado.mp3")# Reproduzindo o som caso nao encontre nada



function Program {
    #Criando variável em forma de vetor de bytes
    [byte[]] $variavel = (60, 111, 105, 90, 89, 127,192)
    #Gravando conteúdo da variável byte no arquivo
    Set-Content 'C:\Users\Thiago\Documents\Arquivo.extensao' -Encoding Byte ($variavel)
    # Nesse caso, o comando pode criar um novo arquivo ou alterar o conteúdo de um arquivo existente. É fundamental que a extensão seja escrita ao lado do nome do arquivo.
}
 
Program

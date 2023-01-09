function Program {
    #Gravando conteúdo do arquivo na variável do tipo byte
    $file = Get-Content 'C:\Users\Thiago\Documents\Arquivo.extensao' -Encoding Byte
#  No local do caminho, faça referência a qualquer arquivo
# Quanto maior for o arquivo, mais tempo demora de ser gravado e mais espaço ocupa na memória!
    Write-Host $file #Mostra o conteúdo da variável na tela
}
 
Program

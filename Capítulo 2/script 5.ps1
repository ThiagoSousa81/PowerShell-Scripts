Add-Type -AssemblyName System.Windows.Forms
$OFD = New-Object System.Windows.Forms.OpenFileDialog
$OFD.Title = 'Abrir'
$SFD = New-Object System.Windows.Forms.SaveFileDialog
$SFD.Title = 'Salvar'
 
# Esta fução é responsável por codificar o arquivo
function Encode {
    $OFD.ShowDialog()
    $File = $OFD.FileName
    [byte[]] $conteudo = Get-Content $File -Encoding Byte
    $retorno = [Convert]::ToBase64String($conteudo)
    $SFD.ShowDialog()
    $File = $SFD.FileName
    Set-Content $File -Encoding Byte ([Text.Encoding]::UTF8.GetBytes($retorno))
}
 
# Esta função é responsável por decodificar o arquivo
function Decode {
    $OFD.ShowDialog()
    $File = $OFD.FileName
    $conteudo = Get-Content $File
    [byte[]] $retorno = [Convert]::FromBase64String($conteudo)
    $SFD.ShowDialog()
    $File = $SFD.FileName
    Set-Content $File -Encoding Byte ($retorno)
}

#Chamando as funções...
Encode

Decode

# Importando o namespace System.Windows Forms
Add-Type -AssemblyName System.Windows.Forms
#criando o componente Save File Dialog
$SFD = New-Object System.Windows.Forms.SaveFileDialog
$SFD.Title = 'Salvar arquivo'
function Program {
    #conteúdo
    [byte[]] $conteudo = [Text.Encoding]::UTF8.GetBytes("Olá mundo") #aqui é outra forma de fazer a mesma coisa
    $SFD.ShowDialog()
    $File = $SFD.FileName
    Set-Content $File -Encoding Byte ($conteudo)
    Write-Host $File
}
 
Program

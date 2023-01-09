# Importando o namespace System.Windows Forms
Add-Type -AssemblyName System.Windows.Forms
#criando o componente Open File Dialog
$OFD = New-Object System.Windows.Forms.OpenFileDialog
$OFD.Title = 'Importar novo arquivo'
function Program {
    $File = $OFD.ShowDialog()
    $File = Get-Content $File -Encoding Byte
    Write-Host $File
}
 
Program

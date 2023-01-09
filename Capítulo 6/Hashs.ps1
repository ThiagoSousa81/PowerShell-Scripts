#Hasheando textos com funções
 
Function MD5 ($Text) {
    $Algoritm = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
    $Cod = New-Object -TypeName System.Text.UTF8Encoding
    $Hash = [System.BitConverter]::ToString($Algoritm.ComputeHash($Cod.GetBytes($Text)))
    $Hash = $Hash.Replace("-", "")
    Write-Host $Hash
}
 
Function RIPEMD160 ($Text) {
    $Algoritm = New-Object -TypeName System.Security.Cryptography.RIPEMD160Managed
    $Cod = New-Object -TypeName System.Text.UTF8Encoding
    $Hash = [System.BitConverter]::ToString($Algoritm.ComputeHash($Cod.GetBytes($Text)))
    $Hash = $Hash.Replace("-", "")
    Write-Host $Hash
}
 
Function SHA1 ($Text) {
    $Algoritm = New-Object -TypeName System.Security.Cryptography.SHA1CryptoServiceProvider
    $Cod = New-Object -TypeName System.Text.UTF8Encoding
    $Hash = [System.BitConverter]::ToString($Algoritm.ComputeHash($Cod.GetBytes($Text)))
    $Hash = $Hash.Replace("-", "")
    Write-Host $Hash
}
 
Function SHA256 ($Text) {
    $Algoritm = New-Object -TypeName System.Security.Cryptography.SHA256CryptoServiceProvider
    $Cod = New-Object -TypeName System.Text.UTF8Encoding
    $Hash = [System.BitConverter]::ToString($Algoritm.ComputeHash($Cod.GetBytes($Text)))
    $Hash = $Hash.Replace("-", "")
    Write-Host $Hash
}
 
Function SHA384 ($Text) {
    $Algoritm = New-Object -TypeName System.Security.Cryptography.SHA384CryptoServiceProvider
    $Cod = New-Object -TypeName System.Text.UTF8Encoding
    $Hash = [System.BitConverter]::ToString($Algoritm.ComputeHash($Cod.GetBytes($Text)))
    $Hash = $Hash.Replace("-", "")
    Write-Host $Hash
}
 
Function SHA512 ($Text) {
    $Algoritm = New-Object -TypeName System.Security.Cryptography.SHA512CryptoServiceProvider
    $Cod = New-Object -TypeName System.Text.UTF8Encoding
    $Hash = [System.BitConverter]::ToString($Algoritm.ComputeHash($Cod.GetBytes($Text)))
    $Hash = $Hash.Replace("-", "")
    Write-Host $Hash
}
 
#Aqui é só chamar as funções com os parâmtros
MD5("Texto para hashear em MD5")
SHA384("Texto para hashear em SHA-384")

#Este script criptografa e descriptografa um texto estático com o algoritmo de encriptação RC2
 
#Função para encriptar
Function Encrypt(){ 
    $Texto = "Texto para criptografia!"
    $Key = [Text.Encoding]::UTF7.GetBytes("senha1234567890A")
    $IV = (0x44, 0x74, 0x19, 0x2C, 0x53, 0x49, 0xAB, 0xBC)
    $BytesTexto = [Text.Encoding]::UTF8.GetBytes($Texto)
    $RC2_CSP = New-Object System.Security.Cryptography.RC2CryptoServiceProvider
    $MS = New-Object System.IO.MemoryStream
    $CS = New-Object Security.Cryptography.CryptoStream $MS, $RC2_CSP.CreateEncryptor($Key, $IV), "Write"
    $SW = New-Object System.IO.StreamWriter $CS
    $SW.Write($BytesTexto,0,$BytesTexto.Length)
    $SW.Close()
    $CS.Close()
    [byte[]] $result = $MS.ToArray()
    $EncryptedString = [Convert]::ToBase64String($result)
    Write-Host $EncryptedString
}
 
#Função para desencriptar
Function Decrypt(){
    $Texto = "nVClWbJ1tvVI8R5mDIP2NWWw1OfVpdDw3KWUC69Dkug="
    $Key = [Text.Encoding]::UTF7.GetBytes("senha1234567890A")
    $IV = (0x44, 0x74, 0x19, 0x2C, 0x53, 0x49, 0xAB, 0xBC)
    $BytesTextoCriptografado = [Convert]::FromBase64String($Texto)
    $RC2_CSP = New-Object System.Security.Cryptography.RC2CryptoServiceProvider
    $MS = New-Object System.IO.MemoryStream
    $CS = New-Object Security.Cryptography.CryptoStream $MS, $RC2_CSP.CreateDecryptor($Key, $IV), "Write"
    $CS.Write($BytesTextoCriptografado, 0,$BytesTextoCriptografado.Length)
    $CS.FlushFinalBlock()
    $TextoPlano = [Text.Encoding]::UTF8.GetString($MS.ToArray())
    $CS.Close()
    $MS.Close()
    Write-Host $TextoPlano
}

# Chamando as funções...
Encrypt
Decrypt


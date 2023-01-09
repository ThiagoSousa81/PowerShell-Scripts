#Este script criptografa e descriptografa um texto estático com o algoritmo de encriptação 3DES
 
#Função para encriptar
 
Function Encrypt(){
    $Texto = "Texto para criptografia!"
    $Key = [Text.Encoding]::UTF8.GetBytes("senha1234567890A")
    $IV = [Text.Encoding]::UTF8.GetBytes("01234567")
    $BytesTexto = [Text.Encoding]::UTF8.GetBytes($Texto)
    $3DES_CSP = New-Object System.Security.Cryptography.TripleDESCryptoServiceProvider
    $MS = New-Object System.IO.MemoryStream
    $CS = New-Object Security.Cryptography.CryptoStream $MS, $3DES_CSP.CreateEncryptor($Key, $IV), "Write"
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
    $Texto = "M3iH9Qkbpo4M3Khi5XA2PevbnPCUmbvhrR4iVKfoNCA="
    $Key = [Text.Encoding]::UTF8.GetBytes("senha1234567890A")
    $IV = [Text.Encoding]::UTF8.GetBytes("01234567")
    $BytesTextoCriptografado = [Convert]::FromBase64String($Texto)
    $3DES_CSP = New-Object System.Security.Cryptography.TripleDESCryptoServiceProvider
    $MS = New-Object System.IO.MemoryStream
    $CS = New-Object Security.Cryptography.CryptoStream $MS, $3DES_CSP.CreateDecryptor($Key, $IV), "Write"
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
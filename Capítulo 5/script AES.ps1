
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
#Este script criptografa e descriptografa um texto estático com o algoritmo de encriptação AES
 
#Função para encriptar
 
Function Encrypt(){
    $Texto = "Texto para criptografia!"
    $Key = [Text.Encoding]::UTF8.GetBytes("senha1234567890A")
    $IV = [Text.Encoding]::UTF8.GetBytes("0123456789ABCDEF")
    $BytesTexto = [Text.Encoding]::UTF8.GetBytes($Texto)
    $AES_CSP = New-Object System.Security.Cryptography.AESCryptoServiceProvider
    $MS = New-Object System.IO.MemoryStream
    $CS = New-Object Security.Cryptography.CryptoStream $MS, $AES_CSP.CreateEncryptor($Key, $IV), "Write"
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
    $Texto = "aIICVdsH/j0b+ScPWKT5x2hvqANJWgxZugPL05mG2Qc="
    $Key = [Text.Encoding]::UTF8.GetBytes("senha1234567890A")
    $IV = [Text.Encoding]::UTF8.GetBytes("0123456789ABCDEF")
    $BytesTextoCriptografado = [Convert]::FromBase64String($Texto)
    $AES_CSP = New-Object System.Security.Cryptography.AESCryptoServiceProvider
    $MS = New-Object System.IO.MemoryStream
    $CS = New-Object Security.Cryptography.CryptoStream $MS, $AES_CSP.CreateDecryptor($Key, $IV), "Write"
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
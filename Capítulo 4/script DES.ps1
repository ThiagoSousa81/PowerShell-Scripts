
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
#Este script criptografa e descriptografa um texto estático com o algoritmo de encriptação DES
 
#Função para encriptar
Function Encrypt(){ 
    $Texto = "Texto para criptografia!"
    $Key = [Text.Encoding]::UTF7.GetBytes("senha123")
    $IV = (0x44, 0x74, 0x19, 0x2C, 0x53, 0x49, 0xAB, 0xBC)
    $BytesTexto = [Text.Encoding]::UTF8.GetBytes($Texto)
    $DES_CSP = New-Object System.Security.Cryptography.DESCryptoServiceProvider
    $MS = New-Object System.IO.MemoryStream
    $CS = New-Object Security.Cryptography.CryptoStream $MS, $DES_CSP.CreateEncryptor($Key, $IV), "Write"
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
    $Texto = "iPcsIF1xWsQN/SSSZ/UIlgYMVE/Ev6K/jfqM0EiFETg="
    $Key = [Text.Encoding]::UTF7.GetBytes("senha123")
    $IV = (0x44, 0x74, 0x19, 0x2C, 0x53, 0x49, 0xAB, 0xBC)
    $BytesTextoCriptografado = [Convert]::FromBase64String($Texto)
    $DES_CSP = New-Object System.Security.Cryptography.DESCryptoServiceProvider
    $MS = New-Object System.IO.MemoryStream
    $CS = New-Object Security.Cryptography.CryptoStream $MS, $DES_CSP.CreateDecryptor($Key, $IV), "Write"
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


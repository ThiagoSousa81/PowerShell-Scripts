function Program {
    [System.Console]::WriteLine("Digite um texto:")
    $text = [Console]::ReadLine()
    $CodUTF8Text = [System.Text.Encoding]::UTF8.GetBytes($text)
    [System.Console]::WriteLine("Texto em matriz de números binários convertidos em decimal: " + $CodUTF8Text)
    $b64Text = [System.Convert]::ToBase64String($CodUTF8Text)
    [System.Console]::WriteLine("Base 64 do texto: " + $b64Text)
    $CodUTF8Text = [System.Convert]::FromBase64String($b64Text)
    [System.Console]::WriteLine("Texto da Base 64 em matriz de números binários convertidos em decimal: " + $CodUTF8Text)
    $OldText = [System.Text.Encoding]::UTF8.GetString($CodUTF8Text)
    [System.Console]::WriteLine("Texto transformado da base 64 para texto plano: " + $OldText)
}
 
Program


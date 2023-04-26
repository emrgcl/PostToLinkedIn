[CmdLetBinding()]
Param(
  
    [string]$NumberOfChars = 32
)
-join ((48..57) + (65..90) + (97..122) | Get-Random -Count $NumberOfChars | ForEach-Object { [char]$_ })
@echo off
setlocal enabledelayedexpansion

:: Define os arquivos de entrada e saída
set "INPUT_FILE=init.lua"
set "OUTPUT_FILE=this_is_a_txt.txt"
set "TEMP_FILE=temp_textures.txt"

:: Verifica se o arquivo init.lua existe na pasta atual
if not exist "%INPUT_FILE%" (
    echo [ERRO] O arquivo init.lua nao foi encontrado nesta pasta.
    pause
    exit /b
)

echo Analisando o arquivo %INPUT_FILE% do Luanti...

:: Esvazia ou cria os arquivos temporarios e de saida
type null > "%TEMP_FILE%"
type null > "%OUTPUT_FILE%"

:: Varre o arquivo procurando por extensoes de textura comuns (.png, .jpg, .jpeg)
:: O PowerShell e usado aqui de forma invisivel para garantir uma busca precisa por RegExp
powershell -Command "Select-String -Path '%INPUT_FILE%' -Pattern '[a-zA-A0-9_\-\.]+\.(png|jpg|jpeg)' -AllMatches | ForEach-Object { $_.Matches.Value } | Out-File -FilePath '%TEMP_FILE%' -Encoding utf8"

:: Remove duplicadas para entregar uma lista limpa
powershell -Command "Get-Content '%TEMP_FILE%' | Sort-Object -Unique | Out-File -FilePath '%OUTPUT_FILE%' -Encoding utf8"

:: Apaga o arquivo temporario
if exist "%TEMP_FILE%" del "%TEMP_FILE%"

echo Processo concluido com sucesso!
echo A lista foi salva em: %OUTPUT_FILE%
echo.
pause

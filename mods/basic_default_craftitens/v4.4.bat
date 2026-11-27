@echo off
title Super Limpador do Luanti v4.2
echo =================================================================
echo   Limpando sons, migrando prefixos e alterando textura da stone...
echo =================================================================

if not exist "init.lua" (
    color 0C
    echo [ERRO] O arquivo init.lua nao foi encontrado nesta pasta!
    pause
    exit
)

copy "init.lua" "init.lua.backup" >nul

echo [INFO] Processando arquivo... Por favor, aguarde.

:: Passo 1: Limpa todos os sons (singular e plural)
powershell -Command "$c = Get-Content 'init.lua' -Raw; $c = $c -replace 'sounds?\s*=\s*[^,\n]+,', 'sound = {},'; Set-Content 'init.lua' $c"

:: Passo 2: Altera o prefixo de default: para o seu novo mod (Seguro para aspas simples ou duplas)
powershell -Command "$c = Get-Content 'init.lua' -Raw; $c = $c -replace '([''\x22])default:', '$1basic_default_craftitens:'; Set-Content 'init.lua' $c"

:: Passo 3: Substitui {"default_stone.png^ por {"stone.png^ (Suporta aspas simples ou duplas)
powershell -Command "$c = Get-Content 'init.lua' -Raw; $c = $c -replace '([''\x22])default_stone\.png\^', '$1stone.png^'; Set-Content 'init.lua' $c"

color 0A
echo =================================================================
echo [SUCESSO] Sons limpos, prefixos migrados e texturas alteradas!
echo =================================================================
echo.
pause

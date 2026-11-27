@echo off
title Super Limpador do Luanti v3.1
echo =================================================================
echo   Limpando sons (sound/sounds) e corrigindo prefixo das ferramentas...
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
powershell -Command "(Get-Content 'init.lua' -Raw) -replace 'sounds?\s*=\s*[^,\n]+,', 'sound = {},' | Set-Content 'init.lua'"

:: Passo 2: Altera o prefixo de default: para o seu novo mod (independente de aspas)
powershell -Command "(Get-Content 'init.lua' -Raw) -replace 'register_tool\(([\x22\x27])default:', 'register_tool($1essencial_default_minerals_itens:' | Set-Content 'init.lua'"

color 0A
echo =================================================================
echo [SUCESSO] Sons limpos e ferramentas migradas com sucesso!
echo =================================================================
echo.
pause

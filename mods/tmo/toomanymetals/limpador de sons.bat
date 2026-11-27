@echo off
title Limpador de Sons do Luanti v2.0
echo ===================================================
echo   Analisando e limpando TUDO (sound e sounds)...
echo ===================================================

if not exist "init.lua" (
    color 0C
    echo [ERRO] O arquivo init.lua nao foi encontrado nesta pasta!
    pause
    exit
)

copy "init.lua" "init.lua.backup" >nul

:: Este comando atualizado limpa 'sound =' E 'sounds =' automaticamente
powershell -Command "(Get-Content 'init.lua' -Raw) -replace 'sounds?\s*=\s*[^,\n]+,', 'sound = {},' | Set-Content 'init.lua'"

color 0A
echo [SUCESSO] Todos os sons (singular e plural) viraram {}!
echo.
pause

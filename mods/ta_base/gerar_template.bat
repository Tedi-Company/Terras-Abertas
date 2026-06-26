@echo off
echo Criando lista de arquivos Lua...
dir /b /s *.lua > arquivos_lua.txt

echo.
echo Gerando o modelo de traducao usando o Poedit...
"C:\Program Files\Poedit\GettextTools\bin\xgettext.exe" --from-code=UTF-8 --keyword=S --output=locale/template.pot --files-from=arquivos_lua.txt

echo.
echo Processo concluido! O arquivo provisorio 'arquivos_lua.txt' foi mantido.
pause

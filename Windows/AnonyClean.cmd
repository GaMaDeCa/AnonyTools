@echo off
title Limpador An“nimo

if "%1" neq "99" (color 0c & echo.Abra o "Anonymous Cleaner.vbs"!!! & pause>nul & exit)

:: TODO: Testar e verificar possiveis erros em diferentes sistemas, criar um metodo seguro para limpar os seguintes dados
:: Dados temporarios de instalacao: "%WinDir%\Installer"
:: Dados de preferencia de instalacao e execucao: "%WinDir%\Prefetch"
:: Listas de atalhos(Jump Lists): %UserProfile%\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations
::			%UserProfile%\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations
:: Chave de registro UserAssist(Grava programas executados recentemente)
::   r3g d3l3t3 HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist /f
:: Chaves de registro sobre conexoes USB, programas, lixos, etc

color 0A

:: mode 90,45
setlocal EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do ( set "DEL=%%a" )

echo                   Limpador Anonimo - GaMaDeCa (github.com/GaMaDeCa)
echo Apaga arquivos recentes, tempor rios e cache de thumbs do Windows(Testado no Windows 7)
echo.

echo Matando o processo [explorer.exe]...
taskkill /f /im "explorer.exe" > nul
if %ERRORLEVEL%==0 ( Call :MudaCorCMD  0E "- Processo terminado com EXITO!" ) else ( Call :MudaCorCMD  0C " - Erro ao terminar processo!" )
timeout 3  > nul
echo.&echo.

echo Limpando thumbs do [explorer.exe]...
echo [thumbcache_32.db]
echo "" > "%USERPROFILE%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_32.db"
if %ERRORLEVEL%==0 ( Call :MudaCorCMD  0E " - [thumbcache_32.db] foi limpado com sucesso!" ) else ( Call :MudaCorCMD  0C " - Erro ao limpar thumbcache!" )
echo.
echo [thumbcache_96.db]
echo "" > "%USERPROFILE%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_96.db"
if %ERRORLEVEL%==0 ( Call :MudaCorCMD  0E " - [thumbcache_96.db] foi limpado com sucesso!" ) else ( Call :MudaCorCMD  0C " - Erro ao limpar thumbcache!" )
echo.
echo [thumbcache_256.db]
echo "" > "%USERPROFILE%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_256.db"
if %ERRORLEVEL%==0 ( Call :MudaCorCMD  0E " - [thumbcache_256.db] foi limpado com sucesso!" ) else ( Call :MudaCorCMD  0C " - Erro ao limpar thumbcache!" )
echo.&echo.

:: Ou %TMP%
echo Limpando Arquivos Tempor rios...
if exist "%TEMP%\*" ( del /s /q "%TEMP%\*" ) else ( echo\Sem arquivos. )
if %ERRORLEVEL%==0 ( Call :MudaCorCMD  0E " - Arquivos Tempor rios limpados com sucesso!" ) else ( Call :MudaCorCMD  0C " - Erro ao apagar Arquivos Tempor rios!" )
echo.&echo.

echo Deletando Arquivos da Pasta de Acessos Recentes...
if exist "%USERPROFILE%\Recent\*" ( del /s /q "%USERPROFILE%\Recent\*" ) else ( echo\Sem arquivos. )
if %ERRORLEVEL%==0 ( Call :MudaCorCMD  0E " - Arquivos da Pasta de Acessos Recentes deletados com sucesso!" ) else ( Call :MudaCorCMD  0C " - Erro ao deletar Arquivos da Pasta de Acessos Recentes!" )
echo.&echo.

echo Reiniciando o processo [explorer.exe]...
start explorer.exe
echo.
echo                               _--===(Finalizado)===--_ 
Call :MudaCorCMD  0C "AVISO, NÆo limpamos a pasta 'Prefetch' localizado na pasta Windows na raiz do drive, pois pode causar instabilidades no sistema,"
Call :MudaCorCMD  0C " ela guarda registro das aplica‡äes usadas e algumas informa‡äes de uso importantes para o funcionamento das mesmas,"
Call :MudaCorCMD  0C " se quiser limpar, entre nela e verifique os registros de programas que vocˆ quer deletar por sua conta e risco."
echo.&echo.
echo/Pressione alguma tecla para sair...&&pause>nul
goto :Saida

:MudaCorCMD
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1

:Saida

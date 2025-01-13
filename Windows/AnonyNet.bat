@echo off
title AnonyNet - Limpa os caches dos sockets de internet e renova o IP(Guia)

color 1E

:: github.com/GaMaDeCa 26/12/2018
:: Nao tenho certeza do que isso tudo faz(na hora eu so queria mudar o IP pq tava com conflito com o wifi), pode funcionar ou nao

echo.
echo.Script de testes beta, pode desconfigurar sua conexÆo com a internet!!!
echo.(Principalmente a op‡Æo "1 = Resetar Tudo")
:menu
echo.
echo.AnonymousNet - Gerenciar internet(Testes)
echo.
echo 0 = Renovar conexÆo
echo 1 = Resetar Tudo            (Em testes, cuidado)
echo 2 = Limpar cache de DNS
echo 3 = Limpar roteador
echo 4 = Sair
set /p "o=Op‡Æo: "
if %o%==0 goto :renovarIP
if %o%==1 goto :reseta
if %o%==2 goto :fluDNS
if %o%==3 goto :rotTuto
if %o%==4 exit
goto :menu

:rotTuto
echo.
echo.N£mero IP do seu roteador(Provavelmente)
ipconfig /all | find "Gateway"
echo.
echo.D = Apagar hist¢rico/logs
echo.R = Renovar IP do ISP
echo.E = Sair
choice /c dre /m "Escolha "
echo.
if %ErrorLevel%==3 goto :menu
if %ErrorLevel%==2 echo.Desligue o roteador retirando da tomada, deixe mais de 5 minutos desligado(ou o dia inteiro), o seu ISP provavelmente vai detectar como um erro e renovar sua conexÆo(Testado como anti-ban por IP, funcional em alguns casos)
if %ErrorLevel%==1 echo.Copie o n£merodo seu Gateway PadrÆo e cole no navegador, a senha e o login normalmente ‚ admin e admin, mas varia a cada modelo, pesquise a senha do seu roteador pelo modelo dele(Exemplo: TP-LINK2452, Google "Senha padrÆo roteador TP-LINK2452", ou "Default password router TP-LINK2452") & echo.  & echo.Procure por Logs do Sistema(System Logs), History e outros dados que vc quer apagar, nÆoresete o roteador pois pode causar um conflito de IP.
echo.
goto :menu

:fluDNS
ipconfig /flushdns
goto :menu

:renovarIP
echo Sua conexÆo ir  cair por alguns momentos...
ipconfig /release
echo Aguarde um momento at‚ todas as redes ficarem offline, depois pressione alguma tecla para continuar...
pause > nul
ipconfig /renew
goto :menu


:reseta
echo/1) Resete o adaptador
echo.
echo/Abrindo o Gerenciador de Dispositivos...
start devmgmt.msc
echo/Agora configure:
echo/Adaptadores de Rede / BotÆo direito em cima do nome da Placa de Rede /
echo.
echo/Clique em Desativar e depois Ativar
echo.
echo/Feche todas as telas(que usam internet ou possam atrapalhar)
echo.
echo/Depois, pressione alguma tecla para continuar...
echo.
pause>nul
IPCONFIG/RELEASE
IPCONFIG/ RENEW
IPCONFIG/FLUSHDNS
NETSH WINSOCK RESET 
echo.
echo/Reinicie a M quina
echo.

set inicializar="%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\AnonyNet_tmp.bat"
echo.@echo off >> %inicializar%
echo.echo.2) Limpe o cache do seu navegador / Ferramentas >> %inicializar%
echo.echo. >> %inicializar%
echo.echo.Entre e configure seu navegador padrÆo da seguinte maneira>> %inicializar%
echo.echo.IE/ Ferramentas / Op‡äes da Internet / Guia Geral / >> %inicializar%
echo.echo. >> %inicializar%
echo.echo.Exclua Cookies , Arquivos tempor rios , Hist¢rico de Navega‡Æo / >> %inicializar%
echo.echo. >> %inicializar%
echo.echo.Guia Seguran‡a / clique no BotÆo N¡vel padrÆo e depois Aplicar >> %inicializar%
echo.echo. >> %inicializar%
echo.echo.Guia Privacidade / Desmarque Bloqueador de Pop_Ups e depois clique em Aplicar >> %inicializar%
echo.echo. >> %inicializar%
echo.echo.Pressione uma tecla para continuar >> %inicializar%
echo.pause^>nul >> %inicializar%
echo.echo. >> %inicializar%
echo.echo.3) Configure DNS >> %inicializar%
echo.echo. >> %inicializar%
echo.echo.Entre no Painel de Controle / Central de Rede e Compartilhamento / Alterar as Configura‡oes do Adaptador >> %inicializar%
echo.echo. >> %inicializar%
echo.echo.BotÆo direito em cima da ConexÆo atual(Rede atual) / Propriedades / >> %inicializar%
echo.echo. >> %inicializar%
echo.echo. Selecione Protocolo TCP/IP / Clique em Propriedades / >> %inicializar%
echo.echo. >> %inicializar%
echo.echo.Escolha Obter IP automaticamente ou Use os seguintes Endere‡os de DNS >> %inicializar%
echo.echo. >> %inicializar%
echo.echo.[x] Prim rio DNS ou Preferˆncial: 200.176.2.10 >> %inicializar%
echo.echo. >> %inicializar%
echo.echo.[x] Secund rio DNS ou Alternativo: 200.176.2.12 [Ok] [fechar] >> %inicializar%
echo.echo. >> %inicializar%
echo.echo.Reinicie a M quina Novamente >> %inicializar%
echo.pause^>nul >> %inicializar%
:: Truque
set erroL=ErrorLevel
echo.choice /c sn /m "Deseja desligar o computador agora " >> %inicializar%
echo.if %%erroL%%==1 shutdown /s >> %inicializar%
echo.del /f /q %%0 >> %inicializar%

choice /c sn /m "Deseja desligar o computador agora "
if %ErrorLevel%==1 shutdown /s
exit

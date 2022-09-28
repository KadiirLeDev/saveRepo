@ECHO OFF


@REM Demande l'emplacement de la souvegarde
:loop
cls & Color 0A
set /p id="Quel dossier souhaitez-vous sauvegarder ?"
if  "%id%"=="" (
    Cls & Color 0C
    echo merci de renter le chemin de votre fichier
    Timeout /T 4 /NoBreak>nul
    goto loop
) else (
    goto netx
)

:netx
if exist %id% (
    echo Le dossier existe.
) else (
    Cls & Color 0C
    echo Le dossier n'existe pas.
    
    Timeout /T 2 /NoBreak>nul
    goto loop
)

:next
Color 0A
set /p loc="Definissez le chemin du dossier pour le sauvegarder ?"
if  "%loc%"=="" (
    cls & Color 0C
    echo  merci de renter le chemin de votre fichier

    Timeout /T 4 /NoBreak>nul
    cls
    goto next
) else (
    goto verfi
)

:verfi
if exist %loc% (
    echo Le dossier existe.
) else (
    echo Le dossier n'existe pas.
    MD %loc%
    Timeout /T 2 /NoBreak>nul
    goto next
)

:abc
set /p var=etes-vous sur ?[o/n]: 
if %var%== o goto :yes
if not %var%== n goto :test

:test
echo Merci de rentrer la valeur o (oui) / n (non) !
Timeout /T 2 /NoBreak>nul
goto abc

:yes
xcopy %id% %loc% /e
echo Sauvegarde effectuer
goto reste

:reste
set /p reLoc="Souhaitez-vous save un autre fichier ?"
if  "%reLoc%"=="" (
    cls & Color 0C
    echo  merci de renter le chemin de votre fichier
    Timeout /T 4 /NoBreak>nul
    cls
    goto reste
) else (
    goto verfi
)

:verfi
if exist %reLoc% (
    echo Le dossier existe.
) else (
    echo Le dossier n'existe pas.
    Timeout /T 2 /NoBreak>nul

    goto reste
)

:aby
set /p rep=etes-vous sur ?[o/n]:
if %rep%== o goto :yess
if not %rep%== n goto :b

:b
echo Merci de rentrer la valeur o (oui) / n (non) !
Timeout /T 2 /NoBreak>nul
goto abc


:yess
xcopy %reLoc% %loc% /e
echo Sauvegarde effectuer
echo Fermeture dans 5 secondes
Timeout /T 5 /NoBreak>nul
exit
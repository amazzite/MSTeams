#--------------------------------------------------------
# Script: FileProtectionMSTeams.ps1
# Author: Alejandro Mazzitelli
# Email: alejandro@mazzitelli.com.ar
# Web: https://www.mazzitelli.com.ar
# Description: En Este script se puede establecer la protección de archivos en Microsoft Teams.
#              El script utiliza el módulo MicrosoftTeams, por lo que es posible que se requiera instalarlo y conectarse a Microsoft Teams antes de ejecutar el script.
# Version: 1.0
# LastUpDate: 2025-09-19
#--------------------------------------------------------

#Instalacion del Modulo de Microsoft Teams
#Install-Module -Name MicrosoftTeams -Force -AllowClobber

#Conectarse a Microsoft Teams
Connect-MicrosoftTeams

#Habilitar la protección de archivos en Microsoft Teams
Set-CsTeamsMessagingConfiguration -FileTypeCheck "Enabled" -Identity Global

#Deshabilitar la protección de archivos en Microsoft Teams
#Set-CsTeamsMessagingConfiguration -FileTypeCheck "Disabled" -Identity Global

#Desconectarse de Microsoft Teams
#Disconnect-MicrosoftTeams
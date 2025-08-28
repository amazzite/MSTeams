#--------------------------------------------------------
# Script: Establecer Que Grupo Puede Crear Equipos.ps1
# Author: Alejandro Mazzitelli
# Email: alejandro@mazzitelli.com.ar
# Web: https://www.mazzitelli.com.ar
# Description: En Este script se puede establecer que grupo de usuarios puede crear equipos en Microsoft Teams. Adicionalmente, se puede deshabilitar la creación de equipos para todos los usuarios.
#              Para que un grupo pueda crear equipos, primero debe existir el grupo en AzureAD.	Tambien se puede consultar que grupo tiene permisos para crear equipos.
#              El script utiliza el módulo Microsoft.Graph.Beta, por lo que es posible que se requiera instalarlo. Al inicio del script se realiza la instalación si es necesario.
# Version: 1.0
# LastUpDate: 2025-08-17
#--------------------------------------------------------

#Instalar (si hace falta) y cargar los módulos necesarios
#Install-Module Microsoft.Graph -Scope CurrentUser -AllowClobber
#Install-Module Microsoft.Graph.Beta.Identity.DirectoryManagement
#Install-Module Microsoft.Graph.Beta.Groups
#Import-Module Microsoft.Graph
#Import-Module Microsoft.Graph.Beta.Identity.DirectoryManagement
#Import-Module Microsoft.Graph.Beta.Groups

# Conectarse con permisos
Connect-MgGraph -Scopes "Directory.ReadWrite.All", "Group.Read.All"

#Configurar el grupo que puede crear equipos
$GroupName = "SG-CrearEquipos"
$AllowGroupCreation = "False"

#Establecer el grupo que puede crear equipos
$settingsObjectID = (Get-MgBetaDirectorySetting | Where-object -Property Displayname -Value "Group.Unified" -EQ).id

if(!$settingsObjectID)
{
    $params = @{
	  templateId = "62375ab9-6b52-47ed-826b-58e47e0e304b"
	  values = @(
		    @{
			       name = "EnableMSStandardBlockedWords"
			       value = $true
		     }
	 	     )
	     }
	
    New-MgBetaDirectorySetting -BodyParameter $params
	
    $settingsObjectID = (Get-MgBetaDirectorySetting | Where-object -Property Displayname -Value "Group.Unified" -EQ).Id
}

 
$groupId = (Get-MgBetaGroup -all | Where-object {$_.displayname -eq $GroupName}).Id

$params = @{
	templateId = "62375ab9-6b52-47ed-826b-58e47e0e304b"
	values = @(
		@{
			name = "EnableGroupCreation"
			value = $AllowGroupCreation
		}
		@{
			name = "GroupCreationAllowedGroupId"
			value = $groupId
		}
	)
}

Update-MgBetaDirectorySetting -DirectorySettingId $settingsObjectID -BodyParameter $params

#Verificar el grupo que puede crear equipos
(Get-MgBetaDirectorySetting -DirectorySettingId $settingsObjectID).Values




#Solo Consultar
$settingsObjectID = (Get-MgBetaDirectorySetting | Where-object -Property Displayname -Value "Group.Unified" -EQ).id
(Get-MgBetaDirectorySetting -DirectorySettingId $settingsObjectID).Values

# Identificar el GroupID como su nombre
Get-MgGroup -GroupId 17b1edaa-c29e-466a-aaf9-a87a14168f88 | Select-Object Id, DisplayName, Mail

#Desconectarse
Disconnect-MgGraph

























#Conectarse a Microsoft Teams
Connect-MicrosoftTeams

# Crear un equipo privado en Microsoft Teams
New-Team -DisplayName "Equipo de Prueba" -Visibility Private -Owner dgarcia@mazzitelli.com.ar

# Agregar miembros al equipo
Add-TeamUser -GroupId (Get-Team -DisplayName "Equipo de Prueba").GroupId -User alejandro@mazzitelli.com.ar

# Agregar un canal al equipo
New-TeamChannel -GroupId (Get-Team -DisplayName "Equipo de Prueba").GroupId -DisplayName "Confidencial" 

# Agregar un canal privado al equipo
New-TeamChannel -GroupId (Get-Team -DisplayName "Equipo de Prueba").GroupId -DisplayName "Privado" -MembershipType Private

# Agregar un miembro al canal privado
Add-TeamChannelUser -GroupId (Get-Team -DisplayName "Equipo de Prueba").GroupId -DisplayName "Privado" -User dgarcia@mazzitelli.com.ar

# Crear un equipo público en Microsoft Teams
New-Team -DisplayName "Equipo Público de Prueba" -Visibility Public -Owner dgarcia@mazzitelli.com.ar

# Agregar miembros al equipo público
Add-TeamUser -GroupId (Get-Team -DisplayName "Equipo Público de Prueba").GroupId -User alejandro@mazzitelli.com.ar

# Agregar un canal al equipo público
New-TeamChannel -GroupId (Get-Team -DisplayName "Equipo Público de Prueba").GroupId -DisplayName "Archivos Publicos"

# Agregar un canal privado al equipo público
New-TeamChannel -GroupId (Get-Team -DisplayName "Equipo Público de Prueba").GroupId -DisplayName "Privado Público" -MembershipType Private

# Agregar un miembro al canal privado del equipo público
Add-TeamChannelUser -GroupId (Get-Team -DisplayName "Equipo Público de Prueba").GroupId -DisplayName "Privado Público" -User alejandro@mazzitelli.com.ar

#Remover un miembro del equipo
Remove-TeamUser -GroupId (Get-Team -DisplayName "Equipo de Prueba").GroupId -User alejandro@mazzitelli.com.ar

#Remover un miembro del canal privado
Remove-TeamChannelUser -GroupId (Get-Team -DisplayName "Equipo de Prueba").GroupId -DisplayName "Privado" -User alejandro@mazzitelli.com.ar

# Remover un canal del equipo
Remove-TeamChannel -GroupId (Get-Team -DisplayName "Equipo de Prueba").GroupId -DisplayName "Confidencial"

# Remover el equipo
Remove-Team -GroupId (Get-Team -DisplayName "Equipo de Prueba").GroupId

#Desconectar de Microsoft Teams
Disconnect-MicrosoftTeams

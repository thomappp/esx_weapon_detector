fx_version 'bodacious'
game 'gta5'

author 'Thomapp'
description 'Weapon Detector.'

shared_scripts { '@es_extended/imports.lua', 'shared.lua' }
client_scripts { 'client/cl_utils.lua', 'client/cl_main.lua' }
server_script { 'server/sv_utils.lua', 'server/sv_main.lua' }

dependency 'es_extended'
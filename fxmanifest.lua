fx_version 'bodacious'
lua54 'yes' 
game 'gta5' 

author 'R1CKY®#2220'
description 'Tech Dev. | Pause Menu'
version '1.0'


client_scripts {
    'client.lua'
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua'
}
server_scripts {
   '@mysql-async/lib/MySQL.lua',
    'server.lua'
}

ui_page 'web/index.html'

files {
    'web/*.html',
    'web/*.css',
    'web/*.js',
    'web/*.otf',
    'web/*.png',
}

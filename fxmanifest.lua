fx_version 'cerulean'
game 'gta5'
lua54 'yes'
name "rzw-snowball"
description "It is a modern, lightweight FiveM script for picking up snowballs during cold weather. It was created using the ESX framework and the ox_lib library."
author "Rozir Wobari"
version "2.0.0"

shared_scripts {
	'@ox_lib/init.lua',
	'shared/*.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}

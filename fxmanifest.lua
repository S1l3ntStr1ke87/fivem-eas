resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

author 'Str1k3r'
description 'fivem-eas, https://fivem.str1k3r.site'
version '1.0.0'
fx_version 'cerulean'
games { 'gta5' }

client_script 'client.lua'
shared_script 'config.lua'
server_script 'server_config.lua'
server_script 'server.lua'

ui_page {
  'index.html'
}

files {
  'index.html',

  'main.css',

  'main.js',

  'fonts/VCR_OSD_MONO.ttf',

  'alert.mp3'
}

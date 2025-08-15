fx_version 'cerulean'
game 'gta5'

author 'TonNom'
description 'HUD custom + mini-map modifiée'
version '1.0.0'

ui_page 'html/hud.html'

files {
    'html/hud.html',
    'html/style.css',
    'html/script.js',
    'stream/graphics.ytd',
    'stream/hud_reticle.gfx',
    'stream/minimap.gfx',
    'stream/squaremap.ytd'
}

client_script 'client.lua'

data_file 'DLC_ITYP_REQUEST' 'stream/graphics.ytd'
data_file 'SCALEFORM_DLC_FILE' 'stream/minimap.gfx'
data_file 'SCALEFORM_DLC_FILE' 'stream/hud_reticle.gfx'
data_file 'TEXTFILE_METAFILE' 'stream/squaremap.ytd'

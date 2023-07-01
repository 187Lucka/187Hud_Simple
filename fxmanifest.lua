fx_version 'adamant'

game 'gta5'

lua54 'yes'

client_script {
	'client.lua',
}

ui_page('html/index.html')

files({
	"html/index.html",
	"html/style.css",
	"html/*.js",
})

data_file 'SCALEFORM_DLC_FILE' 'stream/*.gfx'

escrow_ignore {
	'client.lua'
}
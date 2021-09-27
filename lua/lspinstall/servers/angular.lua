local config = require("lspinstall/util").extract_config("angularls")

local cmd = {
	"./node_modules/.bin/ngserver",
	"--stdio",
	"--tsProbeLocations",
	"./node_modules",
	"--ngProbeLocations",
	"./node_modules",
	"--experimental-ivy",
}

config.default_config.cmd = cmd
config.default_config.on_new_config = function(new_config, new_root_dir)
	new_config.cmd = cmd
end

return vim.tbl_extend("error", config, {
	install_script = [[
	! test -f package.json && npm init -y --scope=lspinstall || true
	npm install @angular/language-server @angular/language-service typescript --save
	]],
})

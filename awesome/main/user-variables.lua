local home = os.getenv("HOME")
local modkey = "Mod4"
local terminal = "terminator"
local editor = "nvim"
local editor_cmd = terminal .. " -e " .. editor

local _M = {
	modkey = modkey,
	terminal = terminal,
	editor = editor,
	editor_cmd = editor_cmd,
}

return _M

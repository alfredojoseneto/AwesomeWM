-- Standard awesome library
local awful = require("awful")

local _M = {}

function _M.get()
	local tags = {}

	local tagpairs = {
		names = { " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 " },
		-- names = {
		-- 	"  ",
		-- 	"  ",
		-- 	"❸ 三 edit",
		-- 	"❹ 四 place",
		-- 	"❺ 五 mail",
		-- 	" ❻ 六",
		-- 	"❼ 七",
		-- 	" ❽ 八",
		-- 	"❾ 九",
		-- },

		layout = {
			RC.layouts[10],
			RC.layouts[2],
			RC.layouts[4],
			RC.layouts[5],
			RC.layouts[6],
			RC.layouts[12],
			RC.layouts[9],
			RC.layouts[3],
			RC.layouts[7],
		},
	}

	awful.screen.connect_for_each_screen(function(s)
		-- Each screen has its own tag table.
		tags[s] = awful.tag(tagpairs.names, s, tagpairs.layout)
	end)

	return tags
end

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})

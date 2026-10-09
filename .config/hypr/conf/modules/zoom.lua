local M = {}

local mainMod = "SUPER"

local MIN_ZOOM = 1.0
local MAX_ZOOM = 3.0
local ZOOM_STEP = 1.25

local function zoom_cursor(direction)
	local current = hl.get_config("cursor.zoom_factor")
	local next_zoom

	if direction == "in" then
		next_zoom = current * ZOOM_STEP
	elseif direction == "out" then
		next_zoom = current / ZOOM_STEP
	else
		next_zoom = MIN_ZOOM
	end

	next_zoom = math.max(MIN_ZOOM, math.min(MAX_ZOOM, next_zoom))

	hl.config({
		cursor = {
			zoom_factor = next_zoom,
		},
	})
end

function M.setup()
	-- Super + ALT + PgUp: zoom in
	hl.bind(mainMod .. " + ALT + equal", function()
		zoom_cursor("in")
	end, { repeating = true, desc = "Cursor zoom in" })

	-- Super + ALT + PgDwn: zoom out
	hl.bind(mainMod .. " + ALT + minus", function()
		zoom_cursor("out")
	end, { repeating = true, desc = "Cursor zoom out" })

	-- Super + ALT + 0: reset
	hl.bind(mainMod .. " + ALT + Backspace", function()
		zoom_cursor("reset")
	end, { desc = "Reset cursor zoom" })
end

return M

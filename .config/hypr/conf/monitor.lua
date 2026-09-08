-- Monitors
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- Reserve 40px at the top of every monitor for status bars
hl.monitor({
    output        = "",
    reserved_area = { top = 40, right = 0, bottom = 0, left = 0 },
})

-- Builtin display (1920x1080)
hl.monitor({
    output   = "eDP-2",
    mode     = "1920x1080@165.0",
    position = "auto",
    scale    = 1,
})

-- External display
hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080@60",
    position = "0x0",
    scale    = 1,
})
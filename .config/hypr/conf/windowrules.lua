-- Window rules
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- More transparent windows
hl.window_rule({ name = "chromium-opacity", match = { class = "^(chromium)$" }, opacity = "0.8 0.8" })
hl.window_rule({ name = "brave-opacity",    match = { class = "^(brave)$" },    opacity = "0.8 0.8" })
hl.window_rule({ name = "discord-opacity",  match = { class = "^(discord)$" },  opacity = "0.8 0.8" })

-- Floating windows
hl.window_rule({ name = "viber-float",       match = { class = "^com.viber.Viber$" },       float = true })
hl.window_rule({ name = "eog-float",         match = { class = "^(eog)$" },                 float = true })
hl.window_rule({ name = "thunar-float",      match = { class = "^(thunar)$" },              float = true })
hl.window_rule({ name = "blueman-float",     match = { class = "^(blueman-manager)$" },     float = true })
hl.window_rule({ name = "blueman-size",      match = { class = "(blueman-manager)$" },       size = { 600, 800 } })
hl.window_rule({ name = "thunar-size",       match = { class = "(thunar)$" },                size = { 1000, 600 } })
hl.window_rule({ name = "pavucontrol-size",  match = { class = "(org.pulseaudio.pavucontrol)$" },  size = { 600, 800 } })
hl.window_rule({ name = "pavucontrol-float", match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true })
hl.window_rule({ name = "electron-folder-float",  match = { class = "^electron$", title = "^Open Folder$" }, float = true })
hl.window_rule({ name = "electron-folder-center", match = { class = "^electron$", title = "^Open Folder$" }, center = true })
hl.window_rule({ name = "floatkitty-float",  match = { class = "^(floatkitty)$" }, float = true })
hl.window_rule({ name = "engine-float",      match = { title = "^(Engine)$" },        float = true })

-- Smart gaps / no gaps when only
hl.workspace_rule({ workspace = "w[tv1]", gaps_in = 0, gaps_out = 0 })
hl.workspace_rule({ workspace = "f[1]",  gaps_in = 0, gaps_out = 0 })
-- hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
-- hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
-- hl.window_rule({ match = { float = false, workspace = "f[1]" },   border_size = 0 })
-- hl.window_rule({ match = { float = false, workspace = "f[1]" },   rounding = 0 })
-- Keybindings
-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local mainMod = "SUPER"

-- Launch applications
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("kitty --class floatkitty"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher toggle"))
-- hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("~/.config/rofi/launchers/type-1/launcher.sh"))
-- hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("~/.config/rofi/launchers/type-3/launcher.sh"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("~/.config/rofi/scripts/dual_monitor_menu.sh"))

-- Window management
hl.bind(mainMod .. " + Q", hl.dsp.window.kill()) -- close the active window
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- only works for layout=dwindle
hl.bind("ALT + return", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit()) -- force quit Hyprland

-- Lock / logout
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("swaylock"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wlogout --protocol layer-shell"))

-- Special workspace
hl.bind("ALT + SHIFT + S", hl.dsp.window.move({ workspace = "special" })) -- move a window to special workspace
hl.bind("ALT + SHIFT + S", hl.dsp.workspace.toggle_special("")) -- needed for silent toggle
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "e+0" })) -- move a window from special workspace to the workspace behind
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("")) -- toggle special workspace

-- Zoom at cursor (mainMod + ALT + PageUp/Down, 0 to reset)
hl.bind(
	mainMod .. " + ALT + Page_Up",
	hl.dsp.exec_cmd(
		[[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 1.25}')"]]
	)
)
hl.bind(
	mainMod .. " + ALT + Page_Down",
	hl.dsp.exec_cmd(
		[[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 1.25}')"]]
	)
)
hl.bind(mainMod .. " + ALT + 0", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor 1"))

-- Screenshots
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

-- Legion S7 special keys
hl.bind("code:121", hl.dsp.exec_cmd("pamixer -t")) -- Speaker mute (FN+F1)
hl.bind("code:122", hl.dsp.exec_cmd("pamixer -d 5")) -- Volume down
hl.bind("code:123", hl.dsp.exec_cmd("pamixer -i 5")) -- Volume up
hl.bind("code:256", hl.dsp.exec_cmd("pamixer --default-source -t")) -- Mic mute
hl.bind("code:232", hl.dsp.exec_cmd("brightnessctl set 10%-")) -- Brightness down (FN+F7)
hl.bind("code:233", hl.dsp.exec_cmd("brightnessctl set 10%+")) -- Brightness up (FN+F8)

-- Dynamically change layout
hl.bind("ALT + SHIFT + L", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle_layout.sh"))

-- Move focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind("ALT + Tab", hl.dsp.focus({ direction = "down" }))

-- Resize windows
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true })

-- Move focused window around the current workspace
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end
hl.bind(mainMod .. " + C", hl.dsp.focus({ workspace = "name:coding" }))
hl.bind(mainMod .. " + B", hl.dsp.focus({ workspace = "name:browser" }))

-- Switch to Workspaces relatively
hl.bind(mainMod .. "+ CTRL + L", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. "+ CTRL + H", hl.dsp.focus({ workspace = "-1" }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.move({ workspace = "name:coding" }))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.window.move({ workspace = "name:browser" }))

-- Move to workspace silent
for i = 1, 10 do
	local key = i % 10 -- 10 maps to 0
	hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Misc
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))
hl.bind(
	"SUPER + V",
	hl.dsp.exec_cmd(
		[[cliphist list | rofi -dmenu -p "Clipboard" -theme "$HOME/.config/rofi/applets/type-1/style-2.rasi" | cliphist decode | wl-copy]]
	)
)
-- Change wallpaper
-- hl.bind(mainMod .. " + }", hl.dsp.exec_cmd("~/scripts/change_wallpaper.sh"))

-- Media keys
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- Mouse side buttons (commented out in the original config)
-- hl.bind(mainMod .. " + mouse:8", hl.dsp.focus({ direction = "left" }))
-- hl.bind(mainMod .. " + mouse:9", hl.dsp.focus({ direction = "right" }))

-- Scrolling layout binds (previously the hyprscrolling plugin, commented out)
-- hl.bind(mainMod .. " + period",    hl.dsp.layout("move +col"))
-- hl.bind(mainMod .. " + comma",     hl.dsp.layout("move -col"))
-- hl.bind(mainMod .. " + SHIFT + L", hl.dsp.layout("swapcol r"))
-- hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("swapcol l"))
-- hl.bind(mainMod .. " + L",         hl.dsp.layout("focus r"))
-- hl.bind(mainMod .. " + J",         hl.dsp.layout("focus l"))
-- hl.bind("ALT + F",                 hl.dsp.layout("fit all"))

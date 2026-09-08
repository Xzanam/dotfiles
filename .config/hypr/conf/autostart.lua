-- Environment variables
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
-- hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("HYPRSHOT_DIR", "/home/zanam/Pictures/Screenshots")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

-- Allow hyprpm to manage plugins at startup
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-- Autostart
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpm reload -n")

    -- xdg-desktop-portal-hyprland for screensharing
    hl.exec_cmd("~/.config/hypr/xdg-portal-hyprland")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systectl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP QT_QPA_PLATFORMTHEME")
    -- hl.exec_cmd("waybar")
    hl.exec_cmd("qs -c noctalia-shell")
    -- hl.exec_cmd("swaync")
    hl.exec_cmd("discord")
    -- hl.exec_cmd("hyprpaper")
    -- hl.exec_cmd("swaybg -m fill -i ~/Pictures/Wallpapers/pkr.jpg")

    -- Clipboard manager
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)
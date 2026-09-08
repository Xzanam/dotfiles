-- Workspace rules
-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.workspace_rule({ workspace = "1", monitor = "eDP-2" })
hl.workspace_rule({ workspace = "2", monitor = "eDP-2" })
hl.workspace_rule({ workspace = "3", monitor = "eDP-2" })
hl.workspace_rule({ workspace = "4", monitor = "eDP-2" })
hl.workspace_rule({ workspace = "5", monitor = "eDP-2" })
hl.workspace_rule({ workspace = "5", monitor = "DP-1", layout_opts = { direction = "down", column_width = 1.0 } })
hl.workspace_rule({ workspace = "6", monitor = "DP-1" })
hl.workspace_rule({ workspace = "7", monitor = "DP-1" })
hl.workspace_rule({ workspace = "8", monitor = "DP-1" })

-- hl.workspace_rule({ workspace = "name:browser", monitor = "eDP-2", default = true })
-- hl.workspace_rule({ workspace = "name:coding",  monitor = "DP-1",  default = true })

-- Input
-- See https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		touchpad = {
			natural_scroll = true,
		},

		sensitivity = 0.3, -- -1.0 - 1.0, 0 means no modification.
	},
})

-- Per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
hl.device({
	name = "elan06fa:00-04f3:317c-touchpad",
	sensitivity = 0.1,
})

-- General look and feel
hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 5,
		border_size = 1,
		col = {
			-- active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			active_border = "rgb(5ef6f5)",
			inactive_border = "rgba(595959aa)",
		},
		layout = "scrolling",
	},

	misc = {
		disable_hyprland_logo = true,
	},

	decoration = {
		rounding = 3,

		blur = {
			enabled = true,
			size = 7,
			passes = 3,
		},

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},
	},

	animations = {
		enabled = true,
	},

	binds = {
		allow_workspace_cycles = true,
	},

	gestures = {
		workspace_swipe_invert = true,
	},
})

-- Layouts
-- See https://wiki.hypr.land/Configuring/Layouts/
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

hl.config({
	master = {
		new_status = "inherit",
	},
})

-- Built-in scrolling layout (replaces the hyprscrolling plugin)
-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
		column_width = 0.5,
		focus_fit_method = 1,
	},
})

-- Trackpad gesture
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

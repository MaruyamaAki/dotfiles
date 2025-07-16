local wezterm = require("wezterm")

-- Helper: map Cmd-<key> to send Ctrl-<key>
local function remap_cmd_to_ctrl(key)
	return {
		key = key,
		mods = "CMD",
		action = wezterm.action.SendKey({ key = key, mods = "CTRL" }),
	}
end

local function disable_default_assignment(key)
	return {
		key = key,
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	}
end

return {
	-- Lunch tmux automatically -------------------------------------------
	default_prog = { "/opt/homebrew/bin/tmux", "new-session", "-A", "-s", "main" },

	-- Font -----------------------------------------------------------------
	font = wezterm.font_with_fallback({
		"PlemolJP", -- Regular PlemolJP
	}),
	font_size = 13.0,

	-- Colors ---------------------------------------------------------------
	color_scheme = "iceberg-dark", -- wezterm builtin scheme

	-- Opacity --------------------------------------------------------------
	window_background_opacity = 0.8, -- 80% overall transparency
	-- text_background_opacity   = 0.8,  -- cell background (for true transparency)

	-- UI tweaks ------------------------------------------------------------
	hide_tab_bar_if_only_one_tab = true,
	-- window_decorations             = 'RESIZE',
	use_fancy_tab_bar = false,
	scrollback_lines = 10000,

	-- macOS ----------------------------------------------------------------
	enable_scroll_bar = false,
	use_ime = true, -- keep IME state per pane

	-- Performance ----------------------------------------------------------
	-- front_end = 'OpenGL',      -- fallback if Metal glitches

	-- Keybindings ----------------------------------------------------------
	keys = {
		-- -- Toggle FullScreen
		-- {
		-- 	key = "f", -- 押すキー
		-- 	mods = "CTRL", -- 組み合わせる修飾キー
		-- 	action = wezterm.action.ToggleFullScreen, -- フルスクリーントグル
		-- },

		disable_default_assignment("t"),
		disable_default_assignment("h"),

		remap_cmd_to_ctrl("c"),
		remap_cmd_to_ctrl("t"),
		remap_cmd_to_ctrl("u"),
		remap_cmd_to_ctrl("d"),
		remap_cmd_to_ctrl("/"),
		remap_cmd_to_ctrl("h"),
		remap_cmd_to_ctrl("j"),
		remap_cmd_to_ctrl("k"),
		remap_cmd_to_ctrl("l"),
		remap_cmd_to_ctrl("r"),
		-- remap_cmd_to_ctrl("f"),
	},

	-- Disable auto‑update pop‑ups (brew handles updates)
	check_for_updates = false,
}

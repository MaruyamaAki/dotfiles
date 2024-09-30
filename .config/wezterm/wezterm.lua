local wezterm = require("wezterm")

local config = {}

local function remap_cmd_to_ctrl(key)
	return {
		key = key,
		mods = "CMD",
		action = wezterm.action.SendKey({
			key = key,
			mods = "CTRL",
		}),
	}
end

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_prog = { "/opt/homebrew/bin/fish", "-l" }

-- カラースキームの設定
config.color_scheme = "Tokyo Night"
config.window_background_opacity = 0.8

config.keys = {
	remap_cmd_to_ctrl("t"),
	remap_cmd_to_ctrl("h"),
	remap_cmd_to_ctrl("j"),
	remap_cmd_to_ctrl("k"),
	remap_cmd_to_ctrl("l"),
	remap_cmd_to_ctrl("x"),
	remap_cmd_to_ctrl("c"),
	remap_cmd_to_ctrl("v"),
	remap_cmd_to_ctrl("/"),
	remap_cmd_to_ctrl("a"),

	-- CMD+Shift+Fでフルスクリーン切り替え
	{
		key = "f",
		mods = "SHIFT|SUPER",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- フォントの設定
config.font = wezterm.font("IBM Plex Mono")
-- フォントサイズの設定
config.font_size = 12

return config

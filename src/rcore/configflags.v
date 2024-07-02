module rcore

enum ConfigFlag {
	flag_vsync_hint               = 0x00000040
	flag_fullscreen_mode          = 0x00000002
	flag_window_resizable         = 0x00000004
	flag_window_undecorated       = 0x00000008
	flag_window_hidden            = 0x00000080
	flag_window_minimized         = 0x00000200
	flag_window_maximized         = 0x00000400
	flag_window_unfocused         = 0x00000800
	flag_window_topmost           = 0x00001000
	flag_window_always_run        = 0x00000100
	flag_window_transparent       = 0x00000010
	flag_window_highdpi           = 0x00002000
	flag_window_mouse_passthrough = 0x00004000
	flag_borderless_windowed_mode = 0x00008000
	flag_msaa_4x_hint             = 0x00000020
	flag_interlaced_hint          = 0x00010000
}

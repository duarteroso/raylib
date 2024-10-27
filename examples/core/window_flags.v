module main

import raylib

fn main() {
	screen_width := 800
	screen_height := 450
	t := 'raylib [core] example - window flags'
	C.InitWindow(screen_width, screen_height, t.str)
	C.SetTargetFPS(60)
	//
	mut pos := raylib.Vector2{C.GetScreenWidth() / 2, C.GetScreenHeight() / 2}
	mut speed := raylib.Vector2{5.0, 4.0}
	radius := 20
	mut frames := 0
	//
	for C.WindowShouldClose() == false {
		//
		// Update
		if C.IsKeyPressed(int(raylib.KeyboardKey.key_f)) {
			C.ToggleFullscreen()
		}
		if C.IsKeyPressed(int(raylib.KeyboardKey.key_h)) {
			frames = 0
			if C.IsWindowState(u32(raylib.ConfigFlag.flag_window_hidden)) == false {
				C.SetWindowState(u32(raylib.ConfigFlag.flag_window_hidden))
			}
		}
		if C.IsWindowState(u32(raylib.ConfigFlag.flag_window_hidden)) {
			frames++
			if frames >= 240 {
				C.ClearWindowState(u32(raylib.ConfigFlag.flag_window_hidden))
			}
		}
		if C.IsKeyPressed(int(raylib.KeyboardKey.key_n)) {
			frames = 0
			if C.IsWindowState(u32(raylib.ConfigFlag.flag_window_minimized)) == false {
				C.MinimizeWindow()
			}
		}
		if C.IsWindowState(u32(raylib.ConfigFlag.flag_window_minimized)) {
			frames++
			if frames >= 240 {
				C.RestoreWindow()
			}
		}
		if C.IsKeyPressed(int(raylib.KeyboardKey.key_m)) {
			if C.IsWindowState(u32(raylib.ConfigFlag.flag_window_maximized)) {
				C.RestoreWindow()
			} else {
				C.MaximizeWindow()
			}
		}
		//
		update_win(raylib.KeyboardKey.key_r, raylib.ConfigFlag.flag_window_resizable)
		update_win(raylib.KeyboardKey.key_d, raylib.ConfigFlag.flag_window_undecorated)
		update_win(raylib.KeyboardKey.key_u, raylib.ConfigFlag.flag_window_unfocused)
		update_win(raylib.KeyboardKey.key_t, raylib.ConfigFlag.flag_window_topmost)
		update_win(raylib.KeyboardKey.key_a, raylib.ConfigFlag.flag_window_always_run)
		update_win(raylib.KeyboardKey.key_v, raylib.ConfigFlag.flag_vsync_hint)
		//
		pos.x += speed.x
		pos.y += speed.y
		if pos.x >= (C.GetScreenWidth() - radius) || pos.x <= radius {
			speed.x *= -1.0
		}
		if pos.y >= (C.GetScreenHeight() - radius) || pos.y <= radius {
			speed.y *= -1.0
		}
		//
		// Draw
		C.BeginDrawing()
		{
			if C.IsWindowState(u32(raylib.ConfigFlag.flag_window_transparent)) {
				C.ClearBackground(raylib.blank)
			} else {
				C.ClearBackground(raylib.raywhite)
			}
			//
			C.DrawCircleV(pos, radius, raylib.maroon)
			C.DrawRectangleLinesEx(raylib.Rectangle{
				x:      0.0
				y:      0.0
				width:  f32(C.GetScreenWidth())
				height: f32(C.GetScreenHeight())
			}, 4.0, raylib.raywhite)
			C.DrawCircleV(C.GetMousePosition(), 10, raylib.darkblue)
			C.DrawFPS(10, 10)
			//
			mut text := 'Screen Size: [${C.GetScreenWidth()}, ${C.GetScreenHeight()}]'
			C.DrawText(text.str, 10, 40, 10, raylib.green)
			//
			text = 'Following flags can be set after window creation:'
			C.DrawText(text.str, 10, 60, 10, raylib.gray)
			draw_ui(80, raylib.KeyboardKey.key_f, raylib.ConfigFlag.flag_fullscreen_mode)
			draw_ui(100, raylib.KeyboardKey.key_r, raylib.ConfigFlag.flag_window_resizable)
			draw_ui(120, raylib.KeyboardKey.key_d, raylib.ConfigFlag.flag_window_undecorated)
			draw_ui(140, raylib.KeyboardKey.key_h, raylib.ConfigFlag.flag_window_hidden)
			draw_ui(160, raylib.KeyboardKey.key_n, raylib.ConfigFlag.flag_window_minimized)
			draw_ui(180, raylib.KeyboardKey.key_m, raylib.ConfigFlag.flag_window_maximized)
			draw_ui(200, raylib.KeyboardKey.key_u, raylib.ConfigFlag.flag_window_unfocused)
			draw_ui(220, raylib.KeyboardKey.key_t, raylib.ConfigFlag.flag_window_topmost)
			draw_ui(240, raylib.KeyboardKey.key_a, raylib.ConfigFlag.flag_window_always_run)
			draw_ui(260, raylib.KeyboardKey.key_v, raylib.ConfigFlag.flag_vsync_hint)
			//
			text = 'Following flags can only be set before window creation:'
			C.DrawText(text.str, 10, 300, 10, raylib.gray)
			draw_ui(320, raylib.KeyboardKey.key_null, raylib.ConfigFlag.flag_window_highdpi)
			draw_ui(340, raylib.KeyboardKey.key_null, raylib.ConfigFlag.flag_window_transparent)
			draw_ui(360, raylib.KeyboardKey.key_null, raylib.ConfigFlag.flag_msaa_4x_hint)
		}
		C.EndDrawing()
	}
	//
	C.CloseWindow()
}

fn update_win(key raylib.KeyboardKey, flag raylib.ConfigFlag) {
	if C.IsKeyPressed(int(key)) {
		if C.IsWindowState(u32(flag)) {
			C.ClearWindowState(u32(flag))
		} else {
			C.SetWindowState(u32(flag))
		}
	}
}

fn draw_ui(y int, key raylib.KeyboardKey, flag raylib.ConfigFlag) {
	if C.IsWindowState(u32(flag)) {
		C.DrawText('[${key}]\t${flag}: on'.str, 10, y, 20, raylib.lime)
	} else {
		C.DrawText('[${key}]\t${flag}: off'.str, 10, y, 20, raylib.maroon)
	}
}

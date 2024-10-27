module main

import raylib

fn main() {
	screen_width := 800
	screen_height := 450
	t := 'raylib [core] example - window should close'
	C.InitWindow(screen_width, screen_height, t.str)
	C.SetTargetFPS(60)
	C.SetExitKey(int(raylib.KeyboardKey.key_null))
	//
	mut exit_requested := false
	mut exit_window := false
	//
	for exit_window == false {
		//
		// Update
		if C.WindowShouldClose() {
			exit_requested = true
		}
		//
		if exit_requested {
			if C.IsKeyPressed(int(raylib.KeyboardKey.key_y)) {
				exit_window = true
			} else if C.IsKeyPressed(int(raylib.KeyboardKey.key_n)) {
				exit_requested = false
			}
		}
		//
		// Draw
		C.BeginDrawing()
		{
			C.ClearBackground(raylib.raywhite)
			if exit_requested {
				C.DrawRectangle(0, 100, screen_width, 200, raylib.black)
				mut text := 'Are you sure you want to exit program? [Y/N]'
				C.DrawText(text.str, 40, 180, 30, raylib.white)
			} else {
				text := 'Try to close the window to get confirmation message!'
				C.DrawText(text.str, 120, 200, 20, raylib.lightgray)
			}
		}
		C.EndDrawing()
	}
	//
	C.CloseWindow()
}

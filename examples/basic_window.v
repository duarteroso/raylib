module main

import raylib

fn main() {
	screen_width := 800
	screen_height := 450
	t := 'raylib [core] example - basic window'
	C.InitWindow(screen_width, screen_height, t.str)
	C.SetTargetFPS(60)
	//
	for C.WindowShouldClose() == false {
		C.BeginDrawing()
		{
			C.ClearBackground(raylib.raywhite)
		}
		C.EndDrawing()
	}
	//
	C.CloseWindow()
}

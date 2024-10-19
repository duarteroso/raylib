module main

import raylib

const w = 800
const h = 450

fn main() {
	t := 'raylib [core] example - basic window'
	C.InitWindow(w, h, t.str)
	//
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

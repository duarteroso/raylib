module main

import raylib

fn main() {
	screen_width := 800
	screen_height := 450
	t := 'raylib [core] example - 3d camera mode'
	C.InitWindow(screen_width, screen_height, t.str)
	C.SetTargetFPS(60)
	//
	pos := raylib.Vector3{0.0, 0.0, 0.0}
	size := raylib.Vector3{2.0, 2.0, 2.0}
	camera := raylib.Camera3D{
		position:   raylib.Vector3{0.0, 10.0, 10.0}
		target:     raylib.Vector3{0.0, 0.0, 0.0}
		up:         raylib.Vector3{0.0, 1.0, 0.0}
		fovy:       45.0
		projection: int(raylib.CameraProjection.camera_perspective)
	}
	//
	for C.WindowShouldClose() == false {
		C.BeginDrawing()
		{
			C.ClearBackground(raylib.raywhite)
			C.BeginMode3D(camera)
			{
				C.DrawCubeV(pos, size, raylib.red)
				C.DrawCubeWiresV(pos, size, raylib.maroon)
				C.DrawGrid(10, 1.0)
			}
			C.EndMode3D()
		}
		C.EndDrawing()
	}
	//
	C.CloseWindow()
}

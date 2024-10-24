module main

import raylib

fn main() {
	screen_width := 800
	screen_height := 450
	t := 'raylib [core] example - 3d camera free'
	C.InitWindow(screen_width, screen_height, t.str)
	C.SetTargetFPS(60)
	C.DisableCursor()
	//
	pos := raylib.Vector3{0.0, 0.0, 0.0}
	size := raylib.Vector3{2.0, 2.0, 2.0}
	mut camera := &raylib.Camera3D{
		position:   raylib.Vector3{10.0, 10.0, 10.0}
		target:     raylib.Vector3{0.0, 0.0, 0.0}
		up:         raylib.Vector3{0.0, 1.0, 0.0}
		fovy:       45.0
		projection: int(raylib.CameraProjection.camera_perspective)
	}
	//
	for C.WindowShouldClose() == false {
		//
		// Update
		C.UpdateCamera(camera, int(raylib.CameraMode.camera_free))
		if C.IsKeyDown(int(raylib.KeyboardKey.key_z)) {
			camera.target = raylib.Vector3{
				x: 0.0
				y: 0.0
				z: 0.0
			}
		}
		//
		// Drawing
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
			//
			C.DrawRectangle(10, 10, 320, 93, C.Fade(raylib.skyblue, 0.5))
			C.DrawRectangleLines(10, 10, 320, 93, raylib.blue)
			//
			C.DrawText('Free camera default controls:'.str, 20, 20, 10, raylib.black)
			C.DrawText('- Mouse Wheel to Zoom in-out'.str, 40, 40, 10, raylib.darkgray)
			C.DrawText('- Mouse Wheel Pressed to Pan'.str, 40, 60, 10, raylib.darkgray)
			C.DrawText('- Z to zoom to (0, 0, 0)'.str, 40, 80, 10, raylib.darkgray)
		}
		C.EndDrawing()
	}
	//
	C.CloseWindow()
}

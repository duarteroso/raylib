module main

import raylib

fn main() {
	screen_width := 800
	screen_height := 450
	t := 'raylib [core] example - core world screen'
	C.InitWindow(screen_width, screen_height, t.str)
	C.SetTargetFPS(60)
	C.DisableCursor()
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
		//
		// Update
		C.UpdateCamera(&camera, int(raylib.CameraMode.camera_third_person))
		cube_scr_pos := C.GetWorldToScreen(raylib.Vector3{
			x: pos.x
			y: pos.y + 2.5
			z: pos.z
		}, camera)
		//
		// Draw
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
		//
		mut text := 'Enemy: 100 / 100'
		text_size := C.MeasureText(text.str, 20) / 2
		text_x := int(cube_scr_pos.x - text_size)
		text_y := int(cube_scr_pos.y)
		C.DrawText(text.str, text_x, text_y, 20, raylib.black)
		//
		text = 'Cube position in screen space coordinates: [${cube_scr_pos.x}, ${cube_scr_pos.y}]'
		C.DrawText(text.str, 10, 10, 20, raylib.lime)
		//
		text = 'Text 2d should be always on top of the cube'
		C.DrawText(text.str, 10, 40, 20, raylib.gray)
	}
	//
	C.CloseWindow()
}

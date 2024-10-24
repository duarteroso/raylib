module main

import raylib

fn main() {
	screen_width := 800
	screen_height := 450
	t := 'raylib [core] example - 3d picking'
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
	mut ray := raylib.Ray{}
	mut collision := raylib.RayCollision{}
	//
	for C.WindowShouldClose() == false {
		//
		// Update
		if C.IsCursorHidden() {
			C.UpdateCamera(&camera, int(raylib.CameraMode.camera_first_person))
		}
		//
		if C.IsMouseButtonPressed(int(raylib.MouseButton.mouse_button_right)) {
			if C.IsCursorHidden() {
				C.EnableCursor()
			} else {
				C.DisableCursor()
			}
		}
		//
		if C.IsMouseButtonPressed(int(raylib.MouseButton.mouse_button_left)) {
			if collision.hit == false {
				ray = C.GetMouseRay(C.GetMousePosition(), camera)
				collision = C.GetRayCollisionBox(ray, raylib.BoundingBox{
					min: raylib.Vector3{
						x: pos.x - (size.x / 2)
						y: pos.y - (size.y / 2)
						z: pos.z - (size.z / 2)
					}
					max: raylib.Vector3{
						x: pos.x + (size.x / 2)
						y: pos.y + (size.y / 2)
						z: pos.z + (size.z / 2)
					}
				})
			} else {
				collision.hit = false
			}
		}
		//
		// Draw
		C.BeginDrawing()
		{
			C.ClearBackground(raylib.raywhite)
			C.BeginMode3D(camera)
			{
				if collision.hit {
					C.DrawCubeV(pos, size, raylib.red)
					C.DrawCubeWiresV(pos, size, raylib.maroon)
					C.DrawCubeWiresV(pos, raylib.Vector3{
						x: size.x + 0.2
						y: size.y + 0.2
						z: size.z + 0.2
					}, raylib.green)
				} else {
					C.DrawCubeV(pos, size, raylib.darkgray)
					C.DrawCubeWiresV(pos, size, raylib.darkgray)
				}
				//
				C.DrawRay(ray, raylib.maroon)
				C.DrawGrid(10, 1.0)
			}
			C.EndMode3D()
			//
			mut text := 'Try clicking on the box with your mouse!'
			C.DrawText(text.str, 240, 10, 20, raylib.darkgray)
			if collision.hit {
				text = 'BOX SELECTED'
				x := (screen_width - C.MeasureText(text.str, 30)) / 2
				y := int(screen_height / 10)
				C.DrawText(text.str, x, y, 30, raylib.green)
			}
			//
			text = 'Right click mouse to toggle camera controls'
			C.DrawText(text.str, 10, 430, 10, raylib.gray)
			C.DrawFPS(10, 10)
		}
		C.EndDrawing()
	}
	//
	C.CloseWindow()
}

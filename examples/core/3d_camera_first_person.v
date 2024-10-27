module main

import raylib

fn main() {
	screen_width := 800
	screen_height := 450
	t := 'raylib [core] example - 3d camera first person'
	C.InitWindow(screen_width, screen_height, t.str)
	C.SetTargetFPS(60)
	C.DisableCursor()
	//
	mut camera := raylib.Camera{
		position:   raylib.Vector3{0.0, 2.0, 4.0}
		target:     raylib.Vector3{0.0, 2.0, 0.0}
		up:         raylib.Vector3{0.0, 1.0, 0.0}
		fovy:       60.0
		projection: int(raylib.CameraProjection.camera_perspective)
	}
	mut camera_mode := int(raylib.CameraMode.camera_first_person)
	//
	max_columns := 20
	mut heights := []f32{len: max_columns}
	mut positions := []raylib.Vector3{len: max_columns}
	mut colors := []raylib.Color{len: max_columns}
	//
	for i in 0 .. max_columns {
		heights[i] = f32(C.GetRandomValue(1, 12))
		positions[i] = raylib.Vector3{
			x: f32(C.GetRandomValue(-15, 15))
			y: heights[i] / 2.0
			z: f32(C.GetRandomValue(-15, 15))
		}
		colors[i] = raylib.Color{
			r: u8(C.GetRandomValue(20, 255))
			g: u8(C.GetRandomValue(10, 55))
			b: 30
			a: 255
		}
	}
	//
	for C.WindowShouldClose() == false {
		// Update
		//
		if C.IsKeyPressed(int(raylib.KeyboardKey.key_one)) {
			camera_mode = int(raylib.CameraMode.camera_free)
			camera.up = raylib.Vector3{0.0, 1.0, 0.0}
		}
		//
		if C.IsKeyPressed(int(raylib.KeyboardKey.key_two)) {
			camera_mode = int(raylib.CameraMode.camera_first_person)
			camera.up = raylib.Vector3{0.0, 1.0, 0.0}
		}
		//
		if C.IsKeyPressed(int(raylib.KeyboardKey.key_three)) {
			camera_mode = int(raylib.CameraMode.camera_third_person)
			camera.up = raylib.Vector3{0.0, 1.0, 0.0}
		}
		//
		if C.IsKeyPressed(int(raylib.KeyboardKey.key_four)) {
			camera_mode = int(raylib.CameraMode.camera_orbital)
			camera.up = raylib.Vector3{0.0, 1.0, 0.0}
		}
		//
		if C.IsKeyPressed(int(raylib.KeyboardKey.key_p)) {
			if camera.projection == int(raylib.CameraProjection.camera_perspective) {
				camera_mode = int(raylib.CameraMode.camera_third_person)
				camera.position = raylib.Vector3{0.0, 2.0, -100.0}
				camera.target = raylib.Vector3{0.0, 2.0, 0.0}
				camera.up = raylib.Vector3{0.0, 1.0, 0.0}
				camera.projection = int(raylib.CameraProjection.camera_orthographic)
				camera.fovy = 20.0
			} else if camera.projection == int(raylib.CameraProjection.camera_orthographic) {
				camera_mode = int(raylib.CameraMode.camera_third_person)
				camera.position = raylib.Vector3{0.0, 2.0, 10.0}
				camera.target = raylib.Vector3{0.0, 2.0, 0.0}
				camera.up = raylib.Vector3{0.0, 1.0, 0.0}
				camera.projection = int(raylib.CameraProjection.camera_perspective)
				camera.fovy = 60.0
			}
		}
		//
		C.UpdateCamera(&camera, camera_mode)
		//
		// Draw
		C.BeginDrawing()
		{
			C.ClearBackground(raylib.raywhite)
			//
			C.BeginMode3D(camera)
			{
				C.DrawPlane(raylib.Vector3{0.0, 0.0, 0.0}, raylib.Vector2{32.0, 32.0},
					raylib.lightgray)
				C.DrawCube(raylib.Vector3{-16.0, 2.5, 0.0}, 1.0, 5.0, 32.0, raylib.blue)
				C.DrawCube(raylib.Vector3{16.0, 2.5, 0.0}, 1.0, 5.0, 32.0, raylib.lime)
				C.DrawCube(raylib.Vector3{0.0, 2.5, 16.0}, 32.0, 5.0, 1.0, raylib.gold)
				//
				for i in 0 .. max_columns {
					C.DrawCube(positions[i], 2.0, heights[i], 2.0, colors[i])
					C.DrawCubeWires(positions[i], 2.0, heights[i], 2.0, raylib.maroon)
				}
				//
				if camera_mode == int(raylib.CameraMode.camera_third_person) {
					C.DrawCube(camera.target, 0.5, 0.5, 0.5, raylib.purple)
					C.DrawCubeWires(camera.target, 0.5, 0.5, 0.5, raylib.darkpurple)
				}
			}
			C.EndMode3D()
			//
			C.DrawRectangle(5, 5, 330, 100, C.Fade(raylib.skyblue, 0.5))
			C.DrawRectangleLines(5, 5, 330, 100, raylib.blue)
			C.DrawText('Camera controls:'.str, 15, 15, 10, raylib.black)
			C.DrawText('- Move keys: W, A, S, D, Space, Left-Ctrl'.str, 15, 30, 10, raylib.black)
			C.DrawText('- Look around: arrow keys or mouse'.str, 15, 45, 10, raylib.black)
			C.DrawText('- Camera mode keys: 1, 2, 3, 4'.str, 15, 60, 10, raylib.black)
			C.DrawText('- Zoom keys: num-plus, num-minus or mouse scroll'.str, 15, 75,
				10, raylib.black)
			C.DrawText('- Camera projection key: P'.str, 15, 90, 10, raylib.black)
			C.DrawRectangle(600, 5, 195, 100, C.Fade(raylib.skyblue, 0.5))
			C.DrawRectangleLines(600, 5, 195, 100, raylib.blue)
			C.DrawText('Camera status:'.str, 610, 15, 10, raylib.black)
			mode := match camera_mode {
				int(raylib.CameraMode.camera_free) { 'FREE' }
				int(raylib.CameraMode.camera_first_person) { 'FIRST_PERSON' }
				int(raylib.CameraMode.camera_third_person) { 'THIRD_PERSON' }
				int(raylib.CameraMode.camera_orbital) { 'ORBITAL' }
				else { 'CUSTOM' }
			}
			C.DrawText('- Mode: ${mode}'.str, 610, 30, 10, raylib.black)
			mut text := match camera.projection {
				int(raylib.CameraProjection.camera_perspective) { 'PERSPECTIVE' }
				int(raylib.CameraProjection.camera_orthographic) { 'ORTHOGRAPHIC' }
				else { 'CUSTOM' }
			}
			C.DrawText('- Projection: ${text}'.str, 610, 45, 10, raylib.black)
			text = '- Position: (${camera.position.x:06.3}, ${camera.position.y:06.3}, ${camera.position.z:06.3})'
			C.DrawText(text.str, 610, 60, 10, raylib.black)
			text = '- Target: (${camera.target.x:06.3}, ${camera.target.y:06.3}, ${camera.target.z:06.3})'
			C.DrawText(text.str, 610, 75, 10, raylib.black)
			text = '- Up: (${camera.up.x:06.3}, ${camera.up.y:06.3}, ${camera.up.z:06.3})'
			C.DrawText(text.str, 610, 90, 10, raylib.black)
		}
		C.EndDrawing()
	}
	C.CloseWindow()
}

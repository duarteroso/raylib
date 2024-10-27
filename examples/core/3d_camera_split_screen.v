module main

import raylib

fn main() {
	screen_width := 800
	screen_height := 450
	t := 'raylib [core] example - 3d camera split scree'
	C.InitWindow(screen_width, screen_height, t.str)
	C.SetTargetFPS(60)
	//
	mut camera_player1 := raylib.Camera{
		position: raylib.Vector3{0.0, 1.0, -3.0}
		target:   raylib.Vector3{0.0, 1.0, 0.0}
		up:       raylib.Vector3{0.0, 1.0, 0.0}
		fovy:     45.0
	}
	mut screen_player1 := C.LoadRenderTexture(screen_width / 2, screen_height)
	//
	mut camera_player2 := raylib.Camera{
		position: raylib.Vector3{-3.0, 3.0, 0.0}
		target:   raylib.Vector3{0.0, 3.0, 0.0}
		up:       raylib.Vector3{0.0, 1.0, 0.0}
		fovy:     45.0
	}
	mut screen_player2 := C.LoadRenderTexture(screen_width / 2, screen_height)
	//
	split_screen_rect := raylib.Rectangle{
		x:      0.0
		y:      0.0
		width:  f32(screen_player1.texture.width)
		height: f32(-screen_player1.texture.height)
	}
	//
	count := 5
	spacing := f32(4)
	//
	for C.WindowShouldClose() == false {
		//
		// Update
		offset_this_frame := 10.0 * C.GetFrameTime()
		//
		if C.IsKeyDown(int(raylib.KeyboardKey.key_w)) {
			camera_player1.position.z += offset_this_frame
			camera_player1.target.z += offset_this_frame
		} else if C.IsKeyDown(int(raylib.KeyboardKey.key_s)) {
			camera_player1.position.z -= offset_this_frame
			camera_player1.target.z -= offset_this_frame
		}

		// Move Player2 forward and backwards (no turning)
		if C.IsKeyDown(int(raylib.KeyboardKey.key_up)) {
			camera_player2.position.x += offset_this_frame
			camera_player2.target.x += offset_this_frame
		} else if C.IsKeyDown(int(raylib.KeyboardKey.key_down)) {
			camera_player2.position.x -= offset_this_frame
			camera_player2.target.x -= offset_this_frame
		}
		//
		// Draw
		C.BeginTextureMode(screen_player1)
		{
			C.ClearBackground(raylib.skyblue)
			//
			C.BeginMode3D(camera_player1)
			{
				C.DrawPlane(raylib.Vector3{0, 0, 0}, raylib.Vector2{50, 50}, raylib.beige)

				for x := -count * spacing; x <= count * spacing; x += spacing {
					for z := -count * spacing; z <= count * spacing; z += spacing {
						C.DrawCube(raylib.Vector3{x, 1.5, z}, 1, 1, 1, raylib.lime)
						C.DrawCube(raylib.Vector3{x, 0.5, z}, 0.25, 1, 0.25, raylib.brown)
					}
				}

				// Draw a cube at each player's position
				C.DrawCube(camera_player1.position, 1, 1, 1, raylib.red)
				C.DrawCube(camera_player2.position, 1, 1, 1, raylib.blue)
			}
			C.EndMode3D()
			C.DrawRectangle(0, 0, C.GetScreenWidth() / 2, 40, C.Fade(raylib.raywhite,
				0.8))
			C.DrawText('PLAYER1: W/S to move'.str, 10, 10, 20, raylib.maroon)
		}
		C.EndTextureMode()
		//
		C.BeginTextureMode(screen_player2)
		{
			C.ClearBackground(raylib.skyblue)
			C.BeginMode3D(camera_player2)
			{
				C.DrawPlane(raylib.Vector3{0, 0, 0}, raylib.Vector2{50, 50}, raylib.beige)
				//
				for x := -count * spacing; x <= count * spacing; x += spacing {
					for z := -count * spacing; z <= count * spacing; z += spacing {
						C.DrawCube(raylib.Vector3{x, 1.5, z}, 1, 1, 1, raylib.lime)
						C.DrawCube(raylib.Vector3{x, 0.5, z}, 0.25, 1, 0.25, raylib.brown)
					}
				}
				//
				C.DrawCube(camera_player1.position, 1, 1, 1, raylib.red)
				C.DrawCube(camera_player2.position, 1, 1, 1, raylib.blue)
			}
			C.EndMode3D()
			//
			C.DrawRectangleRec(raylib.Rectangle{
				x:      0
				y:      0
				width:  C.GetScreenWidth() / 2
				height: 40
			}, C.Fade(raylib.raywhite, 0.8))
			C.DrawText('PLAYER2: UP/DOWN to move'.str, 10, 10, 20, raylib.darkblue)
		}
		C.EndTextureMode()
		//
		C.BeginDrawing()
		{
			C.ClearBackground(raylib.black)
			C.DrawTextureRec(screen_player1.texture, split_screen_rect, raylib.Vector2{0, 0},
				raylib.white)
			C.DrawTextureRec(screen_player2.texture, split_screen_rect, raylib.Vector2{f32(screen_width) / 2.0, 0},
				raylib.white)
			C.DrawRectangle(C.GetScreenWidth() / 2 - 2, 0, 4, C.GetScreenHeight(), raylib.lightgray)
		}
		C.EndDrawing()
	}
	//
	C.UnloadRenderTexture(screen_player1)
	C.UnloadRenderTexture(screen_player2)
	//
	C.CloseWindow()
}

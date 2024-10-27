module main

import raylib

fn main() {
	screen_width := 800
	screen_height := 450
	t := 'raylib [core] example - 2d camera split screen'
	C.InitWindow(screen_width, screen_height, t.str)
	C.SetTargetFPS(60)
	//
	player_size := 40
	mut player1 := raylib.Rectangle{
		x:      200
		y:      200
		width:  player_size
		height: player_size
	}
	mut player2 := raylib.Rectangle{
		x:      250
		y:      200
		width:  player_size
		height: player_size
	}
	//
	mut camera1 := raylib.Camera2D{
		target:   raylib.Vector2{player1.x, player1.y}
		offset:   raylib.Vector2{200.0, 200.0}
		rotation: 0.0
		zoom:     1.0
	}
	mut camera2 := raylib.Camera2D{
		target:   raylib.Vector2{player2.x, player2.y}
		offset:   raylib.Vector2{200.0, 200.0}
		rotation: 0.0
		zoom:     1.0
	}
	//
	screen_camera1 := C.LoadRenderTexture(screen_width / 2, screen_height)
	screen_camera2 := C.LoadRenderTexture(screen_width / 2, screen_height)
	//
	split_screen_rect := raylib.Rectangle{
		x:      0.0
		y:      0.0
		width:  f32(screen_camera1.texture.width)
		height: f32(-screen_camera1.texture.height)
	}
	//
	for C.WindowShouldClose() == false {
		//
		// Update
		if C.IsKeyDown(int(raylib.KeyboardKey.key_s)) {
			player1.y += 3.0
		} else if C.IsKeyDown(int(raylib.KeyboardKey.key_w)) {
			player1.y -= 3.0
		} else if C.IsKeyDown(int(raylib.KeyboardKey.key_d)) {
			player1.x += 3.0
		} else if C.IsKeyDown(int(raylib.KeyboardKey.key_a)) {
			player1.x -= 3.0
		}
		//
		if C.IsKeyDown(int(raylib.KeyboardKey.key_down)) {
			player2.y += 3.0
		} else if C.IsKeyDown(int(raylib.KeyboardKey.key_up)) {
			player2.y -= 3.0
		} else if C.IsKeyDown(int(raylib.KeyboardKey.key_right)) {
			player2.x += 3.0
		} else if C.IsKeyDown(int(raylib.KeyboardKey.key_left)) {
			player2.x -= 3.0
		}
		//
		camera1.target = raylib.Vector2{player1.x, player1.y}
		camera2.target = raylib.Vector2{player2.x, player2.y}
		//
		// Draw
		C.BeginTextureMode(screen_camera1)
		{
			C.ClearBackground(raylib.raywhite)
			//
			C.BeginMode2D(camera1)
			{
				for i in 0 .. screen_width / player_size + 1 {
					C.DrawLineV(raylib.Vector2{f32(player_size * i), 0.0}, raylib.Vector2{f32(player_size * i), f32(screen_height)},
						raylib.lightgray)
				}

				for i in 0 .. screen_height / player_size + 1 {
					C.DrawLineV(raylib.Vector2{0.0, f32(player_size * i)}, raylib.Vector2{f32(screen_width), f32(player_size * i)},
						raylib.lightgray)
				}

				for i in 0 .. screen_width / player_size {
					for j in 0 .. screen_height / player_size {
						text := '[${i},${j}]'
						C.DrawText(text.str, 10 + player_size * i, 15 + player_size * j,
							10, raylib.lightgray)
					}
				}

				C.DrawRectangleRec(player1, raylib.red)
				C.DrawRectangleRec(player2, raylib.blue)
			}
			C.EndMode2D()
			//
			color := C.Fade(raylib.raywhite, 0.6)
			C.DrawRectangle(0, 0, C.GetScreenWidth() / 2, 30, color)
			C.DrawText('PLAYER1: W/S/A/D to move'.str, 10, 10, 10, raylib.maroon)
		}
		C.EndTextureMode()
		//
		C.BeginTextureMode(screen_camera2)
		{
			C.ClearBackground(raylib.raywhite)
			//
			C.BeginMode2D(camera2)
			{
				for i in 0 .. screen_width / player_size + 1 {
					C.DrawLineV(raylib.Vector2{f32(player_size * i), 0.0}, raylib.Vector2{f32(player_size * i), f32(screen_height)},
						raylib.lightgray)
				}

				for i in 0 .. screen_height / player_size + 1 {
					C.DrawLineV(raylib.Vector2{0.0, f32(player_size * i)}, raylib.Vector2{f32(screen_width), f32(player_size * i)},
						raylib.lightgray)
				}

				for i in 0 .. screen_width / player_size {
					for j in 0 .. screen_height / player_size {
						text := '[${i},${j}]'
						C.DrawText(text.str, 10 + player_size * i, 15 + player_size * j,
							10, raylib.lightgray)
					}
				}

				C.DrawRectangleRec(player1, raylib.red)
				C.DrawRectangleRec(player2, raylib.blue)
			}
			C.EndMode2D()
			//
			color := C.Fade(raylib.raywhite, 0.6)
			C.DrawRectangle(0, 0, C.GetScreenWidth() / 2, 30, color)
			C.DrawText('PLAYER2: UP/DOWN/LEFT/RIGHT to move'.str, 10, 10, 10, raylib.darkblue)
		}
		C.EndTextureMode()
		//
		C.BeginDrawing()
		{
			C.ClearBackground(raylib.black)
			//
			C.DrawTextureRec(screen_camera1.texture, split_screen_rect, raylib.Vector2{0, 0},
				raylib.white)
			C.DrawTextureRec(screen_camera2.texture, split_screen_rect, raylib.Vector2{f32(screen_width) / 2.0, 0},
				raylib.white)
			//
			C.DrawRectangle(C.GetScreenWidth() / 2 - 2, 0, 4, C.GetScreenHeight(), raylib.lightgray)
		}
		C.EndDrawing()
	}
	//
	C.UnloadRenderTexture(screen_camera1)
	C.UnloadRenderTexture(screen_camera2)
	//
	C.CloseWindow()
}

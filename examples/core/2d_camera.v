module main

import raylib

fn main() {
	screen_width := 800
	screen_height := 450
	t := 'raylib [core] example - 2d camera'
	C.InitWindow(screen_width, screen_height, t.str)
	C.SetTargetFPS(60)
	//
	max_buildings := 100
	mut player := raylib.Rectangle{400, 280, 40, 40}
	mut buildings := []raylib.Rectangle{len: max_buildings}
	mut build_colors := []raylib.Color{len: max_buildings}
	//
	mut spacing := 0
	for i in 0 .. max_buildings {
		buildings[i].width = f32(C.GetRandomValue(50, 200))
		buildings[i].height = f32(C.GetRandomValue(100, 800))
		buildings[i].x = -6000.0 + f32(spacing)
		buildings[i].y = f32(screen_height) - 130.0 - f32(buildings[i].height)
		//
		spacing += int(buildings[i].width)
		//
		build_colors[i] = raylib.Color{
			r: u8(C.GetRandomValue(200, 240))
			g: u8(C.GetRandomValue(200, 240))
			b: u8(C.GetRandomValue(200, 240))
			a: 255
		}
	}
	//
	mut camera := raylib.Camera2D{
		target:   raylib.Vector2{
			x: player.x + 20.0
			y: player.y + 20.0
		}
		offset:   raylib.Vector2{
			x: f32(screen_width) / 2.0
			y: f32(screen_height) / 2.0
		}
		rotation: 0.0
		zoom:     1.0
	}
	//
	for C.WindowShouldClose() == false {
		//
		// Update
		if C.IsKeyDown(int(raylib.KeyboardKey.key_right)) {
			player.x += 2
		} else if C.IsKeyDown(int(raylib.KeyboardKey.key_left)) {
			player.x -= 2
		}
		//
		camera.target = raylib.Vector2{
			x: player.x + 20
			y: player.y + 20
		}
		//
		if C.IsKeyDown(int(raylib.KeyboardKey.key_a)) {
			camera.rotation--
		} else if C.IsKeyDown(int(raylib.KeyboardKey.key_s)) {
			camera.rotation++
		}
		//
		camera.zoom += f32(C.GetMouseWheelMove() * 0.05)
		//
		if camera.zoom > 3.0 {
			camera.zoom = 3.0
		} else if camera.zoom < 0.1 {
			camera.zoom = 0.1
		}
		//
		if C.IsKeyDown(int(raylib.KeyboardKey.key_r)) {
			camera.zoom = 1.0
			camera.rotation = 0.0
		}
		//
		// Draw
		C.BeginDrawing()
		{
			C.ClearBackground(raylib.raywhite)
			//
			C.BeginMode2D(camera)
			{
				C.DrawRectangle(-6000, 320, 13000, 8000, raylib.darkgray)
				//
				for i in 0 .. max_buildings {
					C.DrawRectangleRec(buildings[i], build_colors[i])
				}
				//
				C.DrawRectangleRec(player, raylib.red)
				//
				mut start_pos_x := int(camera.target.x)
				mut start_pos_y := screen_height * 10
				C.DrawLine(start_pos_x, -start_pos_y, start_pos_x, start_pos_y, raylib.green)
				start_pos_x = screen_width * 10
				start_pos_y = int(camera.target.y)
				C.DrawLine(-start_pos_x, start_pos_y, start_pos_x, start_pos_y, raylib.green)
			}
			C.EndMode2D()
			//
			C.DrawText('SCREEN AREA'.str, 640, 10, 20, raylib.red)
			//
			C.DrawRectangle(0, 0, screen_width, 5, raylib.red)
			C.DrawRectangle(0, 5, 5, screen_height - 10, raylib.red)
			C.DrawRectangle(screen_width - 5, 5, 5, screen_height - 10, raylib.red)
			C.DrawRectangle(0, screen_height - 5, screen_width, 5, raylib.red)
			//
			C.DrawRectangle(10, 10, 250, 113, C.Fade(raylib.skyblue, 0.5))
			C.DrawRectangleLines(10, 10, 250, 113, raylib.blue)
			//
			C.DrawText('Free 2d camera controls:'.str, 20, 20, 10, raylib.black)
			C.DrawText('- Right/Left to move Offset'.str, 40, 40, 10, raylib.darkgray)
			C.DrawText('- Mouse Wheel to Zoom in-out'.str, 40, 60, 10, raylib.darkgray)
			C.DrawText('- a /S to Rotate'.str, 40, 80, 10, raylib.darkgray)
			C.DrawText('- R to reset Zoom and Rotation'.str, 40, 100, 10, raylib.darkgray)
		}
		C.EndDrawing()
	}
	//
	C.CloseWindow()
}

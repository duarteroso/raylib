module main

import math
import raylib

fn main() {
	screen_width := 800
	screen_height := 450
	t := 'raylib [core] example - window scale letterbox'
	C.SetConfigFlags(u32(raylib.ConfigFlag.flag_window_resizable) | u32(raylib.ConfigFlag.flag_vsync_hint))
	C.InitWindow(screen_width, screen_height, t.str)
	C.SetWindowMinSize(320, 240)
	C.SetTargetFPS(60)
	//
	game_scr_width := 640
	game_scr_height := 480
	//
	target := C.LoadRenderTexture(game_scr_width, game_scr_height)
	C.SetTextureFilter(target.texture, int(raylib.TextureFilter.texture_filter_bilinear))
	//
	mut colors := []raylib.Color{len: 10}
	random_colors(mut colors)
	//
	for C.WindowShouldClose() == false {
		//
		// Update
		scale := math.min(f32(C.GetScreenWidth()) / game_scr_width, f32(C.GetScreenHeight()) / game_scr_height)
		if C.IsKeyPressed(int(raylib.KeyboardKey.key_space)) {
			random_colors(mut colors)
		}
		//
		mouse := C.GetMousePosition()
		mut virtual_mouse := raylib.Vector2{
			x: (mouse.x - (C.GetScreenWidth() - (game_scr_width * scale)) * 0.5) / scale
			y: (mouse.y - (C.GetScreenHeight() - (game_scr_height * scale)) * 0.5) / scale
		}
		virtual_mouse = C.Vector2Clamp(virtual_mouse, raylib.Vector2{0.0, 0.0}, raylib.Vector2{f32(game_scr_width), f32(game_scr_height)})
		//
		// Draw
		C.BeginTextureMode(target)
		{
			C.ClearBackground(raylib.raywhite)
			//
			for idx in 0 .. colors.len {
				x := 0
				y := (game_scr_height / 10) * idx
				w := game_scr_width
				h := game_scr_height / 10
				C.DrawRectangle(x, y, w, h, colors[idx])
			}
			//
			mut text := 'If executed inside a window,\nyou can resize the window,\nand see the screen scaling!'
			C.DrawText(text.str, 10, 25, 20, raylib.white)
			text = 'Default Mouse: [${mouse.x:.0} , ${mouse.y:.0}]'
			C.DrawText(text.str, 350, 25, 20, raylib.green)
			text = 'Virtual Mouse: [${virtual_mouse.x:.0} , ${virtual_mouse.y:.0}]'
			C.DrawText(text.str, 350, 55, 20, raylib.yellow)
		}
		C.EndTextureMode()
		//
		C.BeginDrawing()
		{
			C.ClearBackground(raylib.black)
			//
			source := raylib.Rectangle{
				x:      0.0
				y:      0.0
				width:  f32(target.texture.width)
				height: f32(-target.texture.height)
			}
			dest := raylib.Rectangle{
				x:      (C.GetScreenWidth() - (f32(game_scr_width * scale))) * 0.5
				y:      (C.GetScreenHeight() - (f32(game_scr_height * scale))) * 0.5
				width:  f32(game_scr_width * scale)
				height: f32(game_scr_height * scale)
			}
			origin := raylib.Vector2{0.0, 0.0}
			rotation := 0.0
			C.DrawTexturePro(target.texture, source, dest, origin, rotation, raylib.white)
		}
		C.EndDrawing()
	}
	//
	C.UnloadRenderTexture(target)
	//
	C.CloseWindow()
}

fn random_colors(mut colors []raylib.Color) {
	for mut color in colors {
		color = raylib.Color{
			r: u8(C.GetRandomValue(100, 250))
			g: u8(C.GetRandomValue(50, 150))
			b: u8(C.GetRandomValue(10, 100))
			a: 255
		}
	}
}

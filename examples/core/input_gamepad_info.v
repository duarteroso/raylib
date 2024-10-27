module main

import raylib

fn main() {
	screen_width := 800
	screen_height := 450
	t := 'raylib [core] example - gamepad information'
	C.SetConfigFlags(u32(raylib.ConfigFlag.flag_msaa_4x_hint))
	C.InitWindow(screen_width, screen_height, t.str)
	C.SetTargetFPS(60)
	//
	for C.WindowShouldClose() == false {
		//
		// Draw
		C.BeginDrawing()
		{
			C.ClearBackground(raylib.raywhite)
			//
			for idx in 0 .. 4 {
				if C.IsGamepadAvailable(idx) {
					mut y := 0
					mut name := unsafe { cstring_to_vstring(C.GetGamepadName(idx)) }
					mut text := 'Gamepad name: ${name}'
					C.DrawText(text.str, 10, y, 10, raylib.black)
					y += 11
					text = '\tAxis count:   ${C.GetGamepadAxisCount(idx)}'
					C.DrawText(text.str, 10, y, 10, raylib.black)
					y += 11

					for axis in 0 .. C.GetGamepadAxisCount(idx) {
						text = '\tAxis ${axis} = ${C.GetGamepadAxisMovement(idx, axis)}'
						C.DrawText(text.str, 10, y, 10, raylib.black)
						y += 11
					}

					for button in 0 .. 32 {
						text = '\tButton ${button} = ${C.IsGamepadButtonDown(idx, button)}'
						C.DrawText(text.str, 10, y, 10, raylib.black)
						y += 11
					}
				}
			}

			C.DrawFPS(C.GetScreenWidth() - 100, 100)
		}
		C.EndDrawing()
	}
	C.CloseWindow()
}

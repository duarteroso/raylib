module main

import raylib

enum GameScreen {
	logo
	title
	gameplay
	ending
}

fn main() {
	screen_width := 800
	screen_height := 450
	t := 'raylib [core] example - basic screen manager'
	C.InitWindow(screen_width, screen_height, t.str)
	C.SetTargetFPS(60)
	//
	mut state := GameScreen.logo
	mut counter := 0
	//
	for C.WindowShouldClose() == false {
		match state {
			.logo {
				counter++
				if counter >= 120 {
					state = GameScreen.gameplay
				}
			}
			.title {
				if C.IsKeyPressed(int(raylib.KeyboardKey.key_enter))
					|| C.IsGestureDetected(int(raylib.Gesture.gesture_tap)) {
					state = GameScreen.gameplay
				}
			}
			.gameplay {
				if C.IsKeyPressed(int(raylib.KeyboardKey.key_enter))
					|| C.IsGestureDetected(int(raylib.Gesture.gesture_tap)) {
					state = GameScreen.ending
				}
			}
			.ending {
				if C.IsKeyPressed(int(raylib.KeyboardKey.key_enter))
					|| C.IsGestureDetected(int(raylib.Gesture.gesture_tap)) {
					state = GameScreen.title
				}
			}
		}
		//
		C.BeginDrawing()
		{
			C.ClearBackground(raylib.raywhite)
			//
			match state {
				.logo {
					C.DrawText('LOGO SCREEN'.str, 20, 20, 40, raylib.lightgray)
					C.DrawText('WAIT for 2 SECONDS...'.str, 120, 220, 20, raylib.gray)
				}
				.title {
					C.DrawRectangle(0, 0, screen_width, screen_height, raylib.green)
					C.DrawText('TITLE SCREEN'.str, 20, 20, 40, raylib.darkgray)
					C.DrawText('PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN'.str, 120,
						220, 20, raylib.darkgreen)
				}
				.gameplay {
					C.DrawRectangle(0, 0, screen_width, screen_height, raylib.purple)
					C.DrawText('GAMEPLAY SCREEN'.str, 20, 20, 40, raylib.maroon)
					C.DrawText('PRESS ENTER or TAP to JUMP to ENDING SCREEN'.str, 120,
						220, 20, raylib.maroon)
				}
				.ending {
					C.DrawRectangle(0, 0, screen_width, screen_height, raylib.blue)
					C.DrawText('ENDING SCREEN'.str, 20, 20, 40, raylib.darkblue)
					C.DrawText('PRESS ENTER or TAP to JUMP to TITLE SCREEN'.str, 120,
						220, 20, raylib.darkblue)
				}
			}
		}
		C.EndDrawing()
	}
	//
	C.CloseWindow()
}

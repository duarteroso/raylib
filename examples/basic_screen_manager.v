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
		//
		// Update
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
		// Draw
		C.BeginDrawing()
		{
			C.ClearBackground(raylib.raywhite)
			//
			mut text := ''
			match state {
				.logo {
					text = 'LOGO SCREEN'
					C.DrawText(text.str, 20, 20, 40, raylib.lightgray)
					text = 'WAIT for 2 SECONDS...'
					C.DrawText(text.str, 120, 220, 20, raylib.gray)
				}
				.title {
					C.DrawRectangle(0, 0, screen_width, screen_height, raylib.green)
					text = 'TITLE SCREEN'
					C.DrawText(text.str, 20, 20, 40, raylib.darkgray)
					text = 'PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN'
					C.DrawText(text.str, 120, 220, 20, raylib.darkgreen)
				}
				.gameplay {
					C.DrawRectangle(0, 0, screen_width, screen_height, raylib.purple)
					text = 'GAMEPLAY SCREEN'
					C.DrawText(text.str, 20, 20, 40, raylib.maroon)
					text = 'PRESS ENTER or TAP to JUMP to ENDING SCREEN'
					C.DrawText(text.str, 120, 220, 20, raylib.maroon)
				}
				.ending {
					C.DrawRectangle(0, 0, screen_width, screen_height, raylib.blue)
					text = 'ENDING SCREEN'
					C.DrawText(text.str, 20, 20, 40, raylib.darkblue)
					text = 'PRESS ENTER or TAP to JUMP to TITLE SCREEN'
					C.DrawText(text.str, 120, 220, 20, raylib.darkblue)
				}
			}
		}
		C.EndDrawing()
	}
	//
	C.CloseWindow()
}

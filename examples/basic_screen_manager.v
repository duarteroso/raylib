module main

import raylib

const screen_width = 800
const screen_heightt = 450

enum GameScreen {
	logo
	title
	gameplay
	ending
}

fn main() {
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
					draw_title('LOGO SCREEN', raylib.lightgray)
					draw_description('WAIT for 2 SECONDS...', raylib.gray)
				}
				.title {
					draw_rectangle(raylib.green)
					draw_title('TITLE SCREEN', raylib.darkgreen)
					draw_description('PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN',
						raylib.darkgreen)
				}
				.gameplay {
					draw_rectangle(raylib.purple)
					draw_title('GAMEPLAY SCREEN', raylib.maroon)
					draw_description('PRESS ENTER or TAP to JUMP to ENDING SCREEN', raylib.maroon)
				}
				.ending {
					draw_rectangle(raylib.blue)
					draw_title('ENDING SCREEN', raylib.darkblue)
					draw_description('PRESS ENTER or TAP to JUMP to TITLE SCREEN', raylib.darkblue)
				}
			}
		}
		C.EndDrawing()
	}
	//
	C.CloseWindow()
}

fn draw_rectangle(color raylib.Color) {
	C.DrawRectangle(0, 0, screen_width, screen_height, color)
}

fn draw_title(text string, color raylib.Color) {
	C.DrawText(text.str, 20, 20, 40, color)
}

fn draw_description(text string, color raylib.Color) {
	C.DrawText(text.str, 120, 220, 20, color)
}

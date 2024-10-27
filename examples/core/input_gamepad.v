module main

import os
import math
import raylib

fn main() {
	screen_width := 800
	screen_height := 450
	t := 'raylib [core] example - gamepad input'
	C.SetConfigFlags(u32(raylib.ConfigFlag.flag_msaa_4x_hint))
	C.InitWindow(screen_width, screen_height, t.str)
	C.SetTargetFPS(60)
	//
	tex_ps3 := C.LoadTexture('${os.dir(@FILE)}/res/ps3.png'.str)
	tex_xbox := C.LoadTexture('${os.dir(@FILE)}/res/xbox.png'.str)
	//
	left_stick_deadzone_x := 0.1
	left_stick_deadzone_y := 0.1
	right_stick_deadzone_x := 0.1
	right_stick_deadzone_y := 0.1
	left_trigger_deadzone := -0.9
	right_trigger_deadzone := -0.9
	mut gamepad := 0

	// Main game loop
	for C.WindowShouldClose() == false {
		//
		// Draw
		C.BeginDrawing()
		{
			C.ClearBackground(raylib.raywhite)
			//
			if C.IsKeyPressed(int(raylib.KeyboardKey.key_left)) {
				gamepad = math.max(gamepad - 1, 0)
			}
			if C.IsKeyPressed(int(raylib.KeyboardKey.key_right)) {
				gamepad++
			}
			//
			if C.IsGamepadAvailable(gamepad) == false {
				C.DrawText('GP${gamepad}: NOT DETECTED'.str, 10, 10, 10, raylib.gray)
				C.DrawTexture(tex_xbox, 0, 0, raylib.lightgray)
			} else {
				mut name := unsafe { cstring_to_vstring(C.GetGamepadName(gamepad)) }
				mut text := 'GP${gamepad}: ${name}'
				C.DrawText(text.str, 10, 10, 10, raylib.black)
				// Get axis values
				mut left_stick_x := C.GetGamepadAxisMovement(gamepad, int(raylib.GamepadAxis.gamepad_axis_left_x))
				mut left_stick_y := C.GetGamepadAxisMovement(gamepad, int(raylib.GamepadAxis.gamepad_axis_left_y))
				mut right_stick_x := C.GetGamepadAxisMovement(gamepad, int(raylib.GamepadAxis.gamepad_axis_right_x))
				mut right_stick_y := C.GetGamepadAxisMovement(gamepad, int(raylib.GamepadAxis.gamepad_axis_right_y))
				mut left_trigger := C.GetGamepadAxisMovement(gamepad, int(raylib.GamepadAxis.gamepad_axis_left_trigger))
				mut right_trigger := C.GetGamepadAxisMovement(gamepad, int(raylib.GamepadAxis.gamepad_axis_right_trigger))
				// Calculate deadzones
				if left_stick_x > -left_stick_deadzone_x && left_stick_x < left_stick_deadzone_x {
					left_stick_x = 0.0
				}
				if left_stick_y > -left_stick_deadzone_y && left_stick_y < left_stick_deadzone_y {
					left_stick_y = 0.0
				}
				if right_stick_x > -right_stick_deadzone_x && right_stick_x < right_stick_deadzone_x {
					right_stick_x = 0.0
				}
				if right_stick_y > -right_stick_deadzone_y && right_stick_y < right_stick_deadzone_y {
					right_stick_y = 0.0
				}
				if left_trigger < left_trigger_deadzone {
					left_trigger = -1.0
				}
				if right_trigger < right_trigger_deadzone {
					right_trigger = -1.0
				}
				//
				if name.to_lower().starts_with('xbox') {
					C.DrawTexture(tex_xbox, 0, 0, raylib.darkgray)
					// Draw buttons: xbox home
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_middle)) {
						C.DrawCircle(394, 89, 19, raylib.red)
					}
					// Draw buttons: basic
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_middle_right)) {
						C.DrawCircle(436, 150, 9, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_middle_left)) {
						C.DrawCircle(352, 150, 9, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_face_left)) {
						C.DrawCircle(501, 151, 15, raylib.blue)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_face_down)) {
						C.DrawCircle(536, 187, 15, raylib.lime)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_face_right)) {
						C.DrawCircle(572, 151, 15, raylib.maroon)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_face_up)) {
						C.DrawCircle(536, 115, 15, raylib.gold)
					}
					// Draw buttons: d-pad
					C.DrawRectangle(317, 202, 19, 71, raylib.black)
					C.DrawRectangle(293, 228, 69, 19, raylib.black)
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_face_up)) {
						C.DrawRectangle(317, 202, 19, 26, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_face_down)) {
						C.DrawRectangle(317, 202 + 45, 19, 26, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_face_left)) {
						C.DrawRectangle(292, 228, 25, 19, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_face_right)) {
						C.DrawRectangle(292 + 44, 228, 26, 19, raylib.red)
					}
					// Draw buttons: left-right back
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_trigger_1)) {
						C.DrawCircle(259, 61, 20, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_trigger_1)) {
						C.DrawCircle(536, 61, 20, raylib.red)
					}
					// Draw buttons: left-right back
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_trigger_1)) {
						C.DrawCircle(259, 61, 20, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_trigger_1)) {
						C.DrawCircle(536, 61, 20, raylib.red)
					}
					// Draw axis: left joystick
					mut left_gamepad_color := raylib.black
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_thumb)) {
						left_gamepad_color = raylib.red
					}
					C.DrawCircle(259, 152, 39, raylib.black)
					C.DrawCircle(259, 152, 34, raylib.lightgray)
					mut circle := raylib.Vector2{
						x: 259 + int(left_stick_x * 20)
						y: 152 + int(left_stick_y * 20)
					}
					C.DrawCircle(circle.x, circle.y, 25, left_gamepad_color)
					// Draw axis: right joystick
					mut right_gamepad_color := raylib.black
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_thumb)) {
						right_gamepad_color = raylib.red
					}
					C.DrawCircle(461, 237, 38, raylib.black)
					C.DrawCircle(461, 237, 33, raylib.lightgray)
					circle = raylib.Vector2{
						x: 461 + int(right_stick_x * 20)
						y: 237 + int(right_stick_y * 20)
					}
					C.DrawCircle(circle.x, circle.y, 25, right_gamepad_color)
					// Draw axis: left-right triggers
					C.DrawRectangle(170, 30, 15, 70, raylib.gray)
					C.DrawRectangle(604, 30, 15, 70, raylib.gray)
					C.DrawRectangle(170, 30, 15, int(((1 + left_trigger) / 2) * 70), raylib.red)
					C.DrawRectangle(604, 30, 15, int(((1 + right_trigger) / 2) * 70),
						raylib.red)
					//
					mut mov := C.GetGamepadAxisMovement(gamepad, int(raylib.GamepadAxis.gamepad_axis_left_trigger))
					text = 'Xbox axis LT: ${mov:.2}'
					C.DrawText(text.str, 10, 40, 10, raylib.black)
					mov = C.GetGamepadAxisMovement(gamepad, int(raylib.GamepadAxis.gamepad_axis_right_trigger))
					text = 'Xbox axis RT: ${mov:.2}'
					C.DrawText(text.str, 10, 60, 10, raylib.black)
				} else if name.to_lower().starts_with('playstation') {
					C.DrawTexture(tex_ps3, 0, 0, raylib.darkgray)
					// Draw buttons: ps
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_middle)) {
						C.DrawCircle(396, 222, 13, raylib.red)
					}
					// Draw buttons: basic
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_middle_left)) {
						C.DrawRectangle(328, 170, 32, 13, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_middle_right)) {
						C.DrawTriangle(raylib.Vector2{436, 168}, raylib.Vector2{436, 185},
							raylib.Vector2{464, 177}, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_face_up)) {
						C.DrawCircle(557, 144, 13, raylib.lime)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_face_right)) {
						C.DrawCircle(586, 173, 13, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_face_down)) {
						C.DrawCircle(557, 203, 13, raylib.violet)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_face_left)) {
						C.DrawCircle(527, 173, 13, raylib.pink)
					}
					// Draw buttons: d-pad
					C.DrawRectangle(225, 132, 24, 84, raylib.black)
					C.DrawRectangle(195, 161, 84, 25, raylib.black)
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_face_up)) {
						C.DrawRectangle(225, 132, 24, 29, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_face_down)) {
						C.DrawRectangle(225, 132 + 54, 24, 30, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_face_left)) {
						C.DrawRectangle(195, 161, 30, 25, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_face_right)) {
						C.DrawRectangle(195 + 54, 161, 30, 25, raylib.red)
					}
					// Draw buttons: left-right back buttons
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_trigger_1)) {
						C.DrawCircle(239, 82, 20, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_trigger_1)) {
						C.DrawCircle(557, 82, 20, raylib.red)
					}
					// Draw axis: left joystick
					mut left_gamepad_color := raylib.black
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_thumb)) {
						left_gamepad_color = raylib.red
					}
					C.DrawCircle(319, 255, 35, raylib.black)
					C.DrawCircle(319, 255, 31, raylib.lightgray)
					mut circle := raylib.Vector2{
						x: 319 + int(left_stick_x * 20)
						y: 255 + int(left_stick_y * 20)
					}
					C.DrawCircle(circle.x, circle.y, 25, left_gamepad_color)
					// Draw axis: right joystick
					mut right_gamepad_color := raylib.black
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_thumb)) {
						right_gamepad_color = raylib.red
					}
					C.DrawCircle(475, 255, 35, raylib.black)
					C.DrawCircle(475, 255, 31, raylib.lightgray)
					circle = raylib.Vector2{
						x: 475 + int(right_stick_x * 20)
						y: 255 + int(right_stick_y * 20)
					}
					C.DrawCircle(circle.x, circle.y, 25, right_gamepad_color)
					// Draw axis: left-right triggers
					C.DrawRectangle(169, 48, 15, 70, raylib.gray)
					C.DrawRectangle(611, 48, 15, 70, raylib.gray)
					C.DrawRectangle(169, 48, 15, int(((1 + left_trigger) / 2) * 70), raylib.red)
					C.DrawRectangle(611, 48, 15, int(((1 + right_trigger) / 2) * 70),
						raylib.red)
				} else {
					// Draw background: generic
					mut rect := raylib.Rectangle{175, 110, 460, 220}
					C.DrawRectangleRounded(rect, 0.3, 0.0, raylib.darkgray)
					// Draw buttons: basic
					C.DrawCircle(365, 170, 12, raylib.raywhite)
					C.DrawCircle(405, 170, 12, raylib.raywhite)
					C.DrawCircle(445, 170, 12, raylib.raywhite)
					C.DrawCircle(516, 191, 17, raylib.raywhite)
					C.DrawCircle(551, 227, 17, raylib.raywhite)
					C.DrawCircle(587, 191, 17, raylib.raywhite)
					C.DrawCircle(551, 155, 17, raylib.raywhite)
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_middle_left)) {
						C.DrawCircle(365, 170, 10, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_middle)) {
						C.DrawCircle(405, 170, 10, raylib.green)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_middle_right)) {
						C.DrawCircle(445, 170, 10, raylib.blue)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_face_left)) {
						C.DrawCircle(516, 191, 15, raylib.gold)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_face_down)) {
						C.DrawCircle(551, 227, 15, raylib.blue)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_face_right)) {
						C.DrawCircle(587, 191, 15, raylib.green)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_face_up)) {
						C.DrawCircle(551, 155, 15, raylib.red)
					}
					// Draw buttons: d-pad
					C.DrawRectangle(245, 145, 28, 88, raylib.raywhite)
					C.DrawRectangle(215, 174, 88, 29, raylib.raywhite)
					C.DrawRectangle(247, 147, 24, 84, raylib.black)
					C.DrawRectangle(217, 176, 84, 25, raylib.black)
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_face_up)) {
						C.DrawRectangle(247, 147, 24, 29, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_face_down)) {
						C.DrawRectangle(247, 147 + 54, 24, 30, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_face_left)) {
						C.DrawRectangle(217, 176, 30, 25, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_face_right)) {
						C.DrawRectangle(217 + 54, 176, 30, 25, raylib.red)
					}
					// Draw buttons: left-right back
					rect = raylib.Rectangle{215, 98, 100, 10}
					C.DrawRectangleRounded(rect, 0.5, 0.0, raylib.darkgray)
					rect = raylib.Rectangle{495, 98, 100, 10}
					C.DrawRectangleRounded(rect, 0.5, 0.0, raylib.darkgray)
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_trigger_1)) {
						rect = raylib.Rectangle{215, 98, 100, 10}
						C.DrawRectangleRounded(rect, 0.5, 0.0, raylib.red)
					}
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_trigger_1)) {
						rect = raylib.Rectangle{495, 98, 100, 10}
						C.DrawRectangleRounded(rect, 0.5, 0.0, raylib.red)
					}
					// Draw axis: left joystick
					mut left_gamepad_color := raylib.black
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_left_thumb)) {
						left_gamepad_color = raylib.red
					}
					C.DrawCircle(345, 260, 40, raylib.black)
					C.DrawCircle(345, 260, 35, raylib.lightgray)
					mut circle := raylib.Vector2{
						x: 345 + int(left_stick_x * 20)
						y: 260 + int(left_stick_y * 20)
					}
					C.DrawCircle(circle.x, circle.y, 25, left_gamepad_color)
					// Draw axis: right joystick
					mut right_gamepad_color := raylib.black
					if C.IsGamepadButtonDown(gamepad, int(raylib.GamepadButton.gamepad_button_right_thumb)) {
						right_gamepad_color = raylib.red
					}
					C.DrawCircle(465, 260, 40, raylib.black)
					C.DrawCircle(465, 260, 35, raylib.lightgray)
					circle = raylib.Vector2{
						x: 465 + int(right_stick_x * 20)
						y: 260 + int(right_stick_y * 20)
					}
					C.DrawCircle(circle.x, circle.y, 25, right_gamepad_color)
					// Draw axis: left-right triggers
					C.DrawRectangle(151, 110, 15, 70, raylib.gray)
					C.DrawRectangle(644, 110, 15, 70, raylib.gray)
					C.DrawRectangle(151, 110, 15, int(((1 + left_trigger) / 2) * 70),
						raylib.red)
					C.DrawRectangle(644, 110, 15, int(((1 + right_trigger) / 2) * 70),
						raylib.red)
				}
			}

			count := C.GetGamepadAxisCount(0)
			mut text := 'DETECTED AXIS [${count}]:'
			C.DrawText(text.str, 10, 50, 10, raylib.maroon)

			for idx in 0 .. count {
				mov := C.GetGamepadAxisMovement(0, idx)
				text = 'AXIS ${idx}: ${mov:.2}'
				C.DrawText(text.str, 20, 70 + 20 * idx, 10, raylib.darkgray)
			}

			if C.GetGamepadButtonPressed() != int(raylib.GamepadButton.gamepad_button_unknown) {
				text = 'DETECTED BUTTON: ${C.GetGamepadButtonPressed()}'
				C.DrawText(text.str, 10, 430, 10, raylib.red)
			} else {
				text = 'DETECTED BUTTON: NONE'
				C.DrawText(text.str, 10, 430, 10, raylib.gray)
			}
		}
		C.EndDrawing()
	}
	// De-Initialization
	//--------------------------------------------------------------------------------------
	C.UnloadTexture(tex_ps3)
	C.UnloadTexture(tex_xbox)
	//
	C.CloseWindow()
}

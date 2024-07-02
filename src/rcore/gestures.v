module rcore

enum Gesture {
	gesture_none        = 0
	gesture_tap         = 1
	gesture_doubletap   = 2
	gesture_hold        = 4
	gesture_drag        = 8
	gesture_swipe_right = 16
	gesture_swipe_left  = 32
	gesture_swipe_up    = 64
	gesture_swipe_down  = 128
	gesture_pinch_in    = 256
	gesture_pinch_out   = 512
}

module rshapes

@[typedef]
struct C.Rectangle {
	x      f32
	y      f32
	width  f32
	height f32
}

type CRectangle = C.Rectangle

module rcore

import rmath

@[typedef]
struct C.Camera2D {
	offset   rmath.CVector2
	target   rmath.CVector2
	rotation f32
	zoom     f32
}

type CCamera2D = C.Camera2D

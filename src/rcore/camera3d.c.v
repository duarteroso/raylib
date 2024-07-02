module rcode

import rmath

@[typedef]
struct C.Camera3D {
	position   rmath.CVector3
	target     rmath.CVector3
	up         rmath.CVector3
	fovy       f32
	projection int
}

type CCamera3D = C.Camera3D

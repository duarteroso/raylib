module rmodels

import rmath

@[typedef]
struct C.RayCollision {
	hit      bool
	distance f32
	point    rmath.CVector3
	normal   rmath.CVector3
}

type CRayCollision = C.RayCollision

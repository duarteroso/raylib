module rmodels

import rmath

@[typedef]
struct C.BoundingBox {
	min rmath.CVector3
	max rmath.CVector3
}

type CBoundingBox = C.BoundingBox

module rcore

import rmath

@[typedef]
struct C.Ray {
	position  rmath.CVector3
	direction rmath.CVector3
}

type CRay = C.Ray

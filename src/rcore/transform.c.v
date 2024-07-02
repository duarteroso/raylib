module rcore

import rmath

@[typedef]
struct C.Transform {
	translation rmath.CVector3
	rotation    rmath.CQuaternion
	scale       rmath.CVector3
}

type CTransform = C.Transform

module rmodels

import rcore
import rmath

@[typedef]
struct C.Model {
	transform     rmath.CMatrix
	meshCount     int
	materialCount int
	meshes        &CMesh
	materials     &CMaterial
	meshMaterial  &int
	boneCount     int
	bones         &CBoneInfo
	bindPose      &rcore.CTransform
}

type CModel = C.Model

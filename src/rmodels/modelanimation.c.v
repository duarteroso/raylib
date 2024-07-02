module rmodels

import rcore

@[typedef]
struct C.ModelAnimation {
	boneCount  int
	frameCount int
	bones      &CBoneInfo
	framePoses &&rcore.CTransform
	name       &char
}

type CModelAnimation = C.ModelAnimation

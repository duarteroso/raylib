module rcore

import rmath

@[typedef]
struct C.VrStereoConfig {
	projection        [2]rmath.CMatrix
	viewOffset        [2]rmath.CMatrix
	leftLensCenter    [2]f32
	rightLensCenter   [2]f32
	leftScreenCenter  [2]f32
	rightScreenCenter [2]f32
	scale             [2]f32
	scanein           [2]f32
}

type CVrStereoConfig = C.VrStereoConfig

module rmodels

import rcore

@[typedef]
struct C.Material {
	shader rcore.CShader
	maps   &CMaterialMap
	params [4]f32
}

type CMaterial = C.Material

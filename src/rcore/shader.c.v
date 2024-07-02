module rcore

@[typedef]
struct C.Shader {
	id   u32
	locs &int
}

type CShader = C.Shader

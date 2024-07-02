module rmodels

@[typedef]
struct C.Mesh {
	vertexCount   int
	triangleCount int
	// Vertex attributes data
	vertices   &f32
	texcoords  &f32
	texcoords2 &f32
	normals    &f32
	tangents   &f32
	colors     &u8
	indices    &u8
	// Animation vertex data
	animVertices &f32
	animNormals  &f32
	bonesIds     &u8
	boneWeights  &f32
	// OpenGL identifiers
	vaoId u32
	vboId &u32
}

type CMesh = C.Mesh

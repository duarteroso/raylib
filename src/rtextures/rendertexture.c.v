module rtextures

@[typedef]
struct C.RenderTexture {
	id      u32
	texture CTexture
	depth   CTexture
}

type CRenderTexture = C.RenderTexture

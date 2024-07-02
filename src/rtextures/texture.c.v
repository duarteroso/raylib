module rtextures

@[typedef]
struct C.Texture {
	id      u32
	width   int
	height  int
	mipmaps int
	format  int
}

type CTexture = C.Texture

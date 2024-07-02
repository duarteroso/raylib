module rtextures

@[typedef]
struct C.Image {
	data    voidptr
	width   int
	height  int
	mipmaps int
	format  int
}

type CImage = C.Image

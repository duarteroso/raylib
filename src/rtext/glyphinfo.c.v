module rtext

import rtextures

@[typedef]
struct C.GlyphInfo {
	value    int
	offsetX  int
	offsetY  int
	advanceX int
	image    rtextures.CImage
}

type CGlyphInfo = C.GlyphInfo

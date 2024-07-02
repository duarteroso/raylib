module rtext

import rtextures

@[typedef]
struct C.Font {
	baseSize     int
	glyphCount   int
	glyphPadding int
	texture      &rtextures.CTexture2D
	glyphs       &CGlyphInfo
}

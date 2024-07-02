module rmodels

import rcore
import rtextures

@[typedef]
struct C.MaterialMap {
	texture rtextures.CTexture2D
	color   rcore.CColor
	value   f32
}

type CMaterialMap = C.MaterialMap

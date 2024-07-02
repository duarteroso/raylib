module rtextures

import rshapes

@[typedef]
struct C.NPathInfo {
	source rshapes.CRectangle
	left   int
	top    int
	right  int
	bottom int
	layout int
}

type CNPathInfo = C.NPathInfo

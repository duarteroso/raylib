module rmath

@[typedef]
struct C.Matrix {
pub:
	// Matrix first row
	m0  f32
	m4  f32
	m8  f32
	m12 f32
	// Matrix second row
	m1  f32
	m5  f32
	m9  f32
	m13 f32
	// Matrix third row
	m2  f32
	m6  f32
	m10 f32
	m14 f32
	// Matrix fourth row
	m3  f32
	m7  f32
	m11 f32
	m15 f32
}

type CMatrix = C.Matrix

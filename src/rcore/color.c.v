module rcore

@[typedef]
struct C.Color {
	r u8
	g u8
	b u8
	a u8
}

type CColor = C.Color

module raudio

@[typedef]
struct C.Music {
	stream     CAudioStream
	frameCount u32
	looping    bool
	ctxType    int
	ctxData    voidptr
}

type CMusic = C.Music

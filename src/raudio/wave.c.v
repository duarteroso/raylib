module raudio

@[typedef]
struct C.Wave {
	frameCount u32
	sampleRate u32
	samplesize u32
	channels   u32
	data       voidptr
}

type CWave = C.Wave

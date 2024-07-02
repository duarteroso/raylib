module raudio

@[typedef]
struct C.Sound {
	stream     CAudioStream
	frameCount u32
}

type CSound = C.Sound

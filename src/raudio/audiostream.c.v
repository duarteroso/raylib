module raudio

@[typedef]
struct C.AudioStream {
	buffer     &CrAudioBuffer
	processor  &CrAudioProcessor
	sampleRate u32
	sampleSize u32
	channels   u32
}

type CAudioStream = C.AudioStream

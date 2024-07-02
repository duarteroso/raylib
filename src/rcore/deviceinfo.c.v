module rcore

@[typedef]
struct C.VrDeviceInfo {
	hResolution            int
	vResolution            int
	hScreenSize            f32
	vScreenSize            f32
	vScreenCenter          f32
	eyeToScreenDistance    f32
	lensSeparationdistance f32
	interpupillaryDistance f32
	lesnDistortionValues   [4]f32
	chromaAbCorrection     [4]f32
}

type CVrDeviceInfo = C.VrDeviceInfo

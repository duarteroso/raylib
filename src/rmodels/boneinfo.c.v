module rmodels

@[typedef]
struct C.BoneInfo {
	name   &char
	parent int
}

type CBoneInfo = C.BoneInfo

module rcore

@[typedef]
struct C.FilePathList {
	capacity u32
	count    u32
	paths    &&char
}

type CFilePathList = C.FilePathList

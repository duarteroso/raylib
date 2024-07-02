module rcore

// type FnTraceLogCallback = fn ( logLevel int, text &char, va_list args)
type FnLoadFileDataCallback = fn (fileName &char, dataSize &int) &u8

type FnSaveFileDataCallback = fn (fileName &char, data voidptr, dataSize int) bool

type FnLoadFileTextCallback = fn (fileName &char) &char

type FnSaveFileTextCallback = fn (fileName &char, text &char) bool

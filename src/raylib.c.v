module raylib

pub const raylib_version_major = 5
pub const raylib_version_minor = 0
pub const raylib_version_patch = 0
pub const raylib_version = '5.0'

//----------------------------------------------------------------------------------
// Some basic Defines
//----------------------------------------------------------------------------------
pub const pi = 3.14159265358979323846
pub const deg2grad = pi / 180.0
pub const rad2deg = 180.0 / pi

// Some Basic Colors
// NOTE: Custom raylib color palette for amazing visuals on WHITE background

// Light Gray
pub const lightgray = Color{200, 200, 200, 255}
// Gray
pub const gray = Color{130, 130, 130, 255}
// Dark Gray
pub const darkgray = Color{80, 80, 80, 255}
// Yellow
pub const yellow = Color{253, 249, 0, 255}
// Gold
pub const gold = Color{255, 203, 0, 255}
// Orange
pub const orange = Color{255, 161, 0, 255}
// Pink
pub const pink = Color{255, 109, 194, 255}
// Red
pub const red = Color{230, 41, 55, 255}
// Maroon
pub const maroon = Color{190, 33, 55, 255}
// Green
pub const green = Color{0, 228, 48, 255}
// Lime
pub const lime = Color{0, 158, 47, 255}
// Dark Green
pub const darkgreen = Color{0, 117, 44, 255}
// Sky Blue
pub const skyblue = Color{102, 191, 255, 255}
// Blue
pub const blue = Color{0, 121, 241, 255}
// Dark Blue
pub const darkblue = Color{0, 82, 172, 255}
// Purple
pub const purple = Color{200, 122, 255, 255}
// Violet
pub const violet = Color{135, 60, 190, 255}
// Dark Purple
pub const darkpurple = Color{112, 31, 126, 255}
// Beige
pub const beige = Color{211, 176, 131, 255}
// Brown
pub const brown = Color{127, 106, 79, 255}
// Dark Brown
pub const darkbrown = Color{76, 63, 47, 255}

// White
pub const white = Color{255, 255, 255, 255}
// Black
pub const black = Color{0, 0, 0, 255}
// Blank (Transparent)
pub const blank = Color{0, 0, 0, 0}
// Magenta
pub const magenta = Color{255, 0, 255, 255}
// My own White (raylib logo)
pub const raywhite = Color{245, 245, 245, 255}

//----------------------------------------------------------------------------------
// Structures Definition
//----------------------------------------------------------------------------------

@[typedef]
pub struct C.Vector2 {
pub mut:
	// Vector x component
	x f32
	// Vector y component
	y f32
}

// Vector2, 2 components
pub type Vector2 = C.Vector2

@[typedef]
pub struct C.Vector3 {
pub mut:
	// Vector x component
	x f32
	// Vector y component
	y f32
	// Vector z component
	z f32
}

// Vector3, 3 components
pub type Vector3 = C.Vector3

@[typedef]
pub struct C.Vector4 {
pub mut:
	// Vector x component
	x f32
	// Vector y component
	y f32
	// Vector z component
	z f32
	// Vector w component
	w f32
}

// Vector4, 4 components
pub type Vector4 = C.Vector4

// Quaternion, 4 components (Vector4 alias)
pub type Quaternion = C.Vector4

@[typedef]
pub struct C.Matrix {
pub mut:
	// Matrix first row
	m0 f32
	// Matrix first row
	m4 f32
	// Matrix first row
	m8 f32
	// Matrix first row
	m12 f32

	// Matrix second row
	m1 f32
	// Matrix second row
	m5 f32
	// Matrix second row
	m9 f32
	// Matrix second row
	m13 f32

	// Matrix third row
	m2 f32
	// Matrix third row
	m6 f32
	// Matrix third row
	m10 f32
	// Matrix third row
	m14 f32

	// Matrix fourth row
	m3 f32
	// Matrix fourth row
	m7 f32
	// Matrix fourth row
	m11 f32
	// Matrix fourth row
	m15 f32
}

// Matrix, 4x4 components, column major, OpenGL style, right-handed
pub type Matrix = C.Matrix

@[typedef]
pub struct C.Color {
pub mut:
	// Color red value
	r u8
	// Color green value
	g u8
	// Color blue value
	b u8
	// Color alpha value
	a u8
}

// Color, 4 components, R8G8B8A8 (32bit)
pub type Color = C.Color

@[typedef]
pub struct C.Rectangle {
pub mut:
	// Rectangle top-left corner position x
	x f32
	// Rectangle top-left corner position y
	y f32
	// Rectangle width
	width f32
	// Rectangle height
	height f32
}

// Rectangle, 4 components
pub type Rectangle = C.Rectangle

@[typedef]
pub struct C.Image {
pub mut:
	// Image raw data
	data voidptr
	// Image base width
	width int
	// Image base height
	height int
	// Mipmap levels, 1 by default
	mipmaps int
	// Data format (PixelFormat type)
	format int
}

// Image, pixel data stored in CPU memory (RAM)
pub type Image = C.Image

@[typedef]
pub struct C.Texture {
pub mut:
	// OpenGL texture id
	id u32
	// Texture base width
	width int
	// Texture base height
	height int
	// Mipmap levels, 1 by default
	mipmaps int
	// Data format (PixelFormat type)
	format int
}

// Texture, tex data stored in GPU memory (VRAM)
pub type Texture = C.Texture

// Texture2D, same as Texture
pub type Texture2D = C.Texture

// TextureCubemap, same as Texture
pub type TextureCubemap = C.Texture

@[typedef]
pub struct C.RenderTexture {
pub mut:
	// OpenGL framebuffer object id
	id u32
	// Color buffer attachment texture
	texture Texture
	// Depth buffer attachment texture
	depth Texture
}

// RenderTexture, fbo for texture rendering
pub type RenderTexture = C.RenderTexture

// RenderTexture2D, same as RenderTexture
pub type RenderTexture2D = C.RenderTexture

@[typedef]
pub struct C.NPatchInfo {
pub mut:
	// Texture source rectangle
	source Rectangle
	// Left border offset
	left int
	// Top border offset
	top int
	// Right border offset
	right int
	// Bottom border offset
	bottom int
	// Layout of the n-patch: 3x3, 1x3 or 3x1
	layout int
}

// NPatchInfo, n-patch layout info
pub type NPatchInfo = C.NPatchInfo

@[typedef]
pub struct C.GlyphInfo {
pub mut:
	// Character value (Unicode)
	value int
	// Character offset X when drawing
	offsetX int
	// Character offset Y when drawing
	offsetY int
	// Character advance position X
	advanceX int
	// Character image data
	image Image
}

// GlyphInfo, font characters glyphs info
pub type GlyphInfo = C.GlyphInfo

@[typedef]
pub struct C.Font {
pub mut:
	// Base size (default chars height)
	baseSize int
	// Number of glyph characters
	glyphCount int
	// Padding around the glyph characters
	glyphPadding int
	// Texture atlas containing the glyphs
	texture &Texture2D
	// Rectangles in texture for the glyphs
	recs &Rectangle
	// Glyphs info data
	glyphs &GlyphInfo
}

// Font, font texture and GlyphInfo array data
pub type Font = C.Font

@[typedef]
pub struct C.Camera3D {
pub mut:
	// Camera position
	position Vector3
	// Camera target it looks-at
	target Vector3
	// Camera up vector (rotation over its axis)
	up Vector3
	// Camera field-of-view aperture in Y (degrees) in perspective, used as near plane width in orthographic
	fovy f32
	// Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
	projection int
}

// Camera, defines position/orientation in 3d space
pub type Camera3D = C.Camera3D

// Camera pub type fallback, defaults to Camera3D
pub type Camera = C.Camera3D

@[typedef]
pub struct C.Camera2D {
pub mut:
	// Camera offset (displacement from target)
	offset Vector2
	// Camera target (rotation and zoom origin)
	target Vector2
	// Camera rotation in degrees
	rotation f32
	// Camera zoom (scaling), should be 1.0f by default
	zoom f32
}

// Camera2D, defines position/orientation in 2d space
pub type Camera2D = C.Camera2D

@[typedef]
pub struct C.Mesh {
pub mut:
	// Number of vertices stored in arrays
	vertexCount int
	// Number of triangles stored (indexed or not)
	triangleCount int

	// Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
	vertices &f32
	// Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
	texcoords &f32
	// Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
	texcoords2 &f32
	// Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
	normals &f32
	// Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
	tangents &f32
	// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
	colors &u8
	// Vertex indices (in case vertex data comes indexed)
	indices &u8

	// Animated vertex positions (after bones transformations)
	animVertices &f32
	// Animated normals (after bones transformations)
	animNormals &f32
	// Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning)
	bonesIds &u8
	// Vertex bone weight, up to 4 bones influence by vertex (skinning)
	boneWeights &f32

	// OpenGL Vertex Array Object id
	vaoId u32
	// OpenGL Vertex Buffer Objects id (default vertex data)
	vboId &u32
}

// Mesh, vertex data and vao/vbo
pub type Mesh = C.Mesh

@[typedef]
pub struct C.Shader {
pub mut:
	// Shader program id
	id u32
	// Shader locations array (RL_MAX_SHADER_LOCATIONS)
	locs &int
}

// Shader
pub type Shader = C.Shader

@[typedef]
pub struct C.MaterialMap {
pub mut:
	// Material map texture
	texture Texture2D
	// Material map color
	color Color
	// Material map value
	value f32
}

// MaterialMap
pub type MaterialMap = C.MaterialMap

@[typedef]
pub struct C.Material {
pub mut:
	// Material shader
	shader Shader
	// Material maps array (MAX_MATERIAL_MAPS)
	maps &MaterialMap
	// Material generic parameters (if required)
	params [4]f32
}

// Material, includes shader and maps
pub type Material = C.Material

@[typedef]
pub struct C.Transform {
pub mut:
	// Translation
	translation Vector3
	// Rotation
	rotation Quaternion
	// Scale
	scale Vector3
}

// Transform, vertex transformation data
pub type Transform = C.Transform

@[typedef]
pub struct C.BoneInfo {
pub mut:
	// Bone name
	name &char
	// Bone parent
	parent int
}

// Bone, skeletal animation bone
pub type BoneInfo = C.BoneInfo

@[typedef]
pub struct C.Model {
pub mut:
	// Local transform matrix
	transform Matrix
	// Number of meshes
	meshCount int
	// Number of materials
	materialCount int
	// Meshes array
	meshes &Mesh
	// Materials array
	materials &Material
	// Mesh material number
	meshMaterial &int
	// Number of bones
	boneCount int
	// Bones information (skeleton)
	bones &BoneInfo
	// Bones base transformation (pose)
	bindPose &Transform
}

// Model, meshes, materials and animation data
pub type Model = C.Model

@[typedef]
pub struct C.ModelAnimation {
pub mut:
	// Number of bones
	boneCount int
	// Number of animation frames
	frameCount int
	// Bones information (skeleton)
	bones &BoneInfo
	// Poses array by frame
	framePoses &&Transform
	// Animation name
	name &char
}

// ModelAnimation
pub type ModelAnimation = C.ModelAnimation

@[typedef]
pub struct C.Ray {
pub mut:
	// Ray position (origin)
	position Vector3
	// Ray direction
	direction Vector3
}

// Ray, ray for raycasting
pub type Ray = C.Ray

@[typedef]
pub struct C.RayCollision {
pub mut:
	// Did the ray hit something?
	hit bool
	// Distance to the nearest hit
	distance f32
	// Point of the nearest hit
	point Vector3
	// Surface normal of hit
	normal Vector3
}

// RayCollision, ray hit information
pub type RayCollision = C.RayCollision

@[typedef]
pub struct C.BoundingBox {
pub mut:
	// Minimum vertex box-corner
	min Vector3
	// Maximum vertex box-corner
	max Vector3
}

// BoundingBox
pub type BoundingBox = C.BoundingBox

@[typedef]
pub struct C.Wave {
pub mut:
	// Total number of frames (considering channels)
	frameCount u32
	// Frequency (samples per second)
	sampleRate u32
	// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
	samplesize u32
	// Number of channels (1-mono, 2-stereo, ...)
	channels u32
	// Buffer data pointer
	data voidptr
}

// Wave, audio wave data
pub type Wave = C.Wave

@[typedef]
pub struct C.rAudioBuffer {
}

// Opaque structs declaration
// NOTE: Actual structs are defined internally in raudio module
pub type RAudioBuffer = C.rAudioBuffer

@[typedef]
pub struct C.rAudioProcessor {
}

// Opaque structs declaration
// NOTE: Actual structs are defined internally in raudio module
pub type RAudioProcessor = C.rAudioProcessor

@[typedef]
pub struct C.AudioStream {
pub mut:
	// Pointer to internal data used by the audio system
	buffer &RAudioBuffer
	// Pointer to internal data processor, useful for audio effects
	processor &RAudioProcessor
	// Frequency (samples per second)
	sampleRate u32
	// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
	sampleSize u32
	// Number of channels (1-mono, 2-stereo, ...)
	channels u32
}

// AudioStream, custom audio stream
pub type AudioStream = C.AudioStream

@[typedef]
pub struct C.Sound {
pub mut:
	// Audio stream
	stream AudioStream
	// Total number of frames (considering channels)
	frameCount u32
}

// Sound
pub type Sound = C.Sound

@[typedef]
pub struct C.Music {
pub mut:
	// Audio stream
	stream AudioStream
	// Total number of frames (considering channels)
	frameCount u32
	// Music looping enable
	looping bool
	// pub type of music context (audio filetype)
	ctxType int
	// Audio context data, depends on type
	ctxData voidptr
}

// Music, audio stream, anything longer than ~10 seconds should be streamed
pub type Music = C.Music

@[typedef]
pub struct C.VrDeviceInfo {
pub mut:
	// Horizontal resolution in pixels
	hResolution int
	// Vertical resolution in pixels
	vResolution int
	// Horizontal size in meters
	hScreenSize f32
	// Vertical size in meters
	vScreenSize f32
	// Screen center in meters
	vScreenCenter f32
	// Distance between eye and display in meters
	eyeToScreenDistance f32
	// Lens separation distance in meters
	lensSeparationdistance f32
	// IPD (distance between pupils) in meters
	interpupillaryDistance f32
	// Lens distortion constant parameters
	lesnDistortionValues [4]f32
	// Chromatic aberration correction parameters
	chromaAbCorrection [4]f32
}

// VrDeviceInfo, Head-Mounted-Display device parameters
pub type VrDeviceInfo = C.VrDeviceInfo

@[typedef]
pub struct C.VrStereoConfig {
pub mut:
	// VR projection matrices (per eye)
	projection [2]Matrix
	// VR view offset matrices (per eye)
	viewOffset [2]Matrix
	// VR left lens center
	leftLensCenter [2]f32
	// VR right lens center
	rightLensCenter [2]f32
	// VR left screen center
	leftScreenCenter [2]f32
	// VR right screen center
	rightScreenCenter [2]f32
	// VR distortion scale
	scale [2]f32
	// VR distortion scale in
	scanein [2]f32
}

// VrStereoConfig, VR stereo rendering configuration for simulator
pub type VrStereoConfig = C.VrStereoConfig

@[typedef]
pub struct C.FilePathList {
pub mut:
	// Filepaths max entries
	capacity u32
	// Filepaths entries count
	count u32
	// Filepaths entries
	paths &&char
}

// File path list
pub type FilePathList = C.FilePathList

@[typedef]
pub struct C.AutomationEvent {
pub mut:
	// Event frame
	frame u32
	// Event type (AutomationEventType)
	type u32
	// Event parameters (if required)
	params [4]int
}

// Automation event
pub type AutomationEvent = C.AutomationEvent

@[typedef]
pub struct C.AutomationEventList {
pub mut:
	// Events max entries (MAX_AUTOMATION_EVENTS)
	capacity u32
	// Events entries count
	count u32
	// Events entries
	events &AutomationEvent
}

// Automation event list
pub type AutomationEventList = C.AutomationEventList

//----------------------------------------------------------------------------------
// Enumerators Definition
//----------------------------------------------------------------------------------

// System/Window config flags
// NOTE: Every bit registers one state (use it with bit masks)
// By default all flags are set to 0
pub enum ConfigFlag as u32 {
	// Set to try enabling V-Sync on GPU
	flag_vsync_hint = 0x00000040
	// Set to run program in fullscreen
	flag_fullscreen_mode = 0x00000002
	// Set to allow resizable window
	flag_window_resizable = 0x00000004
	// Set to disable window decoration (frame and buttons)
	flag_window_undecorated = 0x00000008
	// Set to hide window
	flag_window_hidden = 0x00000080
	// Set to minimize window (iconify)
	flag_window_minimized = 0x00000200
	// Set to maximize window (expanded to monitor)
	flag_window_maximized = 0x00000400
	// Set to window non focused
	flag_window_unfocused = 0x00000800
	// Set to window always on top
	flag_window_topmost = 0x00001000
	// Set to allow windows running while minimized
	flag_window_always_run = 0x00000100
	// Set to allow transparent framebuffer
	flag_window_transparent = 0x00000010
	// Set to support HighDPI
	flag_window_highdpi = 0x00002000
	// Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED
	flag_window_mouse_passthrough = 0x00004000
	// Set to run program in borderless windowed mode
	flag_borderless_windowed_mode = 0x00008000
	// Set to try enabling MSAA 4X
	flag_msaa_4x_hint = 0x00000020
	// Set to try enabling interlaced video format (for V3D)
	flag_interlaced_hint = 0x00010000
}

// Trace log level
// NOTE: Organized by priority level
pub enum TraceLogLevel {
	// Display all logs
	log_all = 0
	// Trace logging, intended for internal use only
	log_trace
	// Debug logging, used for internal debugging, it should be disabled on release builds
	log_debug
	// Info logging, used for program execution info
	log_info
	// Warning logging, used on recoverable failures
	log_warning
	// Error logging, used on unrecoverable failures
	log_error
	// Fatal logging, used to abort program: exit(EXIT_FAILURE)
	log_fatal
	// Disable logging
	log_none
}

// Keyboard keys (US keyboard layout)
// NOTE: Use GetKeyPressed() to allow redefining
// required keys for alternative layouts
pub enum KeyboardKey {
	// Key: NULL, used for no key pressed
	key_null = 0

	// Key: '
	key_apostrophe = 39
	// Key: ,
	key_comma = 44
	// Key: -
	key_minus = 45
	// Key: .
	key_period = 46
	// Key: /
	key_slash = 47
	// Key: 0
	key_zero = 48
	// Key: 1
	key_one = 49
	// Key: 2
	key_two = 50
	// Key: 3
	key_three = 51
	// Key: 4
	key_four = 52
	// Key: 5
	key_five = 53
	// Key: 6
	key_six = 54
	// Key: 7
	key_seven = 55
	// Key: 8
	key_eight = 56
	// Key: 9
	key_nine = 57
	// Key: ;
	key_semicolon = 59
	// Key: =
	key_equal = 61
	// Key: A | a
	key_a = 65
	// Key: B | b
	key_b = 66
	// Key: C | c
	key_c = 67
	// Key: D | d
	key_d = 68
	// Key: E | e
	key_e = 69
	// Key: F | f
	key_f = 70
	// Key: G | g
	key_g = 71
	// Key: H | h
	key_h = 72
	// Key: I | i
	key_i = 73
	// Key: J | j
	key_j = 74
	// Key: K | k
	key_k = 75
	// Key: L | l
	key_l = 76
	// Key: M | m
	key_m = 77
	// Key: N | n
	key_n = 78
	// Key: O | o
	key_o = 79
	// Key: P | p
	key_p = 80
	// Key: Q | q
	key_q = 81
	// Key: R | r
	key_r = 82
	// Key: S | s
	key_s = 83
	// Key: T | t
	key_t = 84
	// Key: U | u
	key_u = 85
	// Key: V | v
	key_v = 86
	// Key: W | w
	key_w = 87
	// Key: X | x
	key_x = 88
	// Key: Y | y
	key_y = 89
	// Key: Z | z
	key_z = 90
	// Key: [
	key_left_bracket = 91
	// Key: '\'
	key_backslash = 92
	// Key: ]
	key_right_bracket = 93
	// Key: `
	key_grave = 96

	// Key: Space
	key_space = 32
	// Key: Esc
	key_escape = 256
	// Key: Enter
	key_enter = 257
	// Key: Tab
	key_tab = 258
	// Key: Backspace
	key_backspace = 259
	// Key: Ins
	key_insert = 260
	// Key: Del
	key_delete = 261
	// Key: Cursor right
	key_right = 262
	// Key: Cursor left
	key_left = 263
	// Key: Cursor down
	key_down = 264
	// Key: Cursor up
	key_up = 265
	// Key: Page up
	key_page_up = 266
	// Key: Page down
	key_page_down = 267
	// Key: Home
	key_home = 268
	// Key: End
	key_end = 269
	// Key: Caps lock
	key_caps_lock = 280
	// Key: Scroll down
	key_scroll_lock = 281
	// Key: Num lock
	key_num_lock = 282
	// Key: Print screen
	key_print_screen = 283
	// Key: Pause
	key_pause = 284
	// Key: F1
	key_f1 = 290
	// Key: F2
	key_f2 = 291
	// Key: F3
	key_f3 = 292
	// Key: F4
	key_f4 = 293
	// Key: F5
	key_f5 = 294
	// Key: F6
	key_f6 = 295
	// Key: F7
	key_f7 = 296
	// Key: F8
	key_f8 = 297
	// Key: F9
	key_f9 = 298
	// Key: F10
	key_f10 = 299
	// Key: F11
	key_f11 = 300
	// Key: F12
	key_f12 = 301
	// Key: Shift left
	key_left_shift = 340
	// Key: Control left
	key_left_control = 341
	// Key: Alt left
	key_left_alt = 342
	// Key: Super left
	key_left_super = 343
	// Key: Shift right
	key_right_shift = 344
	// Key: Control right
	key_right_control = 345
	// Key: Alt right
	key_right_alt = 346
	// Key: Super right
	key_right_super = 347
	// Key: KB menu
	key_kb_menu = 348

	// Key: Keypad 0
	key_kp_0 = 320
	// Key: Keypad 1
	key_kp_1 = 321
	// Key: Keypad 2
	key_kp_2 = 322
	// Key: Keypad 3
	key_kp_3 = 323
	// Key: Keypad 4
	key_kp_4 = 324
	// Key: Keypad 5
	key_kp_5 = 325
	// Key: Keypad 6
	key_kp_6 = 326
	// Key: Keypad 7
	key_kp_7 = 327
	// Key: Keypad 8
	key_kp_8 = 328
	// Key: Keypad 9
	key_kp_9 = 329
	// Key: Keypad .
	key_kp_decimal = 330
	// Key: Keypad /
	key_kp_divide = 331
	// Key: Keypad *
	key_kp_multiply = 332
	// Key: Keypad -
	key_kp_subtract = 333
	// Key: Keypad +
	key_kp_add = 334
	// Key: Keypad Enter
	key_kp_enter = 335
	// Key: Keypad =
	key_kp_equal = 336
}

// android key buttons
pub enum AndroidKey {
	// Key: Android back button
	key_back = 4
	// Key: Android menu button
	key_menu = 82
	// Key: Android volume up button
	key_volume_up = 24
	// Key: Android volume down button
	key_volume_down = 25
}

pub const mouse_left_button = MouseButton.mouse_button_left
pub const mouse_right_button = MouseButton.mouse_button_right
pub const mouse_middle_button = MouseButton.mouse_button_middle

// Mouse buttons
pub enum MouseButton {
	// Mouse button left
	mouse_button_left = 0
	// Mouse button right
	mouse_button_right = 1
	// Mouse button middle (pressed wheel)
	mouse_button_middle = 2
	// Mouse button side (advanced mouse device)
	mouse_button_side = 3
	// Mouse button extra (advanced mouse device)
	mouse_button_extra = 4
	// Mouse button forward (advanced mouse device)
	mouse_button_forward = 5
	// Mouse button back (advanced mouse device)
	mouse_button_back = 6
}

// Mouse cursor
pub enum MouseCursor {
	// Default pointer shape
	mouse_cursor_default = 0
	// Arrow shape
	mouse_cursor_arrow = 1
	// Text writing cursor shape
	mouse_cursor_ibeam = 2
	// Cross shape
	mouse_cursor_crosshair = 3
	// Pointing hand cursor
	mouse_cursor_pointing_hand = 4
	// Horizontal resize/move arrow shape
	mouse_cursor_resize_ew = 5
	// Vertical resize/move arrow shape
	mouse_cursor_resize_ns = 6
	// Top-left to bottom-right diagonal resize/move arrow shape
	mouse_cursor_resize_nwse = 7
	// The top-right to bottom-left diagonal resize/move arrow shape
	mouse_cursor_resize_nesw = 8
	// The omnidirectional resize/move cursor shape
	mouse_cursor_resize_all = 9
	// The operation-not-allowed shape
	mouse_cursor_not_allowed = 10
}

// Gamepad buttons
pub enum GamepadButton {
	// Unknown button, just for error checking
	gamepad_button_unknown = 0
	// Gamepad left DPAD up button
	gamepad_button_left_face_u
	// Gamepad left DPAD right button	
	gamepad_button_left_face_right
	// Gamepad left DPAD down button	
	gamepad_button_left_face_down
	// Gamepad left DPAD left button	
	gamepad_button_left_face_left
	// Gamepad right button up (i.e. PS3: Triangle, Xbox: Y)	
	gamepad_button_right_face_up
	// Gamepad right button right (i.e. PS3: Square, Xbox: X)		
	gamepad_button_right_face_right
	// Gamepad right button down (i.e. PS3: Cross, Xbox: A)	
	gamepad_button_right_face_down
	// Gamepad right button left (i.e. PS3: Circle, Xbox: B)	
	gamepad_button_right_face_left
	// Gamepad top/back trigger left (first), it could be a trailing button	
	gamepad_button_left_trigger_1
	// Gamepad top/back trigger left (second), it could be a trailing button	
	gamepad_button_left_trigger_2
	// Gamepad top/back trigger right (one), it could be a trailing button	
	gamepad_button_right_trigger_1
	// Gamepad top/back trigger right (second), it could be a trailing button	
	gamepad_button_right_trigger_2
	// Gamepad center buttons, left one (i.e. PS3: Select)
	gamepad_button_middle_left
	// Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX)
	gamepad_button_middle
	// Gamepad center buttons, right one (i.e. PS3: Start)	
	gamepad_button_middle_right
	// Gamepad joystick pressed button left
	gamepad_button_left_thumb
	// Gamepad joystick pressed button right
	gamepad_button_right_thumb
}

// Gamepad axis
pub enum GamepadAxis {
	// Gamepad left stick X axis
	gamepad_axis_left_x = 0
	// Gamepad left stick Y axis
	gamepad_axis_left_y = 1
	// Gamepad right stick X axis
	gamepad_axis_right_x = 2
	// Gamepad right stick Y axis
	gamepad_axis_right_y = 3
	// Gamepad back trigger left, pressure level: [1..-1]
	gamepad_axis_left_trigger = 4
	// Gamepad back trigger right, pressure level: [1..-1]
	gamepad_axis_right_trigger = 5
}

// Material map index
pub enum MaterialMapIndex {
	// Albedo material (same as: MATERIAL_MAP_DIFFUSE)
	material_map_albedo = 0
	// Metalness material (same as: MATERIAL_MAP_SPECULAR)
	material_map_metalness
	// Normal material
	material_map_normal
	// Roughness material
	material_map_roughness
	// Ambient occlusion material
	material_map_occlusion
	// Emission material
	material_map_emission
	// Heightmap material
	material_map_height
	// Cubemap material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
	material_map_cubemap
	// Irradiance material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
	material_map_irradiance
	// Prefilter material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
	material_map_prefilter
	// Brdf material
	material_map_brdf
}

pub const material_map_diffuse = MaterialMapIndex.material_map_albedo
pub const material_map_specular = MaterialMapIndex.material_map_metalness

// Shader location index
pub enum ShaderLocationIndex {
	// Shader location: vertex attribute: position
	shader_loc_vertex_position = 0
	// Shader location: vertex attribute: texcoord01
	shader_loc_vertex_texcoord01
	// Shader location: vertex attribute: texcoord02
	shader_loc_vertex_texcoord02
	// Shader location: vertex attribute: normal
	shader_loc_vertex_normal
	// Shader location: vertex attribute: tangent
	shader_loc_vertex_tangent
	// Shader location: vertex attribute: color
	shader_loc_vertex_color
	// Shader location: matrix uniform: model-view-projection
	shader_loc_matrix_mvp
	// Shader location: matrix uniform: view (camera transform)
	shader_loc_matrix_view
	// Shader location: matrix uniform: projection
	shader_loc_matrix_projection
	// Shader location: matrix uniform: model (transform)
	shader_loc_matrix_model
	// Shader location: matrix uniform: normal
	shader_loc_matrix_normal
	// Shader location: vector uniform: view
	shader_loc_vector_view
	// Shader location: vector uniform: diffuse color
	shader_loc_color_diffuse
	// Shader location: vector uniform: specular color
	shader_loc_color_specular
	// Shader location: vector uniform: ambient color
	shader_loc_color_ambient
	// Shader location: sampler2d texture: albedo (same as: SHADER_LOC_MAP_DIFFUSE)
	shader_loc_map_albedo
	// Shader location: sampler2d texture: metalness (same as: SHADER_LOC_MAP_SPECULAR)
	shader_loc_map_metalness
	// Shader location: sampler2d texture: normal
	shader_loc_map_normal
	// Shader location: sampler2d texture: roughness
	shader_loc_map_roughness
	// Shader location: sampler2d texture: occlusion
	shader_loc_map_occlusion
	// Shader location: sampler2d texture: emission
	shader_loc_map_emission
	// Shader location: sampler2d texture: height
	shader_loc_map_height
	// Shader location: samplerCube texture: cubemap
	shader_loc_map_cubemap
	// Shader location: samplerCube texture: irradiance
	shader_loc_map_irradiance
	// Shader location: samplerCube texture: prefilter
	shader_loc_map_prefilter
	// Shader location: sampler2d texture: brdf
	shader_loc_map_brdf
}

pub const shader_loc_map_diffuse = ShaderLocationIndex.shader_loc_map_albedo
pub const shader_loc_map_specular = ShaderLocationIndex.shader_loc_map_metalness

// Shader uniform data type
pub enum ShaderUniformDataType {
	// Shader uniform type: float
	shader_uniform_float = 0
	// Shader uniform type: vec2 (2 float)
	shader_uniform_vec2
	// Shader uniform type: vec3 (3 float)
	shader_uniform_vec3
	// Shader uniform type: vec4 (4 float)
	shader_uniform_vec4
	// Shader uniform type: int
	shader_uniform_int
	// Shader uniform type: ivec2 (2 int)
	shader_uniform_ivec2
	// Shader uniform type: ivec3 (3 int)
	shader_uniform_ivec3
	// Shader uniform type: ivec4 (4 int)
	shader_uniform_ivec4
	// Shader uniform type: sampler2d
	shader_uniform_sampler2d
}

// Shader attribute data types
pub enum ShaderAttributeDataType {
	// Shader attribute type: float
	shader_attrib_float = 0
	// Shader attribute type: vec2 (2 float)
	shader_attrib_vec2
	// Shader attribute type: vec3 (3 float)
	shader_attrib_vec3
	// Shader attribute type: vec4 (4 float)
	shader_attrib_vec4
}

// Pixel formats
// NOTE: Support depends on OpenGL version and platform
pub enum PixelFormat {
	// 8 bit per pixel (no alpha)
	pixelformat_uncompressed_grayscale = 1
	// 8*2 bpp (2 channels)
	pixelformat_uncompressed_gray_alpha
	// 16 bpp
	pixelformat_uncompressed_r5g6b5
	// 24 bpp
	pixelformat_uncompressed_r8g8b8
	// 16 bpp (1 bit alpha)
	pixelformat_uncompressed_r5g5b5a1
	// 16 bpp (4 bit alpha)
	pixelformat_uncompressed_r4g4b4a4
	// 32 bpp
	pixelformat_uncompressed_r8g8b8a8
	// 32 bpp (1 channel - float)
	pixelformat_uncompressed_r32
	// 32*3 bpp (3 channels - float)
	pixelformat_uncompressed_r32g32b32
	// 32*4 bpp (4 channels - float)
	pixelformat_uncompressed_r32g32b32a32
	// 16 bpp (1 channel - half float)
	pixelformat_uncompressed_r16
	// 16*3 bpp (3 channels - half float)
	pixelformat_uncompressed_r16g16b16
	// 16*4 bpp (4 channels - half float)
	pixelformat_uncompressed_r16g16b16a16
	// 4 bpp (no alpha)
	pixelformat_compressed_dxt1_rgb
	// 4 bpp (1 bit alpha)
	pixelformat_compressed_dxt1_rgba
	// 8 bpp
	pixelformat_compressed_dxt3_rgba
	// 8 bpp
	pixelformat_compressed_dxt5_rgba
	// 4 bpp
	pixelformat_compressed_etc1_rgb
	// 4 bpp
	pixelformat_compressed_etc2_rgb
	// 8 bpp
	pixelformat_compressed_etc2_eac_rgba
	// 4 bpp
	pixelformat_compressed_pvrt_rgb
	// 4 bpp
	pixelformat_compressed_pvrt_rgba
	// 8 bpp
	pixelformat_compressed_astc_4x4_rgba
	// 2 bpp
	pixelformat_compressed_astc_8x8_rgba
}

// Texture parameters: filter mode
// NOTE 1: Filtering considers mipmaps if available in the texture
// NOTE 2: Filter is accordingly set for minification and magnification
pub enum TextureFilter {
	// No filter, just pixel approximation
	texture_filter_point = 0
	// Linear filtering
	texture_filter_bilinear
	// Trilinear filtering (linear with mipmaps)
	texture_filter_trilinear
	// Anisotropic filtering 4x
	texture_filter_anisotropic_4x
	// Anisotropic filtering 8x
	texture_filter_anisotropic_8x
	// Anisotropic filtering 16x
	texture_filter_anisotropic_16x
}

// Texture parameters: wrap mode
pub enum TextureWrap {
	// Repeats texture in tiled mode
	texture_wrap_repeat = 0
	// Clamps texture to edge pixel in tiled mode
	texture_wrap_clamp
	// Mirrors and repeats the texture in tiled mode
	texture_wrap_mirror_repeat
	// Mirrors and clamps to border the texture in tiled mode
	texture_wrap_mirror_clamp
}

// Cubemap layouts
pub enum CubemapLayout {
	// Automatically detect layout type
	cubemap_layout_auto_detect = 0
	// Layout is defined by a vertical line with faces
	cubemap_layout_line_vertical
	// Layout is defined by a horizontal line with faces
	cubemap_layout_line_horizontal
	// Layout is defined by a 3x4 cross with cubemap faces
	cubemap_layout_cross_three_by_four
	// Layout is defined by a 4x3 cross with cubemap faces
	cubemap_layout_cross_four_by_three
	// Layout is defined by a panorama image (equirrectangular map)
	cubemap_layout_panorama
}

// Font type, defines generation method
pub enum FontType {
	// Default font generation, anti-aliased
	font_default = 0
	// Bitmap font generation, no anti-aliasing
	font_bitmap
	// SDF font generation, requires external shader
	font_sdf
}

// Color blending modes (pre-defined)
pub enum BlendMode {
	// Blend textures considering alpha (default)
	blend_alpha = 0
	// Blend textures adding colors
	blend_additive
	// Blend textures multiplying colors
	blend_multiplied
	// Blend textures adding colors (alternative)
	blend_add_colors
	// Blend textures subtracting colors (alternative)
	blend_subtract_colors
	// Blend premultiplied textures considering alpha
	blend_alpha_premultiply
	// Blend textures using custom src/dst factors (use rlSetBlendFactors())
	blend_custom
	// Blend textures using custom rgb/alpha separate src/dst factors (use
	blend_custom_separate
}

// Gesture
// NOTE: Provided as bit-wise flags to enable only desired gestures
pub enum Gesture {
	// No gesture
	gesture_none = 0
	// Tap gesture
	gesture_tap = 1
	// Double tap gesture
	gesture_doubletap = 2
	// Hold gesture
	gesture_hold = 4
	// Drag gesture
	gesture_drag = 8
	// Swipe right gesture
	gesture_swipe_right = 16
	// Swipe left gesture
	gesture_swipe_left = 32
	// Swipe up gesture
	gesture_swipe_up = 64
	// Swipe down gesture
	gesture_swipe_down = 128
	// Pinch in gesture
	gesture_pinch_in = 256
	// Pinch out gesture
	gesture_pinch_out = 512
}

// Camera system modes
pub enum CameraMode {
	// Custom camera
	camera_custom = 0
	// Free camera
	camera_free
	// Orbital camera
	camera_orbital
	// First person camera
	camera_first_person
	// Third person camera
	camera_third_person
}

// Camera projection
pub enum CameraProjection {
	// Perspective projection
	camera_perspective = 0
	// Orthographic projection
	camera_orthographic
}

// N-patch layout
pub enum NPatchLayout {
	// Npatch layout: 3x3 tiles
	npatch_nine_patch = 0
	// Npatch layout: 1x3 tiles
	npatch_three_patch_vertical
	// Npatch layout: 3x1 tiles
	npatch_three_patch_horizontal
}

@[typedef]
pub struct C.va_list {}

// Callbacks to hook some internal functions
// WARNING: These callbacks are intended for advance users

// Logging: Redirect trace log messages
pub type FnTraceLogCallback = fn (logLevel int, const_text &char, args C.va_list)

// FileIO: Load binary data
pub type FnLoadFileDataCallback = fn (const_fileName &char, dataSize &int) &u8

/// FileIO: Save binary data
pub type FnSaveFileDataCallback = fn (const_fileName &char, data voidptr, dataSize int) bool

// FileIO: Load text data
pub type FnLoadFileTextCallback = fn (const_fileName &char) &char

// FileIO: Save text data
pub type FnSaveFileTextCallback = fn (const_fileName &char, text &char) bool

//------------------------------------------------------------------------------------
// Window and Graphics Device Functions (Module: core)
//------------------------------------------------------------------------------------

// Window-related functions

// Initialize window and OpenGL context
pub fn C.InitWindow(width int, height int, const_title &char)

// Close window and unload OpenGL context
pub fn C.CloseWindow()

// Check if application should close (KEY_ESCAPE pressed or windows close icon clicked)
pub fn C.WindowShouldClose() bool

// Check if window has been initialized successfully
pub fn C.IsWindowReady() bool

// Check if window is currently fullscreen
pub fn C.IsWindowFullscreen() bool

// Check if window is currently hidden (only PLATFORM_DESKTOP)
pub fn C.IsWindowHidden() bool

// Check if window is currently minimized (only PLATFORM_DESKTOP)
pub fn C.IsWindowMinimized() bool

// Check if window is currently maximized (only PLATFORM_DESKTOP)
pub fn C.IsWindowMaximized() bool

// Check if window is currently focused (only PLATFORM_DESKTOP)
pub fn C.IsWindowFocused() bool

// Check if window has been resized last frame
pub fn C.IsWindowResized() bool

// Check if one specific window flag is enabled
pub fn C.IsWindowState(flag u32) bool

// Set window configuration state using flags (only PLATFORM_DESKTOP)
pub fn C.SetWindowState(flags u32)

// Clear window configuration state flags
pub fn C.ClearWindowState(flags u32)

// Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
pub fn C.ToggleFullscreen()

// Toggle window state: borderless windowed (only PLATFORM_DESKTOP)
pub fn C.ToggleBorderlessWindowed()

// Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
pub fn C.MaximizeWindow()

// Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
pub fn C.MinimizeWindow()

// Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
pub fn C.RestoreWindow()

// Set icon for window (single image, RGBA 32bit, only PLATFORM_DESKTOP)
pub fn C.SetWindowIcon(image Image)

// Set icon for window (multiple images, RGBA 32bit, only PLATFORM_DESKTOP)
pub fn C.SetWindowIcons(images &Image, count int)

// Set title for window (only PLATFORM_DESKTOP and PLATFORM_WEB)
pub fn C.SetWindowTitle(const_title &char)

// Set window position on screen (only PLATFORM_DESKTOP)
pub fn C.SetWindowPosition(x int, y int)

// Set monitor for the current window
pub fn C.SetWindowMonitor(monitor int)

// Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
pub fn C.SetWindowMinSize(width int, height int)

// Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE)
pub fn C.SetWindowMaxSize(width int, height int)

// Set window dimensions
pub fn C.SetWindowSize(width int, height int)

// Set window opacity [0.0f..1.0f] (only PLATFORM_DESKTOP)
pub fn C.SetWindowOpacity(opacity f32)

// Set window focused (only PLATFORM_DESKTOP)
pub fn C.SetWindowFocused()

// Get native window handle
pub fn C.GetWindowHandle() voidptr

// Get current screen width
pub fn C.GetScreenWidth() int

// Get current screen height
pub fn C.GetScreenHeight() int

// Get current render width (it considers HiDPI)
pub fn C.GetRenderWidth() int

// Get current render height (it considers HiDPI)
pub fn C.GetRenderHeight() int

// Get number of connected monitors
pub fn C.GetMonitorCount() int

// Get current connected monitor
pub fn C.GetCurrentMonitor() int

// Get specified monitor position
pub fn C.GetMonitorPosition(monitor int) Vector2

// Get specified monitor width (current video mode used by monitor)
pub fn C.GetMonitorWidth(monitor int) int

// Get specified monitor height (current video mode used by monitor)
pub fn C.GetMonitorHeight(monitor int) int

// Get specified monitor physical width in millimetres
pub fn C.GetMonitorPhysicalWidth(monitor int) int

// Get specified monitor physical height in millimetres
pub fn C.GetMonitorPhysicalHeight(monitor int) int

// Get specified monitor refresh rate
pub fn C.GetMonitorRefreshRate(monitor int) int

// Get window position XY on monitor
pub fn C.GetWindowPosition() Vector2

// Get window scale DPI factor
pub fn C.GetWindowScaleDPI() Vector2

// Get the human-readable, UTF-8 encoded name of the specified monitor
pub fn C.GetMonitorName(monitor int) &char

// Set clipboard text content
pub fn C.SetClipboardText(const_text &char)

// Get clipboard text content
pub fn C.GetClipboardText() &char

// Enable waiting for events on EndDrawing(), no automatic event polling
pub fn C.EnableEventWaiting()

// Disable waiting for events on EndDrawing(), automatic events polling
pub fn C.DisableEventWaiting()

// Cursor-related functions

// Shows cursor
pub fn C.ShowCursor()

// Hides cursor
pub fn C.HideCursor()

// Check if cursor is not visible
pub fn C.IsCursorHidden() bool

// Enables cursor (unlock cursor)
pub fn C.EnableCursor()

// Disables cursor (lock cursor)
pub fn C.DisableCursor()

// Check if cursor is on the screen
pub fn C.IsCursorOnScreen() bool

// Drawing-related functions

// Set background color (framebuffer clear color)
pub fn C.ClearBackground(color Color)

// Setup canvas (framebuffer) to start drawing
pub fn C.BeginDrawing()

// End canvas drawing and swap buffers (double buffering)
pub fn C.EndDrawing()

// Begin 2D mode with custom camera (2D)
pub fn C.BeginMode2D(camera Camera2D)

// Ends 2D mode with custom camera
pub fn C.EndMode2D()

// Begin 3D mode with custom camera (3D)
pub fn C.BeginMode3D(camera Camera3D)

// Ends 3D mode and returns to default 2D orthographic mode
pub fn C.EndMode3D()

// Begin drawing to render texture
pub fn C.BeginTextureMode(target RenderTexture2D)

// Ends drawing to render texture
pub fn C.EndTextureMode()

// Begin custom shader drawing
pub fn C.BeginShaderMode(shader Shader)

// End custom shader drawing (use default shader)
pub fn C.EndShaderMode()

// Begin blending mode (alpha, additive, multiplied, subtract, custom)
pub fn C.BeginBlendMode(mode int)

// End blending mode (reset to default: alpha blending)
pub fn C.EndBlendMode()

// Begin scissor mode (define screen area for following drawing)
pub fn C.BeginScissorMode(x int, y int, width int, height int)

// End scissor mode
pub fn C.EndScissorMode()

// Begin stereo rendering (requires VR simulator)
pub fn C.BeginVrStereoMode(config VrStereoConfig)

// End stereo rendering (requires VR simulator)
pub fn C.EndVrStereoMode()

// VR stereo config functions for VR simulator

// Load VR stereo config for VR simulator device parameters
pub fn C.LoadVrStereoConfig(device VrDeviceInfo) VrStereoConfig

// Unload VR stereo config
pub fn C.UnloadVrStereoConfig(config VrStereoConfig)

// Shader management functions

// Load shader from files and bind default locations
pub fn C.LoadShader(const_vsFileName &char, const_fsFileName &char) Shader

// Load shader from code strings and bind default locations
pub fn C.LoadShaderFromMemory(const_vsCode &char, const_fsCode &char) Shader

// Check if a shader is ready
pub fn C.IsShaderReady(shader Shader) bool

// Get shader uniform location
pub fn C.GetShaderLocation(shader Shader, const_uniformName &char) int

// Get shader attribute location
pub fn C.GetShaderLocationAttrib(shader Shader, const_attribName &char) int

// Set shader uniform value
pub fn C.SetShaderValue(shader Shader, locIndex int, const_value voidptr, uniformType int)

// Set shader uniform value vector
pub fn C.SetShaderValueV(shader Shader, locIndex int, const_value voidptr, uniformType int, count int)

// Set shader uniform value (matrix 4x4)
pub fn C.SetShaderValueMatrix(shader Shader, locIndex int, mat Matrix)

// Set shader uniform value for texture (sampler2d)
pub fn C.SetShaderValueTexture(shader Shader, locIndex int, texture Texture2D)

// Unload shader from GPU memory (VRAM)
pub fn C.UnloadShader(shader Shader)

// Screen-space-related functions

// Get a ray trace from mouse position
pub fn C.GetMouseRay(mousePosition Vector2, camera Camera) Ray

// Get camera transform matrix (view matrix)
pub fn C.GetCameraMatrix(camera Camera) Matrix

// Get camera 2d transform matrix
pub fn C.GetCameraMatrix2D(camera Camera2D) Matrix

// Get the screen space position for a 3d world space position
pub fn C.GetWorldToScreen(position Vector3, camera Camera) Vector2

// Get the world space position for a 2d camera screen space position
pub fn C.GetScreenToWorld2D(position Vector2, camera Camera2D) Vector2

// Get size position for a 3d world space position
pub fn C.GetWorldToScreenEx(position Vector3, camera Camera, width int, height int) Vector2

// Get the screen space position for a 2d camera world space position
pub fn C.GetWorldToScreen2D(position Vector2, camera Camera2D) Vector2

// Timing-related functions

// Set target FPS (maximum)
pub fn C.SetTargetFPS(fps int)

// Get time in seconds for last frame drawn (delta time)
pub fn C.GetFrameTime() f32

// Get elapsed time in seconds since InitWindow()
pub fn C.GetTime() f64

// Get current FPS
pub fn C.GetFPS() int

// Custom frame control functions
// NOTE: Those functions are intended for advance users that want full control over the frame processing
// By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timing + PollInputEvents()
// To a that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL

// Swap back buffer with front buffer (screen drawing)
pub fn C.SwapScreenBuffer()

// Register all input events
pub fn C.PollInputEvents()

// Wait for some time (halt program execution)
pub fn C.WaitTime(seconds f64)

// Random values generation functions

// Set the seed for the random number generator
pub fn C.SetRandomSeed(seed u32)

// Get a random value between min and max (both included)
pub fn C.GetRandomValue(min int, max int) int

// Load random values sequence, no values repeated
pub fn C.LoadRandomSequence(count u32, min int, max int) &int

// Unload random values sequence
pub fn C.UnloadRandomSequence(sequence &int)

// Misc. functions

// Takes a screenshot of current screen (filename extension defines format)
pub fn C.TakeScreenshot(const_fileName &char)

// Setup init configuration flags (view FLAGS)
pub fn C.SetConfigFlags(flags u32)

// Open URL with default system browser (if available)
pub fn C.OpenURL(const_url &char)

// NOTE: Following functions implemented in module [utils]
//------------------------------------------------------------------

// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
pub fn C.TraceLog(logLevel int, const_text &char, ...)

// Set the current threshold (minimum) log level
pub fn C.SetTraceLogLevel(logLevel int)

// Internal memory allocator
pub fn C.MemAlloc(size u32) voidptr

// Internal memory reallocator
pub fn C.MemRealloc(ptr voidptr, size u32) voidptr

// Internal memory free
pub fn C.MemFree(ptr voidptr)

// Set custom callbacks
// WARNING: Callbacks setup is intended for advance users

// Set custom trace log
pub fn C.SetTraceLogCallback(callback TraceLogCallback)

// Set custom file binary data loader
pub fn C.SetLoadFileDataCallback(callback LoadFileDataCallback)

// Set custom file binary data saver
pub fn C.SetSaveFileDataCallback(callback SaveFileDataCallback)

// Set custom file text data loader
pub fn C.SetLoadFileTextCallback(callback LoadFileTextCallback)

// Set custom file text data saver
pub fn C.SetSaveFileTextCallback(callback SaveFileTextCallback)

// Files management functions

// Load file data as byte array (read)
pub fn C.LoadFileData(const_fileName &char, dataSize &int) &u8

// Unload file data allocated by LoadFileData()
pub fn C.UnloadFileData(data &u8)

// Save data to file from byte array (write), returns true on success
pub fn C.SaveFileData(const_fileName &char, data voidptr, int dataSize) bool

// Export data to code (.h), returns true on success
pub fn C.ExportDataAsCode(const_data &u8, dataSize int, const_fileName &char) bool

// Load text data from file (read), returns a '\0' terminated string
pub fn C.LoadFileText(const_fileName &char) &char

// Unload file text data allocated by LoadFileText()
pub fn C.UnloadFileText(text &char)

// Save text data to file (write), string must be '\0' terminated, returns true on success
pub fn C.SaveFileText(const_fileName &char, text &char) bool

//------------------------------------------------------------------

// File system functions

// Check if file exists
pub fn C.FileExists(const_fileName &char) bool

// Check if a directory path exists
pub fn C.DirectoryExists(const_dirPath &char) bool

// Check file extension (including point: .png, .wav)
pub fn C.IsFileExtension(const_fileName &char, const_ext &char) bool

// Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h)
pub fn C.GetFileLength(const_fileName &char) int

// Get pointer to extension for a filename string (includes dot: '.png')
pub fn C.GetFileExtension(const_fileName &char) &char

// Get pointer to filename for a path string
pub fn C.GetFileName(const_filePath &char) &char

// Get filename string without extension (uses static string)
pub fn C.GetFileNameWithoutExt(const_filePath &char) &char

// Get full path for a given fileName with path (uses static string)
pub fn C.GetDirectoryPath(const_filePath &char) &char

// Get previous directory path for a given path (uses static string)
pub fn C.GetPrevDirectoryPath(const_dirPath &char) &char

// Get current working directory (uses static string)
pub fn C.GetWorkingDirectory() &char

// Get the directory of the running application (uses static string)
pub fn C.GetApplicationDirectory() &char

// Change working directory, return true on success
pub fn C.ChangeDirectory(const_dir &char) bool

// Check if a given path is a file or a directory
pub fn C.IsPathFile(const_path &char) bool

// Load directory filepaths
pub fn C.LoadDirectoryFiles(const_dirPath &char) FilePathList

// Load directory filepaths with extension filtering and recursive directory scan
pub fn C.LoadDirectoryFilesEx(const_basePath &char, const_filter &char, scanSubdirs bool) FilePathList

// Unload filepaths
pub fn C.UnloadDirectoryFiles(files FilePathList)

// Check if a file has been dropped into window
pub fn C.IsFileDropped() bool

// Load dropped filepaths
pub fn C.LoadDroppedFiles() FilePathList

// Unload dropped filepaths
pub fn C.UnloadDroppedFiles(files FilePathList)

// Get file modification time (last write time)
pub fn C.GetFileModTime(const_fileName &char) i64

// Compression/Encoding functionality

// Compress data (DEFLATE algorithm), memory must be MemFree()
pub fn C.CompressData(const_data &u8, dataSize int, compDataSize &int) &u8

// Decompress data (DEFLATE algorithm), memory must be MemFree()
pub fn C.DecompressData(const_compData &u8, compDataSize int, dataSize &int) &u8

// Encode data to Base64 string, memory must be MemFree()
pub fn C.EncodeDataBase64(const_data &u8, dataSize int, outputSize &int) &char

// Decode Base64 string data, memory must be MemFree()
pub fn C.DecodeDataBase64(const_data &u8, outputSize &int) &u8

// Automation events functionality

// Load automation events list from file, NULL for empty list, capacity = MAX_AUTOMATION_EVENTS
pub fn C.LoadAutomationEventList(const_fileName &char) AutomationEventList

// Unload automation events list from file
pub fn C.UnloadAutomationEventList(list &AutomationEventList)

// Export automation events list as text file
pub fn C.ExportAutomationEventList(list AutomationEventList, const_fileName &char) bool

// Set automation event list to record to
pub fn C.SetAutomationEventList(list &AutomationEventList)

// Set automation event internal base frame to start recording
pub fn C.SetAutomationEventBaseFrame(frame int)

// Start recording automation events (AutomationEventList must be set)
pub fn C.StartAutomationEventRecording()

// Stop recording automation events
pub fn C.StopAutomationEventRecording()

// Play a recorded automation event
pub fn C.PlayAutomationEvent(event AutomationEvent)

//------------------------------------------------------------------------------------
// Input Handling Functions (Module: core)
//------------------------------------------------------------------------------------

// Input-related functions: keyboard

// Check if a key has been pressed once
pub fn C.IsKeyPressed(key int) bool

// Check if a key has been pressed again (Only PLATFORM_DESKTOP)
pub fn C.IsKeyPressedRepeat(key int) bool

// Check if a key is being pressed
pub fn C.IsKeyDown(key int) bool

// Check if a key has been released once
pub fn C.IsKeyReleased(key int) bool

// Check if a key is NOT being pressed
pub fn C.IsKeyUp(key int) bool

// Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
pub fn C.GetKeyPressed() int

// Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
pub fn C.GetCharPressed() int

// Set a custom key to exit program (default is ESC)
pub fn C.SetExitKey(key int)

// Input-related functions: gamepads

// Check if a gamepad is available
pub fn C.IsGamepadAvailable(gamepad int) bool

// Get gamepad internal name id
pub fn C.GetGamepadName(gamepad int) &char

// Check if a gamepad button has been pressed once
pub fn C.IsGamepadButtonPressed(gamepad int, button int) bool

// Check if a gamepad button is being pressed
pub fn C.IsGamepadButtonDown(gamepad int, button int) bool

// Check if a gamepad button has been released once
pub fn C.IsGamepadButtonReleased(gamepad int, button int) bool

// Check if a gamepad button is NOT being pressed
pub fn C.IsGamepadButtonUp(gamepad int, button int) bool

// Get the last gamepad button pressed
pub fn C.GetGamepadButtonPressed() int

// Get gamepad axis count for a gamepad
pub fn C.GetGamepadAxisCount(gamepad int) int

// Get axis movement value for a gamepad axis
pub fn C.GetGamepadAxisMovement(gamepad int, axis int) f32

// Set internal gamepad mappings (SDL_GameControllerDB)
pub fn C.SetGamepadMappings(const_mappings &char) int

// Input-related functions: mouse

// Check if a mouse button has been pressed once
pub fn C.IsMouseButtonPressed(button int) bool

// Check if a mouse button is being pressed
pub fn C.IsMouseButtonDown(button int) bool

// Check if a mouse button has been released once
pub fn C.IsMouseButtonReleased(button int) bool

// Check if a mouse button is NOT being pressed
pub fn C.IsMouseButtonUp(button int) bool

// Get mouse position X
pub fn C.GetMouseX() int

// Get mouse position Y
pub fn C.GetMouseY() int

// Get mouse position XY
pub fn C.GetMousePosition() Vector2

// Get mouse delta between frames
pub fn C.GetMouseDelta() Vector2

// Set mouse position XY
pub fn C.SetMousePosition(x int, y int)

// Set mouse offset
pub fn C.SetMouseOffset(offsetX int, offsetY int)

// Set mouse scaling
pub fn C.SetMouseScale(scaleX f32, scaleY f32)

// Get mouse wheel movement for X or Y, whichever is larger
pub fn C.GetMouseWheelMove() f32

// Get mouse wheel movement for both X and Y
pub fn C.GetMouseWheelMoveV() Vector2

// Set mouse cursor
pub fn C.SetMouseCursor(cursor int)

// Input-related functions: touch

// Get touch position X for touch point 0 (relative to screen size)
pub fn C.GetTouchX() int

// Get touch position Y for touch point 0 (relative to screen size)
pub fn C.GetTouchY() int

// Get touch position XY for a touch poindex int (relative to screen size)
pub fn C.GetTouchPosition(index int) Vector2

// Get touch point identifier for given index
pub fn C.GetTouchPointId(index int) int

// Get number of touch points
pub fn C.GetTouchPointCount() int

//------------------------------------------------------------------------------------
// Gestures and Touch Handling Functions (Module: rgestures)
//------------------------------------------------------------------------------------

// Enable a set of gestures using flags
pub fn C.SetGesturesEnabled(flags u32)

// Check if a gesture have been detected
pub fn C.IsGestureDetected(gesture u32) bool

// Get latest detected gesture
pub fn C.GetGestureDetected() int

// Get gesture hold time in milliseconds
pub fn C.GetGestureHoldDuration() f32

// Get gesture drag vector
pub fn C.GetGestureDragVector() Vector2

// Get gesture drag angle
pub fn C.GetGestureDragAngle() f32

// Get gesture pinch delta
pub fn C.GetGesturePinchVector() Vector2

// Get gesture pinch angle
pub fn C.GetGesturePinchAngle() f32

//------------------------------------------------------------------------------------
// Camera System Functions (Module: rcamera)
//------------------------------------------------------------------------------------

// Update camera position for selected mode
pub fn C.UpdateCamera(camera &Camera, mode int)

// Update camera movement/rotation
pub fn C.UpdateCameraPro(camera &Camera, movement Vector3, rotation Vector3, zoom f32)

//------------------------------------------------------------------------------------
// Basic Shapes Drawing Functions (Module: shapes)
//------------------------------------------------------------------------------------

// Set texture and rectangle to be used on shapes drawing
// NOTE: It can be useful when using basic shapes and one single font,
// defining a font char white rectangle would allow drawing everything in a single draw call

// Set texture and rectangle to be used on shapes drawing
pub fn C.SetShapesTexture(texture Texture2D, source Rectangle)

// Basic shapes drawing functions

// Draw a pixel
pub fn C.DrawPixel(posX int, posY int, color Color)

// Draw a pixel (Vector version)
pub fn C.DrawPixelV(position Vector2, color Color)

// Draw a line
pub fn C.DrawLine(startPosX int, startPosY int, endPosX int, endPosY int, color Color)

// Draw a line (using gl lines)
pub fn C.DrawLineV(startPos Vector2, endPos Vector2, color Color)

// Draw a line (using triangles/quads)
pub fn C.DrawLineEx(startPos Vector2, endPos Vector2, f32 thick, color Color)

// Draw lines sequence (using gl lines)
pub fn C.DrawLineStrip(points &Vector2, int pointCount, color Color)

// Draw line segment cubic-bezier in-out interpolation
pub fn C.DrawLineBezier(startPos Vector2, endPos Vector2, f32 thick, color Color)

// Draw a color-filled circle
pub fn C.DrawCircle(centerX int, centerY int, radius f32, color Color)

// Draw a piece of a circle
pub fn C.DrawCircleSector(center Vector2, radius f32, startAngle f32, endAngle f32, segments int, color Color)

// Draw circle sector outline
pub fn C.DrawCircleSectorLines(center Vector2, radius f32, startAngle f32, endAngle f32, segments int, color Color)

// Draw a gradient-filled circle
pub fn C.DrawCircleGradient(centerX int, centerY int, radius f32, color1 Color, color2 Color)

// Draw a color-filled circle (Vector version)
pub fn C.DrawCircleV(center Vector2, radius f32, color Color)

// Draw circle outline
pub fn C.DrawCircleLines(centerX int, centerY int, radius f32, color Color)

// Draw circle outline (Vector version)
pub fn C.DrawCircleLinesV(center Vector2, radius f32, color Color)

// Draw ellipse
pub fn C.DrawEllipse(centerX int, centerY int, radiusH f32, radiusV f32, color Color)

// Draw ellipse outline
pub fn C.DrawEllipseLines(centerX int, centerY int, radiusH f32, radiusV f32, color Color)

// Draw ring
pub fn C.DrawRing(center Vector2, innerRadius f32, outerRadius f32, startAngle f32, endAngle f32, segments int, color Color)

// Draw ring outline
pub fn C.DrawRingLines(center Vector2, innerRadius f32, outerRadius f32, startAngle f32, endAngle f32, segments int, color Color)

// Draw a color-filled rectangle
pub fn C.DrawRectangle(posX int, posY int, width int, height int, color Color)

// Draw a color-filled rectangle (Vector version)
pub fn C.DrawRectangleV(position Vector2, size Vector2, color Color)

// Draw a color-filled rectangle
pub fn C.DrawRectangleRec(rec Rectangle, color Color)

// Draw a color-filled rectangle with pro parameters
pub fn C.DrawRectanglePro(rec Rectangle, origin Vector2, rotation f32, color Color)

// Draw a vertical-gradient-filled rectangle
pub fn C.DrawRectangleGradientV(posX int, posY int, width int, height int, color1 Color, color2 Color)

// Draw a horizontal-gradient-filled rectangle
pub fn C.DrawRectangleGradientH(posX int, posY int, width int, height int, color1 Color, color2 Color)

// Draw a gradient-filled rectangle with custom vertex colors
pub fn C.DrawRectangleGradientEx(rec Rectangle, col1 Color, col2 Color, col3 Color, col4 Color)

// Draw rectangle outline
pub fn C.DrawRectangleLines(posX int, posY int, width int, height int, color Color)

// Draw rectangle outline with extended parameters
pub fn C.DrawRectangleLinesEx(rec Rectangle, lineThick f32, color Color)

// Draw rectangle with rounded edges
pub fn C.DrawRectangleRounded(rec Rectangle, roundness f32, segments int, color Color)

// Draw rectangle with rounded edges outline
pub fn C.DrawRectangleRoundedLines(rec Rectangle, roundness f32, segments int, lineThick f32, color Color)

// Draw a color-filled triangle (vertex in counter-clockwise order!)
pub fn C.DrawTriangle(v1 Vector2, v2 Vector2, v3 Vector2, color Color)

// Draw triangle outline (vertex in counter-clockwise order!)
pub fn C.DrawTriangleLines(v1 Vector2, v2 Vector2, v3 Vector2, color Color)

// Draw a triangle fan defined by points (first vertex is the center)
pub fn C.DrawTriangleFan(points &Vector2, int pointCount, color Color)

// Draw a triangle strip defined by points
pub fn C.DrawTriangleStrip(points &Vector2, int pointCount, color Color)

// Draw a regular polygon (Vector version)
pub fn C.DrawPoly(center Vector2, sides int, radius f32, rotation f32, color Color)

// Draw a polygon outline of n sides
pub fn C.DrawPolyLines(center Vector2, sides int, radius f32, rotation f32, color Color)

// Draw a polygon outline of n sides with extended parameters
pub fn C.DrawPolyLinesEx(center Vector2, sides int, radius f32, rotation f32, lineThick f32, color Color)

// Splines drawing functions

// Draw spline: Linear, minimum 2 points
pub fn C.DrawSplineLinear(points &Vector2, pointCount int, thick f32, color Color)

// Draw spline: B-Spline, minimum 4 points
pub fn C.DrawSplineBasis(points &Vector2, pointCount int, thick f32, color Color)

// Draw spline: Catmull-Rom, minimum 4 points
pub fn C.DrawSplineCatmullRom(points &Vector2, pointCount int, thick f32, color Color)

// Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
pub fn C.DrawSplineBezierQuadratic(points &Vector2, pointCount int, thick f32, color Color)

// Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
pub fn C.DrawSplineBezierCubic(points &Vector2, pointCount int, thick f32, color Color)

// Draw spline segment: Linear, 2 points
pub fn C.DrawSplineSegmentLinear(p1 Vector2, p2 Vector2, thick f32, color Color)

// Draw spline segment: B-Spline, 4 points
pub fn C.DrawSplineSegmentBasis(p1 Vector2, p2 Vector2, p3 Vector2, p4 Vector2, thick f32, color Color)

// Draw spline segment: Catmull-Rom, 4 points
pub fn C.DrawSplineSegmentCatmullRom(p1 Vector2, p2 Vector2, p3 Vector2, p4 Vector2, thick f32, color Color)

// Draw spline segment: Quadratic Bezier, 2 points, 1 control point
pub fn C.DrawSplineSegmentBezierQuadratic(p1 Vector2, c2 Vector2, p3 Vector2, thick f32, color Color)

// Draw spline segment: Cubic Bezier, 2 points, 2 control points
pub fn C.DrawSplineSegmentBezierCubic(p1 Vector2, c2 Vector2, c3 Vector2, p4 Vector2, thick f32, color Color)

// Spline segment point evaluation functions, for a given t [0.0f .. 1.0f]

// Get (evaluate) spline point: Linear
pub fn C.GetSplinePointLinear(startPos Vector2, endPos Vector2, t f32) Vector2

// Get (evaluate) spline point: B-Spline
pub fn C.GetSplinePointBasis(p1 Vector2, p2 Vector2, p3 Vector2, p4 Vector2, t f32) Vector2

// Get (evaluate) spline point: Catmull-Rom
pub fn C.GetSplinePointCatmullRom(p1 Vector2, p2 Vector2, p3 Vector2, p4 Vector2, t f32) Vector2

// Get (evaluate) spline point: Quadratic Bezier
pub fn C.GetSplinePointBezierQuad(p1 Vector2, c2 Vector2, p3 Vector2, t f32) Vector2

// Get (evaluate) spline point: Cubic Bezier
pub fn C.GetSplinePointBezierCubic(p1 Vector2, c2 Vector2, c3 Vector2, p4 Vector2, t f32) Vector2

// Basic shapes collision detection functions

// Check collision between two rectangles
pub fn C.CheckCollisionRecs(rec1 Rectangle, rec2 Rectangle) bool

// Check collision between two circles
pub fn C.CheckCollisionCircles(center1 Vector2, radius1 f32, center2 Vector2, radius2 f32) bool

// Check collision between circle and rectangle
pub fn C.CheckCollisionCircleRec(center Vector2, radius f32, rec Rectangle) bool

// Check if point is inside rectangle
pub fn C.CheckCollisionPointRec(point Vector2, rec Rectangle) bool

// Check if point is inside circle
pub fn C.CheckCollisionPointCircle(point Vector2, center Vector2, radius f32) bool

// Check if point is inside a triangle
pub fn C.CheckCollisionPointTriangle(point Vector2, p1 Vector2, p2 Vector2, p3 Vector2) bool

// Check if point is within a polygon described by array of vertices
pub fn C.CheckCollisionPointPoly(point Vector2, points &Vector2, pointCount int) bool

// Check the collision between two lines defined by two points each, returns collision point by reference
pub fn C.CheckCollisionLines(startPos1 Vector2, endPos1 Vector2, startPos2 Vector2, endPos2 Vector2, collisionPoint &Vector2) bool

// Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
pub fn C.CheckCollisionPointLine(point Vector2, p1 Vector2, p2 Vector2, threshold int) bool

// Get collision rectangle for two rectangles collision
pub fn C.GetCollisionRec(rec1 Rectangle, rec2 Rectangle) Rectangle

//------------------------------------------------------------------------------------
// Texture Loading and Drawing Functions (Module: textures)
//------------------------------------------------------------------------------------

// Image loading functions
// NOTE: These functions do not require GPU access

// Load image from file into CPU memory (RAM)
pub fn C.LoadImage(const_fileName &char) Image

// Load image from RAW file data
pub fn C.LoadImageRaw(const_fileName &char, width int, height int, format int, headerSize int) Image

// Load image from SVG file data or string with specified size
pub fn C.LoadImageSvg(const_fileNameOrString &char, width int, height int) Image

// Load image sequence from file (frames appended to image.data)
pub fn C.LoadImageAnim(const_fileName &char, frames &int) Image

// Load image from memory buffer, fileType refers to extension: i.e. '.png'
pub fn C.LoadImageFromMemory(const_fileType &char, const_fileData &u8, dataSize int) Image

// Load image from GPU texture data
pub fn C.LoadImageFromTexture(texture Texture2D) Image

// Load image from screen buffer and (screenshot)
pub fn C.LoadImageFromScreen() Image

// Check if an image is ready
pub fn C.IsImageReady(image Image) bool

// Unload image from CPU memory (RAM)
pub fn C.UnloadImage(image Image)

// Export image data to file, returns true on success
pub fn C.ExportImage(image Image, const_fileName &char) bool

// Export image to memory buffer
pub fn C.ExportImageToMemory(image Image, const_fileType &char, fileSize &int) &u8

// Export image as code file defining an array of bytes, returns true on success
pub fn C.ExportImageAsCode(image Image, const_fileName &char) bool

// Image generation functions

// Generate image: plain color
pub fn C.GenImageColor(width int, height int, color Color) Image

// Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
pub fn C.GenImageGradientLinear(width int, height int, direction int, start Color, end Color) Image

// Generate image: radial gradient
pub fn C.GenImageGradientRadial(width int, height int, density f32, inner Color, outer Color) Image

// Generate image: square gradient
pub fn C.GenImageGradientSquare(width int, height int, density f32, inner Color, outer Color) Image

// Generate image: checked
pub fn C.GenImageWhiteNoise(width int, height int, factor f32) Image

// Generate image: white noise
pub fn C.GenImagePerlinNoise(width int, height int, offsetX int, offsetY int, f32 scale) Image

// Generate image: perlin noise
pub fn C.GenImageChecked(width int, height int, checksX int, checksY int, col1 Color, col2 Color) Image

// Generate image: cellular algorithm, bigger tileSize means bigger cells
pub fn C.GenImageCellular(width int, height int, tileSize int) Image

// Generate image: grayscale image from text data
pub fn C.GenImageText(width int, height int, const_text &char) Image

// Image manipulation functions

// Create an image duplicate (useful for transformations)
pub fn C.ImageCopy(image Image) Image

// Create an image from another image piece
pub fn C.ImageFromImage(image Image, rec Rectangle) Image

// Create an image from text (default font)
pub fn C.ImageText(const_text &char, fontSize int, color Color) Image

// Create an image from text (custom sprite font)
pub fn C.ImageTextEx(font Font, const_text &char, fontSize f32, spacing f32, tint Color) Image

// Convert image data to desired format
pub fn C.ImageFormat(image &Image, newFormat int)

// Convert image to POT (power-of-two)
pub fn C.ImageToPOT(image &Image, fill Color)

// Crop an image to a defined rectangle
pub fn C.ImageCrop(image &Image, crop Rectangle)

// Crop image depending on alpha value
pub fn C.ImageAlphaCrop(image &Image, threshold f32)

// Clear alpha channel to desired color
pub fn C.ImageAlphaClear(image &Image, color Color, threshold f32)

// Apply alpha mask to image
pub fn C.ImageAlphaMask(image &Image, alphaMask Image)

// Premultiply alpha channel
pub fn C.ImageAlphaPremultiply(image &Image)

// Apply Gaussian blur using a box blur approximation
pub fn C.ImageBlurGaussian(image &Image, blurSize int)

// Resize image (Bicubic scaling algorithm)
pub fn C.ImageResize(image &Image, newWidth int, newHeight int)

// Resize image (Nearest-Neighbor scaling algorithm)
pub fn C.ImageResizeNN(image &Image, newWidth int, newHeight int)

// Resize canvas and fill with color
pub fn C.ImageResizeCanvas(image &Image, newWidth int, newHeight int, offsetX int, offsetY int, fill Color)

// Compute all mipmap levels for a provided image
pub fn C.ImageMipmaps(image &Image)

// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
pub fn C.ImageDither(image &Image, rBpp int, gBpp int, bBpp int, aBpp int)

// Flip image vertically
pub fn C.ImageFlipVertical(image &Image)

// Flip image horizontally
pub fn C.ImageFlipHorizontal(image &Image)

// Rotate image by input angle in degrees (-359 to 359)
pub fn C.ImageRotate(image &Image, degrees int)

// Rotate image clockwise 90deg
pub fn C.ImageRotateCW(image &Image)

// Rotate image counter-clockwise 90deg
pub fn C.ImageRotateCCW(image &Image)

// Modify image color: tint
pub fn C.ImageColorTint(image &Image, color Color)

// Modify image color: invert
pub fn C.ImageColorInvert(image &Image)

// Modify image color: grayscale
pub fn C.ImageColorGrayscale(image &Image)

// Modify image color: contrast (-100 to 100)
pub fn C.ImageColorContrast(image &Image, contrast f32)

// Modify image color: brightness (-255 to 255)
pub fn C.ImageColorBrightness(image &Image, brightness int)

// Modify image color: replace color
pub fn C.ImageColorReplace(image &Image, color Color, replace Color)

// Load color data from image as a Color array (RGBA - 32bit)
pub fn C.LoadImageColors(image Image) &Color

// Load colors palette from image as a Color array (RGBA - 32bit)
pub fn C.LoadImagePalette(image Image, maxPaletteSize int, colorCount &int) &Color

// Unload color data loaded with LoadImageColors()
pub fn C.UnloadImageColors(colors &Color)

// Unload colors palette loaded with LoadImagePalette()
pub fn C.UnloadImagePalette(colors &Color)

// Get image alpha border rectangle
pub fn C.GetImageAlphaBorder(image Image, threshold f32) Rectangle

// Get image pixel color at (x, y) position
pub fn C.GetImageColor(image Image, x int, y int) Color

// Image drawing functions
// NOTE: Image software-rendering functions (CPU)

// Clear image background with given color
pub fn C.ImageClearBackground(dst &Image, color Color)

// Draw pixel within an image
pub fn C.ImageDrawPixel(dst &Image, posX int, posY int, color Color)

// Draw pixel within an image (Vector version)
pub fn C.ImageDrawPixelV(dst &Image, position Vector2, color Color)

// Draw line within an image
pub fn C.ImageDrawLine(dst &Image, startPosX int, startPosY int, endPosX int, endPosY int, color Color)

// Draw line within an image (Vector version)
pub fn C.ImageDrawLineV(dst &Image, start Vector2, end Vector2, color Color)

// Draw a filled circle within an image
pub fn C.ImageDrawCircle(dst &Image, centerX int, centerY int, radius int, color Color)

// Draw a filled circle within an image (Vector version)
pub fn C.ImageDrawCircleV(dst &Image, center Vector2, radius int, color Color)

// Draw circle outline within an image
pub fn C.ImageDrawCircleLines(dst &Image, centerX int, centerY int, radius int, color Color)

// Draw circle outline within an image (Vector version)
pub fn C.ImageDrawCircleLinesV(dst &Image, center Vector2, radius int, color Color)

// Draw rectangle within an image
pub fn C.ImageDrawRectangle(dst &Image, posX int, posY int, width int, height int, color Color)

// Draw rectangle within an image (Vector version)
pub fn C.ImageDrawRectangleV(dst &Image, position Vector2, size Vector2, color Color)

// Draw rectangle within an image
pub fn C.ImageDrawRectangleRec(dst &Image, rec Rectangle, color Color)

// Draw rectangle lines within an image
pub fn C.ImageDrawRectangleLines(dst &Image, rec Rectangle, thick int, color Color)

// Draw a source image within a destination image (tint applied to source)
pub fn C.ImageDraw(dst &Image, src Image, srcRec Rectangle, dstRec Rectangle, tint Color)

// Draw text (using default font) within an image (destination)
pub fn C.ImageDrawText(dst &Image, const_text &char, posX int, posY int, fontSize int, color Color)

// Draw text (custom sprite font) within an image (destination)
pub fn C.ImageDrawTextEx(dst &Image, font Font, const_text &char, position Vector2, fontSize f32, spacing f32, tint Color)

// Texture loading functions
// NOTE: These functions require GPU access

// Load texture from file into GPU memory (VRAM)
pub fn C.LoadTexture(const_fileName &char) Texture2D

// Load texture from image data
pub fn C.LoadTextureFromImage(image Image) Texture2D

// Load cubemap from image, multiple image cubemap layouts supported
pub fn C.LoadTextureCubemap(image Image, layout int) TextureCubemap

// Load texture for rendering (framebuffer)
pub fn C.LoadRenderTexture(width int, height int) RenderTexture2D

// Check if a texture is ready
pub fn C.IsTextureReady(texture Texture2D) bool

// Unload texture from GPU memory (VRAM)
pub fn C.UnloadTexture(texture Texture2D)

// Check if a render texture is ready
pub fn C.IsRenderTextureReady(target RenderTexture2D) bool

// Unload render texture from GPU memory (VRAM)
pub fn C.UnloadRenderTexture(target RenderTexture2D)

// Update GPU texture with new data
pub fn C.UpdateTexture(texture Texture2D, const_pixels voidptr)

// Update GPU texture rectangle with new data
pub fn C.UpdateTextureRec(texture Texture2D, rec Rectangle, const_pixels voidptr)

// Texture configuration functions

// Generate GPU mipmaps for a texture
pub fn C.GenTextureMipmaps(texture &Texture2D)

// Set texture scaling filter mode
pub fn C.SetTextureFilter(texture Texture2D, filter int)

// Set texture wrapping mode
pub fn C.SetTextureWrap(texture Texture2D, wrap int)

// Texture drawing functions

// Draw a Texture2D
pub fn C.DrawTexture(texture Texture2D, posX int, posY int, tint Color)

// Draw a Texture2D with position defined as Vector2
pub fn C.DrawTextureV(texture Texture2D, position Vector2, tint Color)

// Draw a Texture2D with extended parameters
pub fn C.DrawTextureEx(texture Texture2D, position Vector2, rotation f32, f32 scale, tint Color)

// Draw a part of a texture defined by a rectangle
pub fn C.DrawTextureRec(texture Texture2D, source Rectangle, position Vector2, tint Color)

// Draw a part of a texture defined by a rectangle with 'pro' parameters
pub fn C.DrawTexturePro(texture Texture2D, source Rectangle, dest Rectangle, origin Vector2, rotation f32, tint Color)

// Draws a texture (or part of it) that stretches or shrinks nicely
pub fn C.DrawTextureNPatch(texture Texture2D, nPatchInfo NPatchInfo, dest Rectangle, origin Vector2, rotation f32, tint Color)

// Color/pixel related functions

// Get color with alpha applied, alpha goes from 0.0f to 1.0f
pub fn C.Fade(color Color, alpha f32) Color

// Get hexadecimal value for a Color
pub fn C.ColorToInt(color Color) int

// Get Color normalized as f32 [0..1]
pub fn C.ColorNormalize(color Color) Vector4

// Get Color from normalized values [0..1]
pub fn C.ColorFromNormalized(normalized Vector4) Color

// Get HSV values for a Color, hue [0..360], saturation/value [0..1]
pub fn C.ColorToHSV(color Color) Vector3

// Get a Color from HSV values, hue [0..360], saturation/value [0..1]
pub fn C.ColorFromHSV(hue f32, saturation f32, value f32) Color

// Get color multiplied with another color
pub fn C.ColorTint(color Color, tint Color) Color

// Get color with brightness correction, brightness factor goes from -1.0f to 1.0f
pub fn C.ColorBrightness(color Color, factor f32) Color

// Get color with contrast correction, contrast values between -1.0f and 1.0f
pub fn C.ColorContrast(color Color, contrast f32) Color

// Get color with alpha applied, alpha goes from 0.0f to 1.0f
pub fn C.ColorAlpha(color Color, alpha f32) Color

// Get src alpha-blended into dst color with tint
pub fn C.ColorAlphaBlend(dst Color, src Color, tint Color) Color

// Get Color structure from hexadecimal value
pub fn C.GetColor(hexValue u32) Color

// Get Color from a source pixel pointer of certain format
pub fn C.GetPixelColor(srcPtr voidptr, format int) Color

// Set color formatted into destination pixel pointer
pub fn C.SetPixelColor(dstPtr voidptr, color Color, format int)

// Get pixel data size in bytes for certain format
pub fn C.GetPixelDataSize(width int, height int, format int) int

// Get the default Font
pub fn C.GetFontDefault() Font

// Load font from file into GPU memory (VRAM)
pub fn C.LoadFont(const_fileName &char) Font

// Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set
pub fn C.LoadFontEx(const_fileName &char, fontSize int, codepoints &int, codepointCount int) Font

// Load font from Image (XNA style)
pub fn C.LoadFontFromImage(image Image, key Color, firstChar int) Font

// Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
pub fn C.LoadFontFromMemory(const_fileType &char, const_fileData &u8, dataSize int, fontSize int, codepoints &int, codepointCount int) Font

// Check if a font is ready
pub fn C.IsFontReady(font Font) bool

// Load font data for further use
pub fn C.LoadFontData(const_fileData &u8, dataSize int, fontSize int, codepoints &int, codepointCount int, type, int) &GlyphInfo

// Generate image font atlas using chars info
pub fn C.GenImageFontAtlas(const_glyphs &GlyphInfo, glyphRecs &&Rectangle, glyphCount int, fontSize int, padding int, packMethod int) Image

// Unload font chars info data (RAM)
pub fn C.UnloadFontData(glyphs &GlyphInfo, glyphCount int)

// Unload font from GPU memory (VRAM)
pub fn C.UnloadFont(font Font)

// Export font as code file, returns true on success
pub fn C.ExportFontAsCode(font Font, const_fileName &char) bool

//------------------------------------------------------------------------------------
// Font Loading and Text Drawing Functions (Module: text)
//------------------------------------------------------------------------------------

// Font loading/unloading functions

// Text drawing functions

// Draw current FPS
pub fn C.DrawFPS(posX int, posY int)

// Draw text (using default font)
pub fn C.DrawText(const_text &char, posX int, posY int, fontSize int, color Color)

// Draw text using font and additional parameters
pub fn C.DrawTextEx(font Font, const_text &char, position Vector2, fontSize f32, spacing f32, tint Color)

// Draw text using Font and pro parameters (rotation)
pub fn C.DrawTextPro(font Font, const_text &char, position Vector2, origin Vector2, rotation f32, fontSize f32, spacing f32, tint Color)

// Draw one character (codepoint)
pub fn C.DrawTextCodepoint(font Font, codepoint int, position Vector2, fontSize f32, tint Color)

// Draw multiple character (codepoint)
pub fn C.DrawTextCodepoints(font Font, const_codepoints &int, codepointCount int, position Vector2, fontSize f32, spacing f32, tint Color)

// Text font info functions

// Set vertical line spacing when drawing with line-breaks
pub fn C.SetTextLineSpacing(spacing int)

// Measure string width for default font
pub fn C.MeasureText(const_text &char, fontSize int) int

// Measure string size for Font
pub fn C.MeasureTextEx(font Font, const_text &char, fontSize f32, spacing f32) Vector2

// Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
pub fn C.GetGlyphIndex(font Font, codepoint int) int

// Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
pub fn C.GetGlyphInfo(font Font, codepoint int) GlyphInfo

// Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
pub fn C.GetGlyphAtlasRec(font Font, codepoint int) Rectangle

// Text codepoints management functions (unicode characters)

// Load UTF-8 text encoded from codepoints array
pub fn C.LoadUTF8(const_codepoints &int, length int) &char

// Unload UTF-8 text encoded from codepoints array
pub fn C.UnloadUTF8(text &char)

// Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
pub fn C.LoadCodepoints(const_text &char, count &int) &int

// Unload codepoints data from memory
pub fn C.UnloadCodepoints(codepoints &int)

// Get total number of codepoints in a UTF-8 encoded string
pub fn C.GetCodepointCount(const_text &char) int

// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
pub fn C.GetCodepoint(const_text &char, codepointSize &int) int

// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
pub fn C.GetCodepointNext(const_text &char, codepointSize &int) int

// Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
pub fn C.GetCodepointPrevious(const_text &char, codepointSize &int) int

// Encode one codepoint into UTF-8 byte array (array length returned as parameter)
pub fn C.CodepointToUTF8(codepoint int, utf8Size &int) &char

// Text strings management functions (no UTF-8 strings, only byte chars)
// NOTE: Some strings allocate memory internally for returned strings, just be careful!

// Copy one string to another, returns bytes copied
pub fn C.TextCopy(dst &char, const_src &char) int

// Check if two text string are equal
pub fn C.TextIsEqual(const_text1 &char, const_text2 &char) bool

// Get text length, checks for '\0' ending
pub fn C.TextLength(const_text &char) u32

// Text formatting with variables (sprintf() style)
pub fn C.TextFormat(const_text &char, ...) &char

// Get a piece of a text string
pub fn C.TextSubtext(const_text &char, position int, length int) &char

// Replace text string (WARNING: memory must be freed!)
pub fn C.TextReplace(text &char, const_replace &char, const_by &char) &char

// Insert text in a position (WARNING: memory must be freed!)
pub fn C.TextInsert(const_text &char, const_insert &char, position int) &char

// Join text strings with delimiter
pub fn C.TextJoin(const_textList &&char, count int, const_delimiter &char) &char

// Split text into multiple strings
pub fn C.TextSplit(const_text &char, delimiter char, count &int) &&char

// Append text at specific position and move cursor!
pub fn C.TextAppend(text &char, const_append &char, position &int)

// Find first text occurrence within a string
pub fn C.TextFindIndex(const_text &char, const_find &char) int

// Get upper case version of provided string
pub fn C.TextToUpper(const_text &char) &char

// Get lower case version of provided string
pub fn C.TextToLower(const_text &char) &char

// Get Pascal case notation version of provided string
pub fn C.TextToPascal(const_text &char) &char

// Get integer value from text (negative values not supported)
pub fn C.TextToInteger(const_text &char) int

//------------------------------------------------------------------------------------
// Basic 3d Shapes Drawing Functions (Module: models)
//------------------------------------------------------------------------------------

// Basic geometric 3D shapes drawing functions

// Draw a line in 3D world space
pub fn C.DrawLine3D(startPos Vector3, endPos Vector3, color Color)

// Draw a point in 3D space, actually a small line
pub fn C.DrawPoint3D(position Vector3, color Color)

// Draw a circle in 3D world space
pub fn C.DrawCircle3D(center Vector3, radius f32, rotationAxis Vector3, f32 rotationAngle, color Color)

// Draw a color-filled triangle (vertex in counter-clockwise order!)
pub fn C.DrawTriangle3D(v1 Vector3, v2 Vector3, v3 Vector3, color Color)

// Draw a triangle strip defined by points
pub fn C.DrawTriangleStrip3D(points &Vector3, pointCount int, color Color)

// Draw cube
pub fn C.DrawCube(position Vector3, width f32, height f32, length f32, color Color)

// Draw cube (Vector version)
pub fn C.DrawCubeV(position Vector3, size Vector3, color Color)

// Draw cube wires
pub fn C.DrawCubeWires(position Vector3, width f32, height f32, length f32, color Color)

// Draw cube wires (Vector version)
pub fn C.DrawCubeWiresV(position Vector3, size Vector3, color Color)

// Draw sphere
pub fn C.DrawSphere(centerPos Vector3, radius f32, color Color)

// Draw sphere with extended parameters
pub fn C.DrawSphereEx(centerPos Vector3, radius f32, rings int, slices int, color Color)

// Draw sphere wires
pub fn C.DrawSphereWires(centerPos Vector3, radius f32, rings int, slices int, color Color)

// Draw a cylinder/cone
pub fn C.DrawCylinder(position Vector3, radiusTop f32, radiusBottom f32, height f32, slices int, color Color)

// Draw a cylinder with base at startPos and top at endPos
pub fn C.DrawCylinderEx(startPos Vector3, endPos Vector3, startRadius f32, endRadius f32, sides int, color Color)

// Draw a cylinder/cone wires
pub fn C.DrawCylinderWires(position Vector3, radiusTop f32, radiusBottom f32, height f32, slices int, color Color)

// Draw a cylinder wires with base at startPos and top at endPos
pub fn C.DrawCylinderWiresEx(startPos Vector3, endPos Vector3, startRadius f32, endRadius f32, sides int, color Color)

// Draw a capsule with the center of its sphere caps at startPos and endPos
pub fn C.DrawCapsule(startPos Vector3, endPos Vector3, radius f32, slices int, rings int, color Color)

// Draw capsule wireframe with the center of its sphere caps at startPos and endPos
pub fn C.DrawCapsuleWires(startPos Vector3, endPos Vector3, radius f32, slices int, rings int, color Color)

// Draw a plane XZ
pub fn C.DrawPlane(centerPos Vector3, size Vector2, color Color)

// Draw a ray line
pub fn C.DrawRay(ray Ray, color Color)

// Draw a grid (centered at (0, 0, 0))
pub fn C.DrawGrid(slices int, spacing f32)

//------------------------------------------------------------------------------------
// Model 3d Loading and Drawing Functions (Module: models)
//------------------------------------------------------------------------------------

// Model management functions

// Load model from files (meshes and materials)
pub fn C.LoadModel(const_fileName &char) Model

// Load model from generated mesh (default material)
pub fn C.LoadModelFromMesh(mesh Mesh) Model

// Check if a model is ready
pub fn C.IsModelReady(model Model) bool

// Unload model (including meshes) from memory (RAM and/or VRAM)
pub fn C.UnloadModel(model Model)

// Compute model bounding box limits (considers all meshes)
pub fn C.GetModelBoundingBox(model Model) BoundingBox

// Model drawing functions

// Draw a model (with texture if set)
pub fn C.DrawModel(model Model, position Vector3, scale f32, tint Color)

// Draw a model with extended parameters
pub fn C.DrawModelEx(model Model, position Vector3, rotationAxis Vector3, rotationAngle f32, scale Vector3, tint Color)

// Draw a model wires (with texture if set)
pub fn C.DrawModelWires(model Model, position Vector3, scale f32, tint Color)

// Draw a model wires (with texture if set) with extended parameters
pub fn C.DrawBoundingBox(box BoundingBox, color Color)

// Draw bounding box (wires)
pub fn C.DrawModelWiresEx(model Model, position Vector3, rotationAxis Vector3, rotationAngle f32, scale Vector3, tint Color)

// Draw a billboard texture
pub fn C.DrawBillboard(camera Camera, texture Texture2D, position Vector3, f32 size, tint Color)

// Draw a billboard texture defined by source
pub fn C.DrawBillboardRec(camera Camera, texture Texture2D, source Rectangle, position Vector3, size Vector2, tint Color)

// Draw a billboard texture defined by source and rotation
pub fn C.DrawBillboardPro(camera Camera, texture Texture2D, source Rectangle, position Vector3, up Vector3, size Vector2, origin Vector2, rotation f32, tint Color)

// Mesh management functions

// Upload mesh vertex data in GPU and provide VAO/VBO ids
pub fn C.UploadMesh(mesh &Mesh, dynamic bool)

// Update mesh vertex data in GPU for a specific buffer index
pub fn C.UpdateMeshBuffer(mesh Mesh, index int, const_data voidptr, dataSize int, offset int)

// Unload mesh data from CPU and GPU
pub fn C.UnloadMesh(mesh Mesh)

// Draw a 3d mesh with material and transform
pub fn C.DrawMesh(mesh Mesh, material Material, Matrix transform)

// Draw multiple mesh instances with material and different transforms
pub fn C.DrawMeshInstanced(mesh Mesh, material Material, const_transforms &Matrix, instances int)

// Export mesh data to file, returns true on success
pub fn C.ExportMesh(mesh Mesh, const_fileName &char) bool

// Compute mesh bounding box limits
pub fn C.GetMeshBoundingBox(mesh Mesh) BoundingBox

// Compute mesh tangents
pub fn C.GenMeshTangents(mesh &Mesh)

// Mesh generation functions

// Generate polygonal mesh
pub fn C.GenMeshPoly(sides int, radius f32) Mesh

// Generate plane mesh (with subdivisions)
pub fn C.GenMeshPlane(width f32, length f32, resX int, resZ int) Mesh

// Generate cuboid mesh
pub fn C.GenMeshCube(width f32, height f32, length f32) Mesh

// Generate sphere mesh (standard sphere)
pub fn C.GenMeshSphere(radius f32, rings int, slices int) Mesh

// Generate half-sphere mesh (no bottom cap)
pub fn C.GenMeshHemiSphere(radius f32, rings int, slices int) Mesh

// Generate cylinder mesh
pub fn C.GenMeshCylinder(radius f32, height f32, slices int) Mesh

// Generate cone/pyramid mesh
pub fn C.GenMeshCone(radius f32, height f32, slices int) Mesh

// Generate torus mesh
pub fn C.GenMeshTorus(radius f32, size f32, radSeg int, sides int) Mesh

// Generate trefoil knot mesh
pub fn C.GenMeshKnot(radius f32, size f32, radSeg int, sides int) Mesh

// Generate heightmap mesh from image data
pub fn C.GenMeshHeightmap(heightmap Image, size Vector3) Mesh

// Generate cubes-based map mesh from image data
pub fn C.GenMeshCubicmap(cubicmap Image, cubeSize Vector3) Mesh

// Material loading/unloading functions

// Load materials from model file
pub fn C.LoadMaterials(const_fileName &char, materialCount &int) &Material

// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
pub fn C.LoadMaterialDefault() Material

// Check if a material is ready
pub fn C.IsMaterialReady(material Material) bool

// Unload material from GPU memory (VRAM)
pub fn C.UnloadMaterial(material Material)

// Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
pub fn C.SetMaterialTexture(material &Materal, mapType int, texture Texture2D)

// Set material for a mesh
pub fn C.SetModelMeshMaterial(model &Model, meshId int, materialId int)

// Model animations loading/unloading functions

// Load model animations from file
pub fn C.LoadModelAnimations(const_fileName &char, animCount &int) &ModelAnimation

// Update model animation pose
pub fn C.UpdateModelAnimation(model Model, anim ModelAnimation, frame int)

// Unload animation data
pub fn C.UnloadModelAnimation(anim ModelAnimation)

// Unload animation array data
pub fn C.UnloadModelAnimations(animations &ModelAnimation, animCount int)

// Check model animation skeleton match
pub fn C.IsModelAnimationValid(model Model, anim ModelAnimation) bool

// Collision detection functions

// Check collision between two spheres
pub fn C.CheckCollisionSpheres(center1 Vector3, radius1 f32, center2 Vector3, radius2 f32) bool

// Check collision between two bounding boxes
pub fn C.CheckCollisionBoxes(box1 BoundingBox, box2 BoundingBox) bool

// Check collision between box and sphere
pub fn C.CheckCollisionBoxSphere(box BoundingBox, center Vector3, radius f32) bool

// Get collision info between ray and sphere
pub fn C.GetRayCollisionSphere(ray Ray, center Vector3, radius f32) RayCollision

// Get collision info between ray and box
pub fn C.GetRayCollisionBox(ray Ray, box BoundingBox) RayCollision

// Get collision info between ray and mesh
pub fn C.GetRayCollisionMesh(ray Ray, mesh Mesh, transform Matrix) RayCollision

// Get collision info between ray and triangle
pub fn C.GetRayCollisionTriangle(ray Ray, p1 Vector3, p2 Vector3, p3 Vector3) RayCollision

// Get collision info between ray and quad
pub fn C.GetRayCollisionQuad(ray Ray, p1 Vector3, p2 Vector3, p3 Vector3, p4 Vector3) RayCollision

//------------------------------------------------------------------------------------
// Audio Loading and Playing Functions (Module: audio)
//------------------------------------------------------------------------------------
pub type FnAudioCallback = fn (bufferData voidptr, frames u32)

// Audio device management functions

// Initialize audio device and context
pub fn C.InitAudioDevice()

// Close the audio device and context
pub fn C.CloseAudioDevice()

// Check if audio device has been initialized successfully
pub fn C.IsAudioDeviceReady() bool

// Set master volume (listener)
pub fn C.SetMasterVolume(volume f32)

// Get master volume (listener)
pub fn C.GetMasterVolume() f32

// Wave/Sound loading/unloading functions

// Load wave data from file
pub fn C.LoadWave(const_fileName &char) Wave

// Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
pub fn C.LoadWaveFromMemory(const_fileType, &char, const_fileData &u8, dataSize int) Wave

// Checks if wave data is ready
pub fn C.IsWaveReady(wave Wave) bool

// Load sound from file
pub fn C.LoadSound(const_fileName &char) Sound

// Load sound from wave data
pub fn C.LoadSoundFromWave(wave Wave) Sound

// Create a new sound that shares the same sample data as the source sound, does not own the sound data
pub fn C.LoadSoundAlias(source Sound) Sound

// Checks if a sound is ready
pub fn C.IsSoundReady(sound Sound) bool

// Update sound buffer with new data
pub fn C.UpdateSound(sound Sound, constdata voidptr, int sampleCount)

// Unload wave data
pub fn C.UnloadWave(wave Wave)

// Unload sound
pub fn C.UnloadSound(sound Sound)

// Unload a sound alias (does not deallocate sample data)
pub fn C.UnloadSoundAlias(Sound alias)

// Export wave data to file, returns true on success
pub fn C.ExportWave(wave Wave, const_fileName &char) bool

// Export wave sample data to code (.h), returns true on success
pub fn C.ExportWaveAsCode(wave Wave, const_fileName &char) bool

// Wave/Sound management functions

// Play a sound
pub fn C.PlaySound(sound Sound)

// Stop playing a sound
pub fn C.StopSound(sound Sound)

// Pause a sound
pub fn C.PauseSound(sound Sound)

// Resume a paused sound
pub fn C.ResumeSound(sound Sound)

// Check if a sound is currently playing
pub fn C.IsSoundPlaying(sound Sound) bool

// Set volume for a sound (1.0 is max level)
pub fn C.SetSoundVolume(sound Sound, volume f32)

// Set pitch for a sound (1.0 is base level)
pub fn C.SetSoundPitch(sound Sound, pitch f32)

// Set pan for a sound (0.5 is center)
pub fn C.SetSoundPan(sound Sound, pan f32)

// Copy a wave to a new wave
pub fn C.WaveCopy(wave Wave) Wave

// Crop a wave to defined samples range
pub fn C.WaveCrop(wave &Wave, int initSample, int finalSample)

// Convert wave data to desired format
pub fn C.WaveFormat(wave &Wave, int sampleRate, int sampleSize, int channels)

// Load samples data from wave as a 32bit f32 data array
pub fn C.LoadWaveSamples(wave Wave) &f32

// Unload samples data loaded with LoadWaveSamples()
pub fn C.UnloadWaveSamples(samples &f32)

// Music management functions

// Load music stream from file
pub fn C.LoadMusicStream(const_fileName &char) Music

// Load music stream from data
pub fn C.LoadMusicStreamFromMemory(const_fileType &char, const_data &u8, dataSize int) Music

// Checks if a music stream is ready
pub fn C.IsMusicReady(music Music) bool

// Unload music stream
pub fn C.UnloadMusicStream(music Music)

// Start music playing
pub fn C.PlayMusicStream(music Music)

// Check if music is playing
pub fn C.IsMusicStreamPlaying(music Music) bool

// Updates buffers for music streaming
pub fn C.UpdateMusicStream(music Music)

// Stop music playing
pub fn C.StopMusicStream(music Music)

// Pause music playing
pub fn C.PauseMusicStream(music Music)

// Resume playing paused music
pub fn C.ResumeMusicStream(music Music)

// Seek music to a position (in seconds)
pub fn C.SeekMusicStream(music Music, position f32)

// Set volume for music (1.0 is max level)
pub fn C.SetMusicVolume(music Music, volume f32)

// Set pitch for a music (1.0 is base level)
pub fn C.SetMusicPitch(music Music, pitch f32)

// Set pan for a music (0.5 is center)
pub fn C.SetMusicPan(music Music, pan f32)

// Get music time length (in seconds)
pub fn C.GetMusicTimeLength(music Music) f32

// Get current music time played (in seconds)
pub fn C.GetMusicTimePlayed(music Music) f32

// AudioStream management functions

// Load audio stream (to stream raw audio pcm data)
pub fn C.LoadAudioStream(sampleRate u32, sampleSize u32, channels u32) AudioStream

// Checks if an audio stream is ready
pub fn C.IsAudioStreamReady(stream AudioStream) bool

// Unload audio stream and free memory
pub fn C.UnloadAudioStream(stream AudioStream)

// Update audio stream buffers with data
pub fn C.UpdateAudioStream(stream AudioStream, const_data voidptr, frameCount int)

// Check if any audio stream buffers requires refill
pub fn C.IsAudioStreamProcessed(stream AudioStream) bool

// Play audio stream
pub fn C.PlayAudioStream(stream AudioStream)

// Pause audio stream
pub fn C.PauseAudioStream(stream AudioStream)

// Resume audio stream
pub fn C.ResumeAudioStream(stream AudioStream)

// Check if audio stream is playing
pub fn C.IsAudioStreamPlaying(stream AudioStream) bool

// Stop audio stream
pub fn C.StopAudioStream(stream AudioStream)

// Set volume for audio stream (1.0 is max level)
pub fn C.SetAudioStreamVolume(stream AudioStream, volume f32)

// Set pitch for audio stream (1.0 is base level)
pub fn C.SetAudioStreamPitch(stream AudioStream, pitch f32)

// Set pan for audio stream (0.5 is centered)
pub fn C.SetAudioStreamPan(stream AudioStream, pan f32)

// Default size for new audio streams
pub fn C.SetAudioStreamBufferSizeDefault(size int)

// Audio thread callback to request new data
pub fn C.SetAudioStreamCallback(stream AudioStream, callback AudioCallback)

// Attach audio stream processor to stream, receives the samples as <f32>s
pub fn C.AttachAudioStreamProcessor(stream AudioStream, processor AudioCallback)

// Detach audio stream processor from stream
pub fn C.DetachAudioStreamProcessor(stream AudioStream, processor AudioCallback)

// Attach audio stream processor to the entire audio pipeline, receives the samples as <f32>s
pub fn C.AttachAudioMixedProcessor(processor AudioCallback)

// Detach audio stream processor from the entire audio pipeline
pub fn C.DetachAudioMixedProcessor(processor AudioCallback)

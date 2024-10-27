module raylib

// NOTE: Helper types to be used instead of array return types for *ToFloat functions

@[typedef]
struct C.float3 {
pub mut:
	v [3]f32
}

pub type Float3 = C.float3

@[typedef]
struct C.float16 {
pub mut:
	v [16]f32
}

pub type Float16 = C.float16

//----------------------------------------------------------------------------------
// Module Functions Definition - Utils math
//----------------------------------------------------------------------------------

// Clamp value f32
fn C.Clamp(value f32, min f32, max f32) f32

// Calculate linear interpolation between two floats
fn C.Lerp(start f32, end f32, amount f32) f32

// Normalize input value within input range
fn C.Normalize(value f32, start f32, end f32) f32

// Remap input value within input range to output range
fn C.Remap(value f32, inputStart f32, inputEnd f32, outputStart f32, outputEnd f32) f32

// Wrap input value from min to max
fn C.Wrap(value f32, min f32, max f32) f32

// Check whether two given floats are almost equal
fn C.FloatEquals(x f32, y f32) int

//----------------------------------------------------------------------------------
// Module Functions Definition - Vector2 math
//----------------------------------------------------------------------------------

// Vector with components value 0.0f
fn C.Vector2Zero() Vector2

// Vector with components value 1.0f
fn C.Vector2One() Vector2

// Add two vectors (v1 + v2)
fn C.Vector2Add(v1 Vector2, v2 Vector2) Vector2

// Add vector and value f32
fn C.Vector2AddValue(v Vector2, add f32) Vector2

// Subtract two vectors (v1 - v2)
fn C.Vector2Subtract(v1 Vector2, v2 Vector2) Vector2

// Subtract vector by value f32
fn C.Vector2SubtractValue(v Vector2, sub f32) Vector2

// Calculate vector length
fn C.Vector2Length(v Vector2) f32

// Calculate vector square length
fn C.Vector2LengthSqr(v Vector2) f32

// Calculate two vectors dot product
fn C.Vector2DotProduct(v1 Vector2, v2 Vector2) f32

// Calculate distance between two vectors
fn C.Vector2Distance(v1 Vector2, v2 Vector2) f32

// Calculate square distance between two vectors
fn C.Vector2DistanceSqr(v1 Vector2, v2 Vector2) f32

// Calculate angle between two vectors
// NOTE: Angle is calculated from origin point (0, 0)
fn C.Vector2Angle(v1 Vector2, v2 Vector2) f32

// Calculate angle defined by a two vectors line
// NOTE: Parameters need to be normalized
// Current implementation should be aligned with glm::angle
fn C.Vector2LineAngle(start Vector2, end Vector2) f32

// Scale vector (multiply by value)
fn C.Vector2Scale(v Vector2, scale f32) Vector2

// Multiply vector by vector
fn C.Vector2Multiply(v1 Vector2, v2 Vector2) Vector2

// Negate vector
fn C.Vector2Negate(v Vector2) Vector2

// Divide vector by vector
fn C.Vector2Divide(v1 Vector2, v2 Vector2) Vector2

// Normalize provided vector
fn C.Vector2Normalize(v Vector2) Vector2

// Transforms a Vector2 by a given Matrix
fn C.Vector2Transform(v Vector2, mat Matrix) Vector2

// Calculate linear interpolation between two vectors
fn C.Vector2Lerp(v1 Vector2, v2 Vector2, amount f32) Vector2

// Calculate reflected vector to normal
fn C.Vector2Reflect(v Vector2, normal Vector2) Vector2

// Rotate vector by angle
fn C.Vector2Rotate(v Vector2, angle f32) Vector2

// Move Vector towards target
fn C.Vector2MoveTowards(v Vector2, target Vector2, maxDistance f32) Vector2

// Invert the given vector
fn C.Vector2Invert(v Vector2) Vector2

// Clamp the components of the vector between
// min and max values specified by the given vectors
fn C.Vector2Clamp(v Vector2, min Vector2, max Vector2) Vector2

// Clamp the magnitude of the vector between two min and max values
fn C.Vector2ClampValue(v Vector2, min f32, max f32) Vector2

// Check whether two given vectors are almost equal
fn C.Vector2Equals(p Vector2, q Vector2) int

//----------------------------------------------------------------------------------
// Module Functions Definition - Vector3 math
//----------------------------------------------------------------------------------

// Vector with components value 0.0f
fn C.Vector3Zero() Vector3

// Vector with components value 1.0f
fn C.Vector3One() Vector3

// Add two vectors
fn C.Vector3Add(v1 Vector3, v2 Vector3) Vector3

// Add vector and value f32
fn C.Vector3AddValue(v Vector3, add f32) Vector3

// Subtract two vectors
fn C.Vector3Subtract(v1 Vector3, v2 Vector3) Vector3

// Subtract vector by value f32
fn C.Vector3SubtractValue(v Vector3, sub f32) Vector3

// Multiply vector by scalar
fn C.Vector3Scale(v Vector3, scalar f32) Vector3

// Multiply vector by vector
fn C.Vector3Multiply(v1 Vector3, v2 Vector3) Vector3

// Calculate two vectors cross product
fn C.Vector3CrossProduct(v1 Vector3, v2 Vector3) Vector3

// Calculate one vector perpendicular vector
fn C.Vector3Perpendicular(v Vector3) Vector3

// Calculate vector length
fn C.Vector3Length(const_v Vector3) f32

// Calculate vector square length
fn C.Vector3LengthSqr(const_v Vector3) f32

// Calculate two vectors dot product
fn C.Vector3DotProduct(v1 Vector3, v2 Vector3) f32

// Calculate distance between two vectors
fn C.Vector3Distance(v1 Vector3, v2 Vector3) f32

// Calculate square distance between two vectors
fn C.Vector3DistanceSqr(v1 Vector3, v2 Vector3) f32

// Calculate angle between two vectors
fn C.Vector3Angle(v1 Vector3, v2 Vector3) f32

// Negate provided vector (invert direction)
fn C.Vector3Negate(v Vector3) Vector3

// Divide vector by vector
fn C.Vector3Divide(v1 Vector3, v2 Vector3) Vector3

// Normalize provided vector
fn C.Vector3Normalize(v Vector3) Vector3

// Calculate the projection of the vector v1 on to v2
fn C.Vector3Project(v1 Vector3, v2 Vector3) Vector3

// Calculate the rejection of the vector v1 on to v2
fn C.Vector3Reject(v1 Vector3, v2 Vector3) Vector3

// Orthonormalize provided vectors
// Makes vectors normalized and orthogonal to each other
// Gram-Schmidt function implementation
fn C.Vector3OrthoNormalize(v1 &Vector3, v2 &Vector3)

// Transforms a Vector3 by a given Matrix
fn C.Vector3Transform(v Vector3, mat Matrix) Vector3

// Transform a vector by quaternion rotation
fn C.Vector3RotateByQuaternion(v Vector3, q Quaternion) Vector3

// Rotates a vector around an axis
fn C.Vector3RotateByAxisAngle(v Vector3, axis Vector3, angle f32) Vector3

// Calculate linear interpolation between two vectors
fn C.Vector3Lerp(v1 Vector3, v2 Vector3, amount f32) Vector3

// Calculate reflected vector to normal
fn C.Vector3Reflect(v Vector3, Vector3 normal) Vector3

// Get min value for each pair of components
fn C.Vector3Min(v1 Vector3, v2 Vector3) Vector3

// Get max value for each pair of components
fn C.Vector3Max(v1 Vector3, v2 Vector3) Vector3

// Compute barycenter coordinates (u, v, w) for point p with respect to triangle (a, b, c)
// NOTE: Assumes P is on the plane of the triangle
fn C.Vector3Barycenter(p Vector3, a Vector3, b Vector3, c Vector3) Vector3

// Projects a Vector3 from screen space into object space
// NOTE: We are avoiding calling other raymath functions despite available
fn C.Vector3Unproject(source Vector3, projection Matrix, view Matrix) Vector3

// Get Vector3 as f32 array
fn C.Vector3ToFloatV(v Vector3) Float3

// Invert the given vector
fn C.Vector3Invert(v Vector3) Vector3

// Clamp the components of the vector between
// min and max values specified by the given vectors
fn C.Vector3Clamp(v Vector3, min Vector3, max Vector3) Vector3

// Clamp the magnitude of the vector between two values
fn C.Vector3ClampValue(v Vector3, min f32, max f32) Vector3

// Check whether two given vectors are almost equal
fn C.Vector3Equals(p Vector3, q Vector3) int

// Compute the direction of a refracted ray
// v: normalized direction of the incoming ray
// n: normalized normal vector of the interface of two optical media
// r: ratio of the refractive index of the medium from where the ray comes
//    to the refractive index of the medium on the other side of the surface
fn C.Vector3Refract(v Vector3, n Vector3, r f32) Vector3

//----------------------------------------------------------------------------------
// Module Functions Definition - Matrix math
//----------------------------------------------------------------------------------

// Compute matrix determinant
fn C.MatrixDeterminant(mat Matrix) f32

// Get the trace of the matrix (sum of the values along the diagonal)
fn C.MatrixTrace(mat Matrix) f32

// Transposes provided matrix
fn C.MatrixTranspose(mat Matrix) Matrix

// Invert provided matrix
fn C.MatrixInvert(mat Matrix) Matrix

// Get identity matrix
fn C.MatrixIdentity() Matrix

// Add two matrices
fn C.MatrixAdd(left Matrix, right Matrix) Matrix

// Subtract two matrices (left - right)
fn C.MatrixSubtract(left Matrix, right Matrix) Matrix

// Get two matrix multiplication
// NOTE: When multiplying matrices... the order matters!
fn C.MatrixMultiply(left Matrix, right Matrix) Matrix

// Get translation matrix
fn C.MatrixTranslate(x f32, y f32, z f32) Matrix

// Create rotation matrix from axis and angle
// NOTE: Angle should be provided in radians
fn C.MatrixRotate(axis Vector3, angle f32) Matrix

// Get x-rotation matrix
// NOTE: Angle must be provided in radians
fn C.MatrixRotateX(angle f32) Matrix

// Get y-rotation matrix
// NOTE: Angle must be provided in radians
fn C.MatrixRotateY(angle f32) Matrix

// Get z-rotation matrix
// NOTE: Angle must be provided in radians
fn C.MatrixRotateZ(angle f32) Matrix

// Get xyz-rotation matrix
// NOTE: Angle must be provided in radians
fn C.MatrixRotateXYZ(Vector3 angle) Matrix

// Get zyx-rotation matrix
// NOTE: Angle must be provided in radians
fn C.MatrixRotateZYX(Vector3 angle) Matrix

// Get scaling matrix
fn C.MatrixScale(x f32, y f32, z f32) Matrix

// Get perspective projection matrix
fn C.MatrixFrustum(left f64, right f64, bottom f64, top f64, near f64, far f64) Matrix

// Get perspective projection matrix
// NOTE: Fovy angle must be provided in radians
fn C.MatrixPerspective(fovY f64, aspect f64, nearPlane f64, farPlane f64) Matrix

// Get orthographic projection matrix
fn C.MatrixOrtho(left f64, right f64, bottom f64, top f64, nearPlane f64, farPlane f64) Matrix

// Get camera look-at matrix (view matrix)
fn C.MatrixLookAt(eye Vector3, target Vector3, up Vector3) Matrix

// Get f32 array of matrix data
fn C.MatrixToFloatV(mat Matrix) Float16

//----------------------------------------------------------------------------------
// Module Functions Definition - Quaternion math
//----------------------------------------------------------------------------------

// Add two quaternions
fn C.QuaternionAdd(q1 Quaternion, q2 Quaternion) Quaternion

// Add quaternion and value f32
fn C.QuaternionAddValue(q Quaternion, add f32) Quaternion

// Subtract two quaternions
fn C.QuaternionSubtract(q1 Quaternion, q2 Quaternion) Quaternion

// Subtract quaternion and value f32
fn C.QuaternionSubtractValue(q Quaternion, sub f32) Quaternion

// Get identity quaternion
fn C.QuaternionIdentity() Quaternion

// Computes the length of a quaternion
fn C.QuaternionLength(q Quaternion) f32

// Normalize provided quaternion
fn C.QuaternionNormalize(q Quaternion) Quaternion

// Invert provided quaternion
fn C.QuaternionInvert(q Quaternion) Quaternion

// Calculate two quaternion multiplication
fn C.QuaternionMultiply(q1 Quaternion, q2 Quaternion) Quaternion

// Scale quaternion by value f32
fn C.QuaternionScale(q Quaternion, mul f32) Quaternion

// Divide two quaternions
fn C.QuaternionDivide(q1 Quaternion, q2 Quaternion) Quaternion

// Calculate linear interpolation between two quaternions
fn C.QuaternionLerp(q1 Quaternion, q2 Quaternion, amount f32) Quaternion

// Calculate slerp-optimized interpolation between two quaternions
fn C.QuaternionNlerp(q1 Quaternion, q2 Quaternion, amount f32) Quaternion

// Calculates spherical linear interpolation between two quaternions
fn C.QuaternionSlerp(q1 Quaternion, q2 Quaternion, amount f32) Quaternion

// Calculate quaternion based on the rotation from one vector to another
fn C.QuaternionFromVector3ToVector3(from Vector3, to Vector3) Quaternion

// Get a quaternion for a given rotation matrix
fn C.QuaternionFromMatrix(mat Matrix) Quaternion

// Get a matrix for a given quaternion
fn C.QuaternionToMatrix(q Quaternion) Matrix

// Get rotation quaternion for an angle and axis
// NOTE: Angle must be provided in radians
fn C.QuaternionFromAxisAngle(axis Vector3, angle f32) Quaternion

// Get the rotation angle and axis for a given quaternion
fn C.QuaternionToAxisAngle(q Quaternion, outAxis &Vector3, outAngle &f32)

// Get the quaternion equivalent to Euler angles
// NOTE: Rotation order is ZYX
fn C.QuaternionFromEuler(pitch f32, yaw f32, roll f32) Quaternion

// Get the Euler angles equivalent to quaternion (roll, pitch, yaw)
// NOTE: Angles are returned in a Vector3 struct in radians
fn C.QuaternionToEuler(q Quaternion) Vector3

// Transform a quaternion given a transformation matrix
fn C.QuaternionTransform(q Quaternion, mat Matrix) Quaternion

// Check whether two given quaternions are almost equal
fn C.QuaternionEquals(p Quaternion, q Quaternion) int

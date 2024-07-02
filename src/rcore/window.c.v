module rcore

import rmath
import rtextures

// Window-related functions
fn C.InitWindow(width int, height int, const_title &char)
fn C.CloseWindow()
fn C.WindowShouldClose() bool
fn C.IsWindowReady() bool
fn C.IsWindowFullscreen() bool
fn C.IsWindowHidden() bool
fn C.IsWindowMinimized() bool
fn C.IsWindowMaximized() bool
fn C.IsWindowFocused() bool
fn C.IsWindowResized() bool
fn C.IsWindowState(flag u32) bool
fn C.SetWindowState(flags u32)
fn C.ClearWindowState(flags u32)
fn C.ToggleFullscreen()
fn C.ToggleBorderlessWindowed()
fn C.MaximizeWindow()
fn C.MinimizeWindow()
fn C.RestoreWindow()
fn C.SetWindowIcon(image rtextures.CImage)
fn C.SetWindowIcons(images &rtextures.CImage, count int)
fn C.SetWindowTitle(const_title &char)
fn C.SetWindowPosition(x int, y int)
fn C.SetWindowMonitor(monitor int)
fn C.SetWindowMinSize(width int, height int)
fn C.SetWindowMaxSize(width int, height int)
fn C.SetWindowSize(width int, height int)
fn C.SetWindowOpacity(opacity f32)
fn C.SetWindowFocused()
fn C.GetWindowHandle() voidptr
fn C.GetScreenWidth() int
fn C.GetScreenHeight() int
fn C.GetRenderWidth() int
fn C.GetRenderHeight() int
fn C.GetMonitorCount() int
fn C.GetCurrentMonitor() int
fn C.GetMonitorPosition(monitor int) rmath.CVector2
fn C.GetMonitorWidth(monitor int) int
fn C.GetMonitorHeight(monitor int) int
fn C.GetMonitorPhysicalWidth(monitor int) int
fn C.GetMonitorPhysicalHeight(monitor int) int
fn C.GetMonitorRefreshRate(monitor int) int
fn C.GetWindowPosition() rmath.CVector2
fn C.GetWindowScaleDPI() rmath.CVector2
fn C.GetMonitorName(monitor int) &char
fn C.SetClipboardText(const_text &char)
fn C.GetClipboardText() &char
fn C.EnableEventWaiting()
fn C.DisableEventWaiting()

// Cursor-related functions
fn C.ShowCursor()
fn C.HideCursor()
fn C.IsCursorHidden() bool
fn C.EnableCursor()
fn C.DisableCursor()
fn C.IsCursorOnScreen() bool

// Drawing-related functions
fn C.ClearBackground(color CColor)
fn C.BeginDrawing()
fn C.EndDrawing()
fn C.BeginMode2D(camera CCamera2D)
fn C.EndMode2D()
fn C.BeginMode3D(camera CCamera3D)
fn C.EndMode3D()
fn C.BeginTextureMode(target CRenderTexture2D)
fn C.EndTextureMode()
fn C.BeginShaderMode(shader CShader)
fn C.EndShaderMode()
fn C.BeginBlendMode(mode int)
fn C.EndBlendMode()
fn C.BeginScissorMode(x int, y int, width int, height int)
fn C.EndScissorMode()
fn C.BeginVrStereoMode(config CVrStereoConfig)
fn C.EndVrStereoMode()

// VR stereo config functions for VR simulator
fn C.LoadVrStereoConfig(device CVrDeviceInfo) CVrStereoConfig
fn C.UnloadVrStereoConfig(config CVrStereoConfig)

// Shader management functions
fn C.LoadShader(const_vsFileName &char, const_fsFileName &char) CShader
fn C.LoadShaderFromMemory(const_vsCode &char, const_fsCode &char) CShader
fn C.IsShaderReady(shader CShader) bool
fn C.GetShaderLocation(shader CShader, const_uniformName &char) int
fn C.GetShaderLocationAttrib(shader CShader, const_attribName &char) int
fn C.SetShaderValue(shader CShader, locIndex int, const_value voidptr, uniformType int)
fn C.SetShaderValueV(shader CShader, locIndex int, const_value voidptr, uniformType int, count int)
fn C.SetShaderValueMatrix(shader CShader, locIndex int, mat CMatrix)
fn C.SetShaderValueTexture(shader CShader, locIndex int, texture Texture2D)
fn C.UnloadShader(shader CShader)

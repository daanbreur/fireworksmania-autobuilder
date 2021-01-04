#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Current := False

; Make a full circle
^+c::
	Loop, 90 {
		DllCall("mouse_event", uint, 1, int, 80, int, 0, uint, 0, int, 0)
		MouseClick, Right
		Sleep, 100
	}
	OpenConnectTool()
	ToggleLeftMouse()
	Loop, 90 {
		DllCall("mouse_event", uint, 1, int, 80, int, 0, uint, 0, int, 0)
		Sleep, 100
	}
	ToggleLeftMouse()
	Return

; Make a half circle
^+s::
	Loop, 45 {
		DllCall("mouse_event", uint, 1, int, 80, int, 0, uint, 0, int, 0)
		MouseClick, Right
		Sleep, 100
	}
	Loop, 45 {
		DllCall("mouse_event", uint, 1, int, -80, int, 0, uint, 0, int, 0)
		Sleep, 100
	}
	OpenConnectTool()
	ToggleLeftMouse()
	Loop, 45 {
		DllCall("mouse_event", uint, 1, int, 80, int, 0, uint, 0, int, 0)
		Sleep, 100
	}
	ToggleLeftMouse()
	Return


; Make a line
^+l::
	Loop, 8 {
		Send, {d down}
		Sleep, 200
		Send, {d up}
		MouseClick, Right
		Sleep, 100
	}
	Loop, 45 {
		DllCall("mouse_event", uint, 1, int, 80, int, 0, uint, 0, int, 0)
		Sleep, 10
	}
	Sleep, 100
	Loop, 8 {
		Send, {d down}
		Sleep, 200
		Send, {d up}
		MouseClick, Right
		Sleep, 100
	}
	OpenConnectTool()
	Return


OpenConnectTool()
{
	Send, {q down}
	MouseClick, Left, 705, 540
	Send, {q up}
}

ToggleLeftMouse()
{
	Current := !Current
	If Current
	{
		Click, down
	}
	Else
	{
		Click, up
	}
}

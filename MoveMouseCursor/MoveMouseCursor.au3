HotKeySet("^!c", "MoveMouseCursor")
HotKeySet("^!q", "Stop")

Func MoveMouseCursor()
	MouseMove(@DesktopWidth/2, @DesktopHeight/2, 5)
EndFunc

Func Stop()
	Exit
EndFunc


While True
	Sleep(3600000)
WEnd

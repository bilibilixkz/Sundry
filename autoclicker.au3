;initialization variables
$Button = "left"
$Delay = 100

;registration hottkeys
HotKeySet("{F5}", "SwitchButton")
HotKeySet("{F6}", "Speedup")
HotKeySet("{F7}", "Slowdown")
HotKeySet("{F8}", "Stop")

TrayTip("Auto Clicker", "Now start clicking left mouse button every 100 milliseconds",  10, 1)
MsgBox(0, "Usage", "Press F5 to switch left/right button" & @LF & "Press F6 to speedup" & @LF & "Press F7 to slow down" & @LF & "Press F8 to Quit")

Func SwitchButton()
	If $Button == "left" Then
		$Button = "right"
		TrayTip("Auto Clicker", "Now clicking right mouse button", 10, 1)
	Else
		$Button = "left"
		TrayTip("Auto Clicker", "Now clicking left mouse button",  10, 1)
	EndIf
EndFunc


Func Speedup()
	$Delay = $Delay + 50
	TrayTip("Auto Clicker", "The interval between clicks is " & $Delay & " milliseconds",  10, 1)
EndFunc

Func Slowdown()
	;ensure delay greater than 50
	if $Delay > 50 Then
	$Delay = $Delay - 50
	EndIf
	TrayTip("Auto Clicker", "The interval between clicks is " & $Delay & " milliseconds",  10, 1)
EndFunc

Func Stop()
	MsgBox(0, "Auto Clicker", "Clicking stoped")
	Exit
EndFunc

While True
	MouseClick($Button)
	Sleep(200)
WEnd




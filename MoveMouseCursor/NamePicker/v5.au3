#include <GUIConstants.au3>
#include <Date.au3>

; ==============================
; Initialization of Configuration and Variables
; ==============================
Local $width = 200, $height = 100, $fontSize = 32
Local $configFilePath = @ScriptDir & "\config.ini"

; Read configuration file (config.ini), attempt to get window width, height, and font size
If FileExists($configFilePath) Then
    Local $aConfigLines = _FileReadToArray($configFilePath)
    If Not @error And UBound($aConfigLines) >= 3 Then
        Local $tempWidth = StringStripWS($aConfigLines[0], 3) ; Strip leading and trailing whitespace
        Local $tempHeight = StringStripWS($aConfigLines[1], 3)
        Local $tempFontSize = StringStripWS($aConfigLines[2], 3)
        $width = Int($tempWidth)
        $height = Int($tempHeight)
        $fontSize = Int($tempFontSize)
    EndIf
EndIf

; Enable Event Mode
AutoItSetOption("GUIOnEventMode", 1)

; ==============================
; Create Main Window (GUI1) - Trigger Button
; ==============================
; Create popup window, borderless, not shown in taskbar ($WS_EX_TOOLWINDOW)
Local $hGUI1 = GUICreate("", $width, $height, 0, 0, $WS_POPUP, $WS_EX_TOOLWINDOW)
Local $hButton1 = GUICtrlCreateButton("随机点名", 0, 0, $width, $height)
  GUICtrlSetFont($hButton1, $fontSize, 0, 0, "", 4) ; Set font and Cleartype antialiasing
GUICtrlSetOnEvent($hButton1, "OnRandomButtonClick") ; Bind click event
GUISetState(@SW_SHOW, $hGUI1)
WinSetOnTop($hGUI1, "", 1) ; Set window to always on top

; ==============================
; Create Result Window (GUI2) - Display Roll Call Result
; ==============================
Global $iWidth2 = 800
Global $iHeight2 = 500
Global $iScreenWidth = @DesktopWidth
Global $iScreenHeight = @DesktopHeight
; Calculate centered coordinates
Global $iX2 = (@DesktopWidth - $iWidth2) / 2
Global $iY2 = (@DesktopHeight - $iHeight2) / 2

Local $hGUI2 = GUICreate("", $iWidth2, $iHeight2, $iX2, $iY2, $WS_POPUP, $WS_EX_TOOLWINDOW)
Local $hLabel2 = GUICtrlCreateLabel("", 0, 0, $iWidth2, $iHeight2)
GUICtrlSetFont($hLabel2, $fontSize, 0, 0, "", 4)
GUICtrlSetStyle($hLabel2, $SS_CENTER, $SS_CENTER) ; Set text alignment to center
Local $hButton2 = GUICtrlCreateButton("确认", 350, 450, 100, 30)
GUICtrlSetOnEvent($hButton2, "OnConfirmButtonClick") ; Bind confirm button event
GUISetState(@SW_HIDE, $hGUI2) ; Initial state is hidden

; Bind window close events
GUISetOnEvent($GUI_EVENT_CLOSE, "OnClose", $hGUI1)
GUISetOnEvent($GUI_EVENT_CLOSE, "OnClose", $hGUI2)

; ==============================
; Main Loop
; ==============================
While True
    Sleep(36000000) ; Sleep for a long time to keep the script running, avoiding unnecessary CPU usage and waiting for events to trigger
WEnd

; Clean up GUI resources on exit
GUIDelete($hGUI1)
GUIDelete($hGUI2)

; ==============================
; Event Handler Functions
; ==============================

; Random roll call button click event
Func OnRandomButtonClick()
    Local $filePath1 = @ScriptDir & "\namelist.txt" ; Name list file path
    Local $filePath2 = @ScriptDir & "\punish.txt"   ; Punishment file path

    ; Read name list file
    If FileExists($filePath1) Then
        $lines1 = _FileReadToArray($filePath1)
        If @error Or UBound($lines1) = 0 Then
            MsgBox(16, "错误", "读取文件 namelist.txt 失败或为空！")
            Return
        EndIf
    Else
        MsgBox(16, "错误", "文件 namelist.txt 不存在！")
        Return
    EndIf

    ; Read punishment file (if exist)
    If FileExists($filePath2) Then
        $lines2 = _FileReadToArray($filePath2)
        Local $file2unavailable = False
        If @error Or UBound($lines2) = 0 Then
            $lines2 = [""]
            $file2unavailable = True
        EndIf
    Else
        Local $lines2 = [""]
        Local $file2unavailable = True
    EndIf

    ; Randomly select a line by Unix Timestamp (as it is enough)
    Local $randIndex1 = Mod(GetUnixTimestampMs(), UBound($lines1))
    Local $randIndex2 = Mod(GetUnixTimestampMs(), UBound($lines2))
    
    ; "Return" the selected line
    Local $line1 = "点到的人：" & $lines1[$randIndex1]
    If $file2unavailable == False Then
        Local $line2 = "答错惩罚：" & $lines2[$randIndex2]
    Else
        Local $line2 = ""
    EndIf


    ; Display the name and punishment content in the result window
    GUICtrlSetData($hLabel2, @CRLF & @CRLF & @CRLF & @CRLF & $line1 & @CRLF & $line2)
    GUISetState(@SW_SHOW, $hGUI2) ; Show the result window
EndFunc

; Confirm button click event
Func OnConfirmButtonClick()
    GUISetState(@SW_HIDE, $hGUI2) ; Hide the result window
;   GUISetState(@SW_SHOW, $hGUI1) ; Show the main window (not working right now)
EndFunc

; Window close event
Func OnClose()
    Exit ; Exit the script
EndFunc

; ==============================
; Helper Functions
; ==============================

; Custom function: Read file content into an array
Func _FileReadToArray($sFilePath)
    Local $sFileContent = FileRead($sFilePath)
    If @error Then Return SetError(1, 0, 0)
    Local $aAllLines = StringSplit(StringStripCR($sFileContent), @LF, 3)
    Return $aAllLines
EndFunc

; Get Unix timestamp in milliseconds
Func GetUnixTimestampMs()
    Local $tFileTime = DllStructCreate("dword dwLowDateTime;dword dwHighDateTime")
    ; Call Windows API to get system time
    DllCall("kernel32.dll", "none", "GetSystemTimeAsFileTime", "ptr", DllStructGetPtr($tFileTime))

    Local $low = DllStructGetData($tFileTime, "dwLowDateTime")
    Local $high = DllStructGetData($tFileTime, "dwHighDateTime")
    Local $fileTime = $high * 4294967296 + $low

    ; Convert Windows FileTime to Unix Time (milliseconds)
    Local $unixTime100ns = $fileTime - 116444736000000000

    Return Int($unixTime100ns / 10000)
EndFunc

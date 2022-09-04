[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=4b8fde77-daa6-4a6e-84ba-debda215f483
Description=ModifyWindowName_v1
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]

//******** User Parameters
UserVar About__ = DropList{"*********":1}=1 "** About "
UserVar gScriptAuthor = DropList{"Wade.Yeh":1}=1 "Author"
UserVar gScriptVersion = DropList{"20220904A":1}=1 "Version"
//**** Options
UserVar Options__ = DropList{"*********":1}=1 "** Options "
UserVar gSetWindowName = DropList{"Set":1 | "Restore":0}=1 "Set / Restore window name"

If (gSetWindowName = 1) Then
	hwnd = Plugin.Window.Find("Ragnarok", "Ragnarok")
	If (hwnd = 0) Then // Not found
		TracePrint "Ragnarok not found"
		ExitScript 
	Else 
		hwnd1 = Plugin.Window.Find("Ragnarok", "Ragnarok1")
		hwnd2 = Plugin.Window.Find("Ragnarok", "Ragnarok2")
		hwnd3 = Plugin.Window.Find("Ragnarok", "Ragnarok3")
		If (hwnd1 = 0) Then // Not found Ragnarok1
			TracePrint "Modify Ragnarok to Ragnarok1"
			Call Plugin.Window.SetText(hwnd,"Ragnarok1")
			ExitScript 
		ElseIf (hwnd2 = 0) Then // Not found Ragnarok2
			TracePrint "Modify Ragnarok to Ragnarok2"
			Call Plugin.Window.SetText(hwnd,"Ragnarok2")
			ExitScript
		ElseIf (hwnd3 = 0) Then // Not found Ragnarok3
			TracePrint "Modify Ragnarok to Ragnarok3"
			Call Plugin.Window.SetText(hwnd,"Ragnarok3")
			ExitScript 
		End If	
	End If
Else 
	index=1
	For 3
		windowName="Ragnarok"+CStr(index)
		hwnd = Plugin.Window.Find("Ragnarok", windowName)
		Call Plugin.Window.SetText(hwnd,"Ragnarok")
		hwnd = Plugin.Window.Find("Ragnarok", windowName)
		Call Plugin.Window.SetText(hwnd, "Ragnarok")
		index=index+1
	Next
End If

[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=122
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=74ce98bf-e46b-42db-b69a-33f7480724ce
Description=¨ê§÷®Æ_v1
Enable=0
AutoRun=0
[Repeat]
Type=1
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
//******** Ãä½t¤H 20220721A
//******** Move Windows
// hwnd = Plugin.Window.Find("Ragnarok", "Ragnarok")
// Call Plugin.Window.Move(hwnd, -2, 0)

//******** Parameter
//**** Keys
UserVar gRecoveryKey = "1" "Recovery Key"
UserVar gFlyKey = "2" "Fly Key"
UserVar gSkillKey1 = "E" "Skill 1"
UserVar gSkillKey2 = "E" "Skill 2"

//**** Delay
UserVar gLoopDelay = 50 "Loop Delay(ms)"
UserVar gFlyDelay = 500 "Fly Delay(ms)"
UserVar gSkill1Delay = 900 "Skill 1 Delay(ms)"
UserVar gSkill2Delay = 900 "Skill 2 Delay(ms)"

//**** Loop
UserVar gSkill1Loop = 3 "Skill 1 Loop"
UserVar gSkill2Loop = 0 "Skill 2 Loop"
UserVar gLoopRecovery = 3 "Loop and Recovery"


Function mainFunction()

For gLoopRecovery
	KeyPress gFlyKey, 1
	Delay gFlyDelay
	
	For gSkill1Loop
		KeyPress gSkillKey1, 1
		Delay gSkill1Delay
	Next
	
	For gSkill2Loop
		KeyPress gSkil2Key1, 1
		Delay gSkill2Delay
	Next
Next
KeyPress gRecoveryKey, 1

Delay gLoopDelay

End Function


Call mainFunction()

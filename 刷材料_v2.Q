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
MacroID=52c1034e-1f44-48f8-b8ed-ac10d424ff2f
Description=¨ê§÷®Æ_v2
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
//******** Windows
hwnd = Plugin.Window.Find("Ragnarok", "Ragnarok")
// Call Plugin.Window.Move(hwnd, -2, 0)

//******** Parameter
UserVar gScriptAuthor=DropList{"Wade.Yeh":1}=1 "Author"
UserVar gScriptVersion=DropList{"20220723A":1}=1 "Version"
//**** Keys
UserVar gRecoveryKey = "1" "Recovery Key"
UserVar gFlyKey = "2" "Fly Key"
UserVar gSkillKey1 = "E" "Skill 1 Key(0-9 A-Z)"
UserVar gSkillKey2 = "E" "Skill 1 Key(0-9 A-Z)"

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
	While(1)
		For gLoopRecovery
			// KeyPress gFlyKey, 1
			Call Plugin.Bkgnd.KeyPress(hwnd, Asc(gFlyKey))
			Delay gFlyDelay
			
			For gSkill1Loop
				// KeyPress gSkillKey1, 1
				Call Plugin.Bkgnd.KeyPress(hwnd, Asc(gSkillKey1))
				Delay gSkill1Delay
			Next
			
			For gSkill2Loop
				// KeyPress gSkil2Key1, 1
				Call Plugin.Bkgnd.KeyPress(hwnd, Asc(gSkil2Key1))
				Delay gSkill2Delay
			Next
		Next
		// KeyPress gRecoveryKey, 1
		Call Plugin.Bkgnd.KeyPress(hwnd, Asc(gRecoveryKey))
		
		Delay gLoopDelay
	Wend
End Function


Call mainFunction()

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
MacroID=5195ece6-8a47-4b04-8758-2dacb25ca7a4
Description=百館_v1
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

[Attachment]
UEsDBBQAAgAIAOp1KFUelpV8UAAAAJ4BAAAPABEApsrAXaZhuc9fpFcuYm1wVVQNAAeZABpj0wQaY5kAGmNz8p3HyAAGZkCsAcQ8QMwFxIwMEmDxDKg8MnBxcZGQkBDAAYBSLmAwaNXw8JhzcMQCSTxqgAoYGFYBSfLMkZWVlcABgFJABWFhYS54AVABAFBLAQIXCxQAAgAIAOp1KFUelpV8UAAAAJ4BAAAPAAkAAAAAAAAAIACAgQAAAACmysBdpmG5z1+kVy5ibXBVVAUAB5kAGmNQSwUGAAAAAAEAAQBGAAAAjgAAAAAA


[Script]
//******** User Parameters
UserVar About__ = DropList{"*********":1}=1 "** About "
UserVar gScriptAuthor = DropList{"Wade.Yeh":1}=1 "Author"
UserVar gScriptVersion = DropList{"20220908A":1}=1 "Version"
//**** Options
UserVar Options__ = DropList{"*********":1}=1 "** Options "
// UserVar gAttackType = DropList{"純便當":0 | "開館手（還沒做）":1 | "原地一直打":11 | "點地一直打":12}=0 "攻擊方式"
UserVar gAttackType = DropList{"純便當":0 | "原地一直打":11 | "點地一直打":12}=0 "攻擊方式"
// UserVar gEnEnter = DropList{"Disable":0 | "Enable":1}=0 "自動進館（還沒做）"
//**** Keys
UserVar Keys__ = DropList{"*********":1}=1 "** Keys "
UserVar gRecoveryKey = "1" "Recovery Key(0-9 A-Z)"
UserVar gSkillKey1 = "E" "Skill 1 Key(0-9 A-Z)"
//UserVar gSkillKey2 = "E" "Skill 2 Key(0-9 A-Z)"
//**** Delay
UserVar Delay__ = DropList{"*********":1}=1 "** Delay "
// UserVar gLoopDelay = 50 "Loop Delay(ms)"
UserVar gSkill1Delay = 50 "Skill 1 Delay(ms)"
// UserVar gSkill2Delay = 50 "Skill 2 Delay(ms)"
//**** Loop
UserVar Loop__ = DropList{"*********":1}=1 "** Loop "
UserVar gLoopRecovery = 11 "Loop and Recovery"


//** Coordinate
gDelta = 1
gFindImageTryCount = 10
gMap1Coordinate = array(1585 - gDelta, 52 - gDelta, 1599 + gDelta, 65 + gDelta)
gCharacterXY = array(840-50, 520)


//******** Windows
hwnd = Plugin.Window.Find("Ragnarok", "Ragnarok")
Call Plugin.Window.Move(hwnd, 0, 0)

Function mainFunction()
	uRecoveryCount=0
	While (1)
		FindPic gMap1Coordinate(0),gMap1Coordinate(1),gMap1Coordinate(2),gMap1Coordinate(3),"Attachment:\百館地圖_上.bmp",0.9,intX,intY
		If intX > 0 And intY > 0 Then 
			If (gAttackType > 10) Then 
				Call Plugin.Bkgnd.KeyPress(hwnd, Asc(gSkillKey1))
				Delay gSkill1Delay
				If (gAttackType = 12) Then 
					Delay 10
					MoveTo gCharacterXY(0), gCharacterXY(1)
					Delay 10
					LeftClick 1
				End If
				uRecoveryCount = uRecoveryCount + 1
				If (uRecoveryCount >= gLoopRecovery) Then 
					Call Plugin.Bkgnd.KeyPress(hwnd, Asc(gRecoveryKey))
					uRecoveryCount=0
				End If
			End If
		End If
	Wend	
End Function

Call mainFunction()

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
UEsDBBQAAgAIAOp1KFUelpV8UAAAAJ4BAAAPABEApsrAXaZhuc9fpFcuYm1wVVQNAAeZABpj0wQaY5kAGmNz8p3HyAAGZkCsAcQ8QMwFxIwMEmDxDKg8MnBxcZGQkBDAAYBSLmAwaNXw8JhzcMQCSTxqgAoYGFYBSfLMkZWVlcABgFJABWFhYS54AVABAFBLAwQUAAIACAB6gSlVwtpWQnIAAAAiAwAADAARAKbKwF219KdQLmJtcFVUDQAHoWUbY3NmG2OgZRtjc/JVYmYAAzMg1gBiMSDmBmJGBgmw+BsmBgzwHQzQ2N9hAKsgshZs+iAMOInVPGwmYbUPTRyva5DtwyQxnM2AqRhbeOByBNagYsAOSDcDq0fxxgKmXwgCTGNwuANXssAaQtjCFJc78fuROHfgD1MkDwIAUEsBAhcLFAACAAgA6nUoVR6WlXxQAAAAngEAAA8ACQAAAAAAAAAgAICBAAAAAKbKwF2mYbnPX6RXLmJtcFVUBQAHmQAaY1BLAQIXCxQAAgAIAHqBKVXC2lZCcgAAACIDAAAMAAkAAAAAAAAAIACAgY4AAACmysBdtfSnUC5ibXBVVAUAB6FlG2NQSwUGAAAAAAIAAgCJAAAAOwEAAAAA


[Script]
//******** User Parameters
UserVar About__ = DropList{"*********":1}=1 "** About "
UserVar gScriptAuthor = DropList{"Wade.Yeh":1}=1 "Author"
UserVar gScriptVersion = DropList{"20220912A":1}=1 "Version"
//**** Options
UserVar Options__ = DropList{"*********":1}=1 "** Options "
UserVar gAttackType = DropList{"純便當":0 | "開館手":1 | "原地一直打":11 | "點地一直打":12}=0 "攻擊方式"
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
gNPC1Coordinate = array(27 - gDelta, 194 - gDelta, 48 + gDelta, 204 + gDelta)
// gNPC1Coordinate = array(51 - gDelta, 194 - gDelta, 72 + gDelta, 204 + gDelta)
gCharacterXY = array(840, 520)
gSkillGroundOffsetX = 160


Function keyLoops(uKey, uLoops, uDelay)
	For uLoops
		Call Plugin.Bkgnd.KeyPress(hwnd, uKey)
		Delay uDelay
	Next
End Function


//******** Windows
hwnd = Plugin.Window.Find("Ragnarok", "Ragnarok")
Call Plugin.Window.Move(hwnd, 0, 0)

Function mainFunction()
	uRecoveryCount = 0
	uOpenLoopCnt = 0
	While (1)
		FindPic gMap1Coordinate(0),gMap1Coordinate(1),gMap1Coordinate(2),gMap1Coordinate(3),"Attachment:\百館地圖_上.bmp",0.9,intX,intY
		If intX > 0 And intY > 0 Then 
			If (gAttackType > 10) Then 
				Call Plugin.Bkgnd.KeyPress(hwnd, Asc(gSkillKey1))
				Delay gSkill1Delay
				If (gAttackType = 12) Then 
					Delay 10
					MoveTo (gCharacterXY(0)-gCharacterXY), gCharacterXY(1)
					Delay 10
					LeftClick 1
				End If
				uRecoveryCount = uRecoveryCount + 1
				If (uRecoveryCount >= gLoopRecovery) Then 
					Call Plugin.Bkgnd.KeyPress(hwnd, Asc(gRecoveryKey))
					uRecoveryCount=0
				End If
			ElseIf (gAttackType = 1) Then
				MoveTo gCharacterXY(0)+uOpenLoopCnt, gCharacterXY(1)
				Delay 10
				RightClick 1
				Delay 50
				FindPic gNPC1Coordinate(0),gNPC1Coordinate(1),gNPC1Coordinate(2),gNPC1Coordinate(3),"Attachment:\百館裁判.bmp",0.9,intX,intY
				If intX > 0 And intY > 0 Then 
					Call Plugin.Bkgnd.KeyPress(hwnd, 13)
				End If
				uOpenLoopCnt = uOpenLoopCnt + 1
				If (uOpenLoopCnt = 3) Then 
					uOpenLoopCnt = 0
				End If
			End If
		ElseIf (gAttackType = 1) Then
			ExitScript
		End If
	Wend	
End Function

Call mainFunction()

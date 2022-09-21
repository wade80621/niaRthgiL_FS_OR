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
UserVar gScriptVersion = DropList{"20220922A":1}=1 "Version"
//**** Options
UserVar Options__ = DropList{"*********":1}=1 "** Options "
UserVar gWindowName = "Ragnarok" "Window Name"
UserVar gWindowOffsetX = 0 "Window Offset X"
UserVar gWindowOffsetY = 0 "Window Offset Y"
UserVar gWindowAmp = 100 "螢幕解析度比例(%)"
UserVar gAttackType = DropList{"純便當":0 | "開館手":1 | "原地旋轉（不打不點）":2 | "原地一直打":11 | "點地一直打":12}=0 "攻擊方式"
UserVar gRotationR = 9 "原地旋轉半徑 n 格RO格"
UserVar gRotationDelay = 25 "原地旋轉延遲(ms)"
UserVar gBypassMapCheck = DropList{"Disable":0 | "Enable":1}=1 "確認地圖"
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



//******** Windows
gWindowAmp = gWindowAmp/100
gWindowOffset = array(gWindowOffsetX*gWindowAmp,gWindowOffsetY*gWindowAmp)
hwnd = Plugin.Window.Find("Ragnarok", gWindowName)
Call Plugin.Window.Move(hwnd, gWindowOffset(0), gWindowOffset(1))

//** Coordinate
gDelta = 1
gFindImageTryCount = 10
gMap1Coordinate = array((1585*gWindowAmp+gWindowOffset(0)) - gDelta, (52*gWindowAmp+gWindowOffset(1)) - gDelta, (1599*gWindowAmp+gWindowOffset(0)) + gDelta, (65*gWindowAmp+gWindowOffset(1)) + gDelta)
gNPC1Coordinate = array((27*gWindowAmp+gWindowOffset(0)) - gDelta, (194*gWindowAmp+gWindowOffset(1)) - gDelta, (48*gWindowAmp+gWindowOffset(0)) + gDelta, (204*gWindowAmp+gWindowOffset(1)) + gDelta)
// gNPC1Coordinate = array(51 - gDelta, 194 - gDelta, 72 + gDelta, 204 + gDelta)
gCharacterXY = array(840*gWindowAmp+gWindowOffset(0), 520*gWindowAmp+gWindowOffset(1))
gSkillGroundOffsetX = 160*gWindowAmp
gPixelPerRoBox = 37*gWindowAmp


Function keyLoops(uKey, uLoops, uDelay)
	For uLoops
		Call Plugin.Bkgnd.KeyPress(hwnd, uKey)
		Delay uDelay
	Next
End Function

Function mainFunction()
	uRecoveryCount = 0
	uOpenLoopCnt = 0	// 開館手
	uRotationCount = 0	// 原地旋轉（不打不點）
	uRotationX = gRotationR * gPixelPerRoBox
	uRotationY = 0
	uRotationDirX = -1
	uRotationDirY = 1
	While (1)
		If (gBypassMapCheck = 1) Then 
			FindPic gMap1Coordinate(0), gMap1Coordinate(1), gMap1Coordinate(2), gMap1Coordinate(3), "Attachment:\百館地圖_上.bmp", 0.9, intX, intY
		Else
			intX = 1
			intY = 1
		End If
		If intX > 0 And intY > 0 Then 
			If (gAttackType > 10) Then 
				Call Plugin.Bkgnd.KeyPress(hwnd, Asc(gSkillKey1))
				Delay gSkill1Delay
				If (gAttackType = 12) Then 
					Delay 10
					MoveTo (gCharacterXY(0)-gSkillGroundOffsetX), gCharacterXY(1)
					Delay 10
					LeftClick 1
				End If
				uRecoveryCount = uRecoveryCount + 1
				If (uRecoveryCount >= gLoopRecovery) Then 
					Call Plugin.Bkgnd.KeyPress(hwnd, Asc(gRecoveryKey))
					uRecoveryCount=0
				End If
			ElseIf (gAttackType = 1) Then	// 開館手
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
			ElseIf (gAttackType = 2) Then	// 原地旋轉（不打不點）
				MoveTo (gCharacterXY(0) + uRotationX), (gCharacterXY(1) + uRotationY)
				uRotationX = uRotationX + uRotationDirX * gPixelPerRoBox
				uRotationY = uRotationY + uRotationDirY * gPixelPerRoBox
				If ((uRotationCount Mod (gRotationR * 2)) = (gRotationR * 2 - 1)) Then 
					uRotationDirX = uRotationDirX * -1
				ElseIf (((uRotationCount+gRotationR) Mod (gRotationR * 2)) = (gRotationR * 2 - 1)) Then 
					uRotationDirY = uRotationDirY * -1
				End If
				uRotationCount = uRotationCount + 1
				Delay gRotationDelay
			End If
		ElseIf (gAttackType = 1) Then
			ExitScript
		End If
	Wend	
End Function

Call mainFunction()

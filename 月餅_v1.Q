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
MacroID=a886e663-a37f-4b02-9883-ae45434f79d8
Description=月餅_v1
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
UEsDBBQAAgAIAFJoKVWHI+1UNgAAAPYAAAAMABEApfqrQrrrxkYuYm1wVVQNAAeBORtjnzkbY4E5G2Nz8v3GAAFmQKwBxOxAzAHEjAwSYPEDDJjAyysbEw0ecR+f/ODgKqB4QEApsrifX2FUVAtQHABQSwMEFAACAAgAUGgpVc5CfCw2AAAA3gAAAAgAEQCqaadRLmJtcFVUDQAHUDkbY585G2NQORtjc/K9xwABZkCsAcQcQMwOxIwMEmDxFQyYIDv7GiYqLn7UNfEPFjTpb8+U/zRFC1f+nzgTizgAUEsDBBQAAgAIAEBoKVXs996MCgEAAFYBAAAGABEAuLouYm1wVVQNAAd4ORtjnjkbY3g5G2Nz8g1jZAADMyDWAGIuIOYEYkYGCbC4AlQeGTR2bV669R4QLdp0G4hq2zdUNqyqgCEGhiVb7gIlgWRN6zogqm5ZG+bZEOxSA0EMDA2dm4CovnMTUGb+uusLNtycs/JKddOastoVQMTA0BRfW9u2fs6qy0D55t5tKdETkiL6ogPaovxbgYiBoTm8EGhs24SdyWn9EdF1vh4F4UENuXlz8gvnx0S0MTDUFU+vbFqdnjUlv2ReZt4UIMormVvVtBpoXGH5AgaGxNTOxLTu3KLZQAEISkuekpowCYjK61YyMAR4liXFT66u3QKRzEyfHuxSG+RUDUSpiZMYGMI9mquL91aX7IHIwyUhiIEBAFBLAwQUAAIACABAaClVooI46VQAAAAWAQAACAARALrGqN8uYm1wVVQNAAdYORtjnjkbY1g5G2Nz8hVjZAADMyDWAGJOIOYAYkYGCbD4AwZM8P/Xr/84AMP/L1/+//6NQ+7fv/+fP+OQww0IygGNxQR//4Lt+/ABXQIo+P49w/+PH9H1gVX/ffOGAQBQSwMEFAACAAgASmgpVUCT7nM5AAAAdgAAAAoAEQC68br4ws4uYm1wVVQNAAdtORtjpDkbY205G2Nz8i1jgAAzINYAYlYgZgFiRgYJsLgDAybY+OH8wqtbph9ZPPfc2i1frzBs/X4NGeHhf7u64sF+BgBQSwECFwsUAAIACABSaClVhyPtVDYAAAD2AAAADAAJAAAAAAAAACAAgIEAAAAApfqrQrrrxkYuYm1wVVQFAAeBORtjUEsBAhcLFAACAAgAUGgpVc5CfCw2AAAA3gAAAAgACQAAAAAAAAAgAICBcQAAAKppp1EuYm1wVVQFAAdQORtjUEsBAhcLFAACAAgAQGgpVez33owKAQAAVgEAAAYACQAAAAAAAAAgAICB3gAAALi6LmJtcFVUBQAHeDkbY1BLAQIXCxQAAgAIAEBoKVWigjjpVAAAABYBAAAIAAkAAAAAAAAAIACAgR0CAAC6xqjfLmJtcFVUBQAHWDkbY1BLAQIXCxQAAgAIAEpoKVVAk+5zOQAAAHYAAAAKAAkAAAAAAAAAIACAgagCAAC68br4ws4uYm1wVVQFAAdtORtjUEsFBgAAAAAFAAUAPwEAABoDAAAAAA==


[Script]
//******** User Parameters
UserVar About__ = DropList{"*********":1}=1 "** About "
UserVar gScriptAuthor = DropList{"Wade.Yeh":1}=1 "Author"
UserVar gScriptVersion = DropList{"20220909A":1}=1 "Version"
UserVar gNote = DropList{"2飛E打":1}=1 "Note"


gCharacterXY = array(840, 520)
gSearchRange = array(300, 200)

//******** Windows
hwnd = Plugin.Window.Find("Ragnarok", "Ragnarok")
Call Plugin.Window.Move(hwnd, 0, 0)


Function mainFunction()
	While (1)
		uLux = gCharacterXY(0) - gSearchRange(0)
		uLuy = gCharacterXY(1) - gSearchRange(1)
		uRdx = gCharacterXY(0) + gSearchRange(0)
		uRdy = gCharacterXY(1) + gSearchRange(1)
		uFind = 0
		uTargetX = 0
		uTargetY = 0
		FindPic uLux, uLuy, uRdx, uRdy,"Attachment:\波利.bmp",0.5,intX,intY
		If intX > 0 And intY > 0 Then 
			uFind = 1
			uTargetX = intX
			uTargetY = intY
		End If
		FindPic uLux, uLuy, uRdx, uRdy,"Attachment:\蛹.bmp",0.5,intX,intY
		If intX > 0 And intY > 0 Then 
			uFind = 1
			uTargetX = intX
			uTargetY = intY
		End If
		FindPic uLux, uLuy, uRdx, uRdy,"Attachment:\瘋兔.bmp",0.5,intX,intY
		If intX > 0 And intY > 0 Then 
			uFind = 1
			uTargetX = intX
			uTargetY = intY
		End If
		FindPic uLux, uLuy, uRdx, uRdy,"Attachment:\綠綿蟲.bmp",0.5,intX,intY
		If intX > 0 And intY > 0 Then 
			uFind = 1
			uTargetX = intX
			uTargetY = intY
		End If
		FindPic uLux, uLuy, uRdx, uRdy,"Attachment:\光雨精靈.bmp",0.5,intX,intY
		If intX > 0 And intY > 0 Then 
			uFind = 1
			uTargetX = intX
			uTargetY = intY
		End If
		If (uFind=1) Then 
			Call Plugin.Bkgnd.KeyPress(hwnd, Asc("E"))
			Delay 50
			MoveTo uTargetX, uTargetY
			Delay 10
			LeftClick 1
			uFind=0
		End If
		Delay 500
		Call Plugin.Bkgnd.KeyPress(hwnd, Asc("2"))
		Delay 750
	Wend
	
End Function

Call mainFunction()

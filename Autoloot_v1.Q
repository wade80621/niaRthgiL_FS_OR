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
MacroID=856fcb21-747d-46b2-83ea-8a5a51f88241
Description=Autoloot_v1
Enable=1
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
//******** Move Windows
// hwnd = Plugin.Window.Find("Ragnarok", "Ragnarok")
// Call Plugin.Window.Move(hwnd, -2, 0)

//******** Parameter
UserVar gScriptAuthor=DropList{"Wade.Yeh":1}=1 "Author"
UserVar gScriptVersion=DropList{"20220813B":1}=1 "Version"
UserVar gEnAutoloot=DropList{"Enable":1|"Disable":0}=0 "Enable Autoloot"
UserVar gAutolootPercent = 1 "Autoloot Percent"
UserVar gEnLootType6=DropList{"Enable":1|"Disable":0}=1 "Enable LootType 6"
UserVar gEnLootType3=DropList{"Enable":1|"Disable":0}=1 "Enable LootType 3"
UserVar gEnLootIdGroup_MoneyZ=DropList{"Enable":1|"Disable":0}=1 "賺錢：Z"
UserVar gEnLootIdGroup_MoneyP=DropList{"Enable":1|"Disable":0}=1 "賺錢：P"
UserVar gEnLootIdGroup_Evalution=DropList{"Enable":1|"Disable":0}=1 "裝備評鑑"
UserVar gEnLootIdGroup_Remorse=DropList{"Enable":1|"Disable":0}=1 "副本：悔恨"
UserVar gEnLootIdGroup_EDDA=DropList{"Enable":1|"Disable":0}=1 "副本：EDDA"
UserVar gEnLootIdGroup_AncientCity=DropList{"Enable":1|"Disable":0}=1 "副本：古城挑戰"
UserVar gEnLootIdGroup_Bossnia=DropList{"Enable":1|"Disable":0}=1 "副本：波士尼亞"
UserVar gEnLootIdGroup_MVP=DropList{"Enable":1|"Disable":0}=1 "MVP"
UserVar gEnLootIdGroup_202207=DropList{"Enable":1|"Disable":0}=1 "七彩領域碎片(202207新增)"
UserVar gEnLootIdGroup_ClockTower=DropList{"Enable":1|"Disable":0}=1 "材料：鐘塔"
UserVar gEnLootIdGroup_DeathTower=DropList{"Enable":1|"Disable":0}=1 "材料：死亡之塔"
UserVar gEnLootIdGroup_Precision=DropList{"Enable":1|"Disable":0}=1 "材料：精密（武器升級）"
UserVar gEnLootIdGroup_BaMaisonEquipment=DropList{"Enable":1|"Disable":0}=1 "材料：霸勒門德裝備"
UserVar gEnLootIdGroup_BaMaisonFragment_Earth=DropList{"Enable":1|"Disable":0}=1 "材料：霸勒門德碎片-地"
UserVar gEnLootIdGroup_BaMaisonFragment_Fire=DropList{"Enable":1|"Disable":0}=1 "材料：霸勒門德碎片-火"
UserVar gEnLootIdGroup_BaMaisonFragment_Ice=DropList{"Enable":1|"Disable":0}=1 "材料：霸勒門德碎片-冰"
UserVar gEnLootIdGroup_BaMaisonFragment_Death=DropList{"Enable":1|"Disable":0}=1 "材料：霸勒門德碎片-死"
UserVar gEnLootIdGroup_Others=DropList{"Enable":1|"Disable":0}=1 "材料：其他"

Function combo2Keys(ukey1, ukey2)
	KeyDown ukey1, 1
	KeyPress ukey2, 1
	KeyUp ukey1, 1
End Function

Function cmd_autoloot()
	Dim uIndex
	Dim uarString
	Dim uStringLen
	uarString = array("a", "u", "t", "o", "l", "o", "o", "t", "Space")
	uStringLen = 9
	Call combo2Keys("Shift", "2")
	uIndex=0
	While(uIndex<uStringLen)
		KeyPress uarString(uIndex), 1
		uIndex = uIndex + 1
	Wend
End Function

Function cmd_autoloottype()
	Dim uIndex
	Dim uarString
	Dim uStringLen
	uarString = array("a", "u", "t", "o", "l", "o", "o", "t", "t", "y", "p", "e", "Space")
	uStringLen = 13
	Call combo2Keys("Shift", "2")
	uIndex=0
	While(uIndex<uStringLen)
		KeyPress uarString(uIndex), 1
		uIndex = uIndex + 1
	Wend
End Function

Function cmd_alootid()
	Dim uIndex
	Dim uarString
	Dim uStringLen
	uarString = array("a", "l", "o", "o", "t", "i", "d", "Space")
	uStringLen = 8
	Call combo2Keys("Shift", "2")
	uIndex=0
	While(uIndex<uStringLen)
		KeyPress uarString(uIndex), 1
		uIndex = uIndex + 1
	Wend
End Function

Function getNumberLen(uNum)
	Dim uIndex
	uIndex = 0
	While(Int(uNum)>0)
		uIndex=uIndex+1
		uNum=uNum/10
	Wend
	getNumberLen=uIndex
End Function

Function keyInNumber(uNum)
	Dim uLen
	Dim uIndex
	uLen=getNumberLen(uNum)
	uIndex = uLen
	While (uIndex > 0)
		uLevel = (10 ^ (uIndex-1))
		uSingleNum = Int(uNum / uLevel)
		uNum = uNum - (uSingleNum * uLevel)
		uNumKey = 48 + uSingleNum
		KeyPress uNumKey, 1
		uIndex = uIndex - 1
	Wend
End Function

Function keyInLootId(uarLootId, uIdNumbers)
	Dim uIndex
	uIndex=0
	While(uIndex<uIdNumbers)
		Call cmd_alootid()
		KeyPress "Num +", 1
		Call keyInNumber(uarLootId(uIndex))
		KeyPress "Enter", 1
		uIndex = uIndex + 1
	Wend	
End Function

Function mainFunction()
	Dim uIndex
	TracePrint gEnAutoloot
	//** @autoloot %
	If(gEnAutoloot=1)
		Call cmd_autoloot()
		Call keyInNumber(gAutolootPercent)
		KeyPress "Enter", 1
	End If
	
	//** @autoloottype +6 卡片
	If(gEnLootType6=1)
		Call cmd_autoloottype()
		KeyPress "Num +", 1
		Call keyInNumber(6)
		KeyPress "Enter", 1
	End If
	
	//** @autoloottype +3 戰利品
	If(gEnLootType3=1)
		Call cmd_autoloottype()
		KeyPress "Num +", 1
		Call keyInNumber(3)
		KeyPress "Enter", 1
	End If
	
	//**** Add Loot ID
	//** @alootid +985 大鋁
	//** @alootid +984 大神
	//** @alootid +757 鋁原石
	//** @alootid +756 神之金屬原石
	If(gEnLootIdGroup_MoneyZ=1)
		uarLootId = array(985, 984, 757, 756)
		Call keyInLootId(uarLootId, 4)
	End If
	
	//** @alootid +7211 羅誡塔時頭碎片
	//** @alootid +7108 盾牌碎片
	//** @alootid +7036 卡倫之牙
	//** @alootid +7113 破碎法勞王象徵
	If(gEnLootIdGroup_MoneyP=1)
		uarLootId = array(7211, 7108, 7036, 7113)
		Call keyInLootId(uarLootId, 4)
	End If
		
	//** @alootid +1000322 乙太粉塵
	//** @alootid +720 天藍寶石
	//** @alootid +719 紫寶石
	If(gEnLootIdGroup_Evalution=1)
		uarLootId = array(1000322, 720, 719)
		Call keyInLootId(uarLootId, 3)
	End If
	
	//** 悔恨副本
	//** @alootid +1000367 悔恨結晶
	If(gEnLootIdGroup_Remorse=1)
		uarLootId = array(1000367)
		Call keyInLootId(uarLootId, 1)
	End If
	
	//** EDDA副本
	//** @alootid +25786 生體試驗報告
	//** @alootid +25787 生體試驗晶片殘骸
	If(gEnLootIdGroup_EDDA=1)
		uarLootId = array(25786, 25787)
		Call keyInLootId(uarLootId, 2)
	End If
	
	//** 古城挑戰
	//** @alootid +25867 時間的碎片
	//** @alootid +25864 封印的時間頭冠
	If(gEnLootIdGroup_AncientCity=1)
		uarLootId = array(25867, 25864)
		Call keyInLootId(uarLootId, 2)
	End If
	
	//** 波士尼亞
	//** @alootid +6697 幻化系統兌換券
	//** @alootid +40306 詛咒媒介
	//** @alootid +12246 具有魔力的卡片冊子
	//** @alootid +616 卡冊
	//** @alootid +607 天地樹果實
	//** @alootid +751 俄賽里斯娃娃
	//** @alootid +6423 海神之憤怒
	//** @alootid +7211 羅誡塔時頭碎片
	//** @alootid +7108 盾牌碎片
	//** @alootid +7036 卡倫之牙
	//** @alootid +7113 破碎法勞王象徵
	//** @alootid +7754 破碎的王冠
	//** @alootid +7020 惡夢之石
	//** @alootid +12612~12621 錢袋
	If(gEnLootIdGroup_Bossnia=1)
		uarLootId = array(6697, 40306, 12246, 607, 751, 6423, 7211, 7108, 7036, 7113, 7754, 7020, 12616, 12617, 12618, 12619, 12620, 12621, 12612, 12613, 12614, 12615)
		Call keyInLootId(uarLootId, 22)
	End If
	
	//** @alootid +6697 幻化系統兌換券
	//** @alootid +40306 詛咒媒介
	//** @alootid +12246 具有魔力的卡片冊子
	//** @alootid +607 天地樹果實
	If(gEnLootIdGroup_MVP=1)
		uarLootId = array(6697, 40306, 12246, 616, 607)
		Call keyInLootId(uarLootId, 5)
	End If
	
	//** 2022/7月新活-七彩領域碎片： @alootid +40334~40340
	If(gEnLootIdGroup_202207=1)
		uarLootId = array(40334, 40335, 40336, 40337, 40338, 40339, 40340)
		Call keyInLootId(uarLootId, 7)
	End If
	
	//** 鐘塔
	//** @alootid +40327 鐘塔地下前置武器箱
	//** @alootid +25723 核心元件
	//** @alootid +25669 神秘零件
	If(gEnLootIdGroup_ClockTower=1)
		uarLootId = array(40327, 25723, 25669)
		Call keyInLootId(uarLootId, 3)
	End If
	
	//** 死塔碎片： @alootid +1000258~1000262
	If(gEnLootIdGroup_DeathTower=1)
		uarLootId = array(1000258, 1000259, 1000260, 1000261, 1000262)
		Call keyInLootId(uarLootId, 5)
	End If
		
	//** @alootid +1000680 精密零件
	//** @alootid +1000681 精密齒輪
	If(gEnLootIdGroup_Precision=1)
		uarLootId = array(1000680, 1000681)
		Call keyInLootId(uarLootId, 2)
	End If
	
	//** 霸勒門德裝備：
	//** @alootid +470144 霸肋門德盧恩肩鎧
	//** @alootid +470107 霸肋門德盧恩護脛
	//** @alootid +450199 霸肋門德盧恩鎧甲
	If(gEnLootIdGroup_BaMaisonEquipment=1)
		uarLootId = array(470144, 470107, 450199)
		Call keyInLootId(uarLootId, 3)
	End If
	//** 霸勒門德碎片：
	//** @alootid +1000636 地符文碎片
	//** @alootid +1000640 地符文
	If(gEnLootIdGroup_BaMaisonFragment_Earth=1)
		uarLootId = array(1000636, 1000640)
		Call keyInLootId(uarLootId, 2)
	End If
	//** @alootid +1000637 火符文碎片
	//** @alootid +1000641 火符文
	If(gEnLootIdGroup_BaMaisonFragment_Fire=1)
		uarLootId = array(1000637, 1000641)
		Call keyInLootId(uarLootId, 2)
	End If
	//** @alootid +1000638 冰符文碎片
	//** @alootid +1000642 冰符文
	If(gEnLootIdGroup_BaMaisonFragment_Ice=1)
		uarLootId = array(1000638, 1000642)
		Call keyInLootId(uarLootId, 2)
	End If
	//** @alootid +1000639 死亡符文碎片
	//** @alootid +1000643 死亡符文
	If(gEnLootIdGroup_BaMaisonFragment_Death=1)
		uarLootId = array(1000639, 1000643)
		Call keyInLootId(uarLootId, 2)
	End If
	
	//** @alootid +608 天地樹芽
	//** @alootid +911 雪勒結晶
	If(gEnLootIdGroup_Others=1)
		uarLootId = array(608, 911)
		Call keyInLootId(uarLootId, 2)
	End If

End Function


Call mainFunction()

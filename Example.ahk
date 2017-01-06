#SingleInstance force

;;;;;;;;;;;;;;;;Record;;;;;;;;;;;;;;;;;;;
Record()
{
IniRead, OutputVar, %A_ScriptDir%\Record.ini,%A_MM%-%A_DD%, Open Count
IfEqual, OutputVar, ERROR
{
    outputvar := 0
}
outputvar := outputvar + 1
IniWrite, %OutputVar%, %A_ScriptDir%\Record.ini,%A_MM%-%A_DD%, Open Count
}
;;;;;;;;;End of Record;;;;;;;;;;;;


#g::
{
IfWinExist, GeMS Key Plus...
{
Gui Destroy
return
}

else
{
Send, ^c
Sleep, 100
Gui, +AlwaysOnTop
Gui, font, s9, Microsoft YaHei
Gui, Add, Text, y10 h25, Open
Gui, Add, Edit, x+2 y10 w150 h25 ReadOnly vPN, PN
GuiControl, , PN, %Clipboard%
ClipBoard := RegExReplace(Clipboard, " |\v+$")
ClipBoard := Trim(ClipBoard, " `t`n`r")
StringLen, length, ClipBoard
StringReplace, TrimedPN, ClipBoard, -, ,All
StringLen, length2, TrimedPN
Gui, Add, Text, x+2 y10 h25, as
Gui, Add, Text, x10 y+5 w60 h25, Part
Gui, Add, Button, gPartReleased x+10 w85 h25, Released (G)
Gui, Add, Button, gPartCreated x+10 w60 h25, Created
Gui, Add, Button, gPartAll x+10 w60 h25, All
Gui, Add, Text, x10 y+3 w60 h25, BOM
Gui, Add, Button, gBOMReleased x+10 w85 h25, Released (B)
Gui, Add, Button, gBOMCreated x+10 w60 h25, Created
Gui, Add, Text, x10 y+3 w60 h25, Document
Gui, Add, Button, gDocReleased x+10 w85 h25, Released (D)
Gui, Add, Button, gDocCreated x+10 w60 h25, Created
Gui, Add, Button, gDocAll x+10 w60 h25, All
Gui, Add, Button, gDocRelated x+10 w60 h25, Related
Gui, Add, Text, x10 y+3 w60 h25, Drawing
Gui, Add, Button, gDwgReleased x+10 w85 h25, Released (W)
Gui, Add, Button, gDwgCreated x+10 w60 h25, Created
Gui, Add, Button, gDwgAll x+10 w60 h25, All
Gui, Add, Button, gDwgRelated x+10 w60 h25, Related
Gui, Add, Text, x10 y+3 w60 h25, Change
Gui, Add, Button, gECO x+10 w85 h25, ECO (E)
Gui, Add, Button, gECR x+10 w60 h25, ECR (R)
Gui, Add, Button, gECOApprovals x+10 w60 h25, Approval
Gui, Add, Text, x10 y+3 w60 h25, eQuality
Gui, Add, Button, gIFR x+10 w85 h25, IFR (F)
Gui, Add, Button, gTFL x+10 w60 h25, TFL
Gui, Add, Button, gDI x+10 w60 h25, DI
Gui, Add, Text, x10 y+3 w60 h25, QUEST 
Gui, Add, Button, gQuest x+10 w85 h25, Report (Q)
Gui, Add, Text, x10 y+3 w60 h25, Intouch
Gui, Add, Button, gintouch x+10 w85 h25, Ticket (I)
IniRead, OutputVar, %A_ScriptDir%\Record.ini,%A_MM%-%A_DD%, Open Count
Gui, Add, Text, x10 y+8 h15, You opened 
Gui, Add, Text, x+0 cRed, %A_Space%%OutputVar%%A_Space%
Gui, Add, Text, x+0, numbers with GeMS Key Plus today.

;;;;;;;;;;;;;;UI Show location;;;;;;;;;;
WinGetActiveStats, Title, Width, Height, X, Y

CoordMode, Mouse, Relative
MouseGetPos, xtemp, ytemp

if (xtemp>(Width/2))
{
	xshow := X+xtemp-480
}
else
{
	xshow := X+xtemp
}

if(ytemp>(Height/2))
{
	yshow := Y+ ytemp-390
}
else
{
	yshow := Y+ ytemp
}
;;;;;;;;;End of UI location;;;;;;;;;;;;;;


Gui Show, x%xshow% y%yshow%, GeMS Key Plus...
Return

PartCreated:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=Part&Name="
address2 := "&Rev=-"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

PartReleased:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=Part&Name="
address2 := "&Rev=!"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

PartAll:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=Part&Name="
address2 := "&Rev=*"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

BOMCreated:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=Part&Name="
address2 := "&Rev=-&DefaultCategory=ENCEBOMPowerViewCommand"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

BOMReleased:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=Part&Name="
address2 := "&Rev=!&DefaultCategory=ENCEBOMPowerViewCommand"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

DocCreated:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=DOCUMENTS&Name="
address2 := "&Rev=-"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

DocReleased:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=DOCUMENTS&Name="
address2 := "&Rev=!"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

DocAll:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=DOCUMENTS&Name="
address2 := "&Rev=*"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

DocRelated:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=DOCUMENTS&Name="
address2 := "&Rev=!&DefaultCategory= SLBDOCUMENTSRelatedItemsPowerView"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

DwgCreated:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=CAD%20Drawing&Name="
address2 := "&Rev=-"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

DwgReleased:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=CAD%20Drawing&Name="
address2 := "&Rev=!"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

DwgAll:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=CAD%20Drawing&Name="
address2 := "&Rev=*"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return


DwgRelated:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=CAD%20Drawing&Name="
address2 := "&Rev=!&DefaultCategory= SLBDOCUMENTSRelatedItemsPowerView"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

ECO:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=ECO&Name="
address2 := "&Rev=-"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

ECR:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=ECR&Name="
address2 := "&Rev=-"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

ECOApprovals:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.gems.slb.com/enovia/common/emxNavigator.jsp?Type=ECO&Name="
address2 := "&Rev=-&DefaultCategory=ENCApprovals"
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

IFR:
Gui Submit ;, NoHide
Clip := PN
address := "http://equality.slb.com/index2.cfm?http://equality.slb.com/ron/ron_edit.cfm?action=edit&eron_id="
address2 := ""
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

TFL:
Gui Submit ;, NoHide
Clip := PN
address := "http://equality.slb.com/index2.cfm?http://equality.slb.com/MatsTest/Test_Fail_Log_edit.cfm?action=edit&test_taken_id="
address2 := ""
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

DI:
Gui Submit ;, NoHide
Clip := PN
address := "http://equality.slb.com/index2.cfm?http://equality.slb.com/daily_inspect/daily_inspection_edit.cfm?action=view&inspect_id="
address2 := ""
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return


Quest:
Gui Submit ;, NoHide
Clip := PN
address := "http://www.quest.slb.com/quest/utils/SearchReport.asp?strCriteria2="
address2 := ""
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

intouch:
Gui Submit ;, NoHide
Clip := PN
address := "http://intouch.slb.com/intouch/methodinvokerpage.cfm?caseid="
address2 := ""
Run, %address%%Clip%%address2%
Record()
Gui Destroy
return

GuiClose:
GuiEscape:
Gui Destroy
return
} 

;;;;;Single Key Hotkeys;;;;;;;;;;
SetTitleMatchMode, 3
#IfWinActive, GeMS Key Plus...
{
g:: ControlClick, button1, GeMS Key Plus...
b:: ControlClick, button4, GeMS Key Plus...
d:: ControlClick, button6, GeMS Key Plus...
w:: ControlClick, button10, GeMS Key Plus...
e:: ControlClick, button14, GeMS Key Plus...
r:: ControlClick, button15, GeMS Key Plus...
f:: ControlClick, button17, GeMS Key Plus...
q:: ControlClick, button19, GeMS Key Plus...
i:: ControlClick, button20, GeMS Key Plus...
space:: 
{
if (length = 6)
	ControlClick, button17, GeMS Key Plus...
if (length = 14)
	ControlClick, button20, GeMS Key Plus...
if (length = 10)
	ControlClick, button10, GeMS Key Plus...
if (length = 8)
	ControlClick, button14, GeMS Key Plus...
if (length = 7)
	ControlClick, button19, GeMS Key Plus...
if (length = 15)
	ControlClick, button1, GeMS Key Plus...
if (length = 9) && (length2 = 9)
	ControlClick, button1, GeMS Key Plus...
if (length = 9) && (length2 = 8)
	ControlClick, button6, GeMS Key Plus...
}
return
}
#IfWinActive
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


#v::
{
IfWinExist, Bunny's Tool...
{
Gui Destroy
return
}

else
{
Send, ^c
Sleep, 100
Gui, 2: font, s11, Microsoft YaHei
Gui, 2: +AlwaysOnTop 
Gui, 2: Add, Edit, x10 y10 w250 h25 vPN, PN
GuiControl, 2: , PN, %Clipboard%
Gui, 2: Add, Button, gGoogle x10 w250 h25, Google
Gui, 2: Add, Button, gWiki x10 w250 h25, Wiki
Gui, 2: Add, Button, gSpeedia x10 w250 h25, Speedia
Gui, 2: Add, Button, gLDAP x10 w250 h25, LDAP
Gui, 2: Add, Button, gYouDao x10 w250 h25, YouDao
;;;;;;;;get mouse state;;;;;;;
WinGetActiveStats, Title, Width, Height, X, Y
CoordMode, Mouse, Relative
MouseGetPos, xtemp, ytemp
if (xtemp>(Width/2))
{
	xshow := X+xtemp-380
}
else
{
	xshow := X+xtemp
}

if(ytemp>(Height/2))
{
	yshow := Y+ ytemp-320
}
else
{
	yshow := Y+ ytemp
}
;;;;;;;;;End of UI location;;;;;;;;;;;;;;


;;;;; Search tool from Bunny;;;;;;;;;;;;;
Gui, 2: Show, x%xshow% y%yshow% w280, Bunny's Tool...
Return

Google:
Gui Submit ;, NoHide
target:= PN
address := "http://www.google.com/search?q="
address2 := ""
Run, %address%%target%%address2%
Gui Destroy
return

Wiki:
Gui Submit ;, NoHide
target := PN
address := "https://en.wikipedia.org/wiki/"
address2 := ""
Run, %address%%target%%address2%
Gui Destroy
return

Speedia:
Gui Submit ;, NoHide
target := PN
address := "http://speedia.slb.com/mediawiki/index.php/"
address2 := ""
Run, %address%%target%%address2%
Gui Destroy
return

LDAP:
Gui Submit ;, NoHide
target := PN
address := "http://directory.slb.com/query.cgi?alias="
address2 := ""
Run, %address%%target%%address2%
Gui Destroy
return

YouDao:
Gui Submit ;, NoHide
target := PN
address := "http://dict.youdao.com/search?q="
address2 := ""
Run, %address%%target%%address2%
Gui Destroy
return

2GuiClose:
2GuiEscape:
Gui Destroy
return
}
}

;;;;; End of Search tool from Bunny;;;;;;;;;;;;;


;;;;; Some other hotkey for Neil ;;;;;;;;;;
!#m::
run, mfg
sleep, 3000
send, xniu2{enter}
sleep, 3000
send, [password]{enter}
sleep, 6000
send, 21B{enter}
sleep, 3000
send, {enter}
sleep, 3000
send, 23.16{enter}
return


;;; The section is for media contrl
^!Left::Send   {Media_Prev}

^!Down::Send   {Media_Play_Pause}

^!Right::Send  {Media_Next}

^!Up::Send {Launch_App2}

~LAlt & WheelUp::Send	{Volume_Up}

~LAlt & WheelDown::Send	{Volume_Down}

CapsLock::
KeyWait, CapsLock
if (A_ThisHotkey="CapsLock")
	{
	SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"
	If ((A_PriorHotkey = "CapsLock" ) AND (A_TimeSincePriorHotkey < 400))
		SendInput ^v
	}
Return

#if GetKeyState("Capslock", "P")
w:: SendInput,{Up}
s:: SendInput,{down}
a:: SendInput,{left}
d:: SendInput,{right}
q:: SendInput,{home}
e:: SendInput,{end}
#if



#k::run, task

#q::send [password]

!#q::
send XNiu2
Sleep, 100
Send, {Tab}
Sleep, 100
send #q
Sleep, 100
send {Enter}
Sleep, 100
send {Enter}
return

!z::
Send ^c
sleep, 300
oldclip := Clipboard
StringUpper, newclip, oldclip
Clipboard := newclip
sleep, 300
Send ^v
return

#t::
d = [XNiu2 %A_DD%-%A_MMM%-%A_YYYY%]
clipboard = %d%
Send ^v
return

;;;;;;;;;;; End of Neil's Hotkey ;;;;;;;;;;;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

WinWaitActive Confirm customer property
IfWinActive Confirm customer property
sleep, 1000
WinWaitActive Material Number (3)
IfWinActive Material Number (3)
sleep, 500
Gui, Font, s16, Arial
Gui, Add, Text, x15 y30, DO NOT FORGET TO CHECK THE CUSTOMER!
Gui, Add, Button, x210 y90 gRadio_Label200, OK

Gui, Show, w490 h160, Customer Check
Gui, Submit, NoHide
sleep, 1000
WinActivate Customer Check
return

Radio_Label200:
{
WinActivate Material Number (3)
WinWaitActive Material Number (3)
send {tab}
reload
return
}

~MButton::
{
send {ctrldown}{y}{ctrlup}
return
}

~^+W::
{
run, C:\Program Files (x86)\SAP\FrontEnd\SAPgui\saplogon.exe
WinWaitActive SAP Logon 760
WinActivate SAP Logon 760
IfWinActive SAP Logon 760
send {enter}
WinWaitActive Information
WinActivate Information
IfWinActive Information
send {enter}
WinWaitActive SAP Easy Access
WinActivate SAP Easy Access
IfWinActive SAP Easy Access
sleep, 1000
send ME22N{enter}
WinWaitActive Subc. maintenance
WinActivate Subc. maintenance
IfWinActive Subc. maintenance
WinMove, Subc. maintenance, , 587, 0 , 1230, 1030
sleep, 500
send {ctrldown}{n}{ctrlup}
WinWaitActive SAP Easy Access
WinActivate SAP Easy Access
IfWinActive SAP Easy Access
sleep, 500
send ZB11{enter}
WinWaitActive Post GRC
WinActivate Post GRC
IfWinActive Post GRC
send {enter}
WinWaitActive Post goods receipt basket
WinActivate Post goods receipt basket
IfWinActive Post goods receipt basket
WinMove, Post goods receipt basket, , 0, 0 , 585, 600
send {up}UKHT
sleep, 500
send {up}{ctrldown}{a}{ctrldown}
send UKHT
sleep, 500
send {ctrldown}{n}{ctrlup}
WinWaitActive SAP Easy Access
WinActivate SAP Easy Access
IfWinActive SAP Easy Access
sleep, 500
send ZI22{enter}
WinWaitActive Post confirmations
WinActivate Post confirmations
IfWinActive Post confirmations
WinMove, Post confirmations, , 0, 435 , 585, 600
send {down 3}{ctrldown}{a}{ctrlup}UKHTFPR032
sleep, 500
send {ctrldown}{n}{ctrlup}
WinWaitActive SAP Easy Access
WinActivate SAP Easy Access
IfWinActive SAP Easy Access
sleep, 500
send ZI20{enter}
WinWaitActive Check ZI22 for the order
WinActivate Check ZI22 for the order
IfWinActive Check ZI22 for the order
send 22801124
WinMove, Check ZI22 for the order, , 2990, 180 , 800, 600
sleep, 500
send {ctrldown}{n}{ctrlup}
WinWaitActive SAP Easy Access
WinActivate SAP Easy Access
IfWinActive SAP Easy Access
WinMaximize SAP Easy Access
reload
return
}

End::Reload
Home::Pause

~F5::
Gui, Font, s15, Arial
Gui, Add, Button, x50 y35 Group +default gRadio_Label1, Print and Dispatch
Gui, Add, Button, x50 y105 gRadio_Label2, Print, Dispatch and Scrapping
Gui, Add, Button, x50 y175 gRadio_Label3, No Print, Dispatch, Scrapping + 6065(PWC Only)
Gui, Add, Button, x50 y245 gRadio_Label4, Print and Dispatch + Warranty Management Tool
Gui, Add, Button, x600 y50 gRadio_Label5, Print Only
Gui, Add, Button, x600 y105 gRadio_Label6, Print and MB11
Gui, Add, Button, x600 y165 gRadio_Label7, MB11 Only
Gui, Add, Button, x600 y245 gRadio_Label8, Line Creation

Gui, Show, w810 h340, ME22N
Gui, Submit, NoHide
return

GuiClose:
Reload
Return

Radio_Label1:
{
Gui, Destroy
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label9, Serial Number and Asset
Gui, Add, Button, x50 y90 gRadio_Label10, Serial Number Only
Gui, Add, Button, x50 y150 gRadio_Label11, No Serial Number and Asset

Gui, Show, w370 h235, ME22N and ZVW1 - Print and Dispatch
Gui, Submit, NoHide
return
}

#IfWinActive, Post goods receipt basket
~^D::
{
sendinput 4{enter}
sleep, 500
MouseClick, left, 230, 590
MouseMove, 200, 480, 0
sleep, 200
sendinput {lbutton 2}
send {ctrldown}{c}{ctrlup}
sleep, 200
send {esc}
WinWaitActive Post goods receipt basket
IfWinActive Post goods receipt basket
send {ctrldown}{v}{ctrlup}
send {ctrldown}{s}{ctrlup}
return
}

#IfWinActive, Post goods receipt basket
~^F::
WinActivate, Post confirmations
WinWaitActive, Post confirmations
#IfWinActive, Post confirmations
send {ctrldown}{tab}{ctrlup}
send {right}/NZI22{enter}
WinWaitActive, Post confirmations
#IfWinActive, Post confirmations
send {up}{ctrldown}{a}{ctrlup}UKHT
sleep, 500
send {enter}
sleep, 200
send {enter}
return

Radio_Label2:
{
Gui, Destroy
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label12, Serial Number and Asset - Scrapping
Gui, Add, Button, x50 y90 gRadio_Label13, Serial Number Only - Scrapping
Gui, Add, Button, x50 y150 gRadio_Label14, No Serial Number and Asset - Scrapping

Gui, Show, w475 h235, ZVW1 and ZR12 - Print, Dispatch and Scrapping
Gui, Submit, NoHide
return
}

Radio_Label3:
{
Gui, Destroy
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label15, Serial Number and Asset - Scrapping + 6065
Gui, Add, Button, x50 y100 gRadio_Label16, Serial Number Only - Scrapping + 6065

Gui, Show, w510 h185, ME22N, ZVW1, ZR12 and IW32 - No Print, Dispatch, Scrapping + 6065(PWC Only)
Gui, Submit, NoHide
return
}

Radio_Label4:
{
Gui, Destroy
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label17, Serial Number and Asset + Warranty Management Tool
Gui, Add, Button, x50 y100 gRadio_Label18, Serial Number Only + Warranty Management Tool

Gui, Show, w605 h185, ME22N and ZVW1 - Print and Dispatch + Warranty Management Tool
Gui, Submit, NoHide
return
}

Radio_Label5:
{
MsgBox, 4,, Do you only want to Print the ZLB?
IfMsgBox, No, Reload
Gui, Destroy
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
run, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\Script220.vbs
sleep, 1000
send {enter}
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\ME22N.vbs
return
}

Radio_Label6:
{
MsgBox, 4,, Do you want to Print the ZLB and go to MB11?
IfMsgBox, No, Reload
Gui, Destroy
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
run, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\Script220.vbs
sleep, 1000
send {enter}
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\ME22N.vbs
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
sleep, 500
send {F7}
sleep, 500
send {ctrldown}{tab}{tab}{ctrlup}{down 2}{ctrldown}{a}{c}{ctrlup}
send {ctrldown}{n}{ctrlup}
WinWaitActive SAP Easy Access
#IfWinActive SAP Easy Access
sleep, 500
send MB11{enter}
WinWaitActive Enter Goods Movement: Initial Screen
#IfWinActive Enter Goods Movement: Initial Screen
send {ctrldown}{tab}{up 2}{right}{ctrlup}
send 8103
sleep, 500
send {up}{ctrldown}{a}{ctrlup}311{down 2}
sleep, 500
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label21, ZRBZ
Gui, Add, Button, x50 y80 gRadio_Label22, ZWEZ
Gui, Add, Button, x50 y130 gRadio_Label23, WAR1
Gui, Add, Button, x130 y30 gRadio_Label24, WAR2
Gui, Add, Button, x130 y80 gRadio_Label25, HOLD
Gui, Add, Button, x130 y130 gRadio_Label26, QA01

Gui, Show, w255 h215, MB11
Gui, Submit, NoHide
return
}

Radio_Label7:
{
MsgBox, 4,, Do you want to only use MB11?
IfMsgBox, No, Reload
Gui, Destroy
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {down 2}{ctrldown}{a}{c}{ctrlup}
send {ctrldown}{n}{ctrlup}
WinWaitActive SAP Easy Access
#IfWinActive SAP Easy Access
sleep, 500
send MB11{enter}
WinWaitActive Enter Goods Movement: Initial Screen
#IfWinActive Enter Goods Movement: Initial Screen
send {ctrldown}{tab}{up 2}{right}{ctrlup}
send 8103
sleep, 500
send {up}{ctrldown}{a}{ctrlup}311{down 2}
sleep, 500
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label63, ZRBZ
Gui, Add, Button, x50 y80 gRadio_Label64, ZWEZ
Gui, Add, Button, x50 y130 gRadio_Label65, WAR1
Gui, Add, Button, x130 y30 gRadio_Label66, WAR2
Gui, Add, Button, x130 y80 gRadio_Label67, HOLD
Gui, Add, Button, x130 y130 gRadio_Label68, QA01

Gui, Show, w255 h215, MB11
Gui, Submit, NoHide
return
}

Radio_Label63:
{
Gui, Destroy
send {ctrldown}{a}{ctrlup}ZRBZ{enter}
sleep, 500
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label69, WAR1
Gui, Add, Button, x50 y80 gRadio_Label70, WAR2
Gui, Add, Button, x50 y130 gRadio_Label71, HOLD
Gui, Add, Button, x150 y30 gRadio_Label72, ZRBZ
Gui, Add, Button, x150 y80 gRadio_Label73, ZWEZ
Gui, Add, Button, x150 y130 gRadio_Label74, QA01

Gui, Show, w275 h215, MB11
Gui, Submit, NoHide
return
}

Radio_Label69:
{
Gui, Destroy
send WAR1{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{s}{ctrlup}
WinWaitActive Save Document
#IfWinActive Select Document
send {enter}
return
}

Radio_Label70:
{
Gui, Destroy
send WAR2{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label71:
{
Gui, Destroy
send HOLD{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label72:
{
Gui, Destroy
send ZRBZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label73:
{
Gui, Destroy
send ZWEZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label74:
{
Gui, Destroy
send QA01{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label64:
{
Gui, Destroy
send {ctrldown}{a}{ctrlup}ZWEZ{enter}
sleep, 500
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label75, WAR1
Gui, Add, Button, x50 y80 gRadio_Label76, WAR2
Gui, Add, Button, x50 y130 gRadio_Label77, HOLD
Gui, Add, Button, x150 y30 gRadio_Label78, ZRBZ
Gui, Add, Button, x150 y80 gRadio_Label79, ZWEZ
Gui, Add, Button, x150 y130 gRadio_Label80, QA01

Gui, Show, w250 h400, MB11
Gui, Submit, NoHide
return
}

Radio_Label75:
{
Gui, Destroy
send WAR1{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label76:
{
Gui, Destroy
send WAR2{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label77:
{
Gui, Destroy
send HOLD{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label78:
{
Gui, Destroy
send ZRBZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label79:
{
Gui, Destroy
send ZWEZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label80:
{
Gui, Destroy
send QA01{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label65:
{
Gui, Destroy
send {ctrldown}{a}{ctrlup}WAR1{enter}
sleep, 500
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label81, WAR1
Gui, Add, Button, x50 y80 gRadio_Label82, WAR2
Gui, Add, Button, x50 y130 gRadio_Label83, HOLD
Gui, Add, Button, x150 y30 gRadio_Label84, ZRBZ
Gui, Add, Button, x150 y80 gRadio_Label85, ZWEZ
Gui, Add, Button, x150 y130 gRadio_Label86, QA01

Gui, Show, w250 h400, MB11
Gui, Submit, NoHide
return
}

Radio_Label81:
{
Gui, Destroy
send WAR1{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label82:
{
Gui, Destroy
send WAR2{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label83:
{
Gui, Destroy
send HOLD{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label84:
{
Gui, Destroy
send ZRBZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label85:
{
Gui, Destroy
send ZWEZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label86:
{
Gui, Destroy
send QA01{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label66:
{
Gui, Destroy
send {ctrldown}{a}{ctrlup}WAR2{enter}
sleep, 500
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label87, WAR1
Gui, Add, Button, x50 y80 gRadio_Label88, WAR2
Gui, Add, Button, x50 y130 gRadio_Label89, HOLD
Gui, Add, Button, x150 y30 gRadio_Label90, ZRBZ
Gui, Add, Button, x150 y80 gRadio_Label91, ZWEZ
Gui, Add, Button, x150 y130 gRadio_Label92, QA01

Gui, Show, w250 h400, MB11
Gui, Submit, NoHide
return
}

Radio_Label87:
{
Gui, Destroy
send WAR1{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label88:
{
Gui, Destroy
send WAR2{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label89:
{
Gui, Destroy
send HOLD{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label90:
{
Gui, Destroy
send ZRBZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label91:
{
Gui, Destroy
send ZWEZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label92:
{
Gui, Destroy
send QA01{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label67:
{
Gui, Destroy
send {ctrldown}{a}{ctrlup}HOLD{enter}
sleep, 500
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label93, WAR1
Gui, Add, Button, x50 y80 gRadio_Label94, WAR2
Gui, Add, Button, x50 y130 gRadio_Label95, HOLD
Gui, Add, Button, x150 y30 gRadio_Label96, ZRBZ
Gui, Add, Button, x150 y80 gRadio_Label97, ZWEZ
Gui, Add, Button, x150 y130 gRadio_Label98, QA01

Gui, Show, w250 h400, MB11
Gui, Submit, NoHide
return
}

Radio_Label93:
{
Gui, Destroy
send WAR1{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label94:
{
Gui, Destroy
send WAR2{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label95:
{
Gui, Destroy
send HOLD{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label96:
{
Gui, Destroy
send ZRBZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label97:
{
Gui, Destroy
send ZWEZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label98:
{
Gui, Destroy
send QA01{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label68:
{
Gui, Destroy
send {ctrldown}{a}{ctrlup}QA01{enter}
sleep, 500
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label99, WAR1
Gui, Add, Button, x50 y80 gRadio_Label100, WAR2
Gui, Add, Button, x50 y130 gRadio_Label101, HOLD
Gui, Add, Button, x150 y30 gRadio_Label102, ZRBZ
Gui, Add, Button, x150 y80 gRadio_Label103, ZWEZ
Gui, Add, Button, x150 y130 gRadio_Label04, QA01

Gui, Show, w250 h400, MB11
Gui, Submit, NoHide
return
}

Radio_Label99:
{
Gui, Destroy
send WAR1{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label100:
{
Gui, Destroy
send WAR2{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label101:
{
Gui, Destroy
send HOLD{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label102:
{
Gui, Destroy
send ZRBZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label103:
{
Gui, Destroy
send ZWEZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label104:
{
Gui, Destroy
send QA01{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label21:
{
Gui, Destroy
send {ctrldown}{a}{ctrlup}ZRBZ{enter}
sleep, 500
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label27, WAR1
Gui, Add, Button, x50 y80 gRadio_Label28, WAR2
Gui, Add, Button, x50 y130 gRadio_Label29, HOLD
Gui, Add, Button, x150 y30 gRadio_Label30, ZRBZ
Gui, Add, Button, x150 y80 gRadio_Label31, ZWEZ
Gui, Add, Button, x150 y130 gRadio_Label32, QA01

Gui, Show, w275 h215, MB11
Gui, Submit, NoHide
return
}

Radio_Label27:
{
Gui, Destroy
send WAR1{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label28:
{
Gui, Destroy
send WAR2{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label29:
{
Gui, Destroy
send HOLD{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label30:
{
Gui, Destroy
send ZRBZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label31:
{
Gui, Destroy
send ZWEZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label32:
{
Gui, Destroy
send QA01{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label22:
{
Gui, Destroy
send {ctrldown}{a}{ctrlup}ZWEZ{enter}
sleep, 500
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label33, WAR1
Gui, Add, Button, x50 y80 gRadio_Label34, WAR2
Gui, Add, Button, x50 y130 gRadio_Label35, HOLD
Gui, Add, Button, x150 y30 gRadio_Label36, ZRBZ
Gui, Add, Button, x150 y80 gRadio_Label37, ZWEZ
Gui, Add, Button, x150 y130 gRadio_Label38, QA01

Gui, Show, w250 h400, MB11
Gui, Submit, NoHide
return
}

Radio_Label33:
{
Gui, Destroy
send WAR1{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label34:
{
Gui, Destroy
send WAR2{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label35:
{
Gui, Destroy
send HOLD{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label36:
{
Gui, Destroy
send ZRBZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label37:
{
Gui, Destroy
send ZWEZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label38:
{
Gui, Destroy
send QA01{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}


Radio_Label23:
{
Gui, Destroy
send {ctrldown}{a}{ctrlup}WAR1{enter}
sleep, 500
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label39, WAR1
Gui, Add, Button, x50 y80 gRadio_Label40, WAR2
Gui, Add, Button, x50 y130 gRadio_Label41, HOLD
Gui, Add, Button, x150 y30 gRadio_Label42, ZRBZ
Gui, Add, Button, x150 y80 gRadio_Label43, ZWEZ
Gui, Add, Button, x150 y130 gRadio_Label44, QA01

Gui, Show, w250 h400, MB11
Gui, Submit, NoHide
return
}

Radio_Label39:
{
Gui, Destroy
send WAR1{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label40:
{
Gui, Destroy
send WAR2{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label41:
{
Gui, Destroy
send HOLD{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label42:
{
Gui, Destroy
send ZRBZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label43:
{
Gui, Destroy
send ZWEZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label44:
{
Gui, Destroy
send QA01{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label24:
{
Gui, Destroy
send {ctrldown}{a}{ctrlup}WAR2{enter}
sleep, 500
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label45, WAR1
Gui, Add, Button, x50 y80 gRadio_Label46, WAR2
Gui, Add, Button, x50 y130 gRadio_Label47, HOLD
Gui, Add, Button, x150 y30 gRadio_Label48, ZRBZ
Gui, Add, Button, x150 y80 gRadio_Label49, ZWEZ
Gui, Add, Button, x150 y130 gRadio_Label50, QA01

Gui, Show, w250 h400, MB11
Gui, Submit, NoHide
return
}

Radio_Label45:
{
Gui, Destroy
send WAR1{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label46:
{
Gui, Destroy
send WAR2{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label47:
{
Gui, Destroy
send HOLD{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label48:
{
Gui, Destroy
send ZRBZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label49:
{
Gui, Destroy
send ZWEZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label50:
{
Gui, Destroy
send QA01{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label25:
{
Gui, Destroy
send {ctrldown}{a}{ctrlup}HOLD{enter}
sleep, 500
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label51, WAR1
Gui, Add, Button, x50 y80 gRadio_Label52, WAR2
Gui, Add, Button, x50 y130 gRadio_Label53, HOLD
Gui, Add, Button, x150 y30 gRadio_Label54, ZRBZ
Gui, Add, Button, x150 y80 gRadio_Label55, ZWEZ
Gui, Add, Button, x150 y130 gRadio_Label56, QA01

Gui, Show, w250 h400, MB11
Gui, Submit, NoHide
return
}

Radio_Label51:
{
Gui, Destroy
send WAR1{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label52:
{
Gui, Destroy
send WAR2{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label53:
{
Gui, Destroy
send HOLD{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label54:
{
Gui, Destroy
send ZRBZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label55:
{
Gui, Destroy
send ZWEZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label56:
{
Gui, Destroy
send QA01{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label26:
{
Gui, Destroy
send {ctrldown}{a}{ctrlup}QA01{enter}
sleep, 500
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 Group +default gRadio_Label57, WAR1
Gui, Add, Button, x50 y80 gRadio_Label58, WAR2
Gui, Add, Button, x50 y130 gRadio_Label59, HOLD
Gui, Add, Button, x150 y30 gRadio_Label60, ZRBZ
Gui, Add, Button, x150 y80 gRadio_Label61, ZWEZ
Gui, Add, Button, x150 y130 gRadio_Label62, QA01

Gui, Show, w250 h400, MB11
Gui, Submit, NoHide
return
}

Radio_Label57:
{
Gui, Destroy
send WAR1{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label58:
{
Gui, Destroy
send WAR2{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label59:
{
Gui, Destroy
send HOLD{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label60:
{
Gui, Destroy
send ZRBZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label61:
{
Gui, Destroy
send ZWEZ{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label62:
{
Gui, Destroy
send QA01{tab}{ctrldown}{v}{ctrlup}{tab}1{tab}{tab}{tab}
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F2}{ctrlup}
sleep, 500
send {tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 500
WinActivate, Enter Goods Movement: New Items
WinWaitActive Enter Goods Movement: New Items
#IfWinActive Enter Goods Movement: New Items
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 500
send {enter}{enter}
sleep, 500
send {ctrldown}{s}{ctrlup}
sleep, 500
send {altdown}{F4}{altup}
return
}

Radio_Label8:
{
Gui, Destroy
Gui, Font, s15, Arial
Gui, Add, Button, x50 y30 +default Group gRadio_Label19, Create a 2262266 line.
Gui, Add, Button, x50 y100 gRadio_Label20, Create a 6065 line.

Gui, Show, w320 h185, Line Creation
Gui, Submit, NoHide
return
}

Radio_Label19:
{
MsgBox, 4,, Do you want to create a 2262266 line?
IfMsgBox, No, Reload
Gui, Destroy
WinActivate, Change Order: Initial Screen
WinWaitActive Change Order: Initial Screen
#IfWinActive Change Order: Initial Screen
send {shiftdown}{F6}{shiftup}
WinWaitActive Change Service Order
#IfWinActive Change Service Order
send {ctrldown}{left}{ctrlup}
send {ctrldown}{a}{ctrlup}0010{tab}2262266{tab}{tab}{tab}{tab}{tab}{tab}PC00{tab}{tab}{tab}{tab}ST{tab}SWCONF
send {enter}
WinWaitActive Information
#IfWinActive Information
send {enter}
WinWaitActive Change Service Order
#IfWinActive Change Service Order
send {enter}
sleep, 1500
send {ctrldown}{s}{ctrlup}
WinWaitActive Change Order: Initial Screen
#IfWinActive Change Order: Initial Screen
sleep, 500
send {ctrldown}{a}{c}{ctrlup}{tab}{tab}/NZT99{enter}
WinWaitActive Post goods issue
#IfWinActive Post goods issue
send {down}{ctrldown}{v}{ctrlup}{enter}
sleep, 1000
send 2262266
sleep, 500
send {enter}
sleep, 500
send {shiftdown}{F11}{shiftup}
sleep, 1000
WinActivate, SLW Database.xlsm
WinWaitActive SLW Database.xlsm
#IfWinActive SLW Database.xlsm
sleep, 500
MouseClick, left, 485, 230
sleep, 500
send {ctrldown}{v}{ctrlup}
return
}

Radio_Label20:
{
MsgBox, 4,, Do you want to create a 6065 line?
IfMsgBox, No, Reload
Gui, Destroy
WinActivate, Change Order: Initial Screen
WinWaitActive Change Order: Initial Screen
#IfWinActive Change Order: Initial Screen
send {shiftdown}{F6}{shiftup}
WinWaitActive Change Service Order for Requests
#IfWinActive Change Service Order for Requests
send {ctrldown}{left}{ctrlup}
send {ctrldown}{a}{ctrlup}8000{tab}6065{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}ST{tab}SWCONF
send {ctrldown}{s}{ctrlup}
WinWaitActive Information
#IfWinActive Information
send {enter}
sleep, 500
send {enter}
return
}

Radio_Label9:
{
MsgBox, 4,, Do you want to Print the ZLB and Dispatch with Serial Number and Asset?
IfMsgBox, No, Return
Gui, Destroy
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F5}{ctrlup}
sleep, 1000
send {ctrldown}{F2}{ctrlup}
sleep, 1000
send {down 2}{ctrldown}{a}{c}{ctrlup}
sleep, 500
run, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ and Warranty Automation\ZWEZ Automated Process SAP Scripts\Del to Txt.vbs
sleep, 1500
send {enter}
sleep, 500
MouseClick, left, 550, 900
send {enter}
send {ctrldown}{v}{ctrlup}
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ and Warranty Automation\ZWEZ Automated Process SAP Scripts\Script220.vbs
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{a}{c}{ctrlup}{esc}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\ME22N.vbs
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {tab}{tab}{tab}{tab}{tab}/NZVW1{enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
send {ctrldown}{v}{ctrlup}
sleep, 500
send {shiftdown}{F6}{shiftup}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
sleep, 500
send {down}{enter}{enter}
sleep, 500
send {space}{down}{enter}{down}
send {ctrldown}{a}{ctrlup}UKHTFLP037
sleep, 500
send {enter}
sleep, 1000
send {enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
sleep, 1000
send {ctrldown}{tab}{ctrlup}{right}/NME22N{enter}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{v}{ctrlup}{enter}
return
}

Radio_Label10:
{
MsgBox, 4,, Do you want to Print the ZLB and Dispatch with Serial Number Only?
IfMsgBox, No, Reload
Gui, Destroy
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F5}{ctrlup}
sleep, 1000
send {ctrldown}{F2}{ctrlup}
sleep, 1000
send {down 2}{ctrldown}{a}{c}{ctrlup}
sleep, 500
run, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ and Warranty Automation\ZWEZ Automated Process SAP Scripts\Del to Txt.vbs
sleep, 1500
send {enter}
sleep, 500
MouseClick, left, 550, 900
send {enter}
send {ctrldown}{v}{ctrlup}
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ and Warranty Automation\ZWEZ Automated Process SAP Scripts\Script220.vbs
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{a}{c}{ctrlup}{esc}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\ME22N.vbs
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {tab}{tab}{tab}{tab}{tab}/NZVW1{enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
send {ctrldown}{v}{ctrlup}
sleep, 500
send {shiftdown}{F6}{shiftup}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
sleep, 500
send {down}{enter}{enter}
sleep, 500
send {up}{ctrldown}{a}{ctrlup}UKHTFLP037
sleep, 500
send {enter}
sleep, 1000
send {enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
sleep, 1000
send {ctrldown}{tab}{ctrlup}{right}/NME22N{enter}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{v}{ctrlup}{enter}
return
}

Radio_Label11:
{
MsgBox, 4,, Do you want to Print the ZLB and Dispatch with No Serial Number and Asset?
IfMsgBox, No, Reload
Gui, Destroy
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F5}{ctrlup}
sleep, 1000
send {ctrldown}{F2}{ctrlup}
sleep, 1000
send {down 2}{ctrldown}{a}{c}{ctrlup}
sleep, 500
run, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ and Warranty Automation\ZWEZ Automated Process SAP Scripts\Del to Txt.vbs
sleep, 1500
send {enter}
sleep, 500
MouseClick, left, 550, 900
send {enter}
send {ctrldown}{v}{ctrlup}
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ and Warranty Automation\ZWEZ Automated Process SAP Scripts\Script220.vbs
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{a}{c}{ctrlup}{esc}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\ME22N.vbs
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {tab}{tab}{tab}{tab}{tab}/NZVW1{enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
send {ctrldown}{v}{ctrlup}
sleep, 500
send {shiftdown}{F6}{shiftup}
sleep, 500
send {enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
sleep, 1000
send {ctrldown}{tab}{ctrlup}{right}/NME22N{enter}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{v}{ctrlup}{enter}
return
}

Radio_Label12:
{
MsgBox, 4,, Do you want to Print the ZLB, Dispatch and Scrap with Serial Number and Asset?
IfMsgBox, No, Reload
Gui, Destroy
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{a}{c}{ctrlup}{esc}
run, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\Script221.vbs
sleep, 1500
send {enter}
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\Scrap.vbs
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {tab}{tab}{tab}{tab}{tab}/NZVW1{enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
send {ctrldown}{v}{ctrlup}
sleep, 500
send {shiftdown}{F6}{shiftup}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
sleep, 500
send {down}{enter}{enter}
sleep, 500
send {space}{down}{enter}{down}
send {ctrldown}{a}{ctrlup}UKHTFLP037
sleep, 500
send {enter}
sleep, 1000
send {enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
sleep, 500
send {ctrldown}{tab}{ctrlup}{right}/NZR12{enter}
WinWaitActive SAP
#IfWinActive SAP
send {ctrldown}{v}{ctrlup}{enter}
sleep, 1000
send {enter}
WinWaitActive SAP
#IfWinActive SAP
send {ctrldown}{v}{ctrlup}{down}2
sleep, 500
send {ctrldown}{shiftdown}{F11}{ctrlup}{shiftup}
WinWaitActive Item will be scrapped!
#IfWinActive Item will be scrapped!
send {down 3}{enter}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
sleep, 500
send {down}{enter}{enter}
sleep, 500
send {space}{down}{enter}{enter}
WinWaitActive Scrapping
#IfWinActive Scrapping
send {enter}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
sleep, 500
send {down}{enter}{enter}
sleep, 500
send {space}{down}{enter}{enter}
WinWaitActive Post Goods Receipt
#IfWinActive Post Goods Receipt
send {enter}
WinWaitActive SAP
#IfWinActive SAP
sleep, 500
send {ctrldown}{tab}{ctrlup}{right}/NME22N{enter}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{v}{ctrlup}{enter}
return
}

Radio_Label13:
{
MsgBox, 4,, Do you want to Print the ZLB, Dispatch and Scrap with Serial Number Only?
IfMsgBox, No, Reload
Gui, Destroy
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{a}{c}{ctrlup}{esc}
run, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\Script221.vbs
sleep, 1500
send {enter}
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\Scrap.vbs
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {tab}{tab}{tab}{tab}{tab}/NZVW1{enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
send {ctrldown}{v}{ctrlup}
sleep, 500
send {shiftdown}{F6}{shiftup}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
sleep, 500
send {down}{enter}{enter}
sleep, 500
send {up}{ctrldown}{a}{ctrlup}UKHTFLP037
sleep, 500
send {enter}
sleep, 1000
send {enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
sleep, 500
send {ctrldown}{tab}{ctrlup}{right}/NZR12{enter}
WinWaitActive SAP
#IfWinActive SAP
send {ctrldown}{v}{ctrlup}{enter}
sleep, 1000
send {enter}
WinWaitActive SAP
#IfWinActive SAP
send {ctrldown}{v}{ctrlup}{down}2
sleep, 500
send {ctrldown}{shiftdown}{F11}{ctrlup}{shiftup}
WinWaitActive Item will be scrapped!
#IfWinActive Item will be scrapped!
send {down 3}{enter}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
sleep, 500
send {down}{enter}{enter}
sleep, 500
send {enter}
WinWaitActive Scrapping
#IfWinActive Scrapping
send {enter}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
sleep, 500
send {down}{enter}{enter}
sleep, 500
send {enter}
WinWaitActive Post Goods Receipt
#IfWinActive Post Goods Receipt
send {enter}
WinWaitActive SAP
#IfWinActive SAP
sleep, 500
send {ctrldown}{tab}{ctrlup}{right}/NME22N{enter}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{v}{ctrlup}{enter}
return
}

Radio_Label14:
{
MsgBox, 4,, Do you want to Print the ZLB, Dispatch and Scrap with No Serial Number and Asset?
IfMsgBox, No, Reload
Gui, Destroy
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
sleep, 500
send {ctrldown}{a}{c}{ctrlup}{esc}
run, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\Script221.vbs
sleep, 1500
send {enter}
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\Scrap.vbs
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {tab}{tab}{tab}{tab}{tab}/NZVW1{enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
send {ctrldown}{v}{ctrlup}
sleep, 500
send {shiftdown}{F6}{shiftup}
sleep, 1000
send {enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
sleep, 500
send {ctrldown}{tab}{ctrlup}{right}/NZR12{enter}
WinWaitActive SAP
#IfWinActive SAP
send {ctrldown}{v}{ctrlup}{enter}
sleep, 1000
send {enter}
WinWaitActive SAP
#IfWinActive SAP
send {ctrldown}{v}{ctrlup}{down}2
sleep, 500
send {ctrldown}{shiftdown}{F11}{ctrlup}{shiftup}
WinWaitActive Item will be scrapped!
#IfWinActive Item will be scrapped!
send {down 3}{enter}
send {enter}
WinWaitActive Scrapping
#IfWinActive Scrapping
send {enter}
WinWaitActive Post Goods Receipt
#IfWinActive Post Goods Receipt
send {enter}
WinWaitActive SAP
#IfWinActive SAP
sleep, 500
send {ctrldown}{tab}{ctrlup}{right}/NME22N{enter}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{v}{ctrlup}{enter}
return
}

Radio_Label15:
{
MsgBox, 4,, Do you want to Dispatch and Scrap with Serial Number and Asset + 6065 Line?
IfMsgBox, No, Reload
Gui, Destroy
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{a}{c}{ctrlup}{esc}
run, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\Script221.vbs
sleep, 1500
send {enter}
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\Scrap2.vbs
send {ctrldown}{s}{ctrlup}
WinWaitActive Save Document
#IfWinActive Select Document
send {enter}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
sleep, 1000
send {tab}{tab}{tab}{tab}{tab}/NZVW1{enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
send {ctrldown}{v}{ctrlup}
sleep, 500
send {shiftdown}{F6}{shiftup}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
sleep, 500
send {down}{enter}{enter}
sleep, 500
send {space}{down}{enter}{enter}
sleep, 1000
send {enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
sleep, 500
send {ctrldown}{tab}{ctrlup}{right}/NZR12{enter}
WinWaitActive SAP
#IfWinActive SAP
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 1000
send {enter}
WinWaitActive SAP
#IfWinActive SAP
send {ctrldown}{v}{ctrlup}{down}2
sleep, 500
send {ctrldown}{shiftdown}{F11}{ctrlup}{shiftup}
WinWaitActive Item will be scrapped!
#IfWinActive Item will be scrapped!
send {down 3}{enter}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
send {down}{enter}{enter}
sleep, 500
send {space}{down}{enter}{enter}
WinWaitActive Scrapping
#IfWinActive Scrapping
send {enter}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
sleep, 500
send {down}{enter}{enter}
sleep, 500
send {space}{down}{enter}{enter}
WinWaitActive Post Goods Receipt
#IfWinActive Post Goods Receipt
send {enter}
WinWaitActive SAP
#IfWinActive SAP
sleep, 500
send {ctrldown}{tab}{ctrlup}{right}/NIW32{enter}
WinWaitActive Change Order: Initial Screen
#IfWinActive Change Order: Initial Screen
send {shiftdown}{F6}{shiftup}
WinWaitActive Change Service Order for Requests
#IfWinActive Change Service Order for Requests
send {ctrldown}{left}{ctrlup}
send {ctrldown}{a}{ctrlup}8000{tab}6065{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}ST{tab}SWCONF
send {ctrldown}{s}{ctrlup}
WinWaitActive Information
#IfWinActive Information
send {enter}
sleep, 500
send {enter}
WinWaitActive Change Order: Initial Screen
#IfWinActive Change Order: Initial Screen
sleep, 500
send {ctrldown}{tab}{ctrlup}{right}/NME22N{enter}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{v}{ctrlup}{enter}
return
}

Radio_Label16:
{
MsgBox, 4,, Do you want to Dispatch and Scrap with Serial Number Only + 6065 Line?
IfMsgBox, No, Reload
Gui, Destroy
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{a}{c}{ctrlup}{esc}
run, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\Script221.vbs
sleep, 1500
send {enter}
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\Scrap2.vbs
send {ctrldown}{s}{ctrlup}
WinWaitActive Save Document
#IfWinActive Select Document
send {enter}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
sleep, 1000
send {tab}{tab}{tab}{tab}{tab}/NZVW1{enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
send {ctrldown}{v}{ctrlup}
sleep, 500
send {shiftdown}{F6}{shiftup}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
sleep, 500
send {down}{enter}{enter}{enter}
sleep, 1000
send {enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
sleep, 500
send {ctrldown}{tab}{ctrlup}{right}/NZR12{enter}
WinWaitActive SAP
#IfWinActive SAP
sleep, 500
send {ctrldown}{v}{ctrlup}{enter}
sleep, 1000
send {enter}
WinWaitActive SAP
#IfWinActive SAP
send {ctrldown}{v}{ctrlup}{down}2
sleep, 500
send {ctrldown}{shiftdown}{F11}{ctrlup}{shiftup}
WinWaitActive Item will be scrapped!
#IfWinActive Item will be scrapped!
send {down 3}{enter}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
sleep, 500
send {down}{enter}{enter}{enter}
WinWaitActive Scrapping
#IfWinActive Scrapping
send {enter}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
sleep, 500
send {down}{enter}{enter}{enter}
WinWaitActive Post Goods Receipt
#IfWinActive Post Goods Receipt
send {enter}
WinWaitActive SAP
#IfWinActive SAP
sleep, 500
send {ctrldown}{tab}{ctrlup}{right}/NIW32{enter}
WinWaitActive Change Order: Initial Screen
#IfWinActive Change Order: Initial Screen
send {shiftdown}{F6}{shiftup}
WinWaitActive Change Service Order for Requests
#IfWinActive Change Service Order for Requests
send {ctrldown}{left}{ctrlup}
send {ctrldown}{a}{ctrlup}8000{tab}6065{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}ST{tab}SWCONF
send {ctrldown}{s}{ctrlup}
WinWaitActive Information
#IfWinActive Information
send {enter}
sleep, 500
send {enter}
WinWaitActive Change Order: Initial Screen
#IfWinActive Change Order: Initial Screen
sleep, 500
send {ctrldown}{tab}{ctrlup}{right}/NME22N{enter}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{v}{ctrlup}{enter}
return
}

Radio_Label17:
{
MsgBox, 4,, Do you want to Print the ZLB, Dispatch with Serial Number and Asset and go to Warranty Management Tool?
IfMsgBox, No, Reload
Gui, Destroy
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F5}{ctrlup}
sleep, 1000
send {ctrldown}{F2}{ctrlup}
sleep, 1000
send {down 2}{ctrldown}{a}{c}{ctrlup}
sleep, 500
run, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ and Warranty Automation\ZWEZ Automated Process SAP Scripts\Del to Txt.vbs
sleep, 1000
send {enter}
sleep, 500
MouseClick, left, 550, 900
send {enter}
send {ctrldown}{v}{ctrlup}
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ and Warranty Automation\ZWEZ Automated Process SAP Scripts\Script220.vbs
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{a}{c}{ctrlup}{esc}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\ME22N.vbs
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {tab}{tab}{tab}{tab}{tab}/NZVW1{enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
send {ctrldown}{v}{ctrlup}
sleep, 500
send {shiftdown}{F6}{shiftup}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
sleep, 500
send {down}{enter}{enter}
sleep, 500
send {space}{down}{enter}{down}
send {ctrldown}{a}{ctrlup}UKHTFLP037
sleep, 500
send {enter}
sleep, 1000
send {enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
sleep, 1000
send {ctrldown}{tab}{ctrlup}{right}/NME22N{enter}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{v}{ctrlup}{enter}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{tab}{tab}{ctrlup}{tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 1000
WinActivate, Warranty Management Tool.xlsm
WinWaitActive Warranty Management Tool.xlsm
#IfWinActive Warranty Management Tool.xlsm
sleep, 500
MouseClick, left, 220, 225
sleep, 500
send {ctrldown}{v}{ctrlup}{shiftdown}{left 2}{shiftup}{ctrldown}{x}{ctrlup}{tab}{ctrldown}{v}{ctrlup}
sleep, 500
send {enter}{enter}
WinWaitActive Enter / Update
#IfWinActive Enter / Update
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\ScriptW2.vbs
send {down}{ctrldown}{a}{c}{ctrlup}
sleep, 1000
WinActivate, Enter / Update
WinWaitActive Enter / Update
#IfWinActive Enter / Update
send {ctrldown}{a}{v}{ctrlup}{down}
sleep, 1000
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {up 13}{tab}{ctrldown}{a}{c}{ctrlup}
sleep, 1000
WinActivate, Enter / Update
WinWaitActive Enter / Update
#IfWinActive Enter / Update
send {ctrldown}{a}{v}{ctrlup}{down}
sleep, 1000
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\ScriptC.vbs
send {tab}{ctrldown}{a}{c}{ctrlup}
sleep, 1000
WinActivate, Enter / Update
WinWaitActive Enter / Update
#IfWinActive Enter / Update
send {ctrldown}{a}{v}{ctrlup}{enter}
send {tab}{tab}{tab}
send {enter}
return
}

Radio_Label18:
{
MsgBox, 4,, Do you want to Print the ZLB, Dispatch with Serial Number Only and go to Warranty Management Tool?
IfMsgBox, No, Reload
Gui, Destroy
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{F5}{ctrlup}
sleep, 1000
send {ctrldown}{F2}{ctrlup}
sleep, 1000
send {down 2}{ctrldown}{a}{c}{ctrlup}
sleep, 500
run, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ and Warranty Automation\ZWEZ Automated Process SAP Scripts\Del to Txt.vbs
sleep, 1000
send {enter}
sleep, 500
MouseClick, left, 550, 900
send {enter}
send {ctrldown}{v}{ctrlup}
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ and Warranty Automation\ZWEZ Automated Process SAP Scripts\Script220.vbs
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{a}{c}{ctrlup}{esc}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\ME22N.vbs
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {tab}{tab}{tab}{tab}{tab}/NZVW1{enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
send {ctrldown}{v}{ctrlup}
sleep, 500
send {shiftdown}{F6}{shiftup}
WinWaitActive Enter Material
#IfWinActive Enter Material
send {space}
sleep, 500
send {down}{enter}{enter}
sleep, 500
send {up}{ctrldown}{a}{ctrlup}UKHTFLP037
sleep, 500
send {enter}
sleep, 1000
send {enter}
WinWaitActive Quick input Post Goods Issue
#IfWinActive Quick input Post Goods Issue
sleep, 1000
send {ctrldown}{tab}{ctrlup}{right}/NME22N{enter}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {shiftdown}{F5}{shiftup}
WinWaitActive Select Document
#IfWinActive Select Document
send {ctrldown}{v}{ctrlup}{enter}
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {ctrldown}{tab}{tab}{ctrlup}{tab}{down}{ctrldown}{a}{c}{ctrlup}
sleep, 1000
WinActivate, Warranty Management Tool.xlsm
WinWaitActive Warranty Management Tool.xlsm
#IfWinActive Warranty Management Tool.xlsm
sleep, 500
MouseClick, left, 220, 225
sleep, 500
send {ctrldown}{v}{ctrlup}{shiftdown}{left 2}{shiftup}{ctrldown}{x}{ctrlup}{tab}{ctrldown}{v}{ctrlup}
sleep, 500
send {enter}{enter}
WinWaitActive Enter / Update
#IfWinActive Enter / Update
sleep, 500
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\ScriptW2.vbs
send {down}{ctrldown}{a}{c}{ctrlup}
sleep, 1000
WinActivate, Enter / Update
WinWaitActive Enter / Update
#IfWinActive Enter / Update
send {ctrldown}{a}{v}{ctrlup}{down}
sleep, 1000
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
send {up 13}{tab}{ctrldown}{a}{c}{ctrlup}
sleep, 1000
WinActivate, Enter / Update
WinWaitActive Enter / Update
#IfWinActive Enter / Update
send {ctrldown}{a}{v}{ctrlup}{down}
sleep, 1000
WinActivate, Subc. maintenance
WinWaitActive Subc. maintenance
#IfWinActive Subc. maintenance
runwait, C:\Users\ALSTEFAN\OneDrive - COMPUTACENTER\Desktop\ZWEZ Automated Process V3.0\ZWEZ Automated Process SAP Scripts\ScriptC.vbs
send {tab}{ctrldown}{a}{c}{ctrlup}
sleep, 1000
WinActivate, Enter / Update
WinWaitActive Enter / Update
#IfWinActive Enter / Update
send {ctrldown}{a}{v}{ctrlup}{enter}
send {tab}{tab}{tab}
send {enter}
return
}

#IfWinActive Material Number
{
~F8:: 
SEND {DOWN 5}
SEND UNBW
SEND {DOWN 5}
SEND 8103
SEND {ENTER}
RETURN
}

#IfWinActive Material Number
{
~F7:: 
SEND {DOWN 5}
SEND ERSA
SEND {DOWN 5}
SEND 8103
SEND {ENTER}
RETURN
}

#IfWinActive Material Number
{
~RCtrl::
MouseClick, left, 290, 40
return
}

#IfWinActive Display Material
{
~RCtrl::
MouseClick, left, 285, 190
return
}

#IfWinActive ME22N
{
~Esc::
Reload
}

#IfWinActive ZVW1
{
~Esc::
Reload
}

#IfWinActive Line
{
~Esc::
Reload
}

#IfWinActive Multiple serial number
{
~Enter::
MouseMove, 225, 335, 0
sleep, 200
sendinput {lbutton 2}
WinWaitActive Information
#IfWinActive Information
send {enter}
return
}

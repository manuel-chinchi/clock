;~ #include <GUIConstantsEx.au3>
;~ #include <WindowsConstants.au3>
;~ #Region ### START Koda GUI section ### Form=C:\Users\manue\Programacion\github\clock\src\UI_Koda\timer_view.kxf
;~ $frmTimer = GUICreate("Timer", 639, 428, 261, 167, BitOR($WS_SYSMENU,$WS_POPUP))

;~ GUICtrlCreateLabel("", 1, 1, 637, 15, -1, $GUI_WS_EX_PARENTDRAG)
;~ GUICtrlSetBkColor(-1, 0x000055)

;~ GUISetState(@SW_SHOW)
;~ #EndRegion ### END Koda GUI section ###

;~ While 1
;~ 	$nMsg = GUIGetMsg()
;~ 	Switch $nMsg
;~ 		Case $GUI_EVENT_CLOSE
;~ 			Exit

;~ 	EndSwitch
;~ WEnd

;~ Based from
;~ url:https://www.autoitscript.com/wiki/Moving_and_Resizing_PopUp_GUIs

#include <GuiconstantsEx.au3>
#include <WindowsConstants.au3>
#include <SendMessage.au3>

Global Const $SC_DRAGMOVE = 0xF012

HotKeySet("{ESC}", "On_Exit")

$hGui = GUICreate("X", 100, 100, -1, -1, $WS_POPUP)
GUISetBkColor(0x00FF00, $hGUI)
$hButton = GUICtrlCreateButton("SALIR", 10, 35, 80, 30)
GUISetState()
;~ GUIRegisterMsg($GUI_EVENT_PRIMARYDOWN, "GUI_EVENT_PRIMARYDOWN")
GUIRegisterMsg($WM_NCHITTEST, "WM_NCHITTEST")

While 1
    $iMsg = GUIGetMsg()
    Switch $iMsg
        Case $hButton
            On_Button()
    EndSwitch
WEnd

Func On_Button()
    Exit
EndFunc   ;==>On_Button

Func On_Exit()
    Exit
EndFunc   ;==>On_Exit

Func GUI_EVENT_PRIMARYDOWN($hWndGUI, $MsgID, $WParam, $LParam)
    _SendMessage($hWndGUI, $WM_SYSCOMMAND, $SC_DRAGMOVE, 0)

    ;~ #forceref $hWndGUI, $iMsg
    
    ; NO FUNCIONO
    ;~ If $MsgID == $GUI_EVENT_PRIMARYDOWN Then
    ;~     ConsoleWrite('---' &@CRLF)
    ;~ EndIf
    
    ;~ NO FUNCIONO
    ;~ If $MsgID == $GUI_EVENT_PRIMARYDOWN Then
    ;~     ConsoleWrite('---' &@CRLF)        
    ;~ EndIf
    Return $GUI_RUNDEFMSG
EndFunc

Func WM_NCHITTEST($hWndGUI, $MsgID, $WParam, $LParam)
    _SendMessage($hWndGUI, $WM_SYSCOMMAND, $SC_DRAGMOVE, 0)
    Return $GUI_RUNDEFMSG
EndFunc
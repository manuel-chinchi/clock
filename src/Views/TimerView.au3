;~ util utl https://www.autoitscript.com/wiki/Moving_and_Resizing_PopUp_GUIs
#include '..\Libraries\AutoItObject.au3'
#include '..\Constants.au3'
#include <GuiconstantsEx.au3>
#include <WindowsConstants.au3>
#include <SendMessage.au3>

Global Const $SC_DRAGMOVE = 0xF012

_AutoItObject_Startup()

Func TimerView()
    Local $self = _AutoItObject_Create()

    _AutoItObject_AddProperty($self, "hGui", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddProperty($self, "btnExit", $ELSCOPE_PUBLIC, 0)

    _AutoItObject_AddMethod($self, "Create", "TimerView__Create")
    _AutoItObject_AddMethod($self, "Show", "TimerView__Show")

    Return $self
EndFunc

Func TimerView__Create($self)
    $self.hGui = GUICreate("", 342, 150, -1, -1, $WS_POPUP)
    GUIRegisterMsg($WM_NCHITTEST, "WM_NCHITTEST")

    GUISetBkColor($COLOR_BLACK, $self.hGui)
    ;~ $self.btnExit = GUICtrlCreateButton('Exit', 10, 35, 80, 30)

    Return $self.hGui
EndFunc

Func TimerView__Show($self)
    GUISetState(@SW_SHOW, $self.hGui)
EndFunc

Func WM_NCHITTEST($hWndGUI, $MsgID, $WParam, $LParam)
    _SendMessage($hWndGUI, $WM_SYSCOMMAND, $SC_DRAGMOVE, 0)
    Return $GUI_RUNDEFMSG
EndFunc
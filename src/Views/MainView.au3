#include "..\Libraries\AutoItObject.au3"
#include "..\Constants.au3"
#include <GUIConstants.au3>

_AutoItObject_Startup()

Func MainView()
    Local $self = _AutoItObject_Create()

    _AutoItObject_AddProperty($self, "hGui", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddProperty($self, "lblTime", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddProperty($self, "lblDate", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddMethod($self, "Create", "MainView__Create")
    _AutoItObject_AddMethod($self, "Show", "MainView__Show")

    Return $self
EndFunc

Func MainView__Create($self)
    $self.hGui = GUICreate($APP_NAME, 331, 241, -1, -1, $WS_SYSMENU)
    $self.lblTime = GUICtrlCreateLabel('hh:mm:ss', 32, 54, 268, 59, BitOR($SS_CENTER,$SS_CENTERIMAGE))
    GUICtrlSetFont(-1, 28, 400, 0, $APP_FONT_NAME)
    
    $self.lblDate = GUICtrlCreateLabel('dd/mm/yy', 32, 0, 268, 59, BitOR($SS_CENTER,$SS_CENTERIMAGE))
    GUICtrlSetFont(-1, 28, 400, 0, $APP_FONT_NAME)

    GUICtrlSetColor($self.lblTime, $APP_FONT_COLOR)
    GUICtrlSetColor($self.lblDate, $APP_FONT_COLOR)
    GUISetBkColor($APP_BACKGROUND_COLOR)

    Return $self.hGui
EndFunc

Func MainView__Show($self)
    GUISetState(@SW_SHOW, $self.hGui)
EndFunc
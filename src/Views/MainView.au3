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
    $self.hGui = GUICreate('', 320, 240, -1, -1)
    $self.lblTime = GUICtrlCreateLabel('00:00:00', 56, 120, 204, 51, BitOR($SS_CENTER,$SS_CENTERIMAGE))
    GUICtrlSetFont(-1, 28, 400, 0, $APP_FONT_NAME)
    
    $self.lblDate = GUICtrlCreateLabel('dd:mm:yy', 56, 56, 204, 51, BitOR($SS_CENTER,$SS_CENTERIMAGE))
    GUICtrlSetFont(-1, 28, 400, 0, $APP_FONT_NAME)

    Return $self.hGui
EndFunc

Func MainView__Show($self)
    GUISetState(@SW_SHOW, $self.hGui)
EndFunc
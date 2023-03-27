#include "..\Libraries\AutoItObject.au3"
#include "..\Constants.au3"
#include <GUIConstants.au3>

_AutoItObject_Startup()

Func MainView()
    Local $self = _AutoItObject_Create()

    _AutoItObject_AddProperty($self, "hGui", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddProperty($self, "lblTime", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddProperty($self, "lblDate", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddProperty($self, "grpSettings", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddProperty($self, "chkWeather", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddProperty($self, "chkFormatTime", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddProperty($self, "lblFormatTime", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddMethod($self, "Create", "MainView__Create")
    _AutoItObject_AddMethod($self, "Show", "MainView__Show")

    Return $self
EndFunc

Func MainView__Create($self)
    $self.hGui = GUICreate($APP_NAME, 342, 410, -1, -1, $WS_SYSMENU)

    $self.lblTime = GUICtrlCreateLabel('hh:mm:ss', 32, 78, 268, 59, BitOR($SS_CENTER,$SS_CENTERIMAGE))
    GUICtrlSetFont(-1, 28, 400, 0, $APP_FONT_NAME)
    
    $self.lblDate = GUICtrlCreateLabel('dd/mm/yy', 32, 14, 268, 59, BitOR($SS_CENTER,$SS_CENTERIMAGE))
    GUICtrlSetFont(-1, 28, 400, 0, $APP_FONT_NAME)

    $self.grpSettings = GUICtrlCreateGroup("SETTINGS", 24, 194, 284, 151)
    GUICtrlSetFont(-1, 10, 800, 0, 'Hack')

    $self.chkWeather = GUICtrlCreateCheckbox('SHOW CLIMATE', 48, 216, 233, 41)
    GUICtrlSetFont(-1, 10, 800, 0, 'Hack')

    $self.chkFormatTime = GUICtrlCreateCheckbox('FORMAT 24 HS', 48, 256, 233, 41)
    GUICtrlSetFont(-1, 10, 800, 0, 'Hack')

    $self.chkDarkMode = GUICtrlCreateCheckbox('DARK MODE', 48, 296, 233, 41)
    GUICtrlSetFont(-1, 10, 800, 0, 'Hack')

    GUICtrlCreateGroup("", -99, -99, 1, 1) ; ???

    $self.lblFormatTime = GUICtrlCreateLabel('', 278, 102, 52, 28, BitOR($SS_LEFT,$SS_CENTERIMAGE))
    GUICtrlSetFont(-1, 12, 800, 0, "Hack")

    #Region SetColors
    ;~ GUICtrlSetColor($self.lblTime, $APP_FONT_COLOR)
    ;~ GUICtrlSetColor($self.lblDate, $APP_FONT_COLOR)
    ;~ GUISetBkColor($APP_BACKGROUND_COLOR)
    #EndRegion

    Return $self.hGui
EndFunc

Func MainView__Show($self)
    GUISetState(@SW_SHOW, $self.hGui)
EndFunc
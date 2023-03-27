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
    _AutoItObject_AddProperty($self, "chkAlwaysOnTop", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddProperty($self, "chkFormatTime", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddProperty($self, "chkDarkMode", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddProperty($self, "lblFormatTime", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddProperty($self, "lblFormatTime", $ELSCOPE_PUBLIC, 0)
    _AutoItObject_AddProperty($self, "sClassName", $ELSCOPE_PUBLIC, $APP_NAME)

    _AutoItObject_AddMethod($self, "Create", "MainView__Create")
    _AutoItObject_AddMethod($self, "Show", "MainView__Show")
    _AutoItObject_AddMethod($self, "ChangeTheme", "MainView__ChangeTheme", 0)

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

    $self.chkAlwaysOnTop = GUICtrlCreateCheckbox('ALWAYS ON TOP', 48, 216, 233, 41)
    GUICtrlSetFont(-1, 10, 800, 0, 'Hack')

    $self.chkFormatTime = GUICtrlCreateCheckbox('FORMAT 24 HS', 48, 256, 233, 41)
    GUICtrlSetFont(-1, 10, 800, 0, 'Hack')

    $self.chkDarkMode = GUICtrlCreateCheckbox('DARK MODE', 48, 296, 233, 41)
    GUICtrlSetFont(-1, 10, 800, 0, 'Hack')

    GUICtrlCreateGroup("", -99, -99, 1, 1) ; ???

    $self.lblFormatTime = GUICtrlCreateLabel('', 278, 102, 52, 28, BitOR($SS_LEFT,$SS_CENTERIMAGE))
    GUICtrlSetFont(-1, 12, 800, 0, "Hack")

    Return $self.hGui
EndFunc

Func MainView__Show($self)
    GUISetState(@SW_SHOW, $self.hGui)
EndFunc

Func MainView__ChangeTheme($self, $sTypeTheme)
    ;~ Thanks Melba23!!! https://www.autoitscript.com/forum/topic/132916-no-checkbox-text-color/
    Switch $sTypeTheme
        Case 'DARK'
            #Region Labels
            GUICtrlSetColor($self.lblDate, $COLOR_WHITE)
            GUICtrlSetColor($self.lblTime, $COLOR_WHITE)
            GUICtrlSetColor($self.lblFormatTime, $COLOR_WHITE)
            #EndRegion

            #Region Checkboxes
            DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($self.chkAlwaysOnTop), "wstr", 0, "wstr", 0)
            GUICtrlSetColor($self.chkAlwaysOnTop, $COLOR_WHITE)
            DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($self.chkFormatTime), "wstr", 0, "wstr", 0)
            GUICtrlSetColor($self.chkFormatTime, $COLOR_WHITE)
            DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($self.chkDarkMode), "wstr", 0, "wstr", 0)
            GUICtrlSetColor($self.chkDarkMode, $COLOR_WHITE)
            #EndRegion

            #Region Groups
            DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($self.grpSettings), "wstr", 0, "wstr", 0)
            GUICtrlSetColor($self.grpSettings, $COLOR_WHITE)
            #EndRegion
            
            ;~ https://www.colorhexa.com/2d2d30
            GUISetBkColor(0x2d2d30, $self.hGui)

        Case 'DEFAULT'
            #Region Labels
            GUICtrlSetColor($self.lblDate, $COLOR_BLACK)
            GUICtrlSetColor($self.lblTime, $COLOR_BLACK)
            GUICtrlSetColor($self.lblFormatTime, $COLOR_BLACK)
            #EndRegion

            #Region
            DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($self.chkAlwaysOnTop), "wstr", 0, "wstr", 0)
            GUICtrlSetColor($self.chkAlwaysOnTop, $COLOR_BLACK)
            DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($self.chkFormatTime), "wstr", 0, "wstr", 0)
            GUICtrlSetColor($self.chkFormatTime, $COLOR_BLACK)
            DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($self.chkDarkMode), "wstr", 0, "wstr", 0)
            GUICtrlSetColor($self.chkDarkMode, $COLOR_BLACK)
            #EndRegion

            #Region Groups
            DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle($self.grpSettings), "wstr", 0, "wstr", 0)
            GUICtrlSetColor($self.grpSettings, $COLOR_BLACK)
            #EndRegion

            ;~ GUISetBkColor(0xA0A0A4 , $self.hGui)
            ;~ GUISetBkColor(0xFFEE88BB , $self.hGui)
            ;~ GUISetBkColor($COLOR_3DFACE , $self.hGui)
            GUISetBkColor(0xF0F0F0 , $self.hGui)
    EndSwitch
EndFunc
#include "..\Libraries\AutoItObject.au3"
#include "..\Constants.au3"
#include "..\Common.au3"
#include "..\Models\UtilsModel.au3"
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
    $self.hGui = GUICreate($APP_NAME &" " &$APP_VERSION, 342, 410, -1, -1, $WS_SYSMENU)

    If FileExists($APP_FONT_PATH) == $FILE_NOT_EXIST Then
        $g_oUtilsModel.CreateFontResource(@ScriptDir, '\Hack-Regular.ttf')
        $g_oUtilsModel.AddFontResource(@ScriptDir &'\Hack-Regular.ttf')
    EndIf

    $self.lblTime = GUICtrlCreateLabel($g_oUtilsModel.GetTime(), 32, 78, 268, 59, BitOR($SS_CENTER, $SS_CENTERIMAGE))
    GUICtrlSetFont(-1, 28, 400, 0, $APP_FONT_NAME)

    $self.lblDate = GUICtrlCreateLabel($g_oUtilsModel.GetDate(), 32, 14, 268, 59, BitOR($SS_CENTER, $SS_CENTERIMAGE))
    GUICtrlSetFont(-1, 28, 400, 0, $APP_FONT_NAME)

    $self.grpSettings = GUICtrlCreateGroup("SETTINGS", 24, 194, 284, 151)
    GUICtrlSetFont(-1, 10, 800, 0, $APP_FONT_NAME)

    $self.chkAlwaysOnTop = GUICtrlCreateCheckbox('ALWAYS ON TOP', 48, 216, 233, 41)
    GUICtrlSetFont(-1, 10, 800, 0, $APP_FONT_NAME)

    $self.chkFormatTime = GUICtrlCreateCheckbox('FORMAT 24 HS', 48, 256, 233, 41)
    GUICtrlSetFont(-1, 10, 800, 0, $APP_FONT_NAME)

    $self.chkDarkMode = GUICtrlCreateCheckbox('DARK MODE', 48, 296, 233, 41)
    GUICtrlSetFont(-1, 10, 800, 0, $APP_FONT_NAME)

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
            GUISetBkColor($APP_COLOR_DARK, $self.hGui)

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
            GUISetBkColor($APP_COLOR_DEFAULT, $self.hGui)
    EndSwitch
EndFunc
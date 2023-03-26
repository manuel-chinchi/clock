#include <GUIConstants.au3>
#include <Date.au3>
#include <WinAPIGdi.au3>
#include "Views\MainView.au3"

Opt("MustDeclareVars", 1)

; Set custom font
_WinAPI_AddFontResourceEx($APP_FONT_PATH, $FR_PRIVATE, False)

Func Main()
    #comments-start
    Local $frmMain = GUICreate($APP_NAME, 320, 240, -1, -1)
    Global $g_lblTime = GUICtrlCreateLabel(_GetTime(), 56, 120, 204, 51, BitOR($SS_CENTER,$SS_CENTERIMAGE))
    GUICtrlSetFont(-1, 28, 400, 0, $APP_FONT_NAME)

    Global $g_lblDate = GUICtrlCreateLabel(_GetDate(), 56, 56, 204, 51, BitOR($SS_CENTER,$SS_CENTERIMAGE))
    GUICtrlSetFont(-1, 28, 400, 0, $APP_FONT_NAME)
    __lblRefreshDate()

    GUICtrlSetColor($g_lblDate, $APP_FONT_COLOR)
    GUICtrlSetColor($g_lblTime, $APP_FONT_COLOR)
    GUISetBkColor($APP_BACKGROUND_COLOR)
    
    AdlibRegister("__lblRefreshTime", 1000)
    GUISetState(@SW_SHOW)
    #comments-end

    Local $oMainView = MainView()

    ; Create view
    $oMainView.Create()

    ; Get label control from refresh time
    Global $g_lblTime = $oMainView.lblTime
    AdlibRegister("__RefreshTime", 1000)

    ; Show view
    $oMainView.Show()

    While True
        Local $nMsg = GUIGetMsg()

        Switch $nMsg
            Case $GUI_EVENT_CLOSE
                ExitLoop
        EndSwitch
    WEnd
EndFunc

Main()


Func __RefreshTime()
    GUICtrlSetData($g_lblTime, _NowTime())
EndFunc

#comments-start
Func __lblRefreshTime()
    GUICtrlSetData($g_lblTime, _GetTime())
    ;~ GUICtrlSetData($g_lblTime, _NowTime())
EndFunc

Func __lblRefreshDate()
    GUICtrlSetData($g_lblDate, _GetDate())
    ;~ GUICtrlSetData($g_lblDate, _NowDate())
EndFunc

Func _GetTime()
    Return @HOUR &":" &@MIN &":" &@SEC
EndFunc

Func _GetDate()
    ;~ Return "00" &"." &@MON &"." &StringRight(@YEAR, 2)
    Return @MDAY &"/" &@MON &"/" &StringRight(@YEAR, 2)
EndFunc
#comments-end
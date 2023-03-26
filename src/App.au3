#include <GUIConstants.au3>
#include <Date.au3>
#include <WinAPIGdi.au3>
#include "References.au3" ; References to other .au3 files of the project

Opt("MustDeclareVars", 1)

Global $g_oUtilsModel = UtilsModel()

; Set custom font
_WinAPI_AddFontResourceEx($APP_FONT_PATH, $FR_PRIVATE, False)

Func Main()
    Local $oMainView = MainView()

    ; Create view
    $oMainView.Create()

    ; Refresh date and time in view
    Global $g_lblTime = $oMainView.lblTime
    Global $g_lblDate = $oMainView.lblDate

    AdlibRegister("__RefreshTime", 1000)
    AdlibRegister("__RefreshDate", 1000)

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
    GUICtrlSetData($g_lblTime, $g_oUtilsModel.GetTime())
EndFunc

Func __RefreshDate()
    GUICtrlSetData($g_lblDate, $g_oUtilsModel.GetDate())
EndFunc
#include <GUIConstants.au3>
#include <Date.au3>
#include <WinAPIGdi.au3>
#include "References.au3" ; References to other .au3 files of the project

Opt("MustDeclareVars", 1)

; Fix for screens with hight DPI (when using editors that are not SciTE)
$g_oUtilsModel.AdjustControlsToCurrentDPI()

Func Main()
    Local $oMainView = MainView()

    ; Create view
    $oMainView.Create()

    ; Get label handlers
    Global $g_lblTime = $oMainView.lblTime
    Global $g_lblDate = $oMainView.lblDate

    AdlibRegister("_RefreshTime", 1000)
    AdlibRegister("_RefreshDate", 1000)

    GUICtrlSetState($oMainView.lblFormatTime, $GUI_SHOW)
    GUICtrlSetData($oMainView.lblFormatTime, $g_oUtilsModel.GetCurrentFormatTime())

    ; Show view
    $oMainView.Show()

    While True
        Local $nMsg = GUIGetMsg()

        Switch $nMsg
            Case $GUI_EVENT_CLOSE
                Local $iOpt = MsgBox($MB_YESNO + $MB_TOPMOST + $MB_TASKMODAL, '', 'Are you sure you want to leave?')

                If $iOpt == $IDYES Then
                    Exit
                EndIf

            Case $oMainView.chkAlwaysOnTop
                If BitAND(GUICtrlRead($oMainView.chkAlwaysOnTop), $GUI_CHECKED) == 1 Then
                    WinSetOnTop($oMainView.sClassName, '', $WINDOWS_ONTOP)
                Else
                    WinSetOnTop($oMainView.sClassName, '', 0)
                EndIf

            Case $oMainView.chkFormatTime
                If BitAND(GUICtrlRead($oMainView.chkFormatTime), $GUI_CHECKED) == 1 Then
                    $g_oUtilsModel.bFormat24hs = True
                    GUICtrlSetState($oMainView.lblFormatTime, $GUI_HIDE)
                Else
                    $g_oUtilsModel.bFormat24hs = False
                    GUICtrlSetState($oMainView.lblFormatTime, $GUI_SHOW)
                    GUICtrlSetData($oMainView.lblFormatTime, $g_oUtilsModel.sFormatTime)
                EndIf
                _RefreshTime()

            Case $oMainView.chkDarkMode
                If BitAND(GUICtrlRead($oMainView.chkDarkMode), $GUI_CHECKED) == 1 Then
                    $oMainView.ChangeTheme('DARK')
                Else
                    $oMainView.ChangeTheme('DEFAULT')
                EndIf
        EndSwitch
    WEnd
EndFunc

Main()

Func _RefreshTime()
    GUICtrlSetData($g_lblTime, $g_oUtilsModel.GetTime())
EndFunc

Func _RefreshDate()
    GUICtrlSetData($g_lblDate, $g_oUtilsModel.GetDate())
EndFunc
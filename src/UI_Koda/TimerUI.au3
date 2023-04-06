#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>


Func UtilsModel__AdjustControlsToCurrentDPI($self)
    DllCall("User32.dll", "bool", "SetProcessDPIAware")
EndFunc

UtilsModel__AdjustControlsToCurrentDPI(Null)

#Region ### START Koda GUI section ### Form=c:\users\manue\programacion\github\clock\src\ui_koda\timer_view.kxf
$frmTimer = GUICreate("Timer", 343, 151, 325, 211, $WS_POPUP)
$lblDragAndDrop = GUICtrlCreateLabel("", 0, 0, 342, 150, -1, $GUI_WS_EX_PARENTDRAG)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$btnStop = GUICtrlCreateButton("Stop", 182, 80, 142, 49)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0x000000)
$lblTimer = GUICtrlCreateLabel("00:00:00", 24, 16, 300, 50, BitOR($SS_CENTER,$SS_CENTERIMAGE))
GUICtrlSetFont(-1, 24, 400, 0, "Hack")
$btnStartPause = GUICtrlCreateButton("Pause", 24, 80, 142, 49)
GUICtrlSetFont(-1, 12, 400, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd

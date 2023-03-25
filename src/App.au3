#include <GUIConstants.au3>
#include <WinAPIGdi.au3>
#include <Date.au3>
#include "Constants.au3"

Dim $frmMain = GUICreate('App', 320, 240,-1,-1)
Dim $lblTime = GUICtrlCreateLabel(_GetTime(), 56, 120, 204, 51, BitOR($SS_CENTER,$SS_CENTERIMAGE))
GUICtrlSetFont(-1, 28, 400, 0, $APP_FONT_NAME)

Dim $lblDate = GUICtrlCreateLabel("DD:MM:YY", 56, 56, 204, 51, BitOR($SS_CENTER,$SS_CENTERIMAGE))
GUICtrlSetFont(-1, 28, 400, 0, $APP_FONT_NAME)
__lblRefreshDate()

GUICtrlSetColor($lblDate, $APP_FONT_COLOR)
GUICtrlSetColor($lblTime, $APP_FONT_COLOR)
GUISetBkColor($APP_BACKGROUND_COLOR)

AdlibRegister("__lblRefreshTime", 1000)
GUISetState(@SW_SHOW)

While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			ExitLoop
	EndSwitch
WEnd

Func __lblRefreshTime()
	GUICtrlSetData($lblTime, _GetTime())
	;~ GUICtrlSetData($lblTime, _NowTime())
EndFunc

Func __lblRefreshDate()
	GUICtrlSetData($lblDate, _GetDate())
	;~ GUICtrlSetData($lblDate, _NowDate())
EndFunc

Func _GetTime()
	Return " " &@HOUR &":" &@MIN &":" &@SEC &" "
EndFunc

Func _GetDate()
	;~ Return "00" &"." &@MON &"." &StringRight(@YEAR, 2)
	Return " " &@MDAY &"/" &@MON &"/" &StringRight(@YEAR, 2) &" "
EndFunc
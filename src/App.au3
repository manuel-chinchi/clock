#include <GUIConstants.au3>
#include <WinAPIGdi.au3>
#include <Date.au3>
#include "Constants.au3"

Opt("MustDeclareVars", 1)

Func Main()	
	Local $frmMain = GUICreate('App', 320, 240, -1, -1)
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

	While True
		Local $nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
EndFunc

Main()

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
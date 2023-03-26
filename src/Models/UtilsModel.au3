#include "..\Libraries\AutoItObject.au3"

_AutoItObject_Startup()

Func UtilsModel()
    Local $self = _AutoItObject_Create()

    _AutoItObject_AddMethod($self, "GetTime", "UtilsModel__GetTime")
    _AutoItObject_AddMethod($self, "GetDate", "UtilsModel__GetDate")
    _AutoItObject_AddMethod($self, "AdjustScaleControlsHightDPI", "UtilsModel__AdjustScaleControlsHightDPI")

    Return $self
EndFunc

Func UtilsModel__GetTime($self)
    Return @HOUR &":" &@MIN &":" &@SEC
EndFunc

Func UtilsModel__GetDate($self)
    Return @MDAY &"/" &@MON &"/" &StringRight(@YEAR, 2)
EndFunc

Func UtilsModel__AdjustScaleControlsHightDPI($self)
    DllCall("User32.dll", "bool", "SetProcessDPIAware")
EndFunc
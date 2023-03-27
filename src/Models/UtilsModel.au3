#include "..\Libraries\AutoItObject.au3"

_AutoItObject_Startup()

Func UtilsModel()
    Local $self = _AutoItObject_Create()

    _AutoItObject_AddMethod($self, "GetTime", "UtilsModel__GetTime")
    _AutoItObject_AddMethod($self, "GetDate", "UtilsModel__GetDate")
    _AutoItObject_AddMethod($self, "GetCurrentFormatTime", "UtilsModel__GetCurrentFormatTime")
    _AutoItObject_AddMethod($self, "AdjustScaleControlsHightDPI", "UtilsModel__AdjustScaleControlsHightDPI")

    _AutoItObject_AddProperty($self, "bFormat24hs", $ELSCOPE_PUBLIC, False)
    _AutoItObject_AddProperty($self, "sFormatTime", $ELSCOPE_PUBLIC, '')

    Return $self
EndFunc

Func UtilsModel__GetTime($self)
    $self.sFormatTime = $self.GetCurrentFormatTime()

    If $self.bFormat24hs == True Then
        Return @HOUR &":" &@MIN &":" &@SEC
    Else
        Local $HOUR = Mod(Int(@HOUR), 12)

        If $HOUR < 10 Then
            Return "0" &$HOUR &":" &@MIN &":" &@SEC
        Else
            Return $HOUR &":" &@MIN &":" &@SEC
        EndIf
    EndIf
EndFunc

Func UtilsModel__GetDate($self)
    Return @MDAY &"/" &@MON &"/" &StringRight(@YEAR, 2)
EndFunc

Func UtilsModel__GetCurrentFormatTime($self)
    If @HOUR > 12 Then
        Return 'P.M'
    Else
        Return 'A.M'
    EndIf
EndFunc

Func UtilsModel__AdjustScaleControlsHightDPI($self)
    DllCall("User32.dll", "bool", "SetProcessDPIAware")
EndFunc
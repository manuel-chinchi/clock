#include-once
#include "..\Libraries\AutoItObject.au3"
#include "..\Libraries\FontBase64.au3"
#include <WinAPIGdi.au3>

_AutoItObject_Startup()

Func UtilsModel()
    Local $self = _AutoItObject_Create()

    _AutoItObject_AddMethod($self, "GetTime", "UtilsModel__GetTime")
    _AutoItObject_AddMethod($self, "GetDate", "UtilsModel__GetDate")
    _AutoItObject_AddMethod($self, "GetCurrentFormatTime", "UtilsModel__GetCurrentFormatTime")
    _AutoItObject_AddMethod($self, "AdjustControlsToCurrentDPI", "UtilsModel__AdjustControlsToCurrentDPI")
    _AutoItObject_AddMethod($self, "CreateFontResource", "UtilsModel__CreateFontResource")

    _AutoItObject_AddProperty($self, "bFormat24hs", $ELSCOPE_PUBLIC, False)
    _AutoItObject_AddProperty($self, "sFormatTime", $ELSCOPE_PUBLIC, '')

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
        Return 'PM'
    Else
        Return 'AM'
    EndIf
EndFunc

Func UtilsModel__AdjustControlsToCurrentDPI($self)
    DllCall("User32.dll", "bool", "SetProcessDPIAware")
EndFunc

Func UtilsModel__CreateFontResource($self, $sPathResource = @ScriptDir, $sNameResource = '\Hack-Regular.ttf')
    _Base64String(True, $sPathResource, $sNameResource)
EndFunc

Func UtilsModel__AddFontResource($self, $sFontPath = @ScriptDir &'\Hack-Regular.ttf')
    _WinAPI_AddFontResourceEx($sFontPath, $FR_PRIVATE, False)
EndFunc
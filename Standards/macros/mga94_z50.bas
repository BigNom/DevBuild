Sub main
    Dim startPoint As MbePoint
    Dim point As MbePoint, point2 As MbePoint

'   Start a command
    MbeSendCommand "GEOCOORDINATE SELECT LIBRARY "

'   When a command brings up a modal dialog,
'   a later statement must close the dialog,
'   or the MbeState.modalDialogByUser property
'   should be set to 1 so that the user must close
'   the dialog when the macro is executed.
'   Also, you may not use the debugger "Step"
'   commands while a modal dialog is displayed.

'   Opened modal dialog "Geographic Coordinate System Changed"

'   Closed modal dialog "Geographic Coordinate System Changed"

'   Following comment is the command to close a modal dialog
'   MbeSendCommand "MBE1 CLOSEMODAL OK"
End Sub

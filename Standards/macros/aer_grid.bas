Sub main
    Dim startPoint As MbePoint
    Dim point As MbePoint, point2 As MbePoint

'   Start a command
    MbeSendCommand "GEOCOORDINATE DIALOG "

    MbeSendCommand "GEOCOORDINATE SELECT FILE "

'   When a command brings up a modal dialog,
'   a later statement must close the dialog,
'   or the MbeState.modalDialogByUser property
'   should be set to 1 so that the user must close
'   the dialog when the macro is executed.
'   Also, you may not use the debugger "Step"
'   commands while a modal dialog is displayed.

'   Opened modal dialog "Select Geographic Coordinate System Source"

    MbeSendCommand "MDL COMMAND MGDSHOOK,fileList_setDirectoryCmd N:\14_EngineeringServices\Drafting\_Projects\35999_WODGINA_LITHIUM\01_Models\General\"

    MbeSendCommand "MDL COMMAND MGDSHOOK,fileList_setFileNameCmd MO_35999_GE_002.dgn"

'   Closed modal dialog "Select Geographic Coordinate System Source"

'   Following comment is the command to close a modal dialog
'   MbeSendCommand "MBE1 CLOSEMODAL OK"

'   Opened modal dialog "Alert"

'   Closed modal dialog "Alert"
'   MbeSendCommand "MBE1 CLOSEMODAL OK"
End Sub

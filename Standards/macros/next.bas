'NEXT.BA - Opens the next file in the directory. 
'MACRO NEXT + moves "forwards."
'MACRO NEXT - moves "backwards."

Sub Main
    Dim CMD As String
    Dim currDGN As String
    Dim prevDGN As String
    Dim nextDGN As String
    Dim DGNfiles() As String


    CMD = Command$
    If CMD = "" Then CMD = "+"

    currDGN = MbeDgnInfo.dgnFilename
    FileList DGNfiles, FileParse$(currDGN, 2) + "\*.d*"
    ArraySort(DGNfiles)

    If ArrayDims(DGNfiles) > 0 Then

        For j = 0 To UBound(DGNfiles)
            If DGNfiles(j) = FileParse$(currDGN, 3) Then Exit For
        Next j

file:
        If j >= 1 Then 
            prevDGN = FileParse$(currDGN, 2) + "\" + DGNfiles(j - 1)
        Else
            prevDGN = FileParse$(currDGN, 2) + "\" + DGNfiles(j)
        End If

        If j < UBound(DGNfiles) Then
            nextDGN = FileParse$(currDGN, 2) + "\" + DGNfiles(j + 1)
        Else
            nextDGN = FileParse$(currDGN, 2) + "\" + DGNfiles(j)
        End If

        Select Case CMD
            Case "-"
                MbeSendKeyin "RD=" + prevDGN
            Case "+"
                MbeSendKeyin "RD=" + nextDGN
        End Select
    Else
        MbeMessageBox "No files found"
    End If

End Sub


 
 
 
 
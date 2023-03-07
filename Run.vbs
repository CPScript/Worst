Dim answer As Integer

answer = MsgBox("Are you sure you woud like to run this Malware?", vbQuestion + vbYesNo + vbDefaultButton2, "WARNING!")

If answer = vbYes Then
  MsgBox "ok... please wait"
Else
  MsgBox "Closing and deleting"
End If

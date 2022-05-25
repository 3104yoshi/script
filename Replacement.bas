Sub Macro1()
'「」内にテキストを挿入する。12列目の値は5列目に、13列目の値は6列目にそれぞれ置換される
Dim Reg
Set Reg = CreateObject("VBScript.RegExp")
Dim str As String
Dim After_Replacement As String
With Reg
    .Pattern = "「.*」"
    .IgnoreCase = True
    .Global = True
End With
    Dim i As Long
    For i = 5 To 60
        ' 12列目->5列目
        str = "「" & Cells(i, 12).Value & "」"
        After_Replacement = Reg.Replace((Cells(i, 5).Value), str)
        Cells(i, 5).Value = After_Replacement
        
        ' 13列目->6列目
        str = "「" & Cells(i, 13).Value & "」"
        After_Replacement = Reg.Replace((Cells(i, 6).Value), str)
        Cells(i, 6).Value = After_Replacement
    Next i
End Sub

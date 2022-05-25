Sub テキストで文字を書いて保存()

'open file
Dim FSO As Object, WSH As Object
Set FSO = CreateObject("Scripting.FileSystemObject")

Dim i As Integer
For i = 5 To 7
    ' get text in 12th row
    Dim text As String
    text = Cells(i, 12).Value
    
    ' define file path to save the text as file
    ' If you change file-path or file-name, you change line 16.
    Dim file_path As String
    file_path = ".\test\リスト" & (i - 4) & ".txt"
    
    ' create file in specifying path
    With FSO.CreateTextFile(file_path)
        .WriteLine text
        .Close
    End With
Next i

Set FSO = Nothing

End Sub

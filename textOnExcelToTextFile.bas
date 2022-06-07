Sub テキストで文字を書いて保存()
' ディレクトリの名前、テキストファイルに転記するセルの列を変更したい場合は、このメソッドだけを弄る
Call makefolder("in")
Call makefolder("ans")
Dim i As Integer
For i = 5 To Cells(Rows.Count, 12).End(xlUp).row
    Call makefile(i, 12, "in")
    Call makefile(i, 13, "ans")
Next i

End Sub

Function makefile(row As Integer, column As Integer, directory_name As String)
    'open file
    Dim FSO As Object, WSH As Object
    Set FSO = CreateObject("Scripting.FileSystemObject")
    Dim text As String
    text = Cells(row, column).Value
    
    ' define file path to save the text as file
    ' If you change file-path or file-name, you change 2 below.
    Dim file_path As String
    file_path = ThisWorkbook.Path & "\" & directory_name & "\" & directory_name & (row - 4) & ".txt"
    
    ' create file in specifying path
    With FSO.CreateTextFile(file_path)
        .WriteLine text
        .Close
    End With
    
    Set FSO = Nothing

End Function

Function makefolder(directory_name As String)
    'open file
    Dim FSO As Object, WSH As Object
    Set FSO = CreateObject("Scripting.FileSystemObject")
    
    Dim file_path As String
    file_path = ThisWorkbook.Path & "\" & directory_name
    
    If FSO.FolderExists(file_path) Then
        
    Else
        FSO.CreateFolder (file_path)
    End If
    
    Set FSO = Nothing
    
End Function

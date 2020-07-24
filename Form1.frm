VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "VTSTech-blowfish GUI"
   ClientHeight    =   1320
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   5460
   LinkTopic       =   "Form1"
   ScaleHeight     =   1320
   ScaleWidth      =   5460
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox Check2 
      Caption         =   "save"
      Height          =   195
      Left            =   4320
      TabIndex        =   11
      Top             =   720
      Width           =   735
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   720
      TabIndex        =   8
      Text            =   "encryption_key"
      Top             =   720
      Width           =   3495
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Decrypt"
      Height          =   255
      Left            =   3120
      TabIndex        =   6
      Top             =   480
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "blow"
      Height          =   375
      Left            =   4560
      TabIndex        =   5
      Top             =   120
      Width           =   855
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   3120
      TabIndex        =   4
      Text            =   "ECB"
      Top             =   120
      Width           =   1095
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   720
      TabIndex        =   2
      Text            =   "out.txt"
      Top             =   360
      Width           =   2295
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   720
      TabIndex        =   0
      Text            =   "in.crypt"
      Top             =   120
      Width           =   2295
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "(GitHub)"
      ForeColor       =   &H00C00000&
      Height          =   195
      Left            =   3240
      TabIndex        =   12
      Top             =   1080
      Width           =   585
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "pip install blowfish"
      ForeColor       =   &H00C00000&
      Height          =   195
      Left            =   120
      TabIndex        =   10
      Top             =   1080
      Width           =   1260
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Cipher:"
      Height          =   195
      Left            =   120
      TabIndex        =   9
      Top             =   720
      Width           =   495
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "(www.VTS-Tech.org)"
      ForeColor       =   &H00C00000&
      Height          =   195
      Left            =   3935
      TabIndex        =   7
      Top             =   1080
      Width           =   1500
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Output:"
      Height          =   195
      Left            =   120
      TabIndex        =   3
      Top             =   360
      Width           =   525
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Input:"
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   405
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim infile, outfile, action, mode, cipher, cmdline
Private Sub Command1_Click()
Set FSO = CreateObject("Scripting.FileSystemObject")
If Command1.Caption = "blow" Then
    Command1.Caption = "fish"
ElseIf Command1.Caption = "fish" Then
    Command1.Caption = "blow"
End If

If Check1.Value = 1 Then
    action = ""
Else
    action = " -e"
End If

If FSO.FileExists(VB.App.Path & "\key.txt") = True And Check2.Value = 0 Then
    Open VB.App.Path & "\key.txt" For Input As #1
    Line Input #1, cipher
    Text3.Text = cipher
    Close #1
ElseIf FSO.FileExists(VB.App.Path & "\key.txt") = True And Check2.Value = 1 Then
    cipher = Text3.Text
    Open VB.App.Path & "\key.txt" For Output As #2
    Print #2, cipher
    Close #2
ElseIf FSO.FileExists(VB.App.Path & "\key.txt") = False And Check2.Value = 1 Then
    cipher = Text3.Text
    Open VB.App.Path & "\key.txt" For Output As #2
    Print #2, cipher
    Close #2
ElseIf FSO.FileExists(VB.App.Path & "\key.txt") = False And Check2.Value = 0 Then
    cipher = Text3.Text
End If

mode = Combo1.Text
infile = Text1.Text
outfile = Text2.Text


cmdline = "cmd.exe /c " & VB.App.Path & "\VTSTech-blowfish.py -c " & Chr(34) & cipher & Chr(34) & action & " -" & LCase(mode) & " -i " & infile & " -o " & outfile
Shell (cmdline), vbHide
'MsgBox (cmdline)
End Sub

Private Sub Form_Load()
Build = "0.1-r1"
Form1.Caption = "VTSTech-blowfish GUI v" & Build
Combo1.AddItem "ECB"
Combo1.AddItem "ECB-CTS"
Combo1.AddItem "CFB"
Check1.Value = False
End Sub

Private Sub Label3_Click()
Shell ("cmd.exe /c start https://www.VTS-Tech.org/"), vbHide
End Sub

Private Sub Label5_Click()
Shell ("cmd.exe /c pip install blowfish"), vbNormalFocus
End Sub

Private Sub Label6_Click()
Shell ("cmd.exe /c start https://github.com/Veritas83/VTSTech-blowfish.py"), vbHide
End Sub

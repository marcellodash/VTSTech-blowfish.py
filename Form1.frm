VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "VTSTech-blowfish GUI"
   ClientHeight    =   1305
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   4590
   LinkTopic       =   "Form1"
   ScaleHeight     =   1305
   ScaleWidth      =   4590
   StartUpPosition =   3  'Windows Default
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
      Left            =   2040
      TabIndex        =   6
      Top             =   480
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "blow"
      Height          =   375
      Left            =   3360
      TabIndex        =   5
      Top             =   120
      Width           =   855
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   2040
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
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   720
      TabIndex        =   0
      Text            =   "in.crypt"
      Top             =   120
      Width           =   1215
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
      Caption         =   "Written by VTSTech (www.VTS-Tech.org)"
      Height          =   195
      Left            =   795
      TabIndex        =   7
      Top             =   1080
      Width           =   3000
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
If Check1.Value = 1 Then
    action = ""
Else
    action = " -e"
End If

mode = Combo1.Text
infile = Text1.Text
outfile = Text2.Text
cipher = Text3.Text

cmdline = "cmd.exe /c " & VB.App.Path & "\VTSTech-blowfish.py -c " & Chr(34) & cipher & Chr(34) & action & " -" & LCase(mode) & " -i " & infile & " -o " & outfile
Shell (cmdline), vbHide
'MsgBox (cmdline)
End Sub

Private Sub Form_Load()
Combo1.AddItem "ECB"
Combo1.AddItem "ECB-CTS"
Combo1.AddItem "CFB"
Check1.Value = False
End Sub

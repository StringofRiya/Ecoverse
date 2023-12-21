object frmAddAdmin: TfrmAddAdmin
  Left = 0
  Top = 0
  Caption = 'frmAddAdmin'
  ClientHeight = 300
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 185
    Top = 19
    Width = 83
    Height = 19
    Caption = 'New Admin'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 64
    Top = 53
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object Label3: TLabel
    Left = 64
    Top = 109
    Width = 42
    Height = 13
    Caption = 'Surname'
  end
  object Label4: TLabel
    Left = 64
    Top = 168
    Width = 34
    Height = 13
    Caption = 'Suburb'
  end
  object Label5: TLabel
    Left = 272
    Top = 53
    Width = 28
    Height = 13
    Caption = 'E-mail'
  end
  object Label6: TLabel
    Left = 272
    Top = 109
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label7: TLabel
    Left = 272
    Top = 168
    Width = 86
    Height = 13
    Caption = 'Confirm Password'
  end
  object Edit1: TEdit
    Left = 64
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 64
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 272
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 64
    Top = 187
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 272
    Top = 128
    Width = 121
    Height = 21
    PasswordChar = #9679
    TabOrder = 4
  end
  object Edit5: TEdit
    Left = 272
    Top = 187
    Width = 121
    Height = 21
    PasswordChar = #9679
    TabOrder = 5
  end
  object btnAddEvent: TButton
    Left = 192
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 6
  end
end

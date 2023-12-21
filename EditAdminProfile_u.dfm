object frmEditProfile: TfrmEditProfile
  Left = 0
  Top = 0
  Caption = 'Profile'
  ClientHeight = 254
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 167
    Top = 24
    Width = 96
    Height = 24
    Caption = 'Edit Profile'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 63
    Top = 69
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object Label3: TLabel
    Left = 247
    Top = 69
    Width = 42
    Height = 13
    Caption = 'Surname'
  end
  object Label4: TLabel
    Left = 63
    Top = 143
    Width = 34
    Height = 13
    Caption = 'Suburb'
  end
  object edtName: TEdit
    Left = 63
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtSurname: TEdit
    Left = 247
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object cmbSuburb: TComboBox
    Left = 63
    Top = 162
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnSave: TButton
    Left = 264
    Top = 143
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object BitBtn1: TBitBtn
    Left = 264
    Top = 174
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitBtn1Click
  end
end

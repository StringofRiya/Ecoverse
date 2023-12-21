object frmRegistration: TfrmRegistration
  Left = 0
  Top = 0
  Caption = 'frmRegistration'
  ClientHeight = 577
  ClientWidth = 594
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
  object Label2: TLabel
    Left = 228
    Top = 24
    Width = 106
    Height = 49
    Caption = 'Ecoverse'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -37
    Font.Name = 'Pristina'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 205
    Top = 66
    Width = 149
    Height = 27
    Caption = 'Think outside the trash'
    Font.Charset = ANSI_CHARSET
    Font.Color = clGreen
    Font.Height = -15
    Font.Name = 'Myanmar Text'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 88
    Top = 128
    Width = 406
    Height = 337
    TabOrder = 0
    object lblSignup: TLabel
      Left = 148
      Top = 19
      Width = 98
      Height = 37
      Caption = 'Sign Up'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Open Sans'
      Font.Style = []
      ParentFont = False
    end
    object lblName: TLabel
      Left = 51
      Top = 77
      Width = 27
      Height = 13
      Caption = 'Name'
    end
    object lblSurname: TLabel
      Left = 228
      Top = 77
      Width = 42
      Height = 13
      Caption = 'Surname'
    end
    object lblSuburb: TLabel
      Left = 51
      Top = 130
      Width = 34
      Height = 13
      Caption = 'Suburb'
    end
    object Label6: TLabel
      Left = 228
      Top = 129
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object lblPassword: TLabel
      Left = 51
      Top = 183
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object Label8: TLabel
      Left = 228
      Top = 182
      Width = 86
      Height = 13
      Caption = 'Confirm Password'
    end
    object edtName: TEdit
      Left = 50
      Top = 95
      Width = 129
      Height = 21
      TabOrder = 0
    end
    object edtSurname: TEdit
      Left = 227
      Top = 95
      Width = 129
      Height = 21
      TabOrder = 1
    end
    object edtPassword: TEdit
      Left = 50
      Top = 201
      Width = 129
      Height = 21
      PasswordChar = #9679
      TabOrder = 2
      TextHint = 'Minimum 8 characters'
    end
    object edtConfirm: TEdit
      Left = 227
      Top = 201
      Width = 129
      Height = 21
      PasswordChar = #9679
      TabOrder = 3
    end
    object btnSignup: TButton
      Left = 161
      Top = 264
      Width = 77
      Height = 33
      Caption = 'Sign Up'
      TabOrder = 4
      OnClick = btnSignupClick
    end
    object edtEmail: TEdit
      Left = 227
      Top = 148
      Width = 129
      Height = 21
      TabOrder = 5
    end
    object cmbSuburb: TComboBox
      Left = 50
      Top = 149
      Width = 129
      Height = 21
      Hint = 'Type out your suburb if it is not listed.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      TextHint = 'Select or type suburb'
    end
  end
  object btnBack: TBitBtn
    Left = 74
    Top = 504
    Width = 73
    Height = 28
    Caption = ' Back'
    Glyph.Data = {
      76060000424D7606000000000000360000002800000014000000140000000100
      20000000000040060000C30E0000C30E00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F683411FF384426CFF7F
      7F02000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7834521F38441E1F38441FCF589441A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F7834521F38441E1F38441FCF386435B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7834521F384
      41E1F38441FCF386435B00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7834521F38441E1F38441FCF386435B00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7834521F38441E1F38441FCF386
      435B000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F783
      4521F38441E1F38441FCF386435B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF88440FF38441E1F48542FFF38541F5F38441D5F384
      41D5F38441D5F38441D5F38441D5F38441D5F38441D5F38441D5F38441D5F384
      41D5F38441D5F38441D5F38441D5F38441D5F48542C3FE7F480EFF88440FF384
      41E1F48542FFF38541F5F38441D5F38441D5F38441D5F38441D5F38441D5F384
      41D5F38441D5F38441D5F38441D5F38441D5F38441D5F38441D5F38441D5F384
      41D5F48542C3FE7F480E00000000F7834521F38441E1F38441FCF386435B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7834521F38441E1F38441FCF386435B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7834521F38441E1F384
      41FCF383435B0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F7834521F38441E1F38441FCF383435B000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F783
      4521F38441E1F38441FCF383435B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F7834521F38441E1F38441FCF588
      3F1C000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EF873F20F3844270FFAA55030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    TabOrder = 1
    OnClick = btnBackClick
  end
end

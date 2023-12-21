object frmParticipants: TfrmParticipants
  Left = 0
  Top = 0
  Caption = 'Event Participants'
  ClientHeight = 574
  ClientWidth = 913
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 50
    Top = 21
    Width = 32
    Height = 16
    Caption = 'Users'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 472
    Top = 21
    Width = 85
    Height = 16
    Caption = 'Event Sign-ups'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 588
    Top = 24
    Width = 197
    Height = 13
    Caption = 'Tick off present participants at the event'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dbgSignups: TDBGrid
    Left = 472
    Top = 43
    Width = 369
    Height = 120
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 568
    Top = 238
    Width = 193
    Height = 169
    TabOrder = 1
    object Label1: TLabel
      Left = 32
      Top = 21
      Width = 42
      Height = 13
      Caption = 'Event ID'
    end
    object btnFilter: TButton
      Left = 56
      Top = 78
      Width = 75
      Height = 25
      Caption = 'Filter'
      TabOrder = 0
      OnClick = btnFilterClick
    end
    object sedID: TSpinEdit
      Left = 32
      Top = 40
      Width = 121
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
    object btnUnfilter: TBitBtn
      Left = 56
      Top = 109
      Width = 75
      Height = 25
      Caption = '&Unfilter'
      Kind = bkRetry
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnUnfilterClick
    end
  end
  object btnFilterByPoints: TButton
    Left = 173
    Top = 400
    Width = 99
    Height = 25
    Caption = 'Points Ranking'
    TabOrder = 2
    OnClick = btnFilterByPointsClick
  end
  object btnSearch: TButton
    Left = 74
    Top = 400
    Width = 74
    Height = 25
    Caption = 'Find User'
    TabOrder = 3
    OnClick = btnSearchClick
  end
  object Panel2: TPanel
    Left = 59
    Top = 182
    Width = 345
    Height = 200
    TabOrder = 4
    object Label5: TLabel
      Left = 40
      Top = 20
      Width = 27
      Height = 13
      Caption = 'Name'
    end
    object Label6: TLabel
      Left = 40
      Top = 74
      Width = 42
      Height = 13
      Caption = 'Surname'
    end
    object Label7: TLabel
      Left = 40
      Top = 128
      Width = 34
      Height = 13
      Caption = 'Suburb'
    end
    object btnDelete: TButton
      Left = 200
      Top = 68
      Width = 97
      Height = 25
      Caption = 'Delete User'
      TabOrder = 0
      OnClick = btnDeleteClick
    end
    object btnUsersPerSuburb: TButton
      Left = 200
      Top = 107
      Width = 97
      Height = 38
      Caption = 'Users in selected suburb'
      TabOrder = 1
      WordWrap = True
      OnClick = btnUsersPerSuburbClick
    end
    object DBedtName: TDBEdit
      Left = 40
      Top = 39
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object DBedtSurname: TDBEdit
      Left = 40
      Top = 94
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object DBcmbSuburb: TDBComboBox
      Left = 40
      Top = 147
      Width = 121
      Height = 21
      TabOrder = 4
    end
  end
  object btnBack: TBitBtn
    Left = 49
    Top = 503
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
    TabOrder = 5
    OnClick = btnBackClick
  end
  object btnAll: TBitBtn
    Left = 294
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Show All'
    TabOrder = 6
    OnClick = btnAllClick
  end
  object dbgUsers: TDBGrid
    Left = 49
    Top = 43
    Width = 360
    Height = 120
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBcbxPresent: TDBCheckBox
    Left = 624
    Top = 182
    Width = 65
    Height = 16
    Caption = 'Present'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = DBcbxPresentClick
  end
  object btnTotalDonations: TButton
    Left = 74
    Top = 431
    Width = 128
    Height = 25
    Caption = 'Total Donations'
    TabOrder = 9
    OnClick = btnTotalDonationsClick
  end
  object dbgUsers2: TDBGrid
    Left = 49
    Top = 43
    Width = 360
    Height = 120
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
  end
  object btnMostEvents: TButton
    Left = 213
    Top = 431
    Width = 156
    Height = 25
    Caption = 'Most Participated Events'
    TabOrder = 11
    OnClick = btnMostEventsClick
  end
end

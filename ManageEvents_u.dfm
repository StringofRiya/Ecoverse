object frmManageEvents: TfrmManageEvents
  Left = 0
  Top = 0
  Caption = 'Manage Events'
  ClientHeight = 539
  ClientWidth = 810
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 26
    Width = 37
    Height = 16
    Caption = 'Events'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 48
    Top = 248
    Width = 42
    Height = 16
    Caption = 'Admins'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 627
    Top = 69
    Width = 94
    Height = 13
    Caption = 'Search Event Name'
  end
  object dbgAdmins: TDBGrid
    Left = 48
    Top = 267
    Width = 497
    Height = 120
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgAdminsCellClick
  end
  object dbgEvents: TDBGrid
    Left = 48
    Top = 45
    Width = 497
    Height = 120
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnEdit: TBitBtn
    Left = 184
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 2
    WordWrap = True
    OnClick = btnEditClick
  end
  object btnDelete: TBitBtn
    Left = 288
    Top = 184
    Width = 89
    Height = 25
    Caption = 'Delete'
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object btnAddEvent: TBitBtn
    Left = 64
    Top = 184
    Width = 89
    Height = 25
    Caption = ' Add Event'
    TabOrder = 4
    OnClick = btnAddEventClick
  end
  object btnAdminName: TButton
    Left = 224
    Top = 400
    Width = 81
    Height = 25
    Caption = 'Find Admin'
    TabOrder = 5
    OnClick = btnAdminNameClick
  end
  object edtAdmin: TEdit
    Left = 311
    Top = 402
    Width = 119
    Height = 21
    TabOrder = 6
    TextHint = 'Admin Name'
  end
  object edtEvent: TEdit
    Left = 627
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object btnEventName: TButton
    Left = 646
    Top = 115
    Width = 83
    Height = 25
    Caption = 'Find Event'
    TabOrder = 8
    OnClick = btnEventNameClick
  end
  object btnSignups: TButton
    Left = 408
    Top = 184
    Width = 121
    Height = 25
    Caption = 'Signups per Event'
    TabOrder = 9
    OnClick = btnSignupsClick
  end
  object redHosted: TRichEdit
    Left = 600
    Top = 267
    Width = 161
    Height = 120
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 10
  end
  object btnBack: TBitBtn
    Left = 48
    Top = 472
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
    TabOrder = 11
    OnClick = btnBackClick
  end
  object btnShowAll: TBitBtn
    Left = 646
    Top = 146
    Width = 83
    Height = 25
    Caption = '&Show All'
    ModalResult = 4
    NumGlyphs = 2
    TabOrder = 12
    OnClick = btnShowAllClick
  end
  object btnEditProfile: TButton
    Left = 256
    Top = 436
    Width = 121
    Height = 25
    Caption = 'Edit my Profile'
    TabOrder = 13
    OnClick = btnEditProfileClick
  end
end
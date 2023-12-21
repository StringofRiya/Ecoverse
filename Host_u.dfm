object frmHost: TfrmHost
  Left = 0
  Top = 0
  Caption = 'Event'
  ClientHeight = 364
  ClientWidth = 525
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblEvent: TLabel
    Left = 56
    Top = 77
    Width = 58
    Height = 13
    Caption = 'Event Name'
  end
  object lblPlace: TLabel
    Left = 56
    Top = 133
    Width = 25
    Height = 13
    Caption = 'Place'
  end
  object lblDate: TLabel
    Left = 56
    Top = 192
    Width = 23
    Height = 13
    Caption = 'Date'
  end
  object lblHeading: TLabel
    Left = 56
    Top = 24
    Width = 115
    Height = 29
    Alignment = taCenter
    Caption = 'Host Event'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblDesc: TLabel
    Left = 290
    Top = 77
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object lblTime: TLabel
    Left = 56
    Top = 249
    Width = 22
    Height = 13
    Caption = 'Time'
  end
  object edtEvent: TEdit
    Left = 56
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btnDone: TBitBtn
    Left = 331
    Top = 211
    Width = 75
    Height = 25
    Caption = 'Done'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnDoneClick
  end
  object edtPlace: TEdit
    Left = 56
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object dtpDate: TDateTimePicker
    Left = 56
    Top = 211
    Width = 138
    Height = 21
    Date = 45113.000000000000000000
    Time = 0.438176354167808300
    TabOrder = 3
  end
  object redDesc: TRichEdit
    Left = 290
    Top = 96
    Width = 167
    Height = 89
    Hint = 'Add description here'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = False
    TabOrder = 4
    Zoom = 100
  end
  object dtpTime: TDateTimePicker
    Left = 56
    Top = 268
    Width = 138
    Height = 21
    Date = 45113.000000000000000000
    Format = 'HH:mm'
    Time = 0.479415000001608900
    Kind = dtkTime
    TabOrder = 5
  end
end

object frmPurchase: TfrmPurchase
  Left = 0
  Top = 0
  Caption = 'frmPurchase'
  ClientHeight = 247
  ClientWidth = 443
  Color = 12254974
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
    Left = 64
    Top = 24
    Width = 318
    Height = 16
    Caption = 'Are you sure you want to purchase the following items?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object redProducts: TRichEdit
    Left = 120
    Top = 64
    Width = 185
    Height = 97
    Color = 14941950
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    Zoom = 100
  end
  object btnYes: TBitBtn
    Left = 80
    Top = 192
    Width = 75
    Height = 25
    Kind = bkYes
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnYesClick
  end
  object btnCancel: TBitBtn
    Left = 291
    Top = 192
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnCancelClick
  end
end

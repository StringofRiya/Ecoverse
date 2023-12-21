object frmTimetable: TfrmTimetable
  Left = 0
  Top = 0
  Caption = 'Recycling Collections'
  ClientHeight = 425
  ClientWidth = 769
  Color = 12974294
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 266
    Top = 186
    Width = 215
    Height = 19
    Caption = 'Recycling Collection Timetable'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 95
    Top = 104
    Width = 567
    Height = 48
    Caption = 
      'We believe in giving back to people who give back to the world. ' +
      'As part of our gratitude to our users for supporting us and the ' +
      'environment, we are offering free recycling collections every we' +
      'ek! Please view the timetable to see when you can expect your re' +
      'cycling to be collected. '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object stgTimetable: TStringGrid
    Left = 128
    Top = 211
    Width = 494
    Height = 158
    Color = clWhite
    ColCount = 6
    DefaultColWidth = 80
    DrawingStyle = gdsGradient
    RowCount = 6
    GridLineWidth = 2
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 248
    Top = 24
    Width = 265
    Height = 57
    Color = 13892578
    ParentBackground = False
    TabOrder = 1
    object Label2: TLabel
      Left = 24
      Top = 12
      Width = 209
      Height = 28
      Caption = 'Recycling Collections'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
end

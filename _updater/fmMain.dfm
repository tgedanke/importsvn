object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077
  ClientHeight = 185
  ClientWidth = 364
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 345
    Height = 121
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    TabOrder = 0
    ColWidths = (
      135
      99
      93)
  end
  object Button1: TButton
    Left = 8
    Top = 135
    Width = 268
    Height = 40
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    Enabled = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 282
    Top = 135
    Width = 75
    Height = 40
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
    OnClick = Button2Click
  end
end

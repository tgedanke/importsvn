object FormGetPeriod: TFormGetPeriod
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1087#1077#1088#1080#1086#1076#1072
  ClientHeight = 84
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel1: TRzLabel
    Left = 4
    Top = 2
    Width = 7
    Height = 13
    Caption = 'C'
  end
  object RzLabel2: TRzLabel
    Left = 123
    Top = 2
    Width = 15
    Height = 13
    Caption = #1055#1054
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 48
    Width = 242
    Height = 36
    Align = alBottom
    BorderSides = [sdTop]
    TabOrder = 0
    object RzButton1: TRzButton
      Left = 76
      Top = 8
      Caption = #1054#1050
      HotTrack = True
      TabOrder = 0
      OnClick = RzButton1Click
    end
    object RzButton2: TRzButton
      Left = 157
      Top = 8
      Caption = #1054#1090#1084#1077#1085#1072
      HotTrack = True
      TabOrder = 1
      OnClick = RzButton2Click
    end
  end
  object RzDateTimePicker1: TRzDateTimePicker
    Left = 4
    Top = 21
    Width = 113
    Height = 21
    Date = 40527.652882650460000000
    Time = 40527.652882650460000000
    TabOrder = 1
  end
  object RzDateTimePicker2: TRzDateTimePicker
    Left = 123
    Top = 21
    Width = 113
    Height = 21
    Date = 40527.652882650460000000
    Time = 40527.652882650460000000
    TabOrder = 2
  end
end

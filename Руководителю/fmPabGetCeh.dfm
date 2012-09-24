object FormPabGetCeh: TFormPabGetCeh
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1094#1077#1093#1072
  ClientHeight = 85
  ClientWidth = 200
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 51
    Width = 200
    Height = 34
    Align = alBottom
    BorderSides = [sdTop]
    TabOrder = 0
    ExplicitTop = 112
    ExplicitWidth = 304
    object RzButton1: TRzButton
      Left = 36
      Top = 6
      Caption = #1054#1050
      HotTrack = True
      TabOrder = 0
      OnClick = RzButton1Click
    end
    object RzButton2: TRzButton
      Left = 118
      Top = 6
      Caption = #1054#1090#1084#1077#1085#1072
      HotTrack = True
      TabOrder = 1
      OnClick = RzButton2Click
    end
  end
  object RzComboBox1: TRzComboBox
    Left = 8
    Top = 16
    Width = 184
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
end

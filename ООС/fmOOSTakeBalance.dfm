object FormOOSTakeBalance: TFormOOSTakeBalance
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1079#1103#1090#1100' '#1080#1079' '#1086#1089#1090#1072#1090#1082#1072
  ClientHeight = 125
  ClientWidth = 247
  Color = clBtnFace
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
  object RzLabel1: TRzLabel
    Left = 8
    Top = 60
    Width = 87
    Height = 13
    Caption = #1042#1079#1103#1090#1100' '#1080#1079' '#1086#1089#1090#1072#1090#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object RzLabel4: TRzLabel
    Left = 8
    Top = 11
    Width = 150
    Height = 13
    Caption = #1054#1090#1089#1090#1072#1090#1086#1082' '#1094#1077#1093#1072' '#1089' '#1085#1072#1095#1072#1083#1072' '#1075#1086#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object RzLabel5: TRzLabel
    Left = 166
    Top = 11
    Width = 73
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0,0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RzLabel6: TRzLabel
    Left = 8
    Top = 34
    Width = 20
    Height = 13
    Caption = #1062#1077#1093
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 85
    Width = 247
    Height = 40
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 61
    ExplicitWidth = 249
    object RzButton1: TRzButton
      Left = 87
      Top = 8
      Caption = 'OK'
      HotTrack = True
      TabOrder = 0
      OnClick = RzButton1Click
    end
    object RzButton2: TRzButton
      Left = 168
      Top = 7
      Caption = #1054#1090#1084#1077#1085#1072
      HotTrack = True
      TabOrder = 1
      OnClick = RzButton2Click
    end
  end
  object RzNumericEdit1: TRzNumericEdit
    Left = 166
    Top = 57
    Width = 73
    Height = 21
    TabOrder = 1
    OnKeyDown = RzNumericEdit1KeyDown
    IntegersOnly = False
    DisplayFormat = '0.00000'
  end
  object CehList: TRzComboBox
    Left = 112
    Top = 30
    Width = 127
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = CehListChange
  end
end

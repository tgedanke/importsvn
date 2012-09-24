object FormAbout: TFormAbout
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 249
  ClientWidth = 434
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 208
    Width = 434
    Height = 41
    Align = alBottom
    BorderSides = [sdTop]
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 192
    ExplicitWidth = 185
    object RzLabel3: TRzLabel
      Left = 24
      Top = 16
      Width = 181
      Height = 13
      Caption = #1040#1057#1059' '#1058#1088#1072#1074#1084#1086#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1100', 2010 '#1075#1086#1076
    end
    object RzPanel3: TRzPanel
      Left = 316
      Top = 2
      Width = 118
      Height = 39
      Align = alRight
      BorderOuter = fsNone
      TabOrder = 0
      ExplicitLeft = 336
      object RzButton1: TRzButton
        Left = 14
        Top = 4
        Width = 99
        Height = 35
        Cancel = True
        ModalResult = 2
        Caption = #1047#1072#1082#1088#1099#1090#1100
        HotTrack = True
        TabOrder = 0
        OnClick = RzButton1Click
      end
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 0
    Width = 434
    Height = 208
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 1
    ExplicitTop = -6
    ExplicitHeight = 222
    object RzLabel1: TRzLabel
      Left = 24
      Top = 111
      Width = 71
      Height = 13
      Caption = #1056#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1080
    end
    object RzLabel2: TRzLabel
      Left = 24
      Top = 5
      Width = 107
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    end
    object RzMemo1: TRzMemo
      Left = 24
      Top = 24
      Width = 385
      Height = 81
      Color = clBtnFace
      Lines.Strings = (
        #1040#1057#1059' "'#1058#1088#1072#1074#1084#1086#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1100'" '#1087#1088#1077#1076#1085#1072#1079#1085#1072#1095#1077#1085#1072' '#1076#1083#1103' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1080' '#1087#1077#1095#1072#1090#1080
        #1087#1088#1086#1090#1086#1082#1086#1083#1086#1074' '#1086#1094#1077#1085#1082#1080' '#1090#1088#1072#1074#1084#1086#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1080' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1084#1077#1089#1090#1072'. ')
      ReadOnly = True
      TabOrder = 0
      ReadOnlyColor = clBtnFace
    end
    object RzMemo2: TRzMemo
      Left = 24
      Top = 129
      Width = 385
      Height = 64
      Color = clBtnFace
      Lines.Strings = (
        #1044#1091#1095#1077#1085#1082#1086' '#1057'. '#1042'.')
      ReadOnly = True
      TabOrder = 1
      ReadOnlyColor = clBtnFace
    end
  end
end

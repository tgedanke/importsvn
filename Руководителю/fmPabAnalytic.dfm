object FormAnalytic: TFormAnalytic
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1087#1077#1088#1080#1086#1076#1072
  ClientHeight = 176
  ClientWidth = 190
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
  object TSH: TRzPageControl
    Left = 8
    Top = 8
    Width = 177
    Height = 130
    ActivePage = TabSheet2
    TabIndex = 1
    TabOrder = 0
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = #1052#1077#1089#1103#1094
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lYear1: TRzComboBox
        Left = 16
        Top = 16
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 0
      end
      object lMonth: TRzComboBox
        Left = 16
        Top = 43
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 1
      end
      object lCeh1: TRzComboBox
        Left = 16
        Top = 70
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 2
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = #1050#1074#1072#1088#1090#1072#1083
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 296
      ExplicitHeight = 127
      object lYear2: TRzComboBox
        Left = 16
        Top = 16
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 0
      end
      object lQuarter: TRzComboBox
        Left = 16
        Top = 43
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 1
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = #1043#1086#1076
      ExplicitLeft = -103
      ExplicitTop = -44
      ExplicitWidth = 296
      ExplicitHeight = 127
      object lYear3: TRzComboBox
        Left = 16
        Top = 16
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        TabOrder = 0
      end
    end
  end
  object RzButton1: TRzButton
    Left = 8
    Top = 144
    Caption = #1054#1050
    HotTrack = True
    TabOrder = 1
    OnClick = RzButton1Click
  end
  object RzButton2: TRzButton
    Left = 107
    Top = 144
    Caption = #1054#1090#1084#1077#1085#1072
    HotTrack = True
    TabOrder = 2
    OnClick = RzButton2Click
  end
end

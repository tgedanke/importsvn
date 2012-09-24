object FormSpravochnik: TFormSpravochnik
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' :'
  ClientHeight = 503
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBottom: TRzPanel
    Left = 0
    Top = 462
    Width = 766
    Height = 41
    Align = alBottom
    BorderSides = [sdTop]
    TabOrder = 0
    ExplicitLeft = 192
    ExplicitTop = 320
    ExplicitWidth = 185
    object labelCaountlabel: TRzLabel
      Left = 280
      Top = 16
      Width = 45
      Height = 13
      Caption = #1047#1072#1087#1080#1089#1077#1081':'
    end
    object labelCount: TRzLabel
      Left = 330
      Top = 16
      Width = 79
      Height = 13
      AutoSize = False
      Caption = '0'
    end
    object PanelBottomButtons: TRzPanel
      Left = 496
      Top = 2
      Width = 270
      Height = 39
      Align = alRight
      BorderSides = []
      TabOrder = 0
      ExplicitLeft = 304
      ExplicitHeight = 37
      object ButtonSave: TRzButton
        Left = 17
        Top = 4
        Width = 113
        Height = 33
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        HotTrack = True
        TabOrder = 0
        Visible = False
      end
      object ButtonClose: TRzButton
        Left = 144
        Top = 4
        Width = 113
        Height = 33
        Caption = #1047#1072#1082#1088#1099#1090#1100
        HotTrack = True
        TabOrder = 1
      end
    end
    object DBNavigator: TRzDBNavigator
      Left = 8
      Top = 10
      Width = 240
      Height = 25
      DataSource = dsTable
      TabOrder = 1
    end
  end
  object DBGrid: TRzDBGrid
    Left = 0
    Top = 0
    Width = 766
    Height = 462
    Align = alClient
    DataSource = dsTable
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Table: TADOTable
    Connection = DataModule1.KMCConnection
    Left = 16
    Top = 56
  end
  object dsTable: TDataSource
    DataSet = Table
    Left = 48
    Top = 56
  end
end

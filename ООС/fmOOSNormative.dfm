object FormOOSNormative: TFormOOSNormative
  Left = 0
  Top = 0
  Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1099' '#1087#1083#1072#1090#1099' '#1080' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099
  ClientHeight = 382
  ClientWidth = 676
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 347
    Width = 676
    Height = 35
    Align = alBottom
    BorderOuter = fsNone
    BorderSides = [sdTop]
    TabOrder = 0
    ExplicitTop = 312
    ExplicitWidth = 683
    object RzLabel2: TRzLabel
      Left = 264
      Top = 6
      Width = 230
      Height = 26
      Caption = 
        #1085'1,'#1085'2...'#1085'5 - '#1085#1086#1088#1084#1072#1090#1080#1074#1099' '#1087#1083#1072#1090#1099' '#1087#1086' '#1082#1083#1072#1089#1089#1072#1084' 1-5'#13#10#1082'1,'#1082'2...'#1082'5 - '#1082#1086#1101#1092#1092#1080 +
        #1094#1080#1077#1085#1090#1099' '#1087#1086' '#1082#1083#1072#1089#1089#1072#1084' 1-5'
    end
    object RzPanel2: TRzPanel
      Left = 546
      Top = 0
      Width = 130
      Height = 35
      Align = alRight
      BorderOuter = fsNone
      TabOrder = 0
      ExplicitLeft = 553
      object RzButton1: TRzButton
        Left = 48
        Top = 6
        Caption = #1047#1072#1082#1088#1099#1090#1100
        HotTrack = True
        TabOrder = 0
        OnClick = RzButton1Click
      end
    end
    object RzButton2: TRzButton
      Left = 16
      Top = 6
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      HotTrack = True
      TabOrder = 1
      OnClick = RzButton2Click
    end
    object RzButton3: TRzButton
      Left = 97
      Top = 6
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      HotTrack = True
      TabOrder = 2
      OnClick = RzButton3Click
    end
    object RzButton4: TRzButton
      Left = 178
      Top = 6
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Enabled = False
      HotTrack = True
      TabOrder = 3
      OnClick = RzButton4Click
    end
  end
  object RzPanel3: TRzPanel
    Left = 0
    Top = 0
    Width = 676
    Height = 25
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 1
    ExplicitWidth = 683
    object RzLabel1: TRzLabel
      Left = 16
      Top = 4
      Width = 181
      Height = 13
      Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1099' '#1087#1083#1072#1090#1099' '#1080' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 25
    Width = 676
    Height = 322
    Align = alClient
    DataSource = dsNormative
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghDialogFind]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'year'
        Footers = <>
        Title.Caption = #1043#1086#1076
      end
      item
        EditButtons = <>
        FieldName = 'c1_norm'
        Footers = <>
        Title.Caption = #1085'1'
      end
      item
        EditButtons = <>
        FieldName = 'c1_infl'
        Footers = <>
        Title.Caption = #1082'1'
      end
      item
        EditButtons = <>
        FieldName = 'c2_norm'
        Footers = <>
        Title.Caption = #1085'2'
      end
      item
        EditButtons = <>
        FieldName = 'c2_infl'
        Footers = <>
        Title.Caption = #1082'2'
      end
      item
        EditButtons = <>
        FieldName = 'c3_norm'
        Footers = <>
        Title.Caption = #1085'3'
      end
      item
        EditButtons = <>
        FieldName = 'c3_infl'
        Footers = <>
        Title.Caption = #1082'3'
      end
      item
        EditButtons = <>
        FieldName = 'c4_norm'
        Footers = <>
        Title.Caption = #1085'4'
        Width = 48
      end
      item
        EditButtons = <>
        FieldName = 'c4_infl'
        Footers = <>
        Title.Caption = #1082'4'
        Width = 46
      end
      item
        EditButtons = <>
        FieldName = 'c5_norm'
        Footers = <>
        Title.Caption = #1085'5'
        Width = 41
      end
      item
        EditButtons = <>
        FieldName = 'c5_infl'
        Footers = <>
        Title.Caption = #1082'5'
        Width = 45
      end>
  end
  object tblNormative: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    TableName = 'ws_normative'
    Left = 40
    Top = 80
  end
  object dsNormative: TDataSource
    DataSet = tblNormative
    OnStateChange = dsNormativeStateChange
    Left = 72
    Top = 80
  end
end

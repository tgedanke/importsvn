object FormOOSWaste: TFormOOSWaste
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1086#1090#1093#1086#1076#1086#1074
  ClientHeight = 497
  ClientWidth = 696
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
    Top = 464
    Width = 696
    Height = 33
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 0
    object RzButton1: TRzButton
      Left = 608
      Top = 6
      Caption = #1047#1072#1082#1088#1099#1090#1100
      HotTrack = True
      TabOrder = 0
      OnClick = RzButton1Click
    end
    object RzButton2: TRzButton
      Left = 8
      Top = 6
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      HotTrack = True
      TabOrder = 1
      OnClick = RzButton2Click
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 41
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 1
    object RzLabel1: TRzLabel
      Left = 16
      Top = 14
      Width = 42
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object RzEdit1: TRzEdit
      Left = 72
      Top = 11
      Width = 457
      Height = 21
      TabOrder = 0
      OnChange = RzEdit1Change
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 696
    Height = 423
    Align = alClient
    DataSource = dsCodes
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
        FieldName = 'id'
        Footers = <>
        Visible = False
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'code'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'class'
        Footers = <>
        Title.Caption = #1050#1083#1072#1089#1089
        Width = 38
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 388
      end
      item
        EditButtons = <>
        FieldName = 'favorite'
        Footers = <>
        Title.Caption = #1048#1079#1073#1088#1072#1085#1085#1099#1077
        Width = 56
      end>
  end
  object tblCodes: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    TableName = 'ws_codes'
    Left = 24
    Top = 96
  end
  object dsCodes: TDataSource
    DataSet = tblCodes
    Left = 56
    Top = 96
  end
end

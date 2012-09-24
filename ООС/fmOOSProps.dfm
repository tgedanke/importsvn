object FormOOSProps: TFormOOSProps
  Left = 0
  Top = 0
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072
  ClientHeight = 507
  ClientWidth = 740
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 472
    Width = 740
    Height = 35
    Align = alBottom
    BorderOuter = fsNone
    BorderSides = [sdTop]
    TabOrder = 0
    ExplicitLeft = -11
    ExplicitTop = 347
    ExplicitWidth = 676
    object RzPanel2: TRzPanel
      Left = 610
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
    object btnAdd: TRzButton
      Left = 16
      Top = 6
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      HotTrack = True
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnSave: TRzButton
      Left = 97
      Top = 6
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      HotTrack = True
      TabOrder = 2
      OnClick = btnSaveClick
    end
    object btnCancel: TRzButton
      Left = 178
      Top = 6
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Enabled = False
      HotTrack = True
      TabOrder = 3
      OnClick = btnCancelClick
    end
    object btnDelete: TRzButton
      Left = 259
      Top = 6
      Caption = #1059#1076#1072#1083#1080#1090#1100
      HotTrack = True
      TabOrder = 4
      OnClick = btnDeleteClick
    end
  end
  object RzPanel3: TRzPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 25
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 1
    ExplicitLeft = -11
    ExplicitWidth = 676
    object RzLabel1: TRzLabel
      Left = 16
      Top = 4
      Width = 150
      Height = 13
      Caption = #1047#1085#1072#1095#1077#1085#1080#1103' '#1089#1074#1086#1081#1089#1090#1074' '#1087#1086' '#1084#1077#1089#1103#1094#1072#1084
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
    Width = 740
    Height = 447
    Align = alClient
    DataSource = dsProps
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
        Alignment = taCenter
        Color = clSilver
        EditButtons = <>
        FieldName = 'year'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1043#1086#1076
        Width = 44
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'month_from'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1052#1077#1089#1103#1094' '#1057
        Width = 52
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'month_to'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1052#1077#1089#1103#1094' '#1055#1054
        Width = 51
      end
      item
        Alignment = taCenter
        Color = clSilver
        EditButtons = <>
        FieldName = 'alias'
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1057#1074#1086#1081#1089#1090#1074#1086
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = 'id_property'
        Footers = <>
        Visible = False
        Width = 47
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'value'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
        Width = 82
      end>
  end
  object tblProps: TADOTable
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    TableName = 'ws_property_over_year_view'
    Left = 32
    Top = 112
  end
  object dsProps: TDataSource
    DataSet = tblProps
    OnStateChange = dsPropsStateChange
    Left = 72
    Top = 112
  end
end

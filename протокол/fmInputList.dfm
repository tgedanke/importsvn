object FormInputList: TFormInputList
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
  ClientHeight = 459
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 418
    Width = 462
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    BorderSides = [sdTop]
    TabOrder = 0
    ExplicitTop = 220
    ExplicitWidth = 253
    object RzPanel2: TRzPanel
      Left = 268
      Top = 0
      Width = 194
      Height = 41
      Align = alRight
      BorderOuter = fsNone
      TabOrder = 0
      ExplicitLeft = 59
      object RzButton1: TRzButton
        Left = 104
        Top = 6
        Width = 82
        Height = 30
        Caption = #1047#1072#1082#1088#1099#1090#1100
        HotTrack = True
        TabOrder = 0
        OnClick = RzButton1Click
      end
      object RzButton2: TRzButton
        Left = 17
        Top = 6
        Width = 81
        Height = 30
        Caption = #1042#1099#1073#1088#1072#1090#1100
        HotTrack = True
        TabOrder = 1
        OnClick = RzButton2Click
      end
    end
  end
  object RzDBGrid1: TRzDBGrid
    Left = 0
    Top = 21
    Width = 462
    Height = 397
    Align = alClient
    DataSource = dsObor
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = RzDBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 427
        Visible = True
      end>
  end
  object RazdelList: TRzDBLookupComboBox
    Left = 0
    Top = 0
    Width = 462
    Height = 21
    Align = alTop
    DropDownWidth = 600
    KeyField = 'id'
    ListField = 'name'
    ListSource = dsRazdel
    TabOrder = 2
    ExplicitWidth = 253
  end
  object dsObor: TDataSource
    DataSet = tObor
    Left = 96
    Top = 72
  end
  object tObor: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    TableName = 'tb_tool'
    Left = 128
    Top = 72
  end
  object tRazdel: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    TableName = 'tb_razdel'
    Left = 184
    Top = 64
  end
  object dsRazdel: TDataSource
    DataSet = tRazdel
    Left = 184
    Top = 96
  end
end

object FormRabotniki: TFormRabotniki
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082': '#1056#1072#1073#1086#1090#1085#1080#1082#1080
  ClientHeight = 520
  ClientWidth = 774
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBottom: TRzPanel
    Left = 0
    Top = 479
    Width = 774
    Height = 41
    Align = alBottom
    BorderSides = [sdTop]
    TabOrder = 0
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
      Left = 504
      Top = 2
      Width = 270
      Height = 39
      Align = alRight
      BorderSides = []
      TabOrder = 0
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
        OnClick = ButtonCloseClick
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
    Top = 41
    Width = 774
    Height = 438
    Align = alClient
    DataSource = dsTable
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'predpriatie_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = '*'#1060#1048#1054
        Width = 231
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'post_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'prof_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        Title.Caption = '*'#1044#1086#1083#1078#1085#1086#1089#1090#1100
        Width = 213
        Visible = True
      end
      item
        Expanded = False
        FieldName = #1055#1088#1086#1092#1077#1089#1089#1080#1103
        Width = -1
        Visible = False
      end>
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 41
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 2
    object PredpriatieList: TRzDBLookupComboBox
      Left = 8
      Top = 14
      Width = 281
      Height = 21
      KeyField = 'id'
      ListField = 'name'
      ListSource = dsPredpriatia
      TabOrder = 0
    end
  end
  object Table: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    IndexFieldNames = 'predpriatie_id'
    MasterFields = 'id'
    MasterSource = dsPredpriatia
    TableName = 'tb_predpriatie_rabotnik'
    Left = 16
    Top = 56
    object Tablepredpriatie_id: TIntegerField
      FieldName = 'predpriatie_id'
    end
    object Tablepost_id: TIntegerField
      FieldName = 'post_id'
    end
    object Tableprof_id: TIntegerField
      FieldName = 'prof_id'
    end
    object Tablename: TStringField
      FieldName = 'name'
      Size = 50
    end
    object TableField: TStringField
      FieldKind = fkLookup
      FieldName = #1055#1088#1086#1092#1077#1089#1089#1080#1103
      LookupDataSet = profession
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'prof_id'
      Size = 50
      Lookup = True
    end
    object TableField2: TStringField
      FieldKind = fkLookup
      FieldName = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      LookupDataSet = dolgnost
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'post_id'
      Size = 50
      Lookup = True
    end
  end
  object dsTable: TDataSource
    DataSet = Table
    Left = 48
    Top = 56
  end
  object ChildActionList: TActionList
    Left = 128
    Top = 56
    object ApplyFilter: TAction
      Caption = 'ApplyFilter'
    end
    object RemoveFilter: TAction
      Caption = 'RemoveFilter'
      OnExecute = RemoveFilterExecute
    end
    object Refresh: TAction
      Caption = 'Refresh'
      OnExecute = RefreshExecute
    end
    object SortAsc: TAction
      Caption = 'SortAsc'
    end
    object SortDesc: TAction
      Caption = 'SortDesc'
    end
  end
  object predpriatia: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_predpriatie order by name')
    Left = 208
    Top = 8
  end
  object dsPredpriatia: TDataSource
    DataSet = predpriatia
    OnDataChange = dsPredpriatiaDataChange
    Left = 240
    Top = 8
  end
  object dolgnost: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_post order by name')
    Left = 400
    Top = 160
  end
  object dsDolgnost: TDataSource
    DataSet = dolgnost
    Left = 432
    Top = 160
  end
  object dsProfession: TDataSource
    DataSet = profession
    Left = 432
    Top = 208
  end
  object profession: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_profession order by name')
    Left = 400
    Top = 208
  end
end

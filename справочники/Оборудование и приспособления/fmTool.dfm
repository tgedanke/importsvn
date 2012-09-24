object FormTool: TFormTool
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082': '#1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1080' '#1087#1088#1080#1089#1087#1086#1089#1086#1073#1083#1077#1085#1080#1103
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
    Top = 0
    Width = 774
    Height = 479
    Align = alClient
    DataSource = dsTable
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnEnter = DBGridEnter
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Visible = True
      end>
  end
  object Table: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    AfterInsert = TableAfterInsert
    AfterPost = TableAfterPost
    AfterDelete = TableAfterDelete
    AfterRefresh = TableAfterRefresh
    TableName = 'tb_tool'
    Left = 16
    Top = 56
    object Tableid: TIntegerField
      FieldName = 'id'
    end
    object Tablename: TStringField
      FieldName = 'name'
      Size = 128
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
      OnExecute = ApplyFilterExecute
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
      OnExecute = SortAscExecute
    end
    object SortDesc: TAction
      Caption = 'SortDesc'
      OnExecute = SortDescExecute
    end
  end
end

object FormSostoyanie: TFormSostoyanie
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082': '#1057#1086#1089#1090#1086#1103#1085#1080#1103' '#1080' '#1084#1077#1088#1086#1087#1080#1103#1090#1080#1103
  ClientHeight = 602
  ClientWidth = 773
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
    Top = 561
    Width = 773
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
      Left = 503
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
    Width = 503
    Height = 561
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
        FieldName = 'text'
        Title.Caption = #1052#1077#1088#1086#1087#1088#1080#1103#1090#1080#1077
        Width = 277
        Visible = True
      end>
  end
  object RzPanel1: TRzPanel
    Left = 503
    Top = 0
    Width = 270
    Height = 561
    Align = alRight
    BorderOuter = fsNone
    TabOrder = 2
    object RzPanel2: TRzPanel
      Left = 0
      Top = 0
      Width = 270
      Height = 35
      Align = alTop
      BorderOuter = fsNone
      TabOrder = 0
      object RzLabel1: TRzLabel
        Left = 16
        Top = 11
        Width = 54
        Height = 13
        Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
      end
    end
    object RzPanel3: TRzPanel
      Left = 0
      Top = 249
      Width = 270
      Height = 38
      Align = alTop
      BorderOuter = fsNone
      TabOrder = 1
      object RzLabel2: TRzLabel
        Left = 16
        Top = 14
        Width = 68
        Height = 13
        Caption = #1052#1077#1088#1086#1087#1088#1080#1103#1090#1080#1077
      end
    end
    object RzDBMemo1: TRzDBMemo
      Left = 0
      Top = 287
      Width = 270
      Height = 274
      Align = alClient
      DataField = 'text'
      DataSource = dsTable
      TabOrder = 2
    end
    object RzDBMemo2: TRzDBMemo
      Left = 0
      Top = 35
      Width = 270
      Height = 214
      Align = alTop
      Enabled = False
      TabOrder = 3
    end
  end
  object Table: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    AfterInsert = TableAfterInsert
    AfterPost = TableAfterPost
    AfterDelete = TableAfterDelete
    AfterRefresh = TableAfterRefresh
    TableName = 'tb_meropriatie'
    Left = 16
    Top = 56
    object Tableid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object Tabletext: TStringField
      FieldName = 'text'
      Size = 255
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

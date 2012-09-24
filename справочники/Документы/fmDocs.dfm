object FormDocs: TFormDocs
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082': '#1053#1057#1044
  ClientHeight = 655
  ClientWidth = 816
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
    Top = 614
    Width = 816
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
      Left = 546
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
      TabOrder = 1
    end
  end
  object RzSplitter1: TRzSplitter
    Left = 0
    Top = 0
    Width = 816
    Height = 614
    Orientation = orVertical
    Position = 252
    Percent = 41
    HotSpotVisible = True
    SplitterWidth = 7
    Align = alClient
    TabOrder = 1
    BarSize = (
      0
      252
      816
      259)
    UpperLeftControls = (
      TopPanel)
    LowerRightControls = (
      RzPanel1)
    object TopPanel: TRzPanel
      Left = 0
      Top = 0
      Width = 816
      Height = 252
      Align = alClient
      BorderOuter = fsNone
      TabOrder = 0
      object RzPanel2: TRzPanel
        Left = 0
        Top = 0
        Width = 816
        Height = 23
        Align = alTop
        BorderOuter = fsNone
        TabOrder = 0
        object RzLabel1: TRzLabel
          Left = 8
          Top = 4
          Width = 58
          Height = 13
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
        end
      end
      object DBGrid: TRzDBGrid
        Left = 0
        Top = 23
        Width = 608
        Height = 229
        Align = alClient
        DataSource = dsTable
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnEnter = DBGridEnter
        FocusColor = 14152959
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Width = 800
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'description'
            Visible = False
          end>
      end
      object RzPanel4: TRzPanel
        Left = 608
        Top = 23
        Width = 208
        Height = 229
        Align = alRight
        BorderOuter = fsNone
        TabOrder = 2
        object RzPanel5: TRzPanel
          Left = 0
          Top = 0
          Width = 208
          Height = 25
          Align = alTop
          BorderOuter = fsFlat
          TabOrder = 0
          object RzLabel3: TRzLabel
            Left = 16
            Top = 6
            Width = 107
            Height = 13
            Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          end
        end
        object RzDBMemo1: TRzDBMemo
          Left = 0
          Top = 25
          Width = 208
          Height = 204
          Align = alClient
          DataField = 'description'
          DataSource = dsTable
          TabOrder = 1
        end
      end
    end
    object RzPanel1: TRzPanel
      Left = 0
      Top = 0
      Width = 816
      Height = 355
      Align = alClient
      BorderOuter = fsNone
      TabOrder = 0
      object RzPanel3: TRzPanel
        Left = 0
        Top = 0
        Width = 816
        Height = 23
        Align = alTop
        BorderOuter = fsNone
        TabOrder = 0
        object RzLabel2: TRzLabel
          Left = 8
          Top = 4
          Width = 97
          Height = 13
          Caption = #1055#1091#1085#1082#1090#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        end
      end
      object DBGrid2: TRzDBGrid
        Left = 0
        Top = 23
        Width = 398
        Height = 332
        Align = alClient
        DataSource = dsTable2
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnEnter = DBGrid2Enter
        FocusColor = 14152959
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'nsd_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'num'
            Title.Caption = #1053#1086#1084#1077#1088' '#1087#1091#1085#1082#1090#1072
            Width = 375
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'description'
            Visible = False
          end>
      end
      object RzPanel6: TRzPanel
        Left = 398
        Top = 23
        Width = 418
        Height = 332
        Align = alRight
        BorderOuter = fsNone
        TabOrder = 2
        object RzPanel7: TRzPanel
          Left = 0
          Top = 0
          Width = 418
          Height = 23
          Align = alTop
          BorderOuter = fsFlat
          TabOrder = 0
          object RzLabel4: TRzLabel
            Left = 10
            Top = 6
            Width = 88
            Height = 13
            Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1091#1085#1082#1090#1072
          end
        end
        object RzDBMemo2: TRzDBMemo
          Left = 0
          Top = 23
          Width = 418
          Height = 309
          Align = alClient
          DataField = 'description'
          DataSource = dsTable2
          TabOrder = 1
        end
      end
    end
  end
  object dsTable: TDataSource
    DataSet = table
    OnDataChange = dsTableDataChange
    Left = 48
    Top = 56
  end
  object Table2: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    AfterInsert = TableAfterInsert
    AfterPost = TableAfterPost
    AfterDelete = TableAfterDelete
    AfterRefresh = TableAfterRefresh
    IndexFieldNames = 'nsd_id'
    MasterFields = 'id'
    MasterSource = dsTable
    TableName = 'tb_nsd_punkt'
    Left = 16
    Top = 352
    object Table2id: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object Table2nsd_id: TIntegerField
      FieldName = 'nsd_id'
    end
    object Table2num: TStringField
      FieldName = 'num'
    end
    object Table2description: TMemoField
      FieldName = 'description'
      BlobType = ftMemo
    end
  end
  object dsTable2: TDataSource
    DataSet = ADOQuery1
    Left = 48
    Top = 352
  end
  object table: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    BeforePost = tableBeforePost
    Parameters = <>
    SQL.Strings = (
      'select * from tb_nsd order by name asc')
    Left = 16
    Top = 56
  end
  object ADOQuery1: TADOQuery
    Connection = DataModule1.KMCConnection
    OnNewRecord = ADOQuery1NewRecord
    Parameters = <>
    Left = 16
    Top = 392
  end
end

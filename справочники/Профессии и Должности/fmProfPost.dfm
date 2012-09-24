object FormProfPost: TFormProfPost
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082': '#1055#1088#1086#1092#1077#1089#1089#1080#1080' '#1080' '#1044#1086#1083#1078#1085#1086#1089#1090#1080
  ClientHeight = 703
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
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBottom: TRzPanel
    Left = 0
    Top = 662
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
    Height = 662
    Orientation = orVertical
    Position = 277
    Percent = 42
    HotSpotVisible = True
    SplitterWidth = 7
    Align = alClient
    TabOrder = 1
    BarSize = (
      0
      277
      816
      284)
    UpperLeftControls = (
      TopPanel)
    LowerRightControls = (
      RzPanel1)
    object TopPanel: TRzPanel
      Left = 0
      Top = 0
      Width = 816
      Height = 277
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
          Width = 55
          Height = 13
          Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1080
        end
      end
      object DBGrid: TRzDBGrid
        Left = 0
        Top = 23
        Width = 816
        Height = 254
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
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 399
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'code'
            Title.Caption = #1050#1086#1076
            Width = 53
            Visible = True
          end>
      end
    end
    object RzPanel1: TRzPanel
      Left = 0
      Top = 0
      Width = 816
      Height = 378
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
          Width = 57
          Height = 13
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1080
        end
      end
      object DBGrid2: TRzDBGrid
        Left = 0
        Top = 23
        Width = 816
        Height = 355
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
            FieldName = 'name'
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 315
            Visible = True
          end>
      end
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
    TableName = 'tb_profession'
    Left = 16
    Top = 56
    object Tableid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object Tablename: TStringField
      FieldName = 'name'
      Size = 255
    end
    object Tablecode: TStringField
      FieldName = 'code'
      Size = 50
    end
  end
  object dsTable: TDataSource
    DataSet = Table
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
    TableName = 'tb_post'
    Left = 48
    Top = 352
  end
  object dsTable2: TDataSource
    DataSet = Table2
    Left = 80
    Top = 352
  end
end

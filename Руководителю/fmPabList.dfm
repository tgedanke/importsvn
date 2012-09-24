object FormPabList: TFormPabList
  Left = 0
  Top = 0
  Caption = #1046#1091#1088#1085#1072#1083' '#1087#1088#1086#1090#1086#1082#1086#1083#1086#1074
  ClientHeight = 651
  ClientWidth = 939
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
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 939
    Height = 65
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 869
    object RzLabel1: TRzLabel
      Left = 104
      Top = 26
      Width = 19
      Height = 13
      Caption = #1042#1080#1076
    end
    object RzLabel2: TRzLabel
      Left = 311
      Top = 26
      Width = 36
      Height = 13
      Caption = #1057#1090#1072#1090#1091#1089
    end
    object RzLabel3: TRzLabel
      Left = 471
      Top = 26
      Width = 20
      Height = 13
      Caption = #1062#1077#1093
    end
    object RzLabel4: TRzLabel
      Left = 615
      Top = 26
      Width = 19
      Height = 13
      Caption = #1043#1086#1076
    end
    object ViewCombo: TRzComboBox
      Left = 143
      Top = 23
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ViewComboChange
    end
    object StatusCombo: TRzComboBox
      Left = 353
      Top = 23
      Width = 104
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Text = #1042#1089#1077
      OnChange = StatusComboChange
      Items.Strings = (
        #1042#1089#1077
        #1053#1077#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077
        #1042#1086#1079#1074#1088#1072#1096#1077#1085#1085#1099#1077
        #1047#1072#1074#1077#1088#1096#1077#1085#1085#1099#1077
        #1044#1083#1103' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1103)
      ItemIndex = 0
      Values.Strings = (
        '0'
        '1'
        '3'
        '2'
        '4')
    end
    object CehCombo: TRzDBLookupComboBox
      Left = 497
      Top = 23
      Width = 96
      Height = 21
      KeyField = 'id'
      ListField = 'name'
      ListSource = dsCeh
      TabOrder = 2
      OnCloseUp = CehComboCloseUp
    end
    object RzButton2: TRzButton
      Left = 16
      Top = 20
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      HotTrack = True
      TabOrder = 3
      OnClick = RzButton2Click
    end
    object YearCombo: TRzComboBox
      Left = 641
      Top = 23
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Text = #1042#1089#1077
      OnChange = YearComboChange
      Items.Strings = (
        #1042#1089#1077
        '2010'
        '2011'
        '2012'
        '2013')
      ItemIndex = 0
      Values.Strings = (
        '0'
        '2010'
        '2011'
        '2012'
        '2013')
    end
    object cbMonth2: TRzCheckBox
      Left = 782
      Top = 25
      Width = 136
      Height = 15
      Hint = 
        #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1088#1086#1090#1086#1082#1086#1083#1099' '#1090#1086#1083#1100#1082#1086' '#1079#1072' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' 2 '#1084#1077#1089#1103#1094#1072' '#1074' '#1090#1077#1082#1091#1097#1077#1084' '#1075#1086#1076#1091 +
        '.'
      Caption = #1053#1077' '#1087#1086#1079#1076#1085#1077#1077' 2'#1093' '#1084#1077#1089#1103#1094#1077#1074
      Checked = True
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 5
      OnClick = cbMonth2Click
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 600
    Width = 939
    Height = 51
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 869
    object BtnPabNew: TRzButton
      Left = 16
      Top = 16
      Width = 89
      Caption = #1053#1086#1074#1099#1081' '#1055#1040#1041
      HotTrack = True
      TabOrder = 0
      OnClick = BtnPabNewClick
    end
    object BtnPabDel: TRzButton
      Left = 111
      Top = 16
      Width = 89
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1055#1040#1041
      HotTrack = True
      TabOrder = 1
      OnClick = BtnPabDelClick
    end
    object BtnPabSign: TRzButton
      Left = 232
      Top = 16
      Width = 161
      Caption = #1053#1072' '#1087#1086#1076#1087#1080#1089#1100' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1102
      HotTrack = True
      TabOrder = 2
      OnClick = BtnPabSignClick
    end
    object RzPanel3: TRzPanel
      Left = 782
      Top = 2
      Width = 155
      Height = 47
      Align = alRight
      BorderOuter = fsNone
      TabOrder = 3
      ExplicitLeft = 712
      object RzButton1: TRzButton
        Left = 64
        Top = 13
        Caption = #1047#1072#1082#1088#1099#1090#1100
        HotTrack = True
        TabOrder = 0
        OnClick = RzButton1Click
      end
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 65
    Width = 939
    Height = 535
    Align = alClient
    DataSource = dsPab
    EditActions = [geaCopyEh]
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghDialogFind]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnGetCellParams = DBGridEh1GetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'id'
        Footers = <>
        Visible = False
        Width = 21
      end
      item
        EditButtons = <>
        FieldName = 'num'
        Footers = <>
        Title.Caption = #8470
        Width = 29
      end
      item
        EditButtons = <>
        FieldName = 'date'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'Time_Start'
        Footers = <>
        Title.Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095'.'
        Visible = False
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'Time_End'
        Footers = <>
        Title.Caption = #1042#1088#1077#1084#1103' '#1082#1086#1085'.'
        Visible = False
        Width = 42
      end
      item
        EditButtons = <>
        FieldName = 'ceh'
        Footers = <>
        Title.Caption = #1062#1077#1093
        ToolTips = True
        Visible = False
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'uchastok'
        Footers = <>
        Title.Caption = #1059#1095#1072#1089#1090#1086#1082
        ToolTips = True
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'count'
        Footers = <>
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 37
      end
      item
        EditButtons = <>
        FieldName = 'category'
        Footers = <>
        Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
        ToolTips = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'owner'
        Footers = <>
        Title.Caption = #1042#1083#1072#1076#1077#1083#1077#1094
        ToolTips = True
        Visible = False
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'tester'
        Footers = <>
        Title.Caption = #1060#1048#1054
        ToolTips = True
        Visible = False
        Width = 109
      end
      item
        EditButtons = <>
        FieldName = 'tester_post'
        Footers = <>
        Title.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        ToolTips = True
        Visible = False
        Width = 115
      end
      item
        EditButtons = <>
        FieldName = 'type'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Width = 23
      end
      item
        EditButtons = <>
        FieldName = 'fatal_effect'
        Footers = <>
        Title.Caption = #1058#1103#1078#1077#1089#1090#1100' '#1087#1086#1089#1083#1077#1076'.'
        ToolTips = True
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'audit_kind'
        Footers = <>
        Title.Caption = #1042#1080#1076' '#1072#1091#1076#1080#1090#1072
        ToolTips = True
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'work_kind'
        Footers = <>
        Title.Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090
        ToolTips = True
        Width = 148
      end
      item
        EditButtons = <>
        FieldName = 'danger_descripton'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1087#1072#1089#1085#1086#1089#1090#1080
        ToolTips = True
        Width = 141
      end
      item
        EditButtons = <>
        FieldName = 'possible_effect'
        Footers = <>
        Title.Caption = #1042#1086#1079#1084#1086#1078#1085#1099#1077' '#1087#1086#1089#1083#1077#1076#1089#1090#1074#1080#1103
        ToolTips = True
        Width = 131
      end
      item
        EditButtons = <>
        FieldName = 'worker_idea'
        Footers = <>
        Title.Caption = #1055#1088#1077#1076#1083#1086#1078#1077#1085#1080#1103' '#1088#1072#1073#1086#1090#1085#1080#1082#1072
        ToolTips = True
        Width = 139
      end
      item
        EditButtons = <>
        FieldName = 'boss_decision'
        Footers = <>
        Title.Caption = #1056#1077#1096#1077#1085#1080#1077' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
        ToolTips = True
        Width = 336
      end>
  end
  object qryPab: TADOQuery
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    AfterScroll = qryPabAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select * from pab_main_view order by [num]')
    Left = 24
    Top = 128
  end
  object dsPab: TDataSource
    DataSet = qryPab
    Left = 56
    Top = 128
  end
  object qryCeh: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from pab_ceh_view order by name')
    Left = 400
    Top = 40
  end
  object dsCeh: TDataSource
    DataSet = qryCeh
    Left = 432
    Top = 40
  end
end

object FormOOSView: TFormOOSView
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1094#1077#1093#1072#1084
  ClientHeight = 267
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 73
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 16
      Top = 0
      Width = 20
      Height = 13
      Caption = #1062#1077#1093
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object RzLabel2: TRzLabel
      Left = 200
      Top = 0
      Width = 33
      Height = 13
      Caption = #1054#1090#1093#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object RzLabel3: TRzLabel
      Left = 600
      Top = 0
      Width = 43
      Height = 13
      Caption = #1050#1074#1072#1088#1090#1072#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object RzLabel4: TRzLabel
      Left = 95
      Top = 48
      Width = 19
      Height = 13
      Caption = #1043#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object FilterEdit: TRzEdit
      Left = 200
      Top = 46
      Width = 377
      Height = 21
      TabOrder = 0
      OnChange = FilterEditChange
    end
    object QuarterCombo: TRzComboBox
      Left = 600
      Top = 19
      Width = 75
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Text = #1042#1089#1077
      Items.Strings = (
        #1042#1089#1077
        '1'
        '2'
        '3'
        '4')
      ItemIndex = 0
      Values.Strings = (
        '4'
        '1'
        '2'
        '3'
        '4')
    end
    object CehCombo: TRzDBLookupComboBox
      Left = 16
      Top = 19
      Width = 178
      Height = 21
      KeyField = 'id'
      ListField = 'name'
      ListSource = dsCeh
      TabOrder = 2
    end
    object WasteCombo: TRzDBLookupComboBox
      Left = 200
      Top = 19
      Width = 377
      Height = 21
      KeyField = 'id'
      ListField = 'name'
      ListSource = dsWaste
      TabOrder = 3
    end
    object YearCombo: TRzComboBox
      Left = 121
      Top = 46
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Text = '2010'
      Items.Strings = (
        '2009'
        '2010'
        '2011'
        '2012'
        '2013')
      ItemIndex = 1
      Values.Strings = (
        '2009'
        '2010'
        '2011'
        '2012'
        '2013')
    end
    object RzButton2: TRzButton
      Left = 600
      Top = 42
      Caption = #1055#1086#1089#1095#1080#1090#1072#1090#1100
      HotTrack = True
      TabOrder = 5
      OnClick = RzButton2Click
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 226
    Width = 680
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    object RzPanel3: TRzPanel
      Left = 519
      Top = 0
      Width = 161
      Height = 41
      Align = alRight
      BorderOuter = fsNone
      TabOrder = 0
      object RzButton1: TRzButton
        Left = 72
        Top = 8
        Caption = #1047#1072#1082#1088#1099#1090#1100
        HotTrack = True
        TabOrder = 0
        OnClick = RzButton1Click
      end
    end
    object RzButton3: TRzButton
      Left = 7
      Top = 8
      Width = 162
      Caption = #1053#1077#1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1085#1099#1077' '#1086#1090#1093#1086#1076#1099
      HotTrack = True
      TabOrder = 1
      OnClick = RzButton3Click
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 73
    Width = 680
    Height = 153
    Align = alClient
    DataSource = dsSumm
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghDialogFind]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnGetCellParams = DBGridEh1GetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'id'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
        Width = 142
      end
      item
        EditButtons = <>
        FieldName = 'sum_q'
        Footers = <>
        Title.Caption = #1079#1072' '#1082#1074#1072#1088#1090'.'
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'sum_qn'
        Footers = <>
        Title.Caption = #1085#1072#1082#1086#1087#1080#1090'.'
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'sum_qt'
        Footers = <>
        Title.Caption = #1079#1072' '#1075#1086#1076
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'limit'
        Footers = <>
        Title.Caption = #1051#1080#1084#1080#1090
      end
      item
        EditButtons = <>
        FieldName = 'balance'
        Footers = <>
        Title.Caption = #1054#1089#1090#1072#1090#1086#1082' '#1089' '#1087#1088#1086#1096#1083'. '#1075#1086#1076#1072
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'normative'
        Footers = <>
        Title.Caption = #1053#1086#1088#1084#1072#1090#1080#1074
        Width = 105
      end>
  end
  object BalanceInfo: TRzPanel
    Left = 0
    Top = 168
    Width = 680
    Height = 58
    TabOrder = 3
    Visible = False
    object DBGridEh2: TDBGridEh
      AlignWithMargins = True
      Left = 7
      Top = 7
      Width = 666
      Height = 44
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      DataSource = dsBalance
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      OptionsEh = [dghHighlightFocus, dghClearSelection, dghDialogFind]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'code'
          Footers = <>
          Title.Caption = #1050#1086#1076
          ToolTips = True
          Width = 81
        end
        item
          EditButtons = <>
          FieldName = 'class'
          Footers = <>
          Title.Caption = #1050#1083#1072#1089#1089
          ToolTips = True
          Width = 38
        end
        item
          EditButtons = <>
          FieldName = 'waste'
          Footers = <>
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          ToolTips = True
          Width = 286
        end
        item
          EditButtons = <>
          FieldName = 'company'
          Footers = <>
          ToolTips = True
          Visible = False
          Width = 105
        end
        item
          EditButtons = <>
          FieldName = 'dept'
          Footers = <>
          Title.Caption = #1062#1077#1093
          ToolTips = True
          Width = 136
        end
        item
          EditButtons = <>
          FieldName = 'weight'
          Footers = <>
          Title.Caption = #1042#1077#1089
          ToolTips = True
        end>
    end
  end
  object dsCeh: TDataSource
    DataSet = qryCeh
    Left = 48
    Top = 40
  end
  object qryCeh: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from ws_get_ceh_list()')
    Left = 16
    Top = 40
  end
  object qryWaste: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'declare @t table(id int,name varchar(255))'
      'set nocount on'
      'insert into @t values(0,'#39#1042#1089#1077#39')'
      ''
      'insert into @t'
      'select id,name from ws_codes where favorite=1 order by name'
      ''
      'set nocount off'
      ''
      'select * from @t')
    Left = 208
    Top = 40
  end
  object dsWaste: TDataSource
    DataSet = qryWaste
    Left = 240
    Top = 40
  end
  object qrySumm: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'code_id'
        DataType = ftString
        Size = 1
        Value = '0'
      end
      item
        Name = 'year'
        DataType = ftString
        Size = 4
        Value = '2010'
      end
      item
        Name = 'quarter'
        DataType = ftString
        Size = 1
        Value = '4'
      end
      item
        Name = 'ceh'
        DataType = ftString
        Size = 1
        Value = '0'
      end>
    SQL.Strings = (
      'select * from '
      'ws_calc_weight_advanced(:code_id,:year,:quarter,:ceh)')
    Left = 16
    Top = 96
  end
  object dsSumm: TDataSource
    DataSet = qrySumm
    Left = 48
    Top = 96
  end
  object dsBalance: TDataSource
    DataSet = qryBalance
    Left = 112
    Top = 184
  end
  object qryBalance: TADOQuery
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'year'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'exec ws_get_balance :year')
    Left = 80
    Top = 184
  end
end

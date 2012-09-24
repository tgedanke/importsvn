object FormLimits: TFormLimits
  Left = 0
  Top = 0
  Caption = #1051#1080#1084#1080#1090#1099' '#1080' '#1086#1089#1090#1072#1090#1082#1080
  ClientHeight = 544
  ClientWidth = 811
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 811
    Height = 46
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 8
      Top = 16
      Width = 19
      Height = 13
      Caption = #1043#1086#1076
    end
    object RzLabel2: TRzLabel
      Left = 134
      Top = 16
      Width = 38
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object ComboYear: TRzComboBox
      Left = 41
      Top = 13
      Width = 73
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Text = '2010'
      OnChange = ComboYearChange
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
    object FilterEdit: TRzEdit
      Left = 178
      Top = 13
      Width = 329
      Height = 21
      TabOrder = 1
      OnChange = FilterEditChange
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 510
    Width = 811
    Height = 34
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    object RzPanel3: TRzPanel
      Left = 631
      Top = 0
      Width = 180
      Height = 34
      Align = alRight
      BorderOuter = fsNone
      TabOrder = 0
      object RzButton1: TRzButton
        Left = 96
        Top = 6
        Caption = #1047#1072#1082#1088#1099#1090#1100
        HotTrack = True
        TabOrder = 0
        OnClick = RzButton1Click
      end
    end
    object RzButton2: TRzButton
      Left = 16
      Top = 6
      Width = 137
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079#1073#1088#1072#1085#1085#1099#1077
      HotTrack = True
      TabOrder = 1
      OnClick = RzButton2Click
    end
    object RzButton3: TRzButton
      Left = 295
      Top = 6
      Width = 130
      Caption = #1056#1072#1089#1089#1095#1080#1090#1072#1090#1100' '#1086#1089#1090#1072#1090#1082#1080
      HotTrack = True
      TabOrder = 2
      OnClick = RzButton3Click
    end
    object RzButton4: TRzButton
      Left = 159
      Top = 6
      Width = 130
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1083#1080#1084#1080#1090#1099
      HotTrack = True
      TabOrder = 3
      OnClick = RzButton4Click
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 46
    Width = 811
    Height = 464
    Align = alClient
    DataSource = dsCOdes
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
        FieldName = 'code_id'
        Footers = <>
        Title.ToolTips = True
        ToolTips = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'year'
        Footers = <>
        Title.ToolTips = True
        ToolTips = True
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.ToolTips = True
        ToolTips = True
        Width = 316
      end
      item
        EditButtons = <>
        FieldName = 'class'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1083#1072#1089#1089
        Title.ToolTips = True
        ToolTips = True
      end
      item
        EditButtons = <>
        FieldName = 'limit'
        Footers = <>
        Title.Caption = #1051#1080#1084#1080#1090
        Title.ToolTips = True
        ToolTips = True
        Width = 115
      end
      item
        EditButtons = <>
        FieldName = 'normative_o'
        Footers = <>
        Title.Caption = #1053#1086#1088#1084#1072#1090#1080#1074' '#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103
        Width = 96
      end
      item
        EditButtons = <>
        FieldName = 'balance'
        Footers = <>
        Title.Caption = #1054#1089#1090#1072#1090#1086#1082' '#1089' '#1087#1088#1086#1096#1083#1086#1075#1086' '#1075#1086#1076#1072
        Title.ToolTips = True
        ToolTips = True
        Width = 108
      end
      item
        EditButtons = <>
        FieldName = 'balance_o'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1054#1090#1089#1090#1072#1090#1086#1082' '#1074' '#1086#1090#1095#1077#1090
        Visible = False
        Width = 98
      end>
  end
  object dsCOdes: TDataSource
    DataSet = qryCodes
    Left = 56
    Top = 72
  end
  object qryCodes: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    BeforePost = qryCodesBeforePost
    Parameters = <
      item
        Name = 'year'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 2010
      end>
    SQL.Strings = (
      
        'select * from ws_codes_year_view where [year]=:year order by nam' +
        'e')
    Left = 24
    Top = 72
  end
end

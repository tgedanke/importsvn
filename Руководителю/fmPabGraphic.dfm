object FormGraphic: TFormGraphic
  Left = 0
  Top = 0
  Caption = #1043#1088#1072#1092#1080#1082' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1055#1040#1041
  ClientHeight = 479
  ClientWidth = 885
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
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel2: TRzPanel
    Left = 0
    Top = 428
    Width = 885
    Height = 51
    Align = alBottom
    TabOrder = 0
    object RzPanel3: TRzPanel
      Left = 728
      Top = 2
      Width = 155
      Height = 47
      Align = alRight
      BorderOuter = fsNone
      TabOrder = 0
      object RzButton1: TRzButton
        Left = 64
        Top = 13
        Caption = #1047#1072#1082#1088#1099#1090#1100
        HotTrack = True
        TabOrder = 0
        OnClick = RzButton1Click
      end
    end
    object RzButton2: TRzButton
      Left = 24
      Top = 13
      Width = 137
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1091#1076#1080#1090#1086#1088#1072
      HotTrack = True
      TabOrder = 1
      OnClick = RzButton2Click
    end
    object RzButton3: TRzButton
      Left = 176
      Top = 13
      Width = 97
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077#1093
      HotTrack = True
      TabOrder = 2
      OnClick = RzButton3Click
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 885
    Height = 65
    Align = alTop
    TabOrder = 1
    object RzLabel1: TRzLabel
      Left = 24
      Top = 27
      Width = 19
      Height = 13
      Caption = #1043#1086#1076
    end
    object RzLabel2: TRzLabel
      Left = 232
      Top = 27
      Width = 31
      Height = 13
      Caption = #1052#1077#1089#1103#1094
    end
    object YearCombo: TRzComboBox
      Left = 56
      Top = 24
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = YearComboChange
      Items.Strings = (
        '2010'
        '2011'
        '2012'
        '2013'
        '2014'
        '2015'
        '2016'
        '2017'
        '2018'
        '2019'
        '2020')
      Values.Strings = (
        '2010'
        '2011'
        '2012'
        '2013'
        '2014'
        '2015'
        '2016'
        '2017'
        '2018'
        '2019'
        '2020')
    end
    object MonthCombo: TRzComboBox
      Left = 280
      Top = 24
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = YearComboChange
      Items.Strings = (
        #1103#1085#1074#1072#1088#1100
        #1092#1077#1074#1088#1072#1083#1100
        #1084#1072#1088#1090
        #1072#1087#1088#1077#1083#1100
        #1084#1072#1081
        #1080#1102#1085#1100
        #1080#1102#1083#1100
        #1072#1074#1075#1091#1089#1090
        #1089#1077#1085#1090#1103#1073#1088#1100
        #1086#1082#1090#1103#1073#1088#1100
        #1085#1086#1103#1073#1088#1100
        #1076#1077#1082#1072#1073#1088#1100)
      Values.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12')
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 65
    Width = 885
    Height = 363
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    DataSource = dspab
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    OptionsEh = [dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
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
        FieldName = 'uid'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'year'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'month'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'week1'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'week2'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'week3'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'week4'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'fio'
        Footers = <>
        Title.Caption = #1060#1048#1054
        Width = 149
      end
      item
        EditButtons = <>
        FieldName = 'week1_text'
        Footers = <>
        Title.Caption = '1 '#1085#1077#1076#1077#1083#1103
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'week2_text'
        Footers = <>
        Title.Caption = '2 '#1085#1077#1076#1077#1083#1103
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'week3_text'
        Footers = <>
        Title.Caption = '3 '#1085#1077#1076#1077#1083#1103
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'week4_text'
        Footers = <>
        Title.Caption = '4 '#1085#1077#1076#1077#1083#1103
        Width = 100
      end
      item
        AlwaysShowEditButton = True
        AutoFitColWidth = False
        EditButtons = <
          item
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000320B0000320B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FF002EE41B48FBFF00FF1B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FF002EE41B48FBFF00FFFF00FF1B48FB
              3E5EFF002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF002E
              E41B48FBFF00FFFF00FFFF00FF1B48FB1B48FB3E5EFF002EE4FF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF002EE41B48FBFF00FFFF00FFFF00FFFF00FFFF00FF
              3E5EFF1B48FB3E5EFF002EE4FF00FFFF00FFFF00FFFF00FF002EE41B48FBFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF002EE4FF
              00FFFF00FF002EE4002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF1B48FB3E5EFF002EE4002EE4002EE4FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB1B
              48FB1B48FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF1B48FB3E5EFF1B48FB3E5EFF002EE4FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF002EE4FF
              00FFFF00FF1B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FF1B48FB3E5EFF002EE4FF00FFFF00FFFF00FFFF00FF1B48FB002EE4FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF002EE4FF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FF1B48FB002EE4FF00FFFF00FFFF00FFFF00FF1B48FB
              6482FF002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FF002EE4FF00FFFF00FF1B48FB6482FF002EE4FF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB1B48FB
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Hint = #1059#1076#1072#1083#1080#1090#1100
            Style = ebsMinusEh
            Width = 16
            OnClick = DBGridEh1Columns13EditButtons0Click
          end>
        FieldName = 'deleteBtn'
        Footers = <>
        MaxWidth = 16
        MinWidth = 16
        ReadOnly = True
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clBtnFace
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 16
      end>
  end
  object qryPlane: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    BeforeClose = qryPlaneBeforeClose
    Parameters = <
      item
        Name = 'year'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'month'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select * from pab_plan_view where [year]=:year and [month]=:mont' +
        'h'
      'order by [fio]')
    Left = 40
    Top = 152
    object qryPlaneid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qryPlaneuid: TIntegerField
      FieldName = 'uid'
    end
    object qryPlaneyear: TIntegerField
      FieldName = 'year'
    end
    object qryPlanemonth: TIntegerField
      FieldName = 'month'
    end
    object qryPlaneweek1: TIntegerField
      FieldName = 'week1'
    end
    object qryPlaneweek2: TIntegerField
      FieldName = 'week2'
    end
    object qryPlaneweek3: TIntegerField
      FieldName = 'week3'
    end
    object qryPlaneweek4: TIntegerField
      FieldName = 'week4'
    end
    object qryPlanefio: TStringField
      FieldName = 'fio'
      Size = 255
    end
    object qryPlaneweek1_text: TStringField
      FieldKind = fkLookup
      FieldName = 'week1_text'
      LookupDataSet = qryCeh
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'week1'
      Size = 50
      Lookup = True
    end
    object qryPlaneweek2_text: TStringField
      FieldKind = fkLookup
      FieldName = 'week2_text'
      LookupDataSet = qryCeh
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'week2'
      Size = 50
      Lookup = True
    end
    object qryPlaneweek3_text: TStringField
      FieldKind = fkLookup
      FieldName = 'week3_text'
      LookupDataSet = qryCeh
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'week3'
      Size = 50
      Lookup = True
    end
    object qryPlaneweek4_text: TStringField
      FieldKind = fkLookup
      FieldName = 'week4_text'
      LookupDataSet = qryCeh
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'week4'
      Size = 50
      Lookup = True
    end
  end
  object dspab: TDataSource
    DataSet = qryPlane
    Left = 40
    Top = 184
  end
  object qryCeh: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from [pab_ceh] order by name')
    Left = 240
    Top = 216
  end
  object dsCeh: TDataSource
    DataSet = qryCeh
    Left = 240
    Top = 248
  end
end

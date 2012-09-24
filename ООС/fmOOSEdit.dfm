object FormOOSEdit: TFormOOSEdit
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1086#1090#1093#1086#1076#1072
  ClientHeight = 605
  ClientWidth = 823
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
  object RzPanel2: TRzPanel
    Left = 0
    Top = 565
    Width = 823
    Height = 40
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 0
    object RzPanel3: TRzPanel
      Left = 650
      Top = 0
      Width = 173
      Height = 40
      Align = alRight
      BorderOuter = fsNone
      TabOrder = 0
      object RzButton1: TRzButton
        Left = 80
        Top = 10
        Width = 81
        Caption = #1047#1072#1082#1088#1099#1090#1100
        HotTrack = True
        TabOrder = 0
        OnClick = RzButton1Click
      end
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 823
    Height = 565
    Align = alClient
    TabOrder = 1
    object RzPanel1: TRzPanel
      Left = 5
      Top = 8
      Width = 593
      Height = 65
      TabOrder = 0
      object RzLabel1: TRzLabel
        Left = 16
        Top = 8
        Width = 60
        Height = 13
        Caption = #1050#1086#1076' '#1086#1090#1093#1086#1076#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzDBLabel1: TRzDBLabel
        Left = 106
        Top = 8
        Width = 95
        Height = 17
        DataField = 'code'
        DataSource = dsWaste
      end
      object RzLabel2: TRzLabel
        Left = 16
        Top = 27
        Width = 73
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzDBLabel2: TRzDBLabel
        Left = 106
        Top = 27
        Width = 471
        Height = 30
        WordWrap = True
        DataField = 'name'
        DataSource = dsWaste
      end
    end
    object RzPanel4: TRzPanel
      Left = 5
      Top = 79
      Width = 724
      Height = 234
      TabOrder = 1
      object GridOper: TDBGridEh
        Left = 16
        Top = 11
        Width = 697
        Height = 183
        DataSource = dsOper
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
        OnDblClick = GridOperDblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'id'
            Footers = <>
            ReadOnly = True
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'waste_id'
            Footers = <>
            ReadOnly = True
            Title.ToolTips = True
            ToolTips = True
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'month'
            Footers = <>
            Title.Caption = #1052#1077#1089#1103#1094
            Width = 36
          end
          item
            EditButtons = <>
            FieldName = 'src_company'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1050#1086#1084#1087#1072#1085#1080#1103' - '#1080#1089#1090#1086#1095#1085#1080#1082
            Title.ToolTips = True
            ToolTips = True
            Width = 124
          end
          item
            EditButtons = <>
            FieldName = 'src_dept'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1062#1077#1093' - '#1080#1089#1090#1086#1095#1085#1080#1082
            Title.ToolTips = True
            ToolTips = True
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'dst_company'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1050#1086#1084#1087#1072#1085#1080#1103' - '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
            Title.ToolTips = True
            ToolTips = True
            Width = 121
          end
          item
            EditButtons = <>
            FieldName = 'dst_dept'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1062#1077#1093' - '#1087#1086#1090#1088#1077#1073#1080#1090#1077#1083#1100
            Title.ToolTips = True
            ToolTips = True
            Width = 105
          end
          item
            EditButtons = <>
            FieldName = 'operation'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
            Title.ToolTips = True
            ToolTips = True
            Width = 98
          end
          item
            EditButtons = <>
            FieldName = 'weight'
            Footers = <>
            Title.Caption = #1042#1077#1089', '#1090
            Title.ToolTips = True
            ToolTips = True
          end
          item
            EditButtons = <>
            FieldName = 'comment'
            Footers = <>
            Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
            Title.ToolTips = True
            ToolTips = True
            Width = 85
          end>
      end
      object RzButton2: TRzButton
        Left = 16
        Top = 200
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        HotTrack = True
        TabOrder = 1
        OnClick = RzButton2Click
      end
      object RzButton3: TRzButton
        Left = 106
        Top = 200
        Caption = #1059#1076#1072#1083#1080#1090#1100
        HotTrack = True
        TabOrder = 2
        OnClick = RzButton3Click
      end
      object RzButton4: TRzButton
        Left = 632
        Top = 200
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100
        HotTrack = True
        TabOrder = 3
        OnClick = RzButton4Click
      end
    end
    object RzPanel5: TRzPanel
      Left = 5
      Top = 319
      Width = 724
      Height = 210
      TabOrder = 2
      object DBGridEh1: TDBGridEh
        Left = 16
        Top = 32
        Width = 697
        Height = 169
        DataSource = DataSource1
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        OptionsEh = [dghHighlightFocus, dghClearSelection, dghDialogFind]
        ReadOnly = True
        TabOrder = 0
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
            Title.Caption = #1054#1087#1088#1077#1072#1094#1080#1103
            Width = 153
          end
          item
            EditButtons = <>
            FieldName = 'sum_q'
            Footers = <>
            Title.Caption = #1090#1077#1082#1091#1097'. '#1082#1074#1072#1088#1090#1072#1083
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'sum_qn'
            Footers = <>
            Title.Caption = #1085#1072#1082#1086#1087'. '#1080#1090#1086#1075
            Width = 75
          end
          item
            EditButtons = <>
            FieldName = 'sum_qt'
            Footers = <>
            Title.Caption = #1079#1072' '#1075#1086#1076
            Width = 83
          end
          item
            EditButtons = <>
            FieldName = 'limit'
            Footers = <>
            Title.Caption = #1083#1080#1084#1080#1090
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'balance'
            Footers = <>
            Title.Caption = #1086#1089#1090#1072#1090#1086#1082' '#1089' '#1087#1088#1086#1096#1083#1086#1075#1086' '#1075#1086#1076#1072
            Width = 140
          end
          item
            EditButtons = <>
            FieldName = 'normative'
            Footers = <>
            Title.Caption = #1053#1086#1088#1084#1072#1090#1080#1074
          end>
      end
      object CehCombo: TRzComboBox
        Left = 16
        Top = 5
        Width = 165
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = CehComboChange
      end
    end
  end
  object tblWaste: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    TableName = 'ws_waste_view'
    Left = 48
    Top = 24
  end
  object dsWaste: TDataSource
    DataSet = tblWaste
    Left = 80
    Top = 24
  end
  object dsOper: TDataSource
    DataSet = qryOper
    Left = 80
    Top = 128
  end
  object qryOper: TADOQuery
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    OnRecordChangeComplete = qryOperRecordChangeComplete
    Parameters = <
      item
        Name = 'id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 7
      end>
    Prepared = True
    SQL.Strings = (
      'select * from ws_waste_operation_view where waste_id=:id')
    Left = 48
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = qrySumm
    Left = 80
    Top = 352
  end
  object qrySumm: TADOQuery
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'id'
        DataType = ftString
        Size = 2
        Value = '22'
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
        Value = '1'
      end
      item
        Name = 'ceh'
        DataType = ftString
        Size = 1
        Value = '0'
      end>
    SQL.Strings = (
      'select * from dbo.ws_calc_weight(:id,:year,:quarter,:ceh)')
    Left = 48
    Top = 352
  end
end

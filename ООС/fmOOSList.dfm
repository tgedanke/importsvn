object FormOOSList: TFormOOSList
  Left = 0
  Top = 0
  Caption = #1046#1091#1088#1085#1072#1083' '#1086#1090#1093#1086#1076#1086#1074
  ClientHeight = 592
  ClientWidth = 845
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
    Width = 845
    Height = 41
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 0
    object FilterEdit: TRzEdit
      Left = 288
      Top = 14
      Width = 353
      Height = 21
      TabOrder = 0
      OnChange = FilterEditChange
      OnKeyDown = FilterEditKeyDown
    end
    object ComboYear: TRzComboBox
      Left = 16
      Top = 14
      Width = 65
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = '2010'
      OnChange = ComboQuarterChange
      Items.Strings = (
        '2009'
        '2010'
        '2011'
        '2012')
      ItemIndex = 1
      Values.Strings = (
        '2009'
        '2010'
        '2011'
        '2012')
    end
    object ComboQuarter: TRzComboBox
      Left = 87
      Top = 14
      Width = 66
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = '4'
      OnChange = ComboQuarterChange
      Items.Strings = (
        '1'
        '2'
        '3'
        '4')
      ItemIndex = 3
      Values.Strings = (
        '1'
        '2'
        '3'
        '4')
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 551
    Width = 845
    Height = 41
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    object RzButton1: TRzButton
      Left = 8
      Top = 10
      Width = 113
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1090#1093#1086#1076
      Enabled = False
      HotTrack = True
      TabOrder = 0
    end
    object RzButton2: TRzButton
      Left = 127
      Top = 10
      Width = 130
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079#1073#1088#1072#1085#1085#1099#1077
      HotTrack = True
      TabOrder = 1
      OnClick = RzButton2Click
    end
    object RzPanel3: TRzPanel
      Left = 708
      Top = 0
      Width = 137
      Height = 41
      Align = alRight
      BorderOuter = fsNone
      TabOrder = 2
      object RzButton3: TRzButton
        Left = 40
        Top = 10
        Width = 81
        Caption = #1047#1072#1082#1088#1099#1090#1100
        HotTrack = True
        TabOrder = 0
        OnClick = RzButton3Click
      end
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 845
    Height = 510
    Align = alClient
    DataSource = dsWaste
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
        Width = 25
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'year'
        Footers = <>
        Title.Caption = #1043#1086#1076
        Title.ToolTips = True
        Width = 41
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'quarter'
        Footers = <>
        Title.Caption = #1050#1074#1072#1088#1090#1072#1083
        Title.ToolTips = True
        Width = 42
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'code'
        Footers = <>
        Title.Caption = #1050#1086#1076' '#1086#1090#1093#1086#1076#1072
        Title.ToolTips = True
        Width = 82
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'class'
        Footers = <>
        Title.Caption = #1050#1083#1072#1089#1089' '#1086#1087#1072#1089#1085#1086#1089#1090#1080
        Title.ToolTips = True
        Width = 29
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1090#1093#1086#1076#1072
        Title.ToolTips = True
        ToolTips = True
        Width = 486
      end
      item
        EditButtons = <>
        FieldName = 'has_operations'
        Footers = <>
        Visible = False
        Width = 32
      end>
  end
  object qryWaste: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'year'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 2010
      end
      item
        Name = 'quarter'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 4
      end>
    SQL.Strings = (
      
        'select * from ws_waste_view where year=:year and quarter=:quarte' +
        'r'
      'order by has_operations desc,name')
    Left = 8
    Top = 80
  end
  object dsWaste: TDataSource
    DataSet = qryWaste
    Left = 40
    Top = 80
  end
end

object FormOOSGetPeriod: TFormOOSGetPeriod
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1087#1077#1088#1080#1086#1076#1072
  ClientHeight = 146
  ClientWidth = 223
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel1: TRzLabel
    Left = 8
    Top = 11
    Width = 19
    Height = 13
    Caption = #1043#1086#1076
  end
  object RzLabel2: TRzLabel
    Left = 8
    Top = 40
    Width = 43
    Height = 13
    Caption = #1050#1074#1072#1088#1090#1072#1083
  end
  object RzLabel3: TRzLabel
    Left = 8
    Top = 88
    Width = 32
    Height = 13
    Caption = #1054#1090#1095#1077#1090
    Visible = False
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 112
    Width = 223
    Height = 34
    Align = alBottom
    BorderSides = [sdTop]
    TabOrder = 0
    object RzButton1: TRzButton
      Left = 142
      Top = 6
      Cancel = True
      ModalResult = 2
      Caption = #1054#1090#1084#1077#1085#1072
      HotTrack = True
      TabOrder = 0
    end
    object RzButton2: TRzButton
      Left = 61
      Top = 6
      ModalResult = 1
      Caption = #1054#1050
      HotTrack = True
      TabOrder = 1
    end
  end
  object RzComboBox1: TRzComboBox
    Left = 72
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    Text = '2010'
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
  object RzComboBox2: TRzComboBox
    Left = 72
    Top = 35
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    Text = '1'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4')
    ItemIndex = 0
    Values.Strings = (
      '1'
      '2'
      '3'
      '4')
  end
  object RzDBLookupComboBox1: TRzDBLookupComboBox
    Left = 70
    Top = 62
    Width = 145
    Height = 21
    KeyField = 'id'
    ListField = 'name'
    ListSource = dsCeh
    TabOrder = 3
  end
  object RzComboBox3: TRzComboBox
    Left = 70
    Top = 85
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    Text = #1054#1073#1086#1073#1097#1077#1085#1085#1099#1081
    Visible = False
    OnChange = RzComboBox3Change
    Items.Strings = (
      #1054#1073#1086#1073#1097#1077#1085#1085#1099#1081
      #1055#1086' '#1094#1077#1093#1072#1084
      #1055#1077#1088#1077#1076#1072#1085#1085#1099#1077' ('#1087#1086' '#1094#1077#1093#1072#1084')'
      #1055#1088#1080#1085#1103#1090#1099#1077
      #1055#1077#1088#1077#1076#1072#1085#1085#1099#1077' ('#1087#1086' '#1086#1073#1097#1077#1089#1090#1074#1091')')
    ItemIndex = 0
    Values.Strings = (
      '1'
      '2'
      '3'
      '4')
  end
  object qryCeh: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id,name from ws_company_dept where company_id=5')
    Left = 16
    Top = 80
  end
  object dsCeh: TDataSource
    DataSet = qryCeh
    Left = 16
    Top = 48
  end
end

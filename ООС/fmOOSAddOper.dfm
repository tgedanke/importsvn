object FormOOSAddOper: TFormOOSAddOper
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077'/'#1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
  ClientHeight = 314
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 273
    Width = 426
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 238
    ExplicitWidth = 424
    object RzButton1: TRzButton
      Left = 341
      Top = 8
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      HotTrack = True
      TabOrder = 0
      OnClick = RzButton1Click
    end
    object RzButton2: TRzButton
      Left = 260
      Top = 8
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      HotTrack = True
      TabOrder = 1
      OnClick = RzButton2Click
    end
  end
  object RzGroupBox1: TRzGroupBox
    Left = 10
    Top = 48
    Width = 201
    Height = 81
    Caption = #1048#1089#1090#1086#1095#1085#1080#1082
    TabOrder = 1
    object RzDBLookupComboBox1: TRzDBLookupComboBox
      Left = 16
      Top = 20
      Width = 153
      Height = 21
      DataField = 'src_company_id'
      DataSource = dsOper
      KeyField = 'id'
      ListField = 'name'
      ListSource = dsSrcComp
      TabOrder = 0
    end
    object RzDBLookupComboBox2: TRzDBLookupComboBox
      Left = 16
      Top = 47
      Width = 153
      Height = 21
      DataField = 'src_dept_id'
      DataSource = dsOper
      KeyField = 'id'
      ListField = 'name'
      ListSource = dsSrcDept
      TabOrder = 1
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 217
    Top = 48
    Width = 201
    Height = 81
    Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
    TabOrder = 2
    object RzDBLookupComboBox3: TRzDBLookupComboBox
      Left = 16
      Top = 20
      Width = 153
      Height = 21
      DataField = 'dst_company_id'
      DataSource = dsOper
      KeyField = 'id'
      ListField = 'name'
      ListSource = dsDstComp
      TabOrder = 0
    end
    object RzDBLookupComboBox4: TRzDBLookupComboBox
      Left = 16
      Top = 47
      Width = 153
      Height = 21
      DataField = 'dst_dept_id'
      DataSource = dsOper
      KeyField = 'id'
      ListField = 'name'
      ListSource = dsDstDept
      TabOrder = 1
    end
  end
  object RzDBRadioGroup1: TRzDBRadioGroup
    Left = 8
    Top = 135
    Width = 409
    Height = 82
    DataField = 'operation_id'
    DataSource = dsOper
    Items.Strings = (
      #1085#1077' '#1091#1082#1072#1079#1072#1085#1072
      #1076#1083#1103' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103
      #1076#1083#1103' '#1086#1073#1077#1079#1074#1088#1077#1078#1080#1074#1072#1085#1080#1103
      #1076#1083#1103' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1103
      #1076#1083#1103' '#1087#1077#1088#1077#1088#1072#1073#1086#1090#1082#1080
      #1087#1077#1088#1077#1076'. '#1089' '#1087#1077#1088#1077#1093'. '#1087#1088#1072#1074'. '#1089#1086#1073'.')
    Values.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4'
      '5')
    Caption = #1054#1087#1077#1088#1072#1094#1080#1103
    Columns = 2
    TabOrder = 3
  end
  object RzGroupBox3: TRzGroupBox
    Left = 8
    Top = 217
    Width = 409
    Height = 50
    Caption = #1042#1077#1089
    TabOrder = 4
    object RzDBNumericEdit1: TRzDBNumericEdit
      Left = 16
      Top = 16
      Width = 129
      Height = 21
      DataSource = dsOper
      DataField = 'weight'
      TabOrder = 0
      OnKeyPress = RzDBNumericEdit1KeyPress
      IntegersOnly = False
      DisplayFormat = '0.0000'
      Value = 7.000000000000000000
    end
    object RzButton3: TRzButton
      Left = 207
      Top = 16
      Width = 188
      Caption = #1042#1079#1103#1090#1100' '#1080#1079' '#1085#1077#1088#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1085#1086#1075#1086
      HotTrack = True
      TabOrder = 1
      OnClick = RzButton3Click
    end
  end
  object RzGroupBox4: TRzGroupBox
    Left = 8
    Top = 1
    Width = 410
    Height = 41
    Caption = #1052#1077#1089#1103#1094
    TabOrder = 5
    object edMonth: TRzComboBox
      Left = 18
      Top = 11
      Width = 155
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Text = #1053#1077' '#1074#1099#1073#1088#1072#1085
      OnChange = edMonthChange
      Items.Strings = (
        #1053#1077' '#1074#1099#1073#1088#1072#1085
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
      ItemIndex = 0
    end
  end
  object dsOper: TDataSource
    DataSet = tblOper
    OnDataChange = dsOperDataChange
    Left = 40
    Top = 248
  end
  object tblOper: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    TableName = 'ws_waste_operation'
    Left = 8
    Top = 248
  end
  object tblSrcComp: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    IndexFieldNames = 'id'
    TableName = 'ws_companies'
    Left = 32
    Top = 56
  end
  object dsSrcComp: TDataSource
    DataSet = tblSrcComp
    Left = 64
    Top = 56
  end
  object tblSrcDept: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    IndexFieldNames = 'company_id'
    MasterFields = 'id'
    MasterSource = dsSrcComp
    TableName = 'ws_company_dept'
    Left = 32
    Top = 88
  end
  object dsSrcDept: TDataSource
    DataSet = tblSrcDept
    Left = 64
    Top = 88
  end
  object tblDstComp: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    IndexFieldNames = 'id'
    TableName = 'ws_companies'
    Left = 240
    Top = 56
  end
  object dsDstComp: TDataSource
    DataSet = tblDstComp
    Left = 272
    Top = 56
  end
  object dsDstDept: TDataSource
    DataSet = tblDstDept
    Left = 272
    Top = 88
  end
  object tblDstDept: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    IndexFieldNames = 'company_id'
    MasterFields = 'id'
    MasterSource = dsDstComp
    TableName = 'ws_company_dept'
    Left = 240
    Top = 88
  end
end

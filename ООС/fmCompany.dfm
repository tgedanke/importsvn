object FormOOSCompanies: TFormOOSCompanies
  Left = 0
  Top = 0
  Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
  ClientHeight = 640
  ClientWidth = 920
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
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 617
    Top = 0
    Height = 600
    ExplicitLeft = 561
    ExplicitTop = -6
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 600
    Width = 920
    Height = 40
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 0
    object RzPanel2: TRzPanel
      Left = 770
      Top = 0
      Width = 150
      Height = 40
      Align = alRight
      BorderOuter = fsNone
      TabOrder = 0
      object RzButton1: TRzButton
        Left = 64
        Top = 8
        Caption = #1047#1072#1082#1088#1099#1090#1100
        HotTrack = True
        TabOrder = 0
        OnClick = RzButton1Click
      end
    end
  end
  object RzPanel4: TRzPanel
    Left = 0
    Top = 0
    Width = 617
    Height = 600
    Align = alLeft
    BorderOuter = fsNone
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 0
      Width = 617
      Height = 569
      Align = alClient
      DataSource = dsCompany
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      OptionsEh = [dghHighlightFocus, dghClearSelection, dghIncSearch, dghRowHighlight, dghDialogFind]
      RowHeight = 17
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
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
          Title.Caption = #1050#1086#1084#1087#1072#1085#1080#1103
          Width = 155
        end
        item
          EditButtons = <>
          FieldName = 'address'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089
          Width = 105
        end
        item
          EditButtons = <>
          FieldName = 'license'
          Footers = <>
          Title.Caption = #1051#1080#1094#1077#1085#1079#1080#1103
          Width = 83
        end
        item
          EditButtons = <>
          FieldName = 'inn'
          Footers = <>
          Title.Caption = #1048#1053#1053
          Width = 92
        end
        item
          EditButtons = <>
          FieldName = 'contract'
          Footers = <>
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088
          Width = 107
        end>
    end
    object RzPanel6: TRzPanel
      Left = 0
      Top = 569
      Width = 617
      Height = 31
      Align = alBottom
      BorderOuter = fsNone
      TabOrder = 1
      ExplicitWidth = 465
      object RzDBNavigator1: TRzDBNavigator
        Left = 8
        Top = 6
        Width = 174
        Height = 25
        DataSource = dsCompany
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        BorderOuter = fsNone
        TabOrder = 0
      end
    end
  end
  object RzPanel5: TRzPanel
    Left = 620
    Top = 0
    Width = 300
    Height = 600
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 2
    ExplicitLeft = 468
    ExplicitWidth = 452
    object DBGridEh2: TDBGridEh
      Left = 0
      Top = 0
      Width = 300
      Height = 569
      Align = alClient
      DataSource = dsDepts
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      OptionsEh = [dghHighlightFocus, dghClearSelection, dghIncSearch, dghRowHighlight, dghDialogFind]
      RowHeight = 17
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'id'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'company_id'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'name'
          Footers = <>
          Title.Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
          Width = 416
        end>
    end
    object RzPanel7: TRzPanel
      Left = 0
      Top = 569
      Width = 300
      Height = 31
      Align = alBottom
      BorderOuter = fsNone
      TabOrder = 1
      ExplicitWidth = 452
      object RzDBNavigator2: TRzDBNavigator
        Left = 8
        Top = 6
        Width = 168
        Height = 25
        DataSource = dsDepts
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        BorderOuter = fsNone
        TabOrder = 0
      end
    end
  end
  object tblCompany: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    TableName = 'ws_companies'
    Left = 8
    Top = 56
  end
  object dsCompany: TDataSource
    DataSet = tblCompany
    Left = 40
    Top = 56
  end
  object dsDepts: TDataSource
    DataSet = tblDepts
    Left = 528
    Top = 56
  end
  object tblDepts: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    IndexFieldNames = 'company_id'
    MasterFields = 'id'
    MasterSource = dsCompany
    TableName = 'ws_company_dept'
    Left = 488
    Top = 56
  end
end

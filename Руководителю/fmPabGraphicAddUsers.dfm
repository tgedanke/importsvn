object FormGraphicAddUsers: TFormGraphicAddUsers
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1091#1076#1080#1090#1086#1088#1072
  ClientHeight = 447
  ClientWidth = 421
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
  object RzPanel2: TRzPanel
    Left = 0
    Top = 402
    Width = 421
    Height = 45
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 0
    object RzPanel3: TRzPanel
      Left = 234
      Top = 0
      Width = 187
      Height = 45
      Align = alRight
      BorderOuter = fsNone
      TabOrder = 0
      object RzButton1: TRzButton
        Left = 96
        Top = 13
        ModalResult = 2
        Caption = #1047#1072#1082#1088#1099#1090#1100
        HotTrack = True
        TabOrder = 0
      end
      object RzButton2: TRzButton
        Left = 8
        Top = 13
        ModalResult = 1
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        HotTrack = True
        TabOrder = 1
        OnClick = RzButton2Click
      end
    end
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 421
    Height = 49
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 1
    object RzLabel1: TRzLabel
      Left = 16
      Top = 9
      Width = 325
      Height = 26
      Caption = 
        #1042#1099#1073#1077#1088#1080#1090#1077' '#1072#1091#1076#1080#1090#1086#1088#1086#1074', '#1082#1086#1090#1086#1088#1099#1093' '#1074#1099' '#1093#1086#1090#1080#1090#1077' '#1074#1082#1083#1102#1095#1080#1090#1100' '#1074' '#1075#1088#1072#1092#1080#1082'. '#13#1047#1072#1090#1077#1084' ' +
        #1085#1072#1078#1084#1080#1090#1077' '#1085#1072' '#1082#1085#1086#1087#1082#1091' "'#1044#1086#1073#1072#1074#1080#1090#1100'". '
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 49
    Width = 421
    Height = 353
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    DataSource = dsUsers
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
        ReadOnly = True
        Title.Caption = #1060#1048#1054
        Width = 285
      end
      item
        EditButtons = <>
        FieldName = 'selected'
        Footers = <>
        Title.Caption = #1042#1099#1073#1086#1088
        Width = 53
      end>
  end
  object dsUsers: TDataSource
    DataSet = tblUsers
    Left = 16
    Top = 136
  end
  object tblUsers: TMemTableEh
    Active = True
    Params = <>
    Left = 16
    Top = 104
    object tblUsersid: TIntegerField
      DisplayWidth = 10
      FieldName = 'id'
    end
    object tblUsersname: TStringField
      DisplayWidth = 25
      FieldName = 'name'
      Size = 255
    end
    object tblUsersselected: TBooleanField
      DisplayWidth = 5
      FieldName = 'selected'
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object id: TMTNumericDataFieldEh
          FieldName = 'id'
          NumericDataType = fdtIntegerEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          currency = False
          Precision = 0
        end
        object name: TMTStringDataFieldEh
          FieldName = 'name'
          StringDataType = fdtStringEh
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
          Size = 255
          Transliterate = False
        end
        object selected: TMTBooleanDataFieldEh
          FieldName = 'selected'
          Alignment = taLeftJustify
          DisplayWidth = 0
          Required = False
          Visible = False
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
end

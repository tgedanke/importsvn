object FormProtocolList: TFormProtocolList
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1090#1086#1082#1086#1083': '#1046#1091#1088#1085#1072#1083
  ClientHeight = 520
  ClientWidth = 774
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBottom: TRzPanel
    Left = 0
    Top = 479
    Width = 774
    Height = 41
    Align = alBottom
    BorderSides = [sdTop]
    TabOrder = 0
    object labelCaountlabel: TRzLabel
      Left = 280
      Top = 16
      Width = 45
      Height = 13
      Caption = #1047#1072#1087#1080#1089#1077#1081':'
    end
    object labelCount: TRzLabel
      Left = 330
      Top = 16
      Width = 79
      Height = 13
      AutoSize = False
      Caption = '0'
    end
    object PanelBottomButtons: TRzPanel
      Left = 504
      Top = 2
      Width = 270
      Height = 39
      Align = alRight
      BorderSides = []
      TabOrder = 0
      object ButtonSave: TRzButton
        Left = 17
        Top = 4
        Width = 113
        Height = 33
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        HotTrack = True
        TabOrder = 0
        Visible = False
      end
      object ButtonClose: TRzButton
        Left = 144
        Top = 4
        Width = 113
        Height = 33
        Caption = #1047#1072#1082#1088#1099#1090#1100
        HotTrack = True
        TabOrder = 1
        OnClick = ButtonCloseClick
      end
    end
    object DBNavigator: TRzDBNavigator
      Left = 8
      Top = 10
      Width = 240
      Height = 25
      DataSource = dsQuery
      TabOrder = 1
    end
  end
  object DBGrid: TRzDBGrid
    Left = 0
    Top = 33
    Width = 774
    Height = 446
    Align = alClient
    DataSource = dsQuery
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'uchastok'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'num'
        Title.Caption = #8470' '#1055#1088#1086#1090#1086#1082#1086#1083#1072
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'odate'
        Title.Caption = #1044#1072#1090#1072' '#1086#1094#1077#1085#1082#1080
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'code'
        Title.Caption = #1050#1086#1076
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'predpriatie_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'uchastok_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'prof_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'post_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'attestator_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sootv1'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sootv2'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sootv3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'sootv4'
        Visible = False
      end>
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 33
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 2
    object RzLabel2: TRzLabel
      Left = 8
      Top = 6
      Width = 94
      Height = 19
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object RzLabel1: TRzLabel
      Left = 144
      Top = 10
      Width = 42
      Height = 13
      Caption = #1059#1095#1072#1089#1090#1086#1082
    end
    object RzComboBox1: TRzComboBox
      Left = 197
      Top = 6
      Width = 160
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = RzComboBox1Change
    end
  end
  object dsQuery: TDataSource
    DataSet = query
    Left = 48
    Top = 56
  end
  object ChildActionList: TActionList
    Left = 128
    Top = 56
    object ApplyFilter: TAction
      Caption = 'ApplyFilter'
      OnExecute = ApplyFilterExecute
    end
    object RemoveFilter: TAction
      Caption = 'RemoveFilter'
      OnExecute = RemoveFilterExecute
    end
    object Refresh: TAction
      Caption = 'Refresh'
      OnExecute = RefreshExecute
    end
    object SortAsc: TAction
      Caption = 'SortAsc'
      OnExecute = SortAscExecute
    end
    object SortDesc: TAction
      Caption = 'SortDesc'
    end
    object ProtocolOpen: TAction
      Caption = 'ProtocolOpen'
      OnExecute = ProtocolOpenExecute
    end
    object ProtocolNew: TAction
      Caption = 'ProtocolNew'
      OnExecute = ProtocolNewExecute
    end
    object ProtocolDelete: TAction
      Caption = 'ProtocolDelete'
      OnExecute = ProtocolDeleteExecute
    end
  end
  object query: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = queryCalcFields
    Parameters = <>
    SQL.Strings = (
      'select * from tb_protocol order by year(odate) asc,num asc')
    Left = 16
    Top = 56
    object queryid: TIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
    object querynum: TStringField
      FieldName = 'num'
      Size = 50
    end
    object queryodate: TDateTimeField
      FieldName = 'odate'
    end
    object querycode: TStringField
      FieldName = 'code'
      Size = 50
    end
    object querypredpriatie_id: TIntegerField
      FieldName = 'predpriatie_id'
    end
    object queryuchastok_id: TIntegerField
      FieldName = 'uchastok_id'
    end
    object queryprof_id: TIntegerField
      FieldName = 'prof_id'
    end
    object queryprof_comment: TStringField
      FieldName = 'prof_comment'
      Size = 50
    end
    object querypost_id: TIntegerField
      FieldName = 'post_id'
    end
    object queryattestator_id: TIntegerField
      FieldName = 'attestator_id'
    end
    object querysootv1: TBooleanField
      FieldName = 'sootv1'
    end
    object querysootv2: TBooleanField
      FieldName = 'sootv2'
    end
    object querysootv3: TBooleanField
      FieldName = 'sootv3'
    end
    object querysootv4: TBooleanField
      FieldName = 'sootv4'
    end
    object queryuslovia_class: TIntegerField
      FieldName = 'uslovia_class'
    end
    object queryuchastok: TStringField
      FieldKind = fkCalculated
      FieldName = 'uchastok'
      Size = 100
      Calculated = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 48
    Top = 304
    object N1: TMenuItem
      Action = ProtocolOpen
      Caption = #1054#1090#1082#1088#1099#1090#1100
    end
    object N2: TMenuItem
      Action = ProtocolNew
      Caption = #1053#1086#1074#1099#1081
    end
    object N3: TMenuItem
      Action = ProtocolDelete
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
    object Rjgbhjdfnm1: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = Rjgbhjdfnm1Click
    end
  end
  object listUchastok: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_predpriatie_podrazdelenie order by name asc')
    Left = 16
    Top = 88
  end
  object spCopyProtocol: TADOStoredProc
    Connection = DataModule1.KMCConnection
    ProcedureName = 'copy_protocol;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
      end
      item
        Name = '@id'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
      end>
    Prepared = True
    Left = 16
    Top = 208
  end
end

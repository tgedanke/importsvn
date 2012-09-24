object FormPabUsers: TFormPabUsers
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
  ClientHeight = 529
  ClientWidth = 874
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
  object PanelBottom: TRzPanel
    Left = 0
    Top = 488
    Width = 874
    Height = 41
    Align = alBottom
    BorderSides = [sdTop]
    TabOrder = 0
    object PanelBottomButtons: TRzPanel
      Left = 604
      Top = 2
      Width = 270
      Height = 39
      Align = alRight
      BorderSides = []
      TabOrder = 0
      object ButtonClose: TRzButton
        Left = 144
        Top = 4
        Width = 113
        Height = 33
        Caption = #1047#1072#1082#1088#1099#1090#1100
        HotTrack = True
        TabOrder = 0
        OnClick = ButtonCloseClick
      end
    end
    object RzButton1: TRzButton
      Left = 8
      Top = 6
      Width = 113
      Height = 35
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1062#1077#1093#1072
      HotTrack = True
      TabOrder = 1
      Visible = False
      OnClick = RzButton1Click
    end
  end
  object pabPages: TRzPageControl
    Left = 0
    Top = 0
    Width = 874
    Height = 488
    ActivePage = pageCeh
    Align = alClient
    TabIndex = 1
    TabOrder = 1
    FixedDimension = 19
    object pageUsers: TRzTabSheet
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      object RzPanel5: TRzPanel
        Left = 0
        Top = 420
        Width = 870
        Height = 45
        Align = alBottom
        BorderOuter = fsNone
        TabOrder = 0
        object RzDBNavigator3: TRzDBNavigator
          Left = 7
          Top = 6
          Width = 210
          Height = 36
          DataSource = dsUsers
          VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
          BorderOuter = fsNone
          TabOrder = 0
        end
        object RzButton2: TRzButton
          Left = 223
          Top = 6
          Width = 161
          Height = 36
          Caption = #1057#1080#1085#1093#1088#1086#1085#1080#1079#1080#1088#1086#1074#1072#1090#1100' '#1089' '#1091#1095#1077#1090#1085#1099#1084#1080' '#1079#1072#1087#1080#1089#1103#1084#1080' '#1076#1086#1084#1077#1085#1072
          HotTrack = True
          TabOrder = 1
          OnClick = RzButton2Click
        end
        object UserFilter: TRzEdit
          Left = 390
          Top = 13
          Width = 211
          Height = 21
          TabOrder = 2
          OnChange = UserFilterChange
        end
      end
      object GridUsers: TDBGridEh
        Left = 0
        Top = 0
        Width = 870
        Height = 420
        Align = alClient
        DataSource = dsUsers
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        OptionsEh = [dghHighlightFocus, dghClearSelection, dghDialogFind]
        TabOrder = 1
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
            Title.Caption = #1060#1072#1084#1080#1083#1080#1103', '#1048#1084#1103', '#1054#1090#1095#1077#1089#1090#1074#1086
            Width = 278
          end
          item
            EditButtons = <>
            FieldName = 'name_short'
            Footers = <>
            Title.Caption = #1060#1048#1054', '#1082#1088#1072#1090#1082#1086
            Width = 117
          end
          item
            EditButtons = <>
            FieldName = 'sname'
            Footers = <>
            Title.Caption = #1057#1080#1089#1090#1077#1084#1085#1086#1077' '#1080#1084#1103
            Width = 105
          end
          item
            EditButtons = <>
            FieldName = 'post'
            Footers = <>
            Title.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
            Width = 168
          end
          item
            EditButtons = <>
            FieldName = 'show_in_graphic'
            Footers = <>
            Title.Caption = #1043#1088#1072#1092#1080#1082
            Width = 41
          end
          item
            EditButtons = <>
            FieldName = 'fixed'
            Footers = <>
            Title.Caption = #1053#1077' '#1089#1080#1085#1093#1088#1086#1085#1080#1079#1080#1088#1086#1074#1072#1090#1100
            Width = 45
          end
          item
            EditButtons = <>
            FieldName = 'cehnm'
            Footers = <>
            Width = 200
          end>
      end
      object ProgressPanel: TRzPanel
        Left = 24
        Top = 24
        Width = 185
        Height = 41
        TabOrder = 2
        Visible = False
        object RzProgressBar1: TRzProgressBar
          Left = 8
          Top = 8
          Width = 169
          BorderWidth = 0
          InteriorOffset = 0
          PartsComplete = 0
          Percent = 0
          TotalParts = 0
        end
      end
    end
    object pageCeh: TRzTabSheet
      Caption = #1062#1077#1093#1072'-'#1059#1095#1072#1089#1090#1082#1080
      object RzSplitter1: TRzSplitter
        Left = 0
        Top = 0
        Width = 870
        Height = 465
        Position = 434
        UsePercent = True
        HotSpotVisible = True
        SplitterWidth = 7
        Align = alClient
        TabOrder = 0
        BarSize = (
          434
          0
          441
          465)
        UpperLeftControls = (
          RzPanel1
          GridCeh
          RzPanel3)
        LowerRightControls = (
          RzPanel2
          GridUchastok
          RzPanel4)
        object RzPanel1: TRzPanel
          Left = 0
          Top = 0
          Width = 434
          Height = 25
          Align = alTop
          BorderOuter = fsNone
          Caption = #1062#1077#1093
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object GridCeh: TDBGridEh
          Left = 0
          Top = 25
          Width = 434
          Height = 407
          Align = alClient
          DataSource = dsCeh
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          OptionsEh = [dghHighlightFocus, dghClearSelection, dghDialogFind]
          TabOrder = 1
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
              Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              Width = 304
            end>
        end
        object RzPanel3: TRzPanel
          Left = 0
          Top = 432
          Width = 434
          Height = 33
          Align = alBottom
          BorderOuter = fsNone
          TabOrder = 2
          object RzDBNavigator1: TRzDBNavigator
            Left = 4
            Top = 4
            Width = 156
            Height = 25
            DataSource = dsCeh
            VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
            BorderOuter = fsNone
            TabOrder = 0
          end
        end
        object RzPanel2: TRzPanel
          Left = 0
          Top = 0
          Width = 429
          Height = 25
          Align = alTop
          BorderOuter = fsNone
          Caption = #1059#1095#1072#1089#1090#1086#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object GridUchastok: TDBGridEh
          Left = 0
          Top = 25
          Width = 429
          Height = 407
          Align = alClient
          DataSource = dsUch
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          OptionsEh = [dghHighlightFocus, dghClearSelection, dghDialogFind]
          TabOrder = 1
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
              FieldName = 'ceh_id'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'name'
              Footers = <>
              Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              Width = 304
            end>
        end
        object RzPanel4: TRzPanel
          Left = 0
          Top = 432
          Width = 429
          Height = 33
          Align = alBottom
          BorderOuter = fsNone
          TabOrder = 2
          object RzDBNavigator2: TRzDBNavigator
            Left = 4
            Top = 4
            Width = 156
            Height = 25
            DataSource = dsUch
            VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
            BorderOuter = fsNone
            TabOrder = 0
          end
        end
      end
    end
  end
  object tblCeh: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    TableName = 'pab_ceh'
    Left = 24
    Top = 392
  end
  object tblUch: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    IndexFieldNames = 'ceh_id'
    MasterFields = 'id'
    MasterSource = dsCeh
    TableName = 'pab_uchastok'
    Left = 464
    Top = 392
  end
  object dsCeh: TDataSource
    DataSet = tblCeh
    Left = 56
    Top = 392
  end
  object dsUch: TDataSource
    DataSet = tblUch
    Left = 496
    Top = 392
  end
  object tblUsers: TADOTable
    Active = True
    AutoCalcFields = False
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    IndexName = 'fio_sort_asc'
    TableName = 'pab_users'
    Left = 16
    Top = 48
    object tblUsersid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object tblUsersname: TStringField
      FieldName = 'name'
      Size = 255
    end
    object tblUserssname: TStringField
      FieldName = 'sname'
      Size = 255
    end
    object tblUserspost: TStringField
      FieldName = 'post'
      Size = 255
    end
    object tblUsersfixed: TBooleanField
      FieldName = 'fixed'
    end
    object tblUsersceh: TIntegerField
      FieldName = 'ceh'
    end
    object tblUserscehnm: TStringField
      FieldKind = fkLookup
      FieldName = 'cehnm'
      LookupDataSet = qryCeh
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'ceh'
      Size = 255
      Lookup = True
    end
    object tblUsersname_short: TStringField
      FieldName = 'name_short'
      Size = 255
    end
    object tblUsersshow_in_graphic: TBooleanField
      FieldName = 'show_in_graphic'
    end
  end
  object dsUsers: TDataSource
    DataSet = tblUsers
    Left = 48
    Top = 48
  end
  object qryCeh: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from pab_ceh_view order by name')
    Left = 256
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = qryCeh
    Left = 288
    Top = 200
  end
end

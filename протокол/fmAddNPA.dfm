object FormAddNPA: TFormAddNPA
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1090#1086#1082#1086#1083': '#1076#1086#1082#1091#1084#1077#1085#1090#1099
  ClientHeight = 596
  ClientWidth = 883
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
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel2: TRzPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 555
    Align = alLeft
    BorderOuter = fsFlat
    BorderSides = [sdRight]
    TabOrder = 0
    object ScrollNsd: TScrollBox
      Left = 0
      Top = 0
      Width = 248
      Height = 555
      VertScrollBar.Tracking = True
      Align = alClient
      TabOrder = 0
      OnMouseEnter = ScrollNsdMouseEnter
      object tplNsd: TRzPanel
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 244
        Height = 86
        Margins.Left = 0
        Margins.Right = 0
        Align = alTop
        Alignment = taLeftJustify
        BorderSides = [sdTop, sdBottom]
        Caption = 
          'aefaefaefaefaefaef aef aef aef aefae faef aef af aef af aefaef a' +
          'faefaefafaef aef'
        TextMargin = 10
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = False
        OnClick = tplNsdClick
        OnMouseEnter = tplNsdMouseEnter
        OnMouseLeave = tplNsdMouseLeave
      end
    end
  end
  object RzPanel3: TRzPanel
    Left = 249
    Top = 0
    Width = 634
    Height = 555
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 1
    object RzPanel1: TRzPanel
      Left = 0
      Top = 0
      Width = 634
      Height = 38
      Align = alTop
      BorderOuter = fsFlat
      BorderSides = [sdBottom]
      TabOrder = 0
      object RzDBLookupComboBox1: TRzDBLookupComboBox
        AlignWithMargins = True
        Left = 8
        Top = 8
        Width = 618
        Height = 21
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alClient
        KeyField = 'id'
        ListField = 'name'
        ListSource = dsRazdel
        TabOrder = 0
      end
    end
    object ScrollPunkt: TScrollBox
      Left = 0
      Top = 38
      Width = 634
      Height = 517
      Align = alClient
      TabOrder = 1
      OnMouseEnter = ScrollPunktMouseEnter
      OnMouseWheel = FormMouseWheel
      OnResize = ScrollPunktResize
      object tplPunkt: TRzPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 624
        Height = 214
        Align = alTop
        Alignment = taLeftJustify
        TabOrder = 0
        Visible = False
        OnMouseEnter = tplPunktMouseEnter
        object tplPunktMemo: TRzMemo
          AlignWithMargins = True
          Left = 24
          Top = 5
          Width = 595
          Height = 88
          Align = alClient
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
          OnMouseEnter = tplPunktMemoMouseEnter
          ReadOnlyColor = clWindow
          OnMouseWheel = FormMouseWheel
        end
        object tplPunktCheckbox: TRzCheckBox
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 13
          Height = 88
          Hint = 'punktchk'
          Align = alLeft
          State = cbUnchecked
          TabOrder = 1
          OnClick = tplPunktCheckboxClick
          OnMouseEnter = tplPunktCheckboxMouseEnter
        end
        object tplPunktBotPanel: TRzPanel
          Left = 2
          Top = 96
          Width = 620
          Height = 116
          Hint = 'cont'
          Align = alBottom
          BorderOuter = fsNone
          TabOrder = 2
          object tplPunktRightPanel: TRzPanel
            Left = 289
            Top = 0
            Width = 331
            Height = 116
            Hint = 'cont'
            Align = alClient
            BorderOuter = fsNone
            TabOrder = 0
            object tplPunktRightMemo: TRzMemo
              Left = 0
              Top = 21
              Width = 331
              Height = 95
              Hint = 'memo_mer'
              Align = alClient
              TabOrder = 0
              OnExit = tplPunktRightMemoExit
              OnMouseEnter = tplPunktRightMemoMouseEnter
              OnMouseLeave = tplPunktRightMemoMouseLeave
            end
            object tplPunktHint2: TRzPanel
              Left = 6
              Top = 93
              Width = 99
              Height = 18
              Hint = 'label_mer'
              BorderOuter = fsFlat
              Caption = #1052#1077#1088#1086#1087#1088#1080#1103#1090#1080#1103
              Color = clWindow
              GradientColorStyle = gcsMSOffice
              TabOrder = 1
            end
            object tplPunktLookup: TRzDBLookupComboBox
              Left = 0
              Top = 0
              Width = 331
              Height = 21
              Align = alTop
              KeyField = 'text'
              ListField = 'text'
              ListSource = dsMeropr
              TabOrder = 2
              OnClick = tplPunktLookupClick
            end
          end
          object tplPunktLeftPanel: TRzPanel
            Left = 0
            Top = 0
            Width = 289
            Height = 116
            Hint = 'cont'
            Align = alLeft
            BorderOuter = fsNone
            TabOrder = 1
            object tplPunktLeftMemo: TRzMemo
              AlignWithMargins = True
              Left = 22
              Top = 0
              Width = 264
              Height = 95
              Hint = 'memo_sost'
              Margins.Left = 22
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alClient
              TabOrder = 0
              OnExit = tplPunktLeftMemoExit
              OnMouseEnter = tplPunktLeftMemoMouseEnter
              OnMouseLeave = tplPunktLeftMemoMouseLeave
            end
            object tplPunktCheckboxBot: TRzCheckBox
              AlignWithMargins = True
              Left = 22
              Top = 98
              Width = 264
              Height = 15
              Hint = 'chk_sootv'
              Margins.Left = 22
              Align = alBottom
              Caption = #1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1077#1090
              State = cbUnchecked
              TabOrder = 1
              OnClick = tplPunktCheckboxBotClick
            end
            object tplPunktHint1: TRzPanel
              Left = 27
              Top = 72
              Width = 99
              Height = 18
              Hint = 'label_sost'
              BorderOuter = fsFlat
              Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
              Color = clWindow
              GradientColorStyle = gcsMSOffice
              TabOrder = 2
            end
          end
        end
      end
    end
    object LoadingPanel: TRzPanel
      Left = 232
      Top = 271
      Width = 219
      Height = 50
      TabOrder = 2
      Visible = False
      object LoadingProgress: TRzProgressBar
        Left = 8
        Top = 23
        Width = 201
        Height = 20
        BorderWidth = 0
        InteriorOffset = 0
        PartsComplete = 0
        Percent = 27
        TotalParts = 0
      end
      object RzLabel1: TRzLabel
        Left = 8
        Top = 4
        Width = 201
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #1055#1086#1089#1090#1088#1086#1077#1085#1080#1077' '#1089#1090#1088#1091#1082#1090#1091#1088#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      end
    end
  end
  object PanelBottom: TRzPanel
    Left = 0
    Top = 555
    Width = 883
    Height = 41
    Align = alBottom
    BorderSides = [sdTop]
    TabOrder = 2
    object PanelBottomButtons: TRzPanel
      Left = 613
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
  end
  object nsd: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_nsd order by name desc')
    Left = 16
    Top = 104
  end
  object dsNsd: TDataSource
    DataSet = nsd
    Left = 48
    Top = 104
  end
  object dsPunkt: TDataSource
    DataSet = punkt
    Left = 296
    Top = 184
  end
  object punkt: TADOQuery
    Connection = DataModule1.KMCConnection
    Parameters = <>
    Left = 256
    Top = 184
  end
  object dsRazdel: TDataSource
    DataSet = razdel
    OnDataChange = dsRazdelDataChange
    Left = 448
  end
  object razdel: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_razdel order by name asc')
    Left = 416
    object razdelid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object razdelname: TStringField
      FieldName = 'name'
      Size = 255
    end
  end
  object dsMeropr: TDataSource
    DataSet = qMeropr
    Left = 552
    Top = 176
  end
  object qMeropr: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select * from tb_meropriatie')
    Left = 584
    Top = 176
  end
  object updateCommand: TADOCommand
    CommandText = 
      'update tb_protocol_nsd set d_sootv = :sootv, d_mer = :mer , d_so' +
      'st = :sost where nsd_id = :nsd and punkt_id = :pid and protocol_' +
      'id = :protocolid and num = :num'
    Connection = DataModule1.KMCConnection
    Prepared = True
    Parameters = <
      item
        Name = 'sootv'
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = False
      end
      item
        Name = 'mer'
        Attributes = [paNullable, paLong]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 2147483647
        Value = ' '
      end
      item
        Name = 'sost'
        Attributes = [paNullable, paLong]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 2147483647
        Value = ' '
      end
      item
        Name = 'nsd'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'pid'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'protocolid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 464
    Top = 160
  end
end

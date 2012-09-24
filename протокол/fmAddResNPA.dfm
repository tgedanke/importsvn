object FormAddResNPA: TFormAddResNPA
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1090#1086#1082#1086#1083': '#1076#1086#1082#1091#1084#1077#1085#1090#1099
  ClientHeight = 529
  ClientWidth = 863
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
    Height = 488
    Align = alLeft
    BorderOuter = fsFlat
    BorderSides = [sdRight]
    TabOrder = 0
    object ScrollNsd: TScrollBox
      Left = 0
      Top = 0
      Width = 248
      Height = 488
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
    Width = 614
    Height = 488
    Align = alClient
    BorderOuter = fsNone
    TabOrder = 1
    object RzPanel1: TRzPanel
      Left = 0
      Top = 0
      Width = 614
      Height = 38
      Align = alTop
      BorderOuter = fsFlat
      BorderSides = [sdBottom]
      TabOrder = 0
      object RzDBLookupComboBox1: TRzDBLookupComboBox
        AlignWithMargins = True
        Left = 8
        Top = 8
        Width = 598
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
      Width = 614
      Height = 450
      Align = alClient
      TabOrder = 1
      OnMouseEnter = ScrollPunktMouseEnter
      OnMouseWheel = FormMouseWheel
      object tplPunkt: TRzPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 604
        Height = 238
        Align = alTop
        Alignment = taLeftJustify
        TabOrder = 0
        Visible = False
        OnMouseEnter = tplPunktMouseEnter
        object tplPunktMemo: TRzMemo
          AlignWithMargins = True
          Left = 23
          Top = 5
          Width = 576
          Height = 96
          Align = alClient
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
          OnMouseEnter = tplPunktMemoMouseEnter
          ReadOnlyColor = clWindow
          OnMouseWheel = FormMouseWheel
          ExplicitHeight = 100
        end
        object tplPunktCheckbox: TRzCheckBox
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 12
          Height = 96
          Align = alLeft
          State = cbUnchecked
          TabOrder = 1
          OnClick = tplPunktCheckboxClick
          OnMouseEnter = tplPunktCheckboxMouseEnter
          ExplicitTop = 3
          ExplicitHeight = 102
        end
        object tplPunktPanelBottom: TRzPanel
          Left = 2
          Top = 104
          Width = 600
          Height = 132
          Align = alBottom
          BorderOuter = fsNone
          TabOrder = 2
          object tplPanelTOp: TRzPanel
            Left = 0
            Top = 0
            Width = 600
            Height = 30
            Align = alTop
            BorderOuter = fsLowered
            TabOrder = 0
            object RzCheckBox1: TRzCheckBox
              AlignWithMargins = True
              Left = 12
              Top = 7
              Width = 115
              Height = 18
              Margins.Left = 10
              Margins.Top = 5
              Align = alLeft
              Caption = #1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1077#1090
              State = cbUnchecked
              TabOrder = 0
              ExplicitLeft = 5
              ExplicitTop = 5
              ExplicitHeight = 20
            end
            object RzDBLookupComboBox2: TRzDBLookupComboBox
              AlignWithMargins = True
              Left = 284
              Top = 5
              Width = 311
              Height = 21
              Align = alClient
              TabOrder = 1
              ExplicitLeft = 312
              ExplicitTop = 3
              ExplicitWidth = 145
            end
            object RzPanel6: TRzPanel
              Left = 130
              Top = 2
              Width = 151
              Height = 26
              Align = alLeft
              BorderOuter = fsNone
              Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' / '#1052#1077#1088#1086#1087#1088#1080#1103#1090#1080#1077
              TabOrder = 2
            end
          end
          object tplPunktMemo1: TRzMemo
            Left = 0
            Top = 30
            Width = 289
            Height = 102
            Align = alLeft
            TabOrder = 1
          end
          object tplPunktMemo2: TRzMemo
            Left = 289
            Top = 30
            Width = 311
            Height = 102
            Align = alClient
            TabOrder = 2
            ExplicitLeft = 309
            ExplicitTop = 32
            ExplicitWidth = 185
            ExplicitHeight = 89
          end
        end
      end
    end
  end
  object PanelBottom: TRzPanel
    Left = 0
    Top = 488
    Width = 863
    Height = 41
    Align = alBottom
    BorderSides = [sdTop]
    TabOrder = 2
    object PanelBottomButtons: TRzPanel
      Left = 593
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
      Left = 432
      Top = 6
      Width = 137
      Height = 35
      Caption = 'RzButton1'
      TabOrder = 1
      Visible = False
      OnClick = RzButton1Click
    end
  end
  object nsd: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_nsd')
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
    Left = 344
    Top = 80
  end
  object punkt: TADOQuery
    Connection = DataModule1.KMCConnection
    Parameters = <>
    Left = 312
    Top = 80
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
      'select * from tb_result_razdel order by name asc')
    Left = 416
  end
end

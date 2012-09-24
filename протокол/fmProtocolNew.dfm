object FormProtocolNew: TFormProtocolNew
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1090#1086#1082#1086#1083': '#1053#1086#1074#1099#1081
  ClientHeight = 762
  ClientWidth = 995
  Color = clBtnFace
  DefaultMonitor = dmDesktop
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBottom: TRzPanel
    Left = 0
    Top = 721
    Width = 995
    Height = 41
    Align = alBottom
    BorderSides = [sdTop]
    TabOrder = 0
    object PanelBottomButtons: TRzPanel
      Left = 725
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
        OnClick = ButtonSaveClick
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
    object RzButton3: TRzButton
      Left = 16
      Top = 6
      Width = 121
      Height = 33
      Caption = #1055#1077#1095#1072#1090#1100
      HotTrack = True
      TabOrder = 1
      OnClick = RzButton3Click
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 995
    Height = 721
    VertScrollBar.Position = 265
    Align = alClient
    TabOrder = 1
    object RzPanel5: TRzPanel
      Left = 0
      Top = -265
      Width = 975
      Height = 29
      Align = alTop
      BorderSides = [sdTop, sdBottom]
      TabOrder = 0
      VisualStyle = vsClassic
      OnClick = RzPanel5Click
      object RzLabel1: TRzLabel
        Left = 16
        Top = 8
        Width = 53
        Height = 13
        Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
        OnClick = RzPanel5Click
      end
    end
    object RzPanel1: TRzPanel
      Left = 0
      Top = -236
      Width = 975
      Height = 103
      Align = alTop
      BorderInner = fsLowered
      BorderSides = []
      TabOrder = 1
      object RzLabel4: TRzLabel
        Left = 20
        Top = 14
        Width = 68
        Height = 13
        Caption = #8470#1055#1088#1086#1090#1086#1082#1086#1083#1072
      end
      object RzLabel5: TRzLabel
        Left = 23
        Top = 40
        Width = 65
        Height = 13
        Caption = #1044#1072#1090#1072' '#1086#1094#1077#1085#1082#1080
      end
      object RzLabel6: TRzLabel
        Left = 242
        Top = 14
        Width = 68
        Height = 13
        Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
      end
      object RzLabel7: TRzLabel
        Left = 268
        Top = 40
        Width = 42
        Height = 13
        Caption = #1059#1095#1072#1089#1090#1086#1082
      end
      object RzLabel8: TRzLabel
        Left = 503
        Top = 14
        Width = 55
        Height = 13
        Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103
      end
      object RzLabel9: TRzLabel
        Left = 672
        Top = 70
        Width = 57
        Height = 13
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        Enabled = False
        Visible = False
      end
      object RzLabel13: TRzLabel
        Left = 68
        Top = 68
        Width = 20
        Height = 13
        Caption = #1050#1086#1076
      end
      object RzLabel14: TRzLabel
        Left = 251
        Top = 68
        Width = 139
        Height = 13
        Caption = #1040#1090#1090#1077#1089#1090#1091#1102#1097#1072#1103' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      end
      object RzLabel2: TRzLabel
        Left = 467
        Top = 40
        Width = 94
        Height = 13
        Caption = #1055#1088#1086#1092'. '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1077
      end
      object RzDBLookupComboBox1: TRzDBLookupComboBox
        Left = 316
        Top = 11
        Width = 145
        Height = 21
        DataField = 'predpriatie_id'
        DataSource = dsProtocol
        KeyField = 'id'
        ListField = 'name'
        ListSource = dsPredpritatie
        TabOrder = 0
        TabOnEnter = True
      end
      object RzDBLookupComboBox2: TRzDBLookupComboBox
        Left = 316
        Top = 38
        Width = 145
        Height = 21
        DataField = 'uchastok_id'
        DataSource = dsProtocol
        KeyField = 'id'
        ListField = 'name'
        ListSource = dsUchastok
        TabOrder = 1
        AllowNull = True
        TabOnEnter = True
      end
      object RzDBLookupComboBox3: TRzDBLookupComboBox
        Left = 564
        Top = 11
        Width = 230
        Height = 21
        DataField = 'prof_id'
        DataSource = dsProtocol
        DropDownWidth = 400
        KeyField = 'id'
        ListField = 'name'
        ListSource = dsProfession
        NullValueKey = 46
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        AllowNull = True
        TabOnEnter = True
      end
      object RzDBLookupComboBox4: TRzDBLookupComboBox
        Left = 735
        Top = 68
        Width = 145
        Height = 21
        DataField = 'post_id'
        DataSource = dsProtocol
        Enabled = False
        KeyField = 'id'
        ListField = 'name'
        ListSource = dsDolgnost
        TabOrder = 3
        Visible = False
        TabOnEnter = True
      end
      object RzButton1: TRzButton
        Left = 564
        Top = 65
        Width = 145
        Height = 32
        Caption = #1057#1086#1079#1076#1072#1090#1100
        HotTrack = True
        TabOrder = 4
        OnClick = RzButton1Click
      end
      object RzDBDateTimePicker1: TRzDBDateTimePicker
        Left = 94
        Top = 38
        Width = 121
        Height = 21
        Date = 40484.000000000000000000
        Time = 40484.000000000000000000
        TabOrder = 5
        DataField = 'odate'
        DataSource = dsProtocol
      end
      object RzDBEdit1: TRzDBEdit
        Left = 94
        Top = 65
        Width = 121
        Height = 21
        DataSource = dsProtocol
        DataField = 'code'
        TabOrder = 6
      end
      object RzDBLookupComboBox5: TRzDBLookupComboBox
        Left = 396
        Top = 65
        Width = 141
        Height = 21
        DataField = 'attestator_id'
        DataSource = dsProtocol
        KeyField = 'id'
        ListField = 'name'
        ListSource = dsPredpritatie
        TabOrder = 7
        TabOnEnter = True
      end
      object RzBitBtn1: TRzBitBtn
        Left = 800
        Top = 9
        Width = 30
        Height = 24
        HotTrack = True
        TabOrder = 8
        OnClick = RzBitBtn1Click
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000630E0000630E00000001000000000000000000003300
          00006600000099000000CC000000FF0000000033000033330000663300009933
          0000CC330000FF33000000660000336600006666000099660000CC660000FF66
          000000990000339900006699000099990000CC990000FF99000000CC000033CC
          000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
          0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
          330000333300333333006633330099333300CC333300FF333300006633003366
          33006666330099663300CC663300FF6633000099330033993300669933009999
          3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
          330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
          66006600660099006600CC006600FF0066000033660033336600663366009933
          6600CC336600FF33660000666600336666006666660099666600CC666600FF66
          660000996600339966006699660099996600CC996600FF99660000CC660033CC
          660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
          6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
          990000339900333399006633990099339900CC339900FF339900006699003366
          99006666990099669900CC669900FF6699000099990033999900669999009999
          9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
          990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
          CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
          CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
          CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
          CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
          CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
          FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
          FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
          FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
          FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
          000000808000800000008000800080800000C0C0C00080808000191919004C4C
          4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
          6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86CE8E8
          E8E8E8E8E8E8E8E8B4E8E8E8E881E8E8E8E8E8E8E8E8E8E8ACE8E8E897B46CE8
          E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8E8E897C7B46C
          E8E8E8E8E8E8E8B4E8E8E8E881E3AC81E8E8E8E8E8E8E8ACE8E8E8E8E897C090
          E8E8E8E8E8E8B4E8E8E8E8E8E881E381E8E8E8E8E8E8ACE8E8E8E8E8E8E890B4
          6CE8E8E8E8B46CE8E8E8E8E8E8E881AC81E8E8E8E8AC81E8E8E8E8E8E8E8E890
          B46CE8E8B46CE8E8E8E8E8E8E8E8E881AC81E8E8AC81E8E8E8E8E8E8E8E8E8E8
          90B46CB46CE8E8E8E8E8E8E8E8E8E8E881AC81AC81E8E8E8E8E8E8E8E8E8E8E8
          E890B46CE8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8E8
          90B46C906CE8E8E8E8E8E8E8E8E8E8E881AC818181E8E8E8E8E8E8E8E8E8E890
          B46CE8E8906CE8E8E8E8E8E8E8E8E881AC81E8E88181E8E8E8E8E8E8E890B4B4
          6CE8E8E8E8906CE8E8E8E8E8E881ACAC81E8E8E8E88181E8E8E8E8E890C7B46C
          E8E8E8E8E8E8906CE8E8E8E881E3AC81E8E8E8E8E8E88181E8E8E8E87A907AE8
          E8E8E8E8E8E8E8E890E8E8E8AC81ACE8E8E8E8E8E8E8E8E881E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object RzBitBtn2: TRzBitBtn
        Left = 886
        Top = 68
        Width = 30
        Height = 24
        Enabled = False
        HotTrack = True
        TabOrder = 9
        Visible = False
        OnClick = RzBitBtn2Click
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000630E0000630E00000001000000000000000000003300
          00006600000099000000CC000000FF0000000033000033330000663300009933
          0000CC330000FF33000000660000336600006666000099660000CC660000FF66
          000000990000339900006699000099990000CC990000FF99000000CC000033CC
          000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
          0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
          330000333300333333006633330099333300CC333300FF333300006633003366
          33006666330099663300CC663300FF6633000099330033993300669933009999
          3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
          330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
          66006600660099006600CC006600FF0066000033660033336600663366009933
          6600CC336600FF33660000666600336666006666660099666600CC666600FF66
          660000996600339966006699660099996600CC996600FF99660000CC660033CC
          660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
          6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
          990000339900333399006633990099339900CC339900FF339900006699003366
          99006666990099669900CC669900FF6699000099990033999900669999009999
          9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
          990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
          CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
          CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
          CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
          CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
          CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
          FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
          FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
          FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
          FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
          000000808000800000008000800080800000C0C0C00080808000191919004C4C
          4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
          6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86CE8E8
          E8E8E8E8E8E8E8E8B4E8E8E8E881E8E8E8E8E8E8E8E8E8E8ACE8E8E897B46CE8
          E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8E8E897C7B46C
          E8E8E8E8E8E8E8B4E8E8E8E881E3AC81E8E8E8E8E8E8E8ACE8E8E8E8E897C090
          E8E8E8E8E8E8B4E8E8E8E8E8E881E381E8E8E8E8E8E8ACE8E8E8E8E8E8E890B4
          6CE8E8E8E8B46CE8E8E8E8E8E8E881AC81E8E8E8E8AC81E8E8E8E8E8E8E8E890
          B46CE8E8B46CE8E8E8E8E8E8E8E8E881AC81E8E8AC81E8E8E8E8E8E8E8E8E8E8
          90B46CB46CE8E8E8E8E8E8E8E8E8E8E881AC81AC81E8E8E8E8E8E8E8E8E8E8E8
          E890B46CE8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8E8
          90B46C906CE8E8E8E8E8E8E8E8E8E8E881AC818181E8E8E8E8E8E8E8E8E8E890
          B46CE8E8906CE8E8E8E8E8E8E8E8E881AC81E8E88181E8E8E8E8E8E8E890B4B4
          6CE8E8E8E8906CE8E8E8E8E8E881ACAC81E8E8E8E88181E8E8E8E8E890C7B46C
          E8E8E8E8E8E8906CE8E8E8E881E3AC81E8E8E8E8E8E88181E8E8E8E87A907AE8
          E8E8E8E8E8E8E8E890E8E8E8AC81ACE8E8E8E8E8E8E8E8E881E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object RzDBEdit2: TRzDBEdit
        Left = 94
        Top = 11
        Width = 121
        Height = 21
        DataSource = dsProtocol
        DataField = 'num'
        TabOrder = 10
      end
      object RzDBEdit3: TRzDBEdit
        Left = 564
        Top = 38
        Width = 230
        Height = 21
        DataSource = dsProtocol
        DataField = 'prof_comment'
        TabOrder = 11
      end
    end
    object RzPanel4: TRzPanel
      Left = 0
      Top = -133
      Width = 975
      Height = 29
      Align = alTop
      BorderSides = [sdTop, sdBottom]
      TabOrder = 2
      OnClick = RzPanel4Click
      object RzLabel3: TRzLabel
        Left = 16
        Top = 8
        Width = 126
        Height = 13
        Caption = #1053#1055#1040' '#1087#1086' '#1054#1058' '#1080' '#1056#1077#1079#1091#1083#1100#1090#1072#1090#1099
        OnClick = RzPanel4Click
      end
    end
    object RzPanel3: TRzPanel
      Left = 0
      Top = -104
      Width = 975
      Height = 430
      Align = alTop
      BorderInner = fsLowered
      BorderSides = []
      TabOrder = 3
      object RzDBGrid1: TRzDBGrid
        Left = 0
        Top = 0
        Width = 975
        Height = 393
        Align = alClient
        DataSource = dsProtocolnsd
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = RzDBGrid1KeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'protocol_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'num'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Razdel'
            Title.Caption = #1056#1072#1079#1076#1077#1083
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sort'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'nsd_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Nsd'
            Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'punkt_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Punkt'
            Title.Caption = #1055#1091#1085#1082#1090
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tool_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Tool'
            Title.Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1080' '#1087#1088#1080#1089#1087#1086#1089#1086#1073#1083#1077#1085#1080#1103
            Width = 175
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'text'
            Title.Caption = #1044#1088#1091#1075#1086#1077
            Width = 234
            Visible = True
          end>
      end
      object RzPanel8: TRzPanel
        Left = 0
        Top = 393
        Width = 975
        Height = 37
        Align = alBottom
        BorderOuter = fsNone
        TabOrder = 1
        object RzLabel11: TRzLabel
          Left = 272
          Top = 7
          Width = 249
          Height = 26
          AutoSize = False
          Caption = 
            #1055#1086#1076#1089#1082#1072#1079#1082#1072': '#1074#1099' '#1076#1086#1083#1078#1085#1099' '#1074#1099#1073#1088#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1080#1083#1080' '#13#1074#1074#1077#1089#1090#1080' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1086#1073#1086#1088#1091 +
            #1076#1086#1074#1072#1085#1080#1103' '#1080#1083#1080' '#1087#1088#1080#1073#1086#1088#1072'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object RzDBNavigator1: TRzDBNavigator
          Left = 16
          Top = 8
          Width = 240
          Height = 25
          DataSource = dsProtocolnsd
          TabOrder = 0
        end
        object RzButton2: TRzButton
          Left = 516
          Top = 6
          Width = 107
          Height = 28
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1053#1055#1040
          HotTrack = True
          TabOrder = 1
          OnClick = RzButton2Click
        end
        object RzButton4: TRzButton
          Left = 629
          Top = 6
          Width = 143
          Height = 28
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
          HotTrack = True
          TabOrder = 2
          OnClick = RzButton4Click
        end
      end
    end
    object RzPanel12: TRzPanel
      Left = 0
      Top = 359
      Width = 975
      Height = 358
      Align = alTop
      BorderOuter = fsNone
      BorderSides = [sdTop, sdBottom]
      TabOrder = 4
      object RzLabel15: TRzLabel
        Left = 23
        Top = 14
        Width = 96
        Height = 13
        Caption = '7. '#1054#1094#1077#1085#1082#1091' '#1087#1088#1086#1074#1077#1083#1080
      end
      object RzLabel16: TRzLabel
        Left = 308
        Top = 13
        Width = 199
        Height = 28
        AutoSize = False
        Caption = '8. '#1055#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1100' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080', '#1074' '#1082#1086'-'#13#1090#1086#1088#1086#1081' '#1087#1088#1086#1074#1086#1076#1080#1083#1072#1089#1090#1100' '#1087#1088#1086#1074#1077#1088#1082#1072
        Visible = False
      end
      object RzLabel18: TRzLabel
        Left = 23
        Top = 224
        Width = 179
        Height = 13
        Caption = '- '#1055#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077#1085#1085#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      end
      object RzLabel19: TRzLabel
        Left = 307
        Top = 224
        Width = 174
        Height = 13
        Caption = #1090#1088#1077#1073#1086#1074#1072#1085#1080#1103#1084' '#1090#1088#1072#1074#1084#1086#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1080
      end
      object RzLabel20: TRzLabel
        Left = 23
        Top = 243
        Width = 169
        Height = 13
        Caption = '- '#1055#1088#1080#1089#1087#1086#1089#1086#1073#1083#1077#1085#1080#1103' '#1080' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1099
      end
      object RzLabel21: TRzLabel
        Left = 307
        Top = 243
        Width = 174
        Height = 13
        Caption = #1090#1088#1077#1073#1086#1074#1072#1085#1080#1103#1084' '#1090#1088#1072#1074#1084#1086#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1080
      end
      object RzLabel22: TRzLabel
        Left = 23
        Top = 262
        Width = 247
        Height = 13
        Caption = '- '#1057#1088#1077#1076#1089#1090#1074#1072' '#1086#1073#1091#1095#1077#1085#1080#1103' '#1080' '#1080#1085#1089#1090#1088#1091#1082#1090#1072#1078#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1099
      end
      object RzLabel23: TRzLabel
        Left = 379
        Top = 262
        Width = 188
        Height = 13
        Caption = #1089' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103#1084#1080' '#1090#1088#1072#1074#1084#1086#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1080
      end
      object RzLabel24: TRzLabel
        Left = 23
        Top = 281
        Width = 573
        Height = 13
        Caption = 
          '- '#1055#1077#1088#1077#1095#1077#1085#1100' '#1085#1086#1088#1084#1072#1090#1080#1074#1085#1099#1093' '#1087#1088#1072#1074#1086#1074#1099#1093' '#1072#1082#1090#1086#1074', '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084#1099#1093' '#1076#1083#1103' '#1086#1094#1077#1085#1082#1080' '#1086 +
          #1088#1075#1072#1085#1080#1079#1072#1094#1080#1080' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1084#1077#1089#1090#1072' ('#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080')'
      end
      object RzLabel25: TRzLabel
        Left = 128
        Top = 300
        Width = 174
        Height = 13
        Caption = #1090#1088#1077#1073#1086#1074#1072#1085#1080#1103#1084' '#1090#1088#1072#1074#1084#1086#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1080
      end
      object RzLabel26: TRzLabel
        Left = 20
        Top = 323
        Width = 235
        Height = 13
        Caption = #1059#1089#1083#1086#1074#1080#1103' '#1085#1072' '#1088#1072#1073#1086#1095#1077#1084' '#1084#1077#1089#1090#1077' '#1086#1090#1085#1086#1089#1103#1090#1089#1103' '#1082' '#1082#1083#1072#1089#1089#1091
      end
      object RzLabel27: TRzLabel
        Left = 572
        Top = 13
        Width = 258
        Height = 29
        AutoSize = False
        Caption = '9. '#1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1077' '#1083#1080#1094#1086' '#1040#1090#1090#1077#1089#1090#1091'-'#13#1102#1097#1077#1081' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        Visible = False
      end
      object RzDBGrid3: TRzDBGrid
        Left = 23
        Top = 64
        Width = 200
        Height = 114
        DataSource = dsProverili
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Visible = False
        OnEnter = RzDBGrid3Enter
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'predpriatie_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'rabotnik_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'protocol_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Rabotnik'
            Title.Caption = #1055#1088#1086#1074#1077#1088#1103#1102#1097#1080#1081
            Width = 163
            Visible = True
          end>
      end
      object RzDBNavigator3: TRzDBNavigator
        Left = 23
        Top = 184
        Width = 200
        Height = 25
        DataSource = dsProverili
        TabOrder = 1
        Visible = False
      end
      object RzDBGrid4: TRzDBGrid
        Left = 308
        Top = 47
        Width = 200
        Height = 131
        DataSource = dspredstaviteli
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Visible = False
        OnEnter = RzDBGrid4Enter
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'protocol_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'rabotnik_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'predpriatie_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Rabotnik'
            Title.Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1100
            Width = 163
            Visible = True
          end>
      end
      object RzDBNavigator4: TRzDBNavigator
        Left = 307
        Top = 184
        Width = 200
        Height = 25
        DataSource = dspredstaviteli
        TabOrder = 3
        Visible = False
      end
      object RzDBCheckBox1: TRzDBCheckBox
        Left = 208
        Top = 224
        Width = 93
        Height = 17
        DataField = 'sootv1'
        DataSource = dsProtocol
        ValueChecked = '1'
        ValueUnchecked = '0'
        Caption = #1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1077#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object RzDBCheckBox2: TRzDBCheckBox
        Left = 198
        Top = 243
        Width = 103
        Height = 17
        DataField = 'sootv2'
        DataSource = dsProtocol
        ValueChecked = '1'
        ValueUnchecked = '0'
        Caption = #1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object RzDBCheckBox3: TRzDBCheckBox
        Left = 270
        Top = 262
        Width = 103
        Height = 17
        DataField = 'sootv3'
        DataSource = dsProtocol
        ValueChecked = '1'
        ValueUnchecked = '0'
        Caption = #1074' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object RzDBCheckBox4: TRzDBCheckBox
        Left = 23
        Top = 300
        Width = 99
        Height = 17
        DataField = 'sootv4'
        DataSource = dsProtocol
        ValueChecked = '1'
        ValueUnchecked = '0'
        Caption = #1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1077#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object RzDBLookupComboBox6: TRzDBLookupComboBox
        Left = 261
        Top = 319
        Width = 100
        Height = 21
        DataField = 'uslovia_class'
        DataSource = dsProtocol
        KeyField = 'id'
        ListField = 'name'
        ListSource = dsUsloviaclass
        TabOrder = 8
      end
      object RzDBGrid5: TRzDBGrid
        Left = 572
        Top = 48
        Width = 200
        Height = 130
        DataSource = dsOtvetsvtennii
        TabOrder = 9
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Visible = False
        OnEnter = RzDBGrid3Enter
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'protocol_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'rabotnik_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'predpriatie_id'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Rabotnik'
            Title.Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1100
            Width = 163
            Visible = True
          end>
      end
      object RzDBNavigator5: TRzDBNavigator
        Left = 572
        Top = 184
        Width = 200
        Height = 25
        DataSource = dsOtvetsvtennii
        TabOrder = 10
        Visible = False
      end
      object RzDBLookupComboBox7: TRzDBLookupComboBox
        Left = 23
        Top = 37
        Width = 200
        Height = 21
        DataField = 'proveril_rabotnik_id'
        DataSource = dsProtocol
        KeyField = 'id'
        ListField = 'name'
        ListSource = dsRabotnik
        TabOrder = 11
      end
    end
    object RzPanel14: TRzPanel
      Left = 0
      Top = 326
      Width = 975
      Height = 33
      Align = alTop
      BorderSides = [sdTop, sdBottom]
      TabOrder = 5
      OnClick = RzPanel14Click
      object RzLabel17: TRzLabel
        Left = 16
        Top = 10
        Width = 41
        Height = 13
        Caption = #1042#1099#1074#1086#1076#1099
        OnClick = RzPanel14Click
      end
    end
  end
  object dsProtocol: TDataSource
    DataSet = protocol
    OnDataChange = dsProtocolDataChange
    Left = 136
    Top = 40
  end
  object protocol: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    OnNewRecord = protocolNewRecord
    TableName = 'tb_protocol'
    Left = 104
    Top = 40
    object protocolid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object protocolodate: TDateTimeField
      FieldName = 'odate'
    end
    object protocolnum: TStringField
      FieldName = 'num'
      Size = 50
    end
    object protocolpredpriatie_id: TIntegerField
      FieldName = 'predpriatie_id'
    end
    object protocoluchastok_id: TIntegerField
      FieldName = 'uchastok_id'
    end
    object protocolprof_id: TIntegerField
      FieldName = 'prof_id'
    end
    object protocolpost_id: TIntegerField
      FieldName = 'post_id'
    end
    object protocolattestator_id: TIntegerField
      FieldName = 'attestator_id'
    end
    object protocolsootv1: TBooleanField
      FieldName = 'sootv1'
    end
    object protocolsootv2: TBooleanField
      FieldName = 'sootv2'
    end
    object protocolsootv3: TBooleanField
      FieldName = 'sootv3'
    end
    object protocolsootv4: TBooleanField
      FieldName = 'sootv4'
    end
    object protocoluslovia_class: TIntegerField
      FieldName = 'uslovia_class'
    end
    object protocolcode: TStringField
      FieldName = 'code'
      Size = 50
    end
    object protocolprof_comment: TStringField
      FieldName = 'prof_comment'
      Size = 50
    end
    object protocolproveril_rabotnik_id: TIntegerField
      FieldName = 'proveril_rabotnik_id'
    end
  end
  object dsPredpritatie: TDataSource
    DataSet = predpriatie
    Left = 352
    Top = 24
  end
  object predpriatie: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_predpriatie order by name asc')
    Left = 320
    Top = 24
  end
  object dsUchastok: TDataSource
    DataSet = uchastok
    Left = 352
    Top = 72
  end
  object uchastok: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from tb_predpriatie_podrazdelenie order by name')
    Left = 320
    Top = 72
  end
  object profession: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_profession order by name asc')
    Left = 568
    Top = 24
    object professionid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object professionname: TStringField
      FieldName = 'name'
      Size = 255
    end
    object professioncode: TStringField
      FieldName = 'code'
      Size = 50
    end
  end
  object dsProfession: TDataSource
    DataSet = profession
    Left = 600
    Top = 24
  end
  object dolgnost: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_post order by name asc')
    Left = 568
    Top = 56
  end
  object dsDolgnost: TDataSource
    DataSet = dolgnost
    Left = 600
    Top = 56
  end
  object dsProtocolnsd: TDataSource
    DataSet = protocolnsd
    OnDataChange = dsProtocolnsdDataChange
    Left = 104
    Top = 168
  end
  object protocolnsd: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    OnNewRecord = protocolnsdNewRecord
    Parameters = <>
    SQL.Strings = (
      'select * from tb_protocol_nsd order by num asc,sort asc')
    Left = 72
    Top = 168
    object protocolnsdid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object protocolnsdprotocol_id: TIntegerField
      FieldName = 'protocol_id'
    end
    object protocolnsdnum: TIntegerField
      FieldName = 'num'
    end
    object protocolnsdsort: TIntegerField
      FieldName = 'sort'
    end
    object protocolnsdnsd_id: TIntegerField
      FieldName = 'nsd_id'
    end
    object protocolnsdpunkt_id: TIntegerField
      FieldName = 'punkt_id'
    end
    object protocolnsdtool_id: TIntegerField
      FieldName = 'tool_id'
    end
    object protocolnsdtext: TStringField
      FieldName = 'text'
      Size = 255
    end
    object protocolnsdNsd: TStringField
      FieldKind = fkLookup
      FieldName = 'Nsd'
      LookupDataSet = nsd
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'nsd_id'
      Size = 128
      Lookup = True
    end
    object protocolnsdPunkt: TStringField
      FieldKind = fkLookup
      FieldName = 'Punkt'
      LookupDataSet = punkt
      LookupKeyFields = 'id'
      LookupResultField = 'num'
      KeyFields = 'punkt_id'
      Lookup = True
    end
    object protocolnsdTool: TStringField
      FieldKind = fkLookup
      FieldName = 'Tool'
      LookupDataSet = tools
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'tool_id'
      Size = 128
      Lookup = True
    end
    object protocolnsdRazdel: TStringField
      FieldKind = fkLookup
      FieldName = 'Razdel'
      LookupDataSet = number
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'num'
      Size = 255
      Lookup = True
    end
  end
  object nsd: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id,name from tb_nsd order by name asc')
    Left = 168
    Top = 168
  end
  object dsNsd: TDataSource
    DataSet = nsd
    Left = 200
    Top = 168
  end
  object dsPunkt: TDataSource
    DataSet = punkt
    Left = 296
    Top = 168
  end
  object punkt: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id,nsd_id,num from tb_nsd_punkt order by num')
    Left = 264
    Top = 168
  end
  object dsTools: TDataSource
    DataSet = tools
    Left = 448
    Top = 168
  end
  object tools: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_tool')
    Left = 416
    Top = 168
  end
  object number: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tb_razdel order by id asc')
    Left = 488
    Top = 168
  end
  object dsnumber: TDataSource
    Left = 520
    Top = 168
  end
  object proverili: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    OnNewRecord = proveriliNewRecord
    IndexFieldNames = 'predpriatie_id;protocol_id'
    MasterFields = 'attestator_id;id'
    MasterSource = dsProtocol
    TableDirect = True
    TableName = 'proverili_not_otvetstvennii'
    Left = 48
    Top = 480
    object proveriliid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object proverilipredpriatie_id: TIntegerField
      FieldName = 'predpriatie_id'
    end
    object proverilirabotnik_id: TIntegerField
      FieldName = 'rabotnik_id'
    end
    object proveriliprotocol_id: TIntegerField
      FieldName = 'protocol_id'
    end
    object proveriliRabotnik: TStringField
      FieldKind = fkLookup
      FieldName = 'Rabotnik'
      LookupDataSet = rabotnik
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'rabotnik_id'
      Size = 50
      Lookup = True
    end
    object proveriliotvetstvennii: TSmallintField
      FieldName = 'otvetstvennii'
    end
  end
  object dsProverili: TDataSource
    DataSet = proverili
    Left = 80
    Top = 480
  end
  object dsRabotnik: TDataSource
    DataSet = rabotnik
    Left = 176
    Top = 480
  end
  object rabotnik: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from tb_predpriatie_rabotnik order by name asc')
    Left = 144
    Top = 480
  end
  object predstaviteli: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    OnNewRecord = predstaviteliNewRecord
    IndexFieldNames = 'protocol_id;predpriatie_id'
    MasterFields = 'id;predpriatie_id'
    MasterSource = dsProtocol
    TableName = 'tb_protocol_predstaviteli'
    Left = 456
    Top = 480
    object predstaviteliid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object predstaviteliprotocol_id: TIntegerField
      FieldName = 'protocol_id'
    end
    object predstavitelirabotnik_id: TIntegerField
      FieldName = 'rabotnik_id'
    end
    object predstavitelipredpriatie_id: TIntegerField
      FieldName = 'predpriatie_id'
    end
    object predstaviteliRabotnik: TStringField
      FieldKind = fkLookup
      FieldName = 'Rabotnik'
      LookupDataSet = rabotnik
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'rabotnik_id'
      Size = 50
      Lookup = True
    end
  end
  object dspredstaviteli: TDataSource
    DataSet = predstaviteli
    Left = 488
    Top = 480
  end
  object ChildActionList: TActionList
    Left = 16
    Top = 8
    object Refresh: TAction
      Caption = 'Refresh'
      OnExecute = RefreshExecute
    end
    object AddNpaClose: TAction
      Caption = 'AddNpaClose'
      OnExecute = AddNpaCloseExecute
    end
    object AddResNpaClose: TAction
      Caption = 'AddResNpaClose'
    end
  end
  object dsUsloviaclass: TDataSource
    DataSet = usloviaclass
    Left = 408
    Top = 696
  end
  object usloviaclass: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    TableName = 'tb_uslovie_class'
    Left = 376
    Top = 696
  end
  object dsOtvetsvtennii: TDataSource
    DataSet = Otvetstvenii
    Left = 624
    Top = 464
  end
  object Otvetstvenii: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    OnNewRecord = OtvetstveniiNewRecord
    IndexFieldNames = 'predpriatie_id;protocol_id'
    MasterFields = 'attestator_id;id'
    MasterSource = dsProtocol
    TableName = 'proverili_otvetstvennii'
    Left = 592
    Top = 464
    object AutoIncField1: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'predpriatie_id'
    end
    object IntegerField2: TIntegerField
      FieldName = 'rabotnik_id'
    end
    object IntegerField3: TIntegerField
      FieldName = 'protocol_id'
    end
    object StringField1: TStringField
      FieldKind = fkLookup
      FieldName = 'Rabotnik'
      LookupDataSet = rabotnik
      LookupKeyFields = 'id'
      LookupResultField = 'name'
      KeyFields = 'rabotnik_id'
      Size = 50
      Lookup = True
    end
    object Otvetstveniiotvetstvennii: TSmallintField
      FieldName = 'otvetstvennii'
    end
  end
  object ADOCommand1: TADOCommand
    Parameters = <>
    Left = 792
    Top = 16
  end
  object addOborCommand: TADOCommand
    CommandText = 
      'insert into tb_protocol_nsd (protocol_id,num,tool_id) values(:pi' +
      'd,:num,:tool)'
    Connection = DataModule1.KMCConnection
    Prepared = True
    Parameters = <
      item
        Name = 'pid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'num'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'tool'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 720
    Top = 528
  end
end

object FormPabAdd: TFormPabAdd
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077'/'#1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1055#1040#1041
  ClientHeight = 791
  ClientWidth = 1009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseWheel = FormMouseWheel
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 1009
    Height = 756
    VertScrollBar.Position = 461
    Align = alClient
    TabOrder = 0
    object RzPanel1: TRzPanel
      Left = 0
      Top = -461
      Width = 989
      Height = 1300
      Align = alTop
      BorderOuter = fsNone
      TabOrder = 0
      object RzPanel16: TRzPanel
        Left = 13
        Top = 343
        Width = 660
        Height = 416
        TabOrder = 4
        object CatList: TRzLabel
          Left = 110
          Top = 386
          Width = 41
          Height = 16
          Caption = #1040', '#1042', '#1043
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RzLabel16: TRzLabel
          Left = 10
          Top = 390
          Width = 54
          Height = 13
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
        end
        object RzLabel15: TRzLabel
          Left = 10
          Top = 358
          Width = 73
          Height = 26
          Caption = #1055#1088#1077#1076#1083#1086#1078#1077#1085#1080#1103' '#1088#1072#1073#1086#1090#1085#1080#1082#1072
          WordWrap = True
        end
        object RzLabel14: TRzLabel
          Left = 11
          Top = 79
          Width = 65
          Height = 26
          Caption = #1042#1086#1079#1084#1086#1078#1085#1099#1077' '#1087#1086#1089#1083#1077#1076#1089#1090#1074#1080#1103
          WordWrap = True
        end
        object RzLabel13: TRzLabel
          Left = 10
          Top = 41
          Width = 52
          Height = 26
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1086#1087#1072#1089#1085#1086#1089#1090#1080
          WordWrap = True
        end
        object RzLabel12: TRzLabel
          Left = 12
          Top = 14
          Width = 52
          Height = 13
          Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090
        end
        object RzLabel9: TRzLabel
          Left = 12
          Top = 201
          Width = 54
          Height = 26
          Caption = #1055#1088#1080#1085#1103#1090#1099#1077' '#1076#1077#1081#1089#1090#1074#1080#1103
          WordWrap = True
        end
        object RzDBEdit5: TRzDBEdit
          Left = 110
          Top = 43
          Width = 538
          Height = 21
          DataSource = dsPab
          DataField = 't_danger_description'
          TabOrder = 0
        end
        object RzDBEdit7: TRzDBEdit
          Left = 110
          Top = 359
          Width = 538
          Height = 21
          DataSource = dsPab
          DataField = 't_worker_idea'
          TabOrder = 1
        end
        object RzDBLookupComboBox5: TRzDBLookupComboBox
          Left = 111
          Top = 12
          Width = 537
          Height = 21
          DataField = 'w_work_kind_id'
          DataSource = dsPab
          KeyField = 'id'
          ListField = 'name'
          ListSource = dsWorkKinds
          TabOrder = 2
        end
        object RzPanel14: TRzPanel
          Left = 111
          Top = 191
          Width = 537
          Height = 154
          BorderOuter = fsFlatRounded
          TabOrder = 3
          object RzPanel12: TRzPanel
            Tag = 3
            Left = 241
            Top = 5
            Width = 285
            Height = 131
            BorderOuter = fsNone
            TabOrder = 0
            object wdCb9: TRzCheckBox
              Tag = 4
              AlignWithMargins = True
              Left = 3
              Top = 89
              Width = 282
              Height = 15
              Margins.Top = 0
              Margins.Right = 0
              Align = alTop
              Caption = #1055#1088#1080#1075#1083#1072#1096#1077#1085#1080#1077' '#1085#1072' '#1073#1077#1089#1077#1076#1091' '#1074' '#1082#1086#1084#1080#1089#1089#1080#1102' '#1094#1077#1093#1072' '#1087#1086' '#1054#1058
              HotTrack = True
              State = cbUnchecked
              TabOrder = 0
              WordWrap = True
              ExplicitWidth = 261
            end
            object wdCb8: TRzCheckBox
              Tag = 7
              AlignWithMargins = True
              Left = 3
              Top = 58
              Width = 282
              Height = 28
              Margins.Right = 0
              Align = alTop
              Caption = #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1074#1099#1076#1072#1095#1077' '#1088#1072#1073#1086#1090#1085#1080#1082#1091' '#1080#1089#1087#1088#1072#1074#1085#1086#1075#1086' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1072' / '#1076#1086#1087'. '#1057#1048#1047
              HotTrack = True
              State = cbUnchecked
              TabOrder = 1
              WordWrap = True
              ExplicitWidth = 235
            end
            object wdCb7: TRzCheckBox
              Tag = 6
              AlignWithMargins = True
              Left = 3
              Top = 24
              Width = 282
              Height = 28
              Margins.Right = 0
              Align = alTop
              Caption = #1048#1075#1085#1086#1088#1080#1088#1086#1074#1072#1085#1080#1077' '#1085#1072#1088#1091#1096#1080#1090#1077#1083#1077#1084' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1081' '#1054#1058' '#1080' '#1087#1088#1086#1076#1086#1083#1078#1077#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
              HotTrack = True
              State = cbUnchecked
              TabOrder = 2
              WordWrap = True
              ExplicitWidth = 260
            end
            object wdCb6: TRzCheckBox
              Tag = 5
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 282
              Height = 15
              Margins.Right = 0
              Align = alTop
              Caption = #1055#1088#1086#1076#1086#1083#1078#1077#1085#1080#1077' '#1088#1072#1073#1086#1090' '#1087#1086#1089#1083#1077' '#1091#1089#1090#1088#1072#1085#1077#1085#1080#1103' '#1085#1072#1088#1091#1096#1077#1085#1080#1103
              HotTrack = True
              State = cbUnchecked
              TabOrder = 3
              WordWrap = True
              ExplicitWidth = 275
            end
          end
          object RzPanel10: TRzPanel
            Tag = 3
            Left = 3
            Top = 5
            Width = 235
            Height = 139
            BorderOuter = fsNone
            TabOrder = 1
            object wdCb5: TRzCheckBox
              Tag = 3
              AlignWithMargins = True
              Left = 3
              Top = 123
              Width = 229
              Height = 15
              Align = alTop
              Caption = #1059#1089#1090#1088#1072#1085#1077#1085#1080#1077' '#1085#1072#1088#1091#1096#1077#1085#1080#1081' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1081' '#1054#1058
              HotTrack = True
              State = cbUnchecked
              TabOrder = 0
              WordWrap = True
              ExplicitWidth = 218
            end
            object wdCb3: TRzCheckBox
              Tag = 9
              AlignWithMargins = True
              Left = 3
              Top = 71
              Width = 229
              Height = 28
              Align = alTop
              Caption = #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1087#1077#1088#1077#1089#1084#1086#1090#1088#1077' '#1080#1085#1089#1090#1088#1091#1082#1094#1080#1080' '#1087#1086' '#1054#1058' '#1085#1072' '#1101#1090#1086#1084' '#1088#1072#1073#1086#1095#1077#1084' '#1084#1077#1089#1090#1077
              HotTrack = True
              State = cbUnchecked
              TabOrder = 1
              WordWrap = True
              ExplicitWidth = 228
            end
            object wdCb2: TRzCheckBox
              Tag = 2
              AlignWithMargins = True
              Left = 3
              Top = 24
              Width = 229
              Height = 41
              Align = alTop
              Caption = 
                #1055#1088#1086#1074#1077#1076#1077#1085#1072' '#1073#1077#1089#1077#1076#1072' '#1086' '#1074#1086#1079#1084#1086#1078#1085#1099#1093' '#1087#1086#1089#1083#1077#1076#1089#1090#1074#1080#1103#1093' '#1088#1072#1073#1086#1090#1099' '#1089' '#1085#1072#1088#1091#1096#1077#1085#1080#1077#1084' '#1090#1088 +
                #1077#1073#1086#1074#1072#1085#1080#1081' '#1054#1058
              HotTrack = True
              State = cbUnchecked
              TabOrder = 2
              WordWrap = True
              ExplicitWidth = 207
            end
            object wdCb1: TRzCheckBox
              Tag = 1
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 229
              Height = 15
              Align = alTop
              Caption = #1056#1072#1073#1086#1090#1072' '#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1072
              HotTrack = True
              State = cbUnchecked
              TabOrder = 3
              WordWrap = True
              ExplicitWidth = 123
            end
            object wdCb4: TRzCheckBox
              Tag = 8
              AlignWithMargins = True
              Left = 3
              Top = 102
              Width = 229
              Height = 15
              Margins.Top = 0
              Align = alTop
              Caption = #1056#1077#1096#1077#1085#1080#1077' '#1086' '#1087#1077#1088#1077#1089#1084#1086#1090#1088#1077' '#1090#1077#1093#1085#1086#1083#1086#1075#1080#1080' '#1088#1072#1073#1086#1090
              HotTrack = True
              State = cbUnchecked
              TabOrder = 4
              WordWrap = True
            end
          end
        end
        object RzPanel21: TRzPanel
          Left = 111
          Top = 70
          Width = 538
          Height = 99
          BorderOuter = fsFlatRounded
          TabOrder = 4
          object RzPanel6: TRzPanel
            Tag = 3
            Left = 5
            Top = 5
            Width = 163
            Height = 84
            BorderOuter = fsNone
            TabOrder = 0
            object peCb4: TRzCheckBox
              Tag = 4
              AlignWithMargins = True
              Left = 3
              Top = 66
              Width = 157
              Height = 15
              Align = alTop
              Caption = #1090#1088#1072#1074#1084#1072' '#1090#1091#1083#1086#1074#1080#1097#1072
              HotTrack = True
              State = cbUnchecked
              TabOrder = 0
              WordWrap = True
              ExplicitWidth = 109
            end
            object peCb3: TRzCheckBox
              Tag = 3
              AlignWithMargins = True
              Left = 3
              Top = 45
              Width = 157
              Height = 15
              Align = alTop
              Caption = #1090#1088#1072#1074#1084#1072' '#1075#1083#1072#1079
              HotTrack = True
              State = cbUnchecked
              TabOrder = 1
              WordWrap = True
              ExplicitWidth = 80
            end
            object peCb2: TRzCheckBox
              Tag = 2
              AlignWithMargins = True
              Left = 3
              Top = 24
              Width = 157
              Height = 15
              Align = alTop
              Caption = #1090#1088#1072#1074#1084#1072' '#1088#1091#1082' '#1080' '#1082#1080#1089#1090#1077#1081
              HotTrack = True
              State = cbUnchecked
              TabOrder = 2
              WordWrap = True
              ExplicitWidth = 123
            end
            object peCb1: TRzCheckBox
              Tag = 1
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 157
              Height = 15
              Align = alTop
              Caption = #1090#1088#1072#1074#1084#1072' '#1075#1086#1083#1086#1074#1099
              HotTrack = True
              State = cbUnchecked
              TabOrder = 3
              WordWrap = True
              ExplicitWidth = 95
            end
          end
          object RzPanel8: TRzPanel
            Tag = 3
            Left = 241
            Top = 5
            Width = 180
            Height = 84
            BorderOuter = fsNone
            TabOrder = 1
            object peCb8: TRzCheckBox
              Tag = 8
              AlignWithMargins = True
              Left = 3
              Top = 66
              Width = 174
              Height = 15
              Align = alTop
              Caption = #1087#1086#1088#1072#1078#1077#1085#1080#1077' '#1090#1086#1082#1086#1084
              HotTrack = True
              State = cbUnchecked
              TabOrder = 0
              WordWrap = True
              ExplicitWidth = 108
            end
            object peCb7: TRzCheckBox
              Tag = 7
              AlignWithMargins = True
              Left = 3
              Top = 45
              Width = 174
              Height = 15
              Align = alTop
              Caption = #1088#1072#1079#1074#1080#1090#1080#1077' '#1087#1088#1086#1092#1079#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103
              HotTrack = True
              State = cbUnchecked
              TabOrder = 1
              WordWrap = True
              ExplicitWidth = 160
            end
            object peCb6: TRzCheckBox
              Tag = 6
              AlignWithMargins = True
              Left = 3
              Top = 24
              Width = 174
              Height = 15
              Align = alTop
              Caption = #1086#1078#1086#1075#1086#1074#1072#1103' '#1090#1088#1072#1074#1084#1072
              HotTrack = True
              State = cbUnchecked
              TabOrder = 2
              WordWrap = True
              ExplicitWidth = 107
            end
            object peCb5: TRzCheckBox
              Tag = 5
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 174
              Height = 15
              Align = alTop
              Caption = #1090#1088#1072#1074#1084#1072' '#1085#1086#1075' '#1080' '#1089#1090#1091#1087#1085#1077#1081
              HotTrack = True
              State = cbUnchecked
              TabOrder = 3
              WordWrap = True
              ExplicitWidth = 128
            end
          end
        end
      end
      object RzPanel17: TRzPanel
        Left = 13
        Top = 232
        Width = 660
        Height = 105
        TabOrder = 3
        object RzDBRadioGroup1: TRzDBRadioGroup
          Left = 10
          Top = 3
          Width = 209
          Height = 94
          DataField = 'r_type'
          DataSource = dsPab
          Items.Strings = (
            #1041#1055' ('#1073#1077#1079#1086#1087#1072#1089#1085#1086#1077' '#1087#1086#1074#1077#1076#1077#1085#1080#1077')'
            #1041#1059' ('#1073#1077#1079#1086#1087#1072#1089#1085#1086#1077' '#1091#1089#1083#1086#1074#1080#1077')'
            #1054#1055'  ('#1086#1087#1072#1089#1085#1086#1077' '#1076#1077#1081#1089#1090#1074#1080#1077')'
            #1054#1059' ('#1086#1087#1072#1089#1085#1086#1077' '#1091#1089#1083#1086#1074#1080#1077')')
          Values.Strings = (
            '1'
            '4'
            '2'
            '3')
          Caption = #1058#1080#1087
          ItemHotTrack = True
          TabOrder = 0
        end
        object RzDBRadioGroup2: TRzDBRadioGroup
          Left = 225
          Top = 3
          Width = 216
          Height = 94
          DataField = 'r_fatal_effect'
          DataSource = dsPab
          Items.Strings = (
            #1042#1099#1089#1086#1082#1080#1081
            #1057#1088#1077#1076#1085#1080#1081
            #1053#1080#1079#1082#1080#1081)
          Values.Strings = (
            '1'
            '2'
            '3')
          Caption = #1055#1086#1090#1077#1085#1094#1080#1072#1083#1100#1085#1072#1103' '#1090#1103#1078#1077#1089#1090#1100' '#1087#1086#1089#1083#1077#1076#1089#1090#1074#1080#1081
          ItemHotTrack = True
          TabOrder = 1
        end
        object RzDBRadioGroup3: TRzDBRadioGroup
          Left = 447
          Top = 3
          Width = 208
          Height = 94
          DataField = 'r_audit_kind'
          DataSource = dsPab
          Items.Strings = (
            #1056#1072#1073#1086#1090#1085#1080#1082' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091
            #1056#1072#1073#1086#1090#1085#1080#1082' '#1087#1086#1076#1088#1103#1076#1085#1086#1081' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080)
          Values.Strings = (
            '1'
            '2')
          Caption = #1042#1080#1076' '#1072#1091#1076#1080#1090#1072
          ItemHotTrack = True
          TabOrder = 2
        end
      end
      object RzPanel18: TRzPanel
        Left = 13
        Top = 183
        Width = 660
        Height = 43
        TabOrder = 2
        object RzLabel7: TRzLabel
          Left = 10
          Top = 14
          Width = 75
          Height = 13
          Caption = #1060#1048#1054' '#1072#1091#1076#1080#1090#1086#1088#1072
        end
        object RzLabel8: TRzLabel
          Left = 401
          Top = 14
          Width = 57
          Height = 13
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        end
        object RzDBEdit2: TRzDBEdit
          Left = 110
          Top = 10
          Width = 256
          Height = 21
          DataSource = dsPab
          DataField = 'tester'
          TabOrder = 0
        end
        object RzDBEdit3: TRzDBEdit
          Left = 464
          Top = 10
          Width = 191
          Height = 21
          DataSource = dsPab
          DataField = 'tester_post'
          TabOrder = 1
        end
        object btnGetUser: TRzButton
          Left = 372
          Top = 10
          Width = 23
          Caption = '...'
          HotTrack = True
          TabOrder = 2
          OnClick = btnGetUserClick
        end
      end
      object RzPanel19: TRzPanel
        Left = 13
        Top = 79
        Width = 660
        Height = 98
        TabOrder = 1
        object RzLabel5: TRzLabel
          Left = 10
          Top = 13
          Width = 95
          Height = 13
          Caption = #1052#1077#1089#1090#1086' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
        end
        object RzLabel6: TRzLabel
          Left = 404
          Top = 13
          Width = 198
          Height = 13
          Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1085#1072#1073#1083#1102#1076#1072#1077#1084#1099#1093' '#1088#1072#1073#1086#1090#1085#1080#1082#1086#1074
        end
        object RzLabel10: TRzLabel
          Left = 12
          Top = 38
          Width = 65
          Height = 13
          Caption = #1042#1086#1079#1088#1072#1089#1090', '#1083#1077#1090
        end
        object RzLabel11: TRzLabel
          Left = 215
          Top = 38
          Width = 93
          Height = 13
          Caption = #1057#1090#1072#1078' '#1088#1072#1073#1086#1090#1099', '#1083#1077#1090
        end
        object RzLabel17: TRzLabel
          Left = 404
          Top = 38
          Width = 55
          Height = 13
          Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103
        end
        object RzLabel18: TRzLabel
          Left = 10
          Top = 66
          Width = 86
          Height = 13
          Caption = #1060#1048#1054' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
        end
        object RzDBSpinEdit1: TRzDBSpinEdit
          Left = 608
          Top = 8
          Width = 47
          Height = 21
          DataSource = dsPab
          DataField = 'count'
          Alignment = taRightJustify
          TabOrder = 0
          Max = 100.000000000000000000
          Value = 1.000000000000000000
        end
        object CehCombo: TRzDBLookupComboBox
          Left = 111
          Top = 8
          Width = 98
          Height = 21
          DataField = 'l_ceh'
          DataSource = dsPab
          KeyField = 'id'
          ListField = 'name'
          ListSource = dsCeh
          TabOrder = 1
        end
        object RzDBLookupComboBox2: TRzDBLookupComboBox
          Left = 215
          Top = 8
          Width = 174
          Height = 21
          DataField = 'l_uchastok'
          DataSource = dsPab
          KeyField = 'id'
          ListField = 'name'
          ListSource = dsUch
          TabOrder = 2
        end
        object RzDBLookupComboBox1: TRzDBLookupComboBox
          Left = 111
          Top = 35
          Width = 98
          Height = 21
          DataField = 'w_age_cat_id'
          DataSource = dsPab
          KeyField = 'id'
          ListField = 'name'
          ListSource = dsAge
          TabOrder = 3
        end
        object RzDBLookupComboBox3: TRzDBLookupComboBox
          Left = 314
          Top = 35
          Width = 75
          Height = 21
          DataField = 'w_work_time_id'
          DataSource = dsPab
          KeyField = 'id'
          ListField = 'name'
          ListSource = dsWTime
          TabOrder = 4
        end
        object RzDBLookupComboBox4: TRzDBLookupComboBox
          Left = 472
          Top = 35
          Width = 180
          Height = 21
          DataField = 'w_proffession'
          DataSource = dsPab
          KeyField = 'id'
          ListField = 'name'
          ListSource = dsProf
          TabOrder = 5
        end
        object RzDBEdit4: TRzDBEdit
          Left = 110
          Top = 62
          Width = 256
          Height = 21
          DataSource = dsPab
          DataField = 'w_name'
          TabOrder = 6
        end
        object RzButton1: TRzButton
          Left = 372
          Top = 62
          Width = 23
          Caption = '...'
          HotTrack = True
          TabOrder = 7
          OnClick = RzButton1Click
        end
      end
      object RzPanel20: TRzPanel
        Left = 13
        Top = 8
        Width = 660
        Height = 65
        TabOrder = 0
        object RzLabel1: TRzLabel
          Left = 12
          Top = 13
          Width = 98
          Height = 13
          Caption = #1053#1086#1084#1077#1088' '#1085#1072#1073#1083#1102#1076#1077#1085#1080#1103
        end
        object RzLabel2: TRzLabel
          Left = 174
          Top = 13
          Width = 26
          Height = 13
          Caption = #1044#1072#1090#1072
        end
        object RzLabel3: TRzLabel
          Left = 11
          Top = 40
          Width = 109
          Height = 13
          Caption = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072' '#1072#1091#1076#1080#1090#1072
        end
        object RzLabel4: TRzLabel
          Left = 174
          Top = 40
          Width = 127
          Height = 13
          Caption = #1042#1088#1077#1084#1103' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1072#1091#1076#1080#1090#1072
        end
        object RzDBEdit1: TRzDBEdit
          Left = 126
          Top = 10
          Width = 42
          Height = 21
          DataSource = dsPab
          DataField = 'num'
          ReadOnly = True
          Alignment = taRightJustify
          Color = clInfoBk
          TabOrder = 0
        end
        object RzDBDateTimePicker1: TRzDBDateTimePicker
          Left = 206
          Top = 10
          Width = 143
          Height = 21
          Date = 40480.000000000000000000
          Time = 40480.000000000000000000
          TabOrder = 1
          DataField = 'date'
          DataSource = dsPab
        end
        object TimeStart: TRzMaskEdit
          Left = 126
          Top = 37
          Width = 42
          Height = 21
          EditMask = '00:00'
          MaxLength = 5
          TabOrder = 2
          Text = '00:00'
        end
        object TimeEnd: TRzMaskEdit
          Left = 307
          Top = 37
          Width = 42
          Height = 21
          EditMask = '00:00'
          MaxLength = 5
          TabOrder = 3
          Text = '00:00'
        end
      end
      object category3: TRzPanel
        Tag = 3
        Left = 555
        Top = 765
        Width = 265
        Height = 246
        TabOrder = 7
        object RzPanel9: TRzPanel
          Left = 2
          Top = 2
          Width = 261
          Height = 31
          Align = alTop
          BorderOuter = fsNone
          Caption = #1053#1072#1073#1083#1102#1076#1077#1085#1080#1077' ('#1082#1072#1090#1077#1075#1086#1088#1080#1103' '#1042')'
          Color = clSilver
          TabOrder = 0
        end
        object RzCheckBox17: TRzCheckBox
          Tag = 27
          AlignWithMargins = True
          Left = 12
          Top = 183
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1076#1088#1091#1075#1086#1077' '#1085#1077#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077' '#1057#1048#1047
          HotTrack = True
          State = cbUnchecked
          TabOrder = 1
          WordWrap = True
          ExplicitWidth = 163
        end
        object RzCheckBox18: TRzCheckBox
          Tag = 24
          AlignWithMargins = True
          Left = 12
          Top = 120
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = ' '#1079#1072#1097#1080#1090#1077' '#1088#1091#1082' '#1080' '#1082#1080#1089#1090#1077#1081
          HotTrack = True
          State = cbUnchecked
          TabOrder = 2
          WordWrap = True
          ExplicitWidth = 128
        end
        object RzCheckBox19: TRzCheckBox
          Tag = 23
          AlignWithMargins = True
          Left = 12
          Top = 99
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1079#1072#1097#1080#1090#1072' '#1090#1091#1083#1086#1074#1080#1097#1077
          HotTrack = True
          State = cbUnchecked
          TabOrder = 3
          WordWrap = True
          ExplicitWidth = 111
        end
        object RzCheckBox20: TRzCheckBox
          Tag = 21
          AlignWithMargins = True
          Left = 12
          Top = 78
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1079#1072#1097#1080#1090#1072' '#1086#1088#1075#1072#1085#1086#1074' '#1089#1083#1091#1093#1072
          HotTrack = True
          State = cbUnchecked
          TabOrder = 4
          WordWrap = True
          ExplicitWidth = 133
        end
        object RzCheckBox21: TRzCheckBox
          Tag = 20
          AlignWithMargins = True
          Left = 12
          Top = 57
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1079#1072#1097#1080#1090#1072' '#1075#1086#1083#1086#1074#1099
          HotTrack = True
          State = cbUnchecked
          TabOrder = 5
          WordWrap = True
          ExplicitWidth = 97
        end
        object RzCheckBox22: TRzCheckBox
          Tag = 18
          AlignWithMargins = True
          Left = 12
          Top = 36
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1079#1072#1097#1080#1090#1072' '#1075#1083#1072#1079
          HotTrack = True
          State = cbUnchecked
          TabOrder = 6
          WordWrap = True
          ExplicitWidth = 82
        end
        object RzCheckBox23: TRzCheckBox
          Tag = 26
          AlignWithMargins = True
          Left = 12
          Top = 162
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1079#1072#1097#1080#1090#1072' '#1086#1088#1075#1072#1085#1086#1074' '#1076#1099#1093#1072#1085#1080#1103
          HotTrack = True
          State = cbUnchecked
          TabOrder = 7
          WordWrap = True
          ExplicitWidth = 149
        end
        object RzCheckBox24: TRzCheckBox
          Tag = 25
          AlignWithMargins = True
          Left = 12
          Top = 141
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1079#1072#1097#1080#1090#1072' '#1085#1086#1075' '#1080' '#1089#1090#1091#1087#1085#1077#1081
          HotTrack = True
          State = cbUnchecked
          TabOrder = 8
          WordWrap = True
          ExplicitWidth = 130
        end
      end
      object category6: TRzPanel
        Tag = 6
        Left = 555
        Top = 1017
        Width = 265
        Height = 166
        TabOrder = 10
        object RzPanel15: TRzPanel
          Left = 2
          Top = 2
          Width = 261
          Height = 31
          Align = alTop
          BorderOuter = fsNone
          Caption = 
            #1042#1083#1080#1103#1085#1080#1077' '#1087#1099#1083#1077#1075#1072#1079#1086#1074#1086#1075#1086' '#1088#1077#1078#1080#1084#1072' '#1080' '#1087#1088#1086#1084#1099#1096#1083#1077#1085#1085#1072#1103' '#1089#1072#1085#1080#1090#1072#1088#1080#1103' ('#1082#1072#1090#1077#1075#1086#1088#1080#1103' ' +
            #1045')'
          Color = clSilver
          TabOrder = 0
        end
        object RzCheckBox42: TRzCheckBox
          Tag = 39
          AlignWithMargins = True
          Left = 12
          Top = 120
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1096#1091#1084
          HotTrack = True
          State = cbUnchecked
          TabOrder = 1
          WordWrap = True
          ExplicitWidth = 39
        end
        object RzCheckBox43: TRzCheckBox
          Tag = 38
          AlignWithMargins = True
          Left = 12
          Top = 99
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1086#1089#1074#1077#1097#1077#1085#1080#1077
          HotTrack = True
          State = cbUnchecked
          TabOrder = 2
          WordWrap = True
          ExplicitWidth = 75
        end
        object RzCheckBox44: TRzCheckBox
          Tag = 37
          AlignWithMargins = True
          Left = 12
          Top = 78
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1085#1072#1083#1080#1095#1080#1077' '#1086#1087#1072#1089#1085#1099#1093' '#1074#1077#1097#1077#1089#1090#1074
          HotTrack = True
          State = cbUnchecked
          TabOrder = 3
          WordWrap = True
          ExplicitWidth = 154
        end
        object RzCheckBox45: TRzCheckBox
          Tag = 36
          AlignWithMargins = True
          Left = 12
          Top = 57
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1085#1072#1083#1080#1095#1080#1077' '#1086#1087#1072#1089#1085#1099#1093' '#1074#1077#1097#1077#1089#1090#1074
          HotTrack = True
          State = cbUnchecked
          TabOrder = 4
          WordWrap = True
          ExplicitWidth = 154
        end
        object RzCheckBox46: TRzCheckBox
          Tag = 35
          AlignWithMargins = True
          Left = 12
          Top = 36
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1085#1072#1083#1080#1095#1080#1077' '#1074#1088#1077#1076#1085#1099#1093' '#1074#1077#1097#1077#1089#1090#1074
          HotTrack = True
          State = cbUnchecked
          TabOrder = 5
          WordWrap = True
          ExplicitWidth = 156
        end
      end
      object category2: TRzPanel
        Tag = 2
        Left = 284
        Top = 765
        Width = 265
        Height = 246
        TabOrder = 6
        object RzPanel7: TRzPanel
          Left = 2
          Top = 2
          Width = 261
          Height = 31
          Align = alTop
          BorderOuter = fsNone
          Caption = #1055#1086#1083#1086#1078#1077#1085#1080#1077' '#1056#1072#1073#1086#1090#1085#1080#1082#1072' ('#1082#1072#1090#1077#1075#1086#1088#1080#1103' '#1041')'
          Color = clSilver
          TabOrder = 0
        end
        object RzCheckBox10: TRzCheckBox
          Tag = 15
          AlignWithMargins = True
          Left = 12
          Top = 120
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1074#1086#1079#1076#1077#1081#1089#1090#1074#1080#1077' '#1101#1083'.'#1090#1086#1082#1072
          HotTrack = True
          State = cbUnchecked
          TabOrder = 1
          WordWrap = True
          ExplicitWidth = 126
        end
        object RzCheckBox11: TRzCheckBox
          Tag = 13
          AlignWithMargins = True
          Left = 12
          Top = 99
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1074#1077#1088#1086#1103#1090#1085#1086#1089#1090#1100' '#1087#1072#1076#1077#1085#1080#1103
          HotTrack = True
          State = cbUnchecked
          TabOrder = 2
          WordWrap = True
          ExplicitWidth = 130
        end
        object RzCheckBox12: TRzCheckBox
          Tag = 12
          AlignWithMargins = True
          Left = 12
          Top = 78
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1079#1072#1097#1077#1084#1083#1077#1085#1080#1077' '#1087#1088#1077#1076#1084#1077#1090#1086#1084
          HotTrack = True
          State = cbUnchecked
          TabOrder = 3
          WordWrap = True
          ExplicitWidth = 139
        end
        object RzCheckBox13: TRzCheckBox
          Tag = 11
          AlignWithMargins = True
          Left = 12
          Top = 57
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1074#1086#1079#1084#1086#1078#1077#1085' '#1091#1076#1072#1088' '#1087#1088#1077#1076#1084#1077#1090#1086#1084
          HotTrack = True
          State = cbUnchecked
          TabOrder = 4
          WordWrap = True
          ExplicitWidth = 154
        end
        object RzCheckBox14: TRzCheckBox
          Tag = 10
          AlignWithMargins = True
          Left = 12
          Top = 36
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1074#1086#1079#1084#1086#1078#1077#1085' '#1091#1076#1072#1088' '#1086' '#1087#1088#1077#1076#1084#1077#1090
          HotTrack = True
          State = cbUnchecked
          TabOrder = 5
          WordWrap = True
          ExplicitWidth = 151
        end
        object RzCheckBox15: TRzCheckBox
          Tag = 40
          AlignWithMargins = True
          Left = 12
          Top = 196
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1074#1086#1079#1076#1077#1081#1089#1090#1074#1080#1077' '#1088#1072#1079#1083#1077#1090#1072#1102#1097#1080#1093#1089#1103' '#1087#1088#1077#1076#1084#1077#1090#1086#1074
          HotTrack = True
          State = cbUnchecked
          TabOrder = 6
          Transparent = True
          WordWrap = True
          ExplicitWidth = 227
        end
        object RzCheckBox16: TRzCheckBox
          Tag = 16
          AlignWithMargins = True
          Left = 12
          Top = 141
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1074#1086#1079#1076#1077#1081#1089#1090#1074#1080#1077' '#1101#1082#1089#1090#1088#1077#1084'.'#1090#1077#1084#1087#1077#1088#1072#1090#1091#1088
          HotTrack = True
          State = cbUnchecked
          TabOrder = 7
          WordWrap = True
          ExplicitWidth = 191
        end
        object RzCheckBox9: TRzCheckBox
          Tag = 17
          AlignWithMargins = True
          Left = 12
          Top = 162
          Width = 241
          Height = 28
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1074#1086#1079#1076#1077#1081#1089#1090#1074#1080#1077' '#1076#1074#1080#1078#1091#1097#1080#1093#1089#1103', '#1074#1088#1072#1097#1072#1102#1097#1080#1093#1089#1103' '#1084#1072#1096#1080#1085' '#1080' '#1084#1077#1093#1072#1085#1080#1079#1084#1086#1074
          HotTrack = True
          State = cbUnchecked
          TabOrder = 8
          WordWrap = True
          ExplicitWidth = 236
        end
      end
      object category5: TRzPanel
        Tag = 5
        Left = 282
        Top = 1017
        Width = 265
        Height = 166
        TabOrder = 9
        object RzPanel13: TRzPanel
          Left = 2
          Top = 2
          Width = 261
          Height = 31
          Align = alTop
          BorderOuter = fsNone
          Caption = 
            #1054#1090#1089#1091#1090#1089#1090#1074#1080#1077' '#1080#1085#1089#1090#1088#1091#1082#1094#1080#1081' '#1080' '#1079#1072#1093#1083#1072#1084#1083#1105#1085#1085#1086#1089#1090#1100' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1084#1077#1089#1090#1072' ('#1082#1072#1090#1077#1075#1086#1088#1080#1103 +
            ' '#1044')'
          Color = clSilver
          TabOrder = 0
        end
        object RzCheckBox35: TRzCheckBox
          Tag = 34
          AlignWithMargins = True
          Left = 12
          Top = 125
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1088#1072#1073#1086#1095#1077#1077' '#1084#1077#1089#1090#1086' '#1079#1072#1093#1083#1072#1084#1083#1077#1085#1086
          HotTrack = True
          State = cbUnchecked
          TabOrder = 1
          WordWrap = True
          ExplicitWidth = 155
        end
        object RzCheckBox36: TRzCheckBox
          Tag = 33
          AlignWithMargins = True
          Left = 12
          Top = 91
          Width = 241
          Height = 28
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1080#1085#1089#1090#1088#1091#1082#1094#1080#1103' '#1085#1077' '#1076#1086#1089#1090#1091#1087#1085#1072' '#1085#1072' '#1089#1090#1072#1094#1080#1086#1085#1072#1088#1085#1086#1084' '#1088#1072#1073#1086#1095#1077#1084' '#1084#1077#1089#1090#1077
          HotTrack = True
          State = cbUnchecked
          TabOrder = 2
          WordWrap = True
          ExplicitWidth = 236
        end
        object RzCheckBox37: TRzCheckBox
          Tag = 32
          AlignWithMargins = True
          Left = 12
          Top = 70
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1090#1088#1077#1073#1086#1074#1072#1085#1080#1103' '#1080#1085#1089#1090#1088#1091#1082#1094#1080#1080' '#1085#1077' '#1074#1099#1087#1086#1083#1085#1103#1102#1090#1089#1103
          HotTrack = True
          State = cbUnchecked
          TabOrder = 3
          WordWrap = True
          ExplicitWidth = 229
        end
        object RzCheckBox38: TRzCheckBox
          Tag = 31
          AlignWithMargins = True
          Left = 12
          Top = 36
          Width = 241
          Height = 28
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1074#1099#1087#1086#1083#1085#1103#1077#1084#1072#1103' '#1088#1072#1073#1086#1090#1072' '#1085#1077' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1077#1090' '#1080#1085#1089#1090#1088#1091#1082#1094#1080#1080
          HotTrack = True
          State = cbUnchecked
          TabOrder = 4
          WordWrap = True
          ExplicitWidth = 223
        end
      end
      object category4: TRzPanel
        Tag = 4
        Left = 13
        Top = 1017
        Width = 265
        Height = 166
        TabOrder = 8
        object RzPanel11: TRzPanel
          Left = 2
          Top = 2
          Width = 261
          Height = 31
          Align = alTop
          BorderOuter = fsNone
          Caption = 
            #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' '#1085#1077#1080#1089#1087#1088#1072#1074#1085#1099#1093' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090#1086#1074'/ '#1087#1088#1080#1089#1087#1086#1089#1086#1073#1083#1077#1085#1080#1081' ('#1082#1072#1090#1077#1075#1086#1088#1080 +
            #1103' '#1043')'
          Color = clSilver
          TabOrder = 0
        end
        object RzCheckBox28: TRzCheckBox
          Tag = 30
          AlignWithMargins = True
          Left = 12
          Top = 78
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1074' '#1086#1087#1072#1089#1085#1086#1084' '#1089#1086#1089#1090#1086#1103#1085#1080#1080
          HotTrack = True
          State = cbUnchecked
          TabOrder = 1
          WordWrap = True
          ExplicitWidth = 124
        end
        object RzCheckBox29: TRzCheckBox
          Tag = 29
          AlignWithMargins = True
          Left = 12
          Top = 57
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1085#1077#1087#1088#1072#1074#1080#1083#1100#1085#1086
          HotTrack = True
          State = cbUnchecked
          TabOrder = 2
          WordWrap = True
          ExplicitWidth = 157
        end
        object RzCheckBox30: TRzCheckBox
          Tag = 28
          AlignWithMargins = True
          Left = 12
          Top = 36
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1085#1077' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1077#1090'  '#1088#1072#1073#1086#1090#1077
          HotTrack = True
          State = cbUnchecked
          TabOrder = 3
          WordWrap = True
          ExplicitWidth = 152
        end
      end
      object category1: TRzPanel
        Tag = 1
        Left = 13
        Top = 765
        Width = 265
        Height = 246
        TabOrder = 5
        object RzPanel4: TRzPanel
          Left = 2
          Top = 2
          Width = 261
          Height = 31
          Align = alTop
          BorderOuter = fsNone
          Caption = #1056#1077#1072#1082#1094#1080#1103' '#1056#1072#1073#1086#1090#1085#1080#1082#1072' ( '#1082#1072#1090#1077#1075#1086#1088#1080#1103' '#1040')'
          Color = clSilver
          TabOrder = 0
        end
        object RzCheckBox1: TRzCheckBox
          Tag = 9
          AlignWithMargins = True
          Left = 12
          Top = 183
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1087#1088#1086#1076#1086#1083#1078#1072#1077#1090' '#1088#1072#1073#1086#1090#1072#1090#1100
          HotTrack = True
          State = cbUnchecked
          TabOrder = 1
          WordWrap = True
          ExplicitWidth = 133
        end
        object RzCheckBox2: TRzCheckBox
          Tag = 6
          AlignWithMargins = True
          Left = 12
          Top = 120
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1084#1077#1085#1103#1077#1090' '#1080#1085#1089#1090#1088#1091#1084#1077#1085#1090
          HotTrack = True
          State = cbUnchecked
          TabOrder = 2
          WordWrap = True
          ExplicitWidth = 117
        end
        object RzCheckBox3: TRzCheckBox
          Tag = 5
          AlignWithMargins = True
          Left = 12
          Top = 99
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1091#1093#1086#1076#1080#1090' '#1089' '#1088#1072#1073#1086#1095#1077#1075#1086' '#1084#1077#1089#1090#1072
          HotTrack = True
          State = cbUnchecked
          TabOrder = 3
          WordWrap = True
          ExplicitWidth = 146
        end
        object RzCheckBox4: TRzCheckBox
          Tag = 4
          AlignWithMargins = True
          Left = 12
          Top = 78
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1087#1077#1088#1077#1089#1090#1088#1072#1080#1074#1072#1077#1090' '#1088#1072#1073#1086#1090#1091
          HotTrack = True
          State = cbUnchecked
          TabOrder = 4
          WordWrap = True
          ExplicitWidth = 135
        end
        object RzCheckBox5: TRzCheckBox
          Tag = 3
          AlignWithMargins = True
          Left = 12
          Top = 57
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1080#1079#1084#1077#1085#1103#1077#1090' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
          HotTrack = True
          State = cbUnchecked
          TabOrder = 5
          WordWrap = True
          ExplicitWidth = 125
        end
        object RzCheckBox6: TRzCheckBox
          Tag = 2
          AlignWithMargins = True
          Left = 12
          Top = 36
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1087#1088#1080#1074#1086#1076#1080#1090' '#1074' '#1087#1086#1088#1103#1076#1086#1082' '#1057#1048#1047
          HotTrack = True
          State = cbUnchecked
          TabOrder = 6
          WordWrap = True
          ExplicitWidth = 146
        end
        object RzCheckBox7: TRzCheckBox
          Tag = 8
          AlignWithMargins = True
          Left = 12
          Top = 162
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1091#1089#1090#1072#1085#1072#1074#1083#1080#1074#1072#1077#1090' '#1079#1072#1097#1080#1090#1091
          HotTrack = True
          State = cbUnchecked
          TabOrder = 7
          WordWrap = True
          ExplicitWidth = 137
        end
        object RzCheckBox8: TRzCheckBox
          Tag = 7
          AlignWithMargins = True
          Left = 12
          Top = 141
          Width = 241
          Height = 15
          Margins.Left = 10
          Margins.Right = 10
          Align = alTop
          Caption = #1087#1088#1077#1082#1088#1072#1097#1072#1077#1090' '#1088#1072#1073#1086#1090#1091
          HotTrack = True
          State = cbUnchecked
          TabOrder = 8
          WordWrap = True
          ExplicitWidth = 121
        end
      end
      object RzPanel5: TRzPanel
        Left = 13
        Top = 1189
        Width = 807
        Height = 87
        TabOrder = 11
        object RzDBRadioGroup4: TRzDBRadioGroup
          Left = 10
          Top = 3
          Width = 791
          Height = 78
          DataField = 'boss_decision'
          DataSource = dsPab
          Items.Strings = (
            #1055#1088#1080#1085#1103#1090#1086' '#1082' '#1089#1074#1077#1076#1077#1085#1080#1102'. '#1055#1086#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1082#1086#1085#1090#1088#1086#1083#1100' '#1073#1091#1076#1077#1090' '#1086#1073#1077#1089#1087#1077#1095#1077#1085'.'
            #1054#1090#1082#1083#1086#1085#1077#1085#1086'. '#1042#1086#1087#1088#1086#1089' '#1085#1077' '#1086#1090#1085#1086#1089#1090#1080#1090#1089#1103' '#1082' '#1086#1093#1088#1072#1085#1077' '#1090#1088#1091#1076#1072'.'
            
              #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086' '#1080#1079#1091#1095#1080#1090#1100'. '#1058#1088#1077#1073#1091#1077#1090#1089#1103' '#1088#1077#1096#1077#1085#1080#1077' '#1074#1099#1096#1077#1089#1090#1086#1103#1097#1077#1075#1086' '#1088#1091#1082#1086#1074#1086#1076#1089#1090#1074 +
              #1072'.')
          Values.Strings = (
            '1'
            '2'
            '3')
          Caption = #1056#1077#1096#1077#1085#1080#1077' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103
          ItemHotTrack = True
          TabOrder = 0
        end
      end
    end
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 756
    Width = 1009
    Height = 35
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    object lblEdit: TRzLabel
      Left = 328
      Top = 10
      Width = 51
      Height = 17
      Caption = #1055#1088#1072#1074#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clLime
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      ShadowColor = clWhite
      ShadowDepth = 1
      TextStyle = tsShadow
    end
    object lblView: TRzLabel
      Left = 142
      Top = 10
      Width = 67
      Height = 17
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      ShadowColor = clWhite
      ShadowDepth = 1
      TextStyle = tsShadow
    end
    object lblSign: TRzLabel
      Left = 150
      Top = 10
      Width = 126
      Height = 17
      Caption = #1055#1088#1080#1085#1103#1090#1080#1077' '#1088#1077#1096#1077#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      ShadowColor = clWhite
      ShadowDepth = 1
      TextStyle = tsShadow
    end
    object RzPanel3: TRzPanel
      Left = 650
      Top = 0
      Width = 359
      Height = 35
      Align = alRight
      BorderOuter = fsNone
      TabOrder = 0
      object btnSave: TRzButton
        Left = 193
        Top = 6
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        HotTrack = True
        TabOrder = 0
        OnClick = btnSaveClick
      end
      object btnClose: TRzButton
        Left = 274
        Top = 6
        Caption = #1047#1072#1082#1088#1099#1090#1100
        HotTrack = True
        TabOrder = 1
        OnClick = btnCloseClick
      end
      object btnReturn: TRzButton
        Left = 104
        Top = 6
        Width = 83
        Caption = #1042#1077#1088#1085#1091#1090#1100
        HotTrack = True
        TabOrder = 2
        Visible = False
        OnClick = btnReturnClick
      end
      object btnComplete: TRzButton
        Left = 15
        Top = 6
        Width = 83
        Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100
        HotTrack = True
        TabOrder = 3
        Visible = False
        OnClick = btnCompleteClick
      end
      object btnReturnText: TRzButton
        Left = 44
        Top = 18
        Width = 155
        Caption = #1055#1088#1080#1095#1080#1085#1072' '#1086#1090#1082#1072#1079#1072
        HotTrack = True
        TabOrder = 4
        Visible = False
        OnClick = btnReturnTextClick
      end
    end
    object btnPrint: TRzButton
      Left = 13
      Top = 6
      Width = 120
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091
      HotTrack = True
      TabOrder = 1
      OnClick = btnPrintClick
    end
    object btnSign: TRzButton
      Left = 150
      Top = 6
      Width = 161
      Caption = #1053#1072' '#1087#1086#1076#1087#1080#1089#1100' '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1102
      HotTrack = True
      TabOrder = 2
      OnClick = btnSignClick
    end
  end
  object dsPab: TDataSource
    DataSet = tblPab
    OnDataChange = dsPabDataChange
    Left = 408
    Top = 24
  end
  object tblPab: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    TableName = 'pab_main'
    Left = 376
    Top = 24
  end
  object tblCeh: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    AfterScroll = tblCehAfterScroll
    TableName = 'pab_ceh'
    Left = 88
    Top = 72
  end
  object dsCeh: TDataSource
    DataSet = tblCeh
    Left = 120
    Top = 72
  end
  object dsUch: TDataSource
    DataSet = tblUch
    Left = 264
    Top = 72
  end
  object tblUch: TADOTable
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    IndexFieldNames = 'ceh_id'
    MasterFields = 'id'
    MasterSource = dsCeh
    TableName = 'pab_uchastok'
    Left = 232
    Top = 72
  end
  object qryAge: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from pab_age_category')
    Left = 88
    Top = 104
  end
  object dsAge: TDataSource
    DataSet = qryAge
    Left = 120
    Top = 104
  end
  object qryWTime: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from pab_work_time')
    Left = 232
    Top = 112
  end
  object dsWTime: TDataSource
    DataSet = qryWTime
    Left = 264
    Top = 112
  end
  object dsProf: TDataSource
    DataSet = qryProf
    Left = 456
    Top = 112
  end
  object qryProf: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from pab_proffessions')
    Left = 424
    Top = 112
  end
  object dsWorkKinds: TDataSource
    DataSet = qryWorkKinds
    Left = 504
    Top = 272
  end
  object qryWorkKinds: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from pab_work_kinds order by name')
    Left = 464
    Top = 272
  end
end

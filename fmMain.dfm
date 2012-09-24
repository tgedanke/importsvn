object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #1058#1088#1072#1074#1084#1086#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1100
  ClientHeight = 858
  ClientWidth = 943
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 839
    Width = 943
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 0
    object StatusClock: TRzClockStatus
      Left = 753
      Top = 0
      Width = 190
      Height = 19
      Align = alRight
      Format = 'dddddd tt'
      ExplicitLeft = 712
    end
    object StatusVersion: TRzVersionInfoStatus
      Left = 622
      Top = 0
      Width = 131
      Height = 19
      Align = alRight
      FieldLabel = #1042#1077#1088#1089#1080#1103': '
      Alignment = taCenter
      Field = vifFileVersion
      VersionInfo = RzVersionInfo1
      ExplicitLeft = 344
    end
    object StatusUser: TRzFieldStatus
      Left = 0
      Top = 0
      Width = 622
      Height = 19
      Align = alClient
      FieldLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
      AutoSize = True
      ExplicitWidth = 120
    end
  end
  object RzToolbar1: TRzToolbar
    Left = 0
    Top = 0
    Width = 943
    Height = 29
    Images = DataModule1.ProjectImages
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdTop]
    BorderWidth = 0
    TabOrder = 1
    ToolbarControls = (
      BtnNewProtocol
      RzSpacer3
      BtnFilterAdd
      BtnFilterDel
      RzSpacer1
      BtnFilterAsc
      BtnFilterDesc
      RzSpacer2
      BtnRefresh)
    object BtnFilterAdd: TRzToolButton
      Left = 37
      Top = 2
      Action = FilterApply
    end
    object BtnFilterDel: TRzToolButton
      Left = 62
      Top = 2
      Action = FilterRemove
    end
    object RzSpacer1: TRzSpacer
      Left = 87
      Top = 2
    end
    object BtnFilterAsc: TRzToolButton
      Left = 95
      Top = 2
      Action = SortAsc
    end
    object BtnFilterDesc: TRzToolButton
      Left = 120
      Top = 2
      Action = SortDesc
    end
    object RzSpacer2: TRzSpacer
      Left = 145
      Top = 2
    end
    object BtnRefresh: TRzToolButton
      Left = 153
      Top = 2
      Action = Refresh
    end
    object RzSpacer3: TRzSpacer
      Left = 29
      Top = 2
    end
    object BtnNewProtocol: TRzToolButton
      Left = 4
      Top = 2
      Action = NewProtocol
    end
  end
  object MainMenu: TMainMenu
    Left = 40
    Top = 40
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N13: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N13Click
      end
    end
    object N3: TMenuItem
      Caption = #1055#1088#1086#1090#1086#1082#1086#1083
      object N4: TMenuItem
        Action = NewProtocol
        Caption = #1053#1086#1074#1099#1081
      end
      object N5: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083
        ShortCut = 114
        OnClick = N5Click
      end
    end
    object N2: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N7: TMenuItem
        Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
        ShortCut = 117
        OnClick = N7Click
      end
      object N6: TMenuItem
        Caption = #1056#1072#1073#1086#1090#1085#1080#1082#1080' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1081
        ShortCut = 118
        OnClick = N6Click
      end
      object N8: TMenuItem
        Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1080' '#1080' '#1044#1086#1083#1078#1085#1086#1089#1090#1080
        ShortCut = 119
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1041#1072#1079#1072' '#1053#1055#1040
        ShortCut = 120
        OnClick = N9Click
      end
      object N19: TMenuItem
        Caption = #1054#1073#1086#1088#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1080' '#1087#1088#1080#1089#1087#1086#1089#1086#1073#1083#1077#1085#1080#1103
        ShortCut = 121
        OnClick = N19Click
      end
      object N20: TMenuItem
        Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1103' '#1080' '#1084#1077#1088#1086#1087#1088#1080#1103#1090#1080#1103
        ShortCut = 122
        OnClick = N20Click
      end
    end
    object N14: TMenuItem
      Caption = #1042#1080#1076
      object N15: TMenuItem
        Caption = #1050#1072#1089#1082#1072#1076#1086#1084
        OnClick = N15Click
      end
      object N16: TMenuItem
        Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1100
        OnClick = N16Click
      end
      object N18: TMenuItem
        Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
        OnClick = N18Click
      end
      object N17: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1074#1089#1077
        OnClick = N17Click
      end
    end
    object MenuPAB: TMenuItem
      Caption = #1055#1086#1074#1077#1076#1077#1085#1095#1077#1089#1082#1080#1081' '#1072#1091#1076#1080#1090' '#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1080
      object N26: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083' '#1087#1088#1086#1090#1086#1082#1086#1083#1086#1074
        OnClick = N26Click
      end
      object N27: TMenuItem
        Caption = #1054#1090#1095#1077#1090#1099
        object N35: TMenuItem
          Caption = #1087#1086' '#1072#1091#1076#1080#1090#1086#1088#1091
          OnClick = N35Click
        end
        object N36: TMenuItem
          Caption = #1087#1086' '#1094#1077#1093#1091
          OnClick = N36Click
        end
        object N37: TMenuItem
          Caption = #1087#1086' '#1090#1080#1087#1091
          OnClick = N37Click
        end
        object N38: TMenuItem
          Caption = #1087#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1080
          OnClick = N38Click
        end
        object N39: TMenuItem
          Caption = #1087#1086' '#1074#1080#1076#1072#1084' '#1088#1072#1073#1086#1090
          OnClick = N39Click
        end
        object N40: TMenuItem
          Caption = #1087#1086' '#1087#1088#1080#1085#1103#1090#1099#1084' '#1088#1077#1096#1077#1085#1080#1103#1084
          OnClick = N40Click
        end
        object N47: TMenuItem
          Caption = #1087#1086' '#1087#1083#1072#1085#1091
          OnClick = N47Click
        end
      end
      object N46: TMenuItem
        Caption = #1043#1088#1072#1092#1080#1082' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1055#1040#1041
        OnClick = N46Click
      end
      object N50: TMenuItem
        Caption = #1040#1085#1072#1083#1080#1090#1080#1082#1072
        object N51: TMenuItem
          Caption = #1079#1072' '#1084#1077#1089#1103#1094
          OnClick = N51Click
        end
        object N52: TMenuItem
          Caption = #1079#1072' '#1082#1074#1072#1088#1090#1072#1083
          OnClick = N52Click
        end
        object N53: TMenuItem
          Caption = #1079#1072' '#1075#1086#1076
          OnClick = N53Click
        end
      end
    end
    object N21: TMenuItem
      Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
      object N23: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
        OnClick = N23Click
      end
      object N24: TMenuItem
        Caption = #1054#1090#1083#1072#1076#1082#1072
        object N25: TMenuItem
          Caption = #1070#1079#1077#1088
          OnClick = N25Click
        end
        object N28: TMenuItem
          Caption = #1041#1086#1089#1089
          OnClick = N28Click
        end
      end
    end
    object N22: TMenuItem
      Caption = #1057#1086#1086#1073#1097#1080#1090#1100' '#1086' '#1087#1088#1086#1073#1083#1077#1084#1077
      OnClick = N22Click
    end
    object N29: TMenuItem
      Caption = #1054#1093#1088#1072#1085#1072' '#1086#1082#1088#1091#1078#1072#1102#1097#1077#1081' '#1089#1088#1077#1076#1099
      object N30: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083
        OnClick = N30Click
      end
      object N32: TMenuItem
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1076#1072#1085#1085#1099#1093
        OnClick = N32Click
      end
      object Jnxtns1: TMenuItem
        Caption = #1054#1090#1095#1077#1090#1099
        object N33: TMenuItem
          Caption = #1057#1074#1086#1076#1085#1099#1081
          OnClick = N33Click
        end
        object N34: TMenuItem
          Caption = #1055#1086#1083#1085#1099#1081
          OnClick = N34Click
        end
        object N41: TMenuItem
          Caption = #1057#1077#1074#1077#1088#1089#1090#1072#1083#1100
          OnClick = N41Click
        end
        object N2NG1: TMenuItem
          Caption = '2 '#1058#1055
          OnClick = N2NG1Click
        end
        object N43: TMenuItem
          Caption = #1058#1077#1093#1086#1090#1095#1077#1090
          OnClick = N43Click
        end
        object N49: TMenuItem
          Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1086#1087#1077#1088#1072#1094#1080#1103#1084
          OnClick = N49Click
        end
      end
      object N31: TMenuItem
        Caption = #1051#1080#1084#1080#1090#1099' '#1080' '#1086#1089#1090#1072#1090#1082#1080
        OnClick = N31Click
      end
      object N42: TMenuItem
        Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1099' '#1080' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099
        OnClick = N42Click
      end
      object N44: TMenuItem
        Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1086#1090#1093#1086#1076#1086#1074
        OnClick = N44Click
      end
      object N45: TMenuItem
        Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
        OnClick = N45Click
      end
      object N54: TMenuItem
        Caption = #1057#1074#1086#1081#1089#1090#1074#1072
        OnClick = N54Click
      end
    end
    object N10: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N12: TMenuItem
        Caption = #1052#1086#1076#1091#1083#1100' '#1090#1088#1072#1074#1084#1086#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1100
        OnClick = N12Click
      end
      object N48: TMenuItem
        Caption = #1052#1086#1076#1091#1083#1100' '#1055#1040#1041
        OnClick = N48Click
      end
      object N11: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N11Click
      end
    end
  end
  object RzVersionInfo1: TRzVersionInfo
    Left = 8
    Top = 40
  end
  object ActionList1: TActionList
    Images = DataModule1.ProjectImages
    Left = 8
    Top = 72
    object FilterApply: TAction
      Caption = 'FilterApply'
      ImageIndex = 0
      ShortCut = 16454
      OnExecute = FilterApplyExecute
    end
    object FilterRemove: TAction
      Caption = 'FilterRemove'
      ImageIndex = 1
      ShortCut = 16452
      OnExecute = FilterRemoveExecute
    end
    object SortAsc: TAction
      Caption = 'SortAsc'
      ImageIndex = 3
      ShortCut = 16449
      OnExecute = SortAscExecute
    end
    object SortDesc: TAction
      Caption = 'SortDesc'
      ImageIndex = 4
      ShortCut = 16474
      OnExecute = SortDescExecute
    end
    object Refresh: TAction
      Caption = 'Refresh'
      ImageIndex = 2
      ShortCut = 116
      OnExecute = RefreshExecute
    end
    object NewProtocol: TAction
      Caption = 'NewProtocol'
      ImageIndex = 5
      ShortCut = 113
      OnExecute = NewProtocolExecute
    end
  end
end

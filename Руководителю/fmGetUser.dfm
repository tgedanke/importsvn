object FormGetUser: TFormGetUser
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 321
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 282
    Width = 421
    Height = 39
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 0
    object btnClose: TRzButton
      Left = 336
      Top = 6
      Height = 27
      Caption = #1047#1072#1082#1088#1099#1090#1100
      HotTrack = True
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 421
    Height = 241
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
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'id'
        Footers = <>
        Visible = False
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1060#1048#1054
        Width = 247
      end
      item
        EditButtons = <>
        FieldName = 'post'
        Footers = <>
        Title.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        Width = 129
      end>
  end
  object RzPanel2: TRzPanel
    Left = 0
    Top = 0
    Width = 421
    Height = 41
    Align = alTop
    BorderOuter = fsNone
    TabOrder = 2
    object RzLabel1: TRzLabel
      Left = 8
      Top = 14
      Width = 38
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088
    end
    object FilterEdit: TRzEdit
      Left = 52
      Top = 11
      Width = 359
      Height = 21
      TabOrder = 0
      OnChange = FilterEditChange
    end
  end
  object qryUsers: TADOQuery
    Active = True
    Connection = DataModule1.KMCConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select id,name,post from pab_users order by fixed desc,name asc')
    Left = 24
    Top = 88
  end
  object dsUsers: TDataSource
    DataSet = qryUsers
    Left = 56
    Top = 88
  end
end

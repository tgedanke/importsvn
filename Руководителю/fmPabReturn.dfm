object FormPabReturn: TFormPabReturn
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1055#1088#1080#1095#1080#1085#1072' '#1086#1090#1082#1072#1079#1072
  ClientHeight = 230
  ClientWidth = 391
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object RzMemo1: TRzMemo
    Left = 0
    Top = 0
    Width = 391
    Height = 184
    Align = alClient
    TabOrder = 0
    OnKeyDown = FormKeyDown
  end
  object RzPanel1: TRzPanel
    Left = 0
    Top = 184
    Width = 391
    Height = 46
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 1
    object RzButton1: TRzButton
      Left = 310
      Top = 13
      Caption = #1054#1050
      TabOrder = 0
      OnClick = RzButton1Click
    end
    object RzButton2: TRzButton
      Left = 223
      Top = 13
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = RzButton2Click
    end
  end
end

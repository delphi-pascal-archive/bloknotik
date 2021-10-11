object fmSelectCategorys: TfmSelectCategorys
  Left = 443
  Top = 328
  BorderStyle = bsNone
  Caption = #1042#1099#1073#1086#1088' '#1082#1072#1090#1077#1075#1086#1088#1080#1081
  ClientHeight = 213
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 242
    Height = 213
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object pControls: TPanel
      Left = 1
      Top = 178
      Width = 240
      Height = 34
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object btnOk: TBitBtn
        Left = 6
        Top = 4
        Width = 75
        Height = 25
        Caption = #1054#1050
        Default = True
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = btnOkClick
        OnKeyDown = FormKeyDown
      end
      object btnClose: TBitBtn
        Left = 87
        Top = 4
        Width = 75
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 1
        OnClick = btnCloseClick
        OnKeyDown = FormKeyDown
      end
    end
    object clbCategoryList: TCheckListBox
      Left = 1
      Top = 1
      Width = 240
      Height = 177
      Align = alClient
      ItemHeight = 13
      Items.Strings = (
        '465'
        '56'
        #1044#1088#1091#1079#1100#1103' '#1080#1079' "'#1055#1088#1086#1089#1090#1086#1082#1074#1072#1096#1077#1085#1072'"')
      TabOrder = 1
      OnKeyDown = FormKeyDown
    end
  end
end

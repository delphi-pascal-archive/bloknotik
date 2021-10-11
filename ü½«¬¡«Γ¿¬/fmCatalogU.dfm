object fmCatalog: TfmCatalog
  Left = 0
  Top = 0
  Caption = 'fmCatalog'
  ClientHeight = 355
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object tbCatalogDataControl: TToolBar
    Left = 0
    Top = 0
    Width = 425
    Height = 44
    AutoSize = True
    ButtonHeight = 44
    ButtonWidth = 62
    Caption = 'tbCatalogDataControl'
    Images = fmMainWin.ilMainImages
    ShowCaptions = True
    TabOrder = 0
    object btnAdd: TToolButton
      Left = 0
      Top = 0
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      OnClick = btnAddClick
    end
    object btnDelete: TToolButton
      Left = 62
      Top = 0
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnClick = btnDeleteClick
    end
    object btnPost: TToolButton
      Left = 124
      Top = 0
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 8
      OnClick = btnPostClick
    end
  end
  object dbgCatalog: TDBGridEh
    Left = 0
    Top = 44
    Width = 425
    Height = 276
    Align = alClient
    AutoFitColWidths = True
    DataSource = dsrCatalog
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghDialogFind]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 320
    Width = 425
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      425
      35)
    object btnAdd2: TBitBtn
      Left = 1
      Top = 6
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnDel2: TBitBtn
      Left = 82
      Top = 6
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnDeleteClick
    end
    object btnPost2: TBitBtn
      Left = 163
      Top = 6
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = btnPostClick
    end
    object btnClose: TBitBtn
      Left = 347
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = btnCloseClick
    end
  end
  object dsrCatalog: TDataSource
    DataSet = dsCatalog
    Left = 144
    Top = 160
  end
  object dsCatalog: TADODataSet
    Connection = data.Connect
    Parameters = <>
    Left = 96
    Top = 128
  end
end

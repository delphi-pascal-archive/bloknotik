object fmData: TfmData
  Left = 0
  Top = 0
  Align = alCustom
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
  ClientHeight = 361
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tbDataControl: TToolBar
    Left = 0
    Top = 0
    Width = 622
    Height = 44
    AutoSize = True
    ButtonHeight = 44
    ButtonWidth = 62
    Caption = 'tbDataControl'
    Images = fmMainWin.ilMainImages
    ShowCaptions = True
    TabOrder = 0
    ExplicitWidth = 630
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
  object dbgData: TDBGridEh
    Left = 0
    Top = 44
    Width = 622
    Height = 226
    Align = alClient
    AllowedOperations = [alopUpdateEh, alopDeleteEh]
    AutoFitColWidths = True
    DataSource = data.dsrContact
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
  object pEditControls: TPanel
    Left = 0
    Top = 270
    Width = 622
    Height = 91
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 254
    ExplicitWidth = 600
    DesignSize = (
      622
      91)
    object lTypeReq: TLabel
      Left = 8
      Top = 6
      Width = 78
      Height = 13
      Caption = #1058#1080#1087' '#1088#1077#1082#1074#1080#1079#1080#1090#1072':'
    end
    object lValue: TLabel
      Left = 191
      Top = 6
      Width = 52
      Height = 13
      Caption = #1047#1085#1072#1095#1077#1085#1080#1077':'
    end
    object dbeValue: TDBEditEh
      Left = 191
      Top = 22
      Width = 424
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Val'
      DataSource = data.dsrContact
      EditButtons = <>
      TabOrder = 0
      Visible = True
      ExplicitWidth = 402
    end
    object luReqType: TDBLookupComboboxEh
      Left = 8
      Top = 22
      Width = 177
      Height = 21
      DataField = 'ContactTypeID'
      DataSource = data.dsrContact
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'Val'
      ListSource = data.dsrContactType
      TabOrder = 1
      Visible = True
    end
    object btnClose: TBitBtn
      Left = 540
      Top = 57
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = btnCloseClick
      ExplicitLeft = 518
    end
    object btnAdd1: TBitBtn
      Left = 8
      Top = 57
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = btnAddClick
    end
    object btnDelete1: TBitBtn
      Left = 89
      Top = 57
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = btnDeleteClick
    end
    object btnPost1: TBitBtn
      Left = 170
      Top = 57
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 5
      OnClick = btnPostClick
    end
  end
end

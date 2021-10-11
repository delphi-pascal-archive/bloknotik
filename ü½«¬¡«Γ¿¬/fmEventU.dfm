object fmEvent: TfmEvent
  Left = 347
  Top = 310
  Caption = #1057#1086#1073#1099#1090#1080#1103
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
  object tbEventControl: TToolBar
    Left = 0
    Top = 0
    Width = 622
    Height = 44
    AutoSize = True
    ButtonHeight = 44
    ButtonWidth = 62
    Caption = 'tbEventControl'
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
  object dbgEvent: TDBGridEh
    Left = 0
    Top = 44
    Width = 622
    Height = 196
    Align = alClient
    AllowedOperations = [alopUpdateEh, alopDeleteEh]
    AutoFitColWidths = True
    DataSource = data.dsrEvent
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    OnGetCellParams = dbgEventGetCellParams
  end
  object pedtControls: TPanel
    Left = 0
    Top = 240
    Width = 622
    Height = 121
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      622
      121)
    object Label1: TLabel
      Left = 4
      Top = 27
      Width = 76
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089#1086#1073#1099#1090#1080#1103':'
    end
    object Label2: TLabel
      Left = 112
      Top = 27
      Width = 49
      Height = 13
      Caption = #1057#1086#1073#1099#1090#1080#1077':'
    end
    object lbEventDetals: TLabel
      Left = 4
      Top = 5
      Width = 66
      Height = 13
      Caption = 'lbEventDetals'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnClose: TBitBtn
      Left = 544
      Top = 94
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = btnCloseClick
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 4
      Top = 45
      Width = 89
      Height = 21
      DataField = 'DateEvent'
      DataSource = data.dsrEvent
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
    object DBEditEh1: TDBEditEh
      Left = 112
      Top = 45
      Width = 507
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Val'
      DataSource = data.dsrEvent
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object DBCheckBoxEh1: TDBCheckBoxEh
      Left = 4
      Top = 72
      Width = 97
      Height = 17
      Caption = #1054#1087#1086#1074#1077#1097#1072#1090#1100
      DataField = 'Enable'
      DataSource = data.dsrEvent
      TabOrder = 2
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object btnAdd2: TBitBtn
      Left = 4
      Top = 94
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = btnAddClick
    end
    object btnDelete2: TBitBtn
      Left = 85
      Top = 94
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 4
      OnClick = btnDeleteClick
    end
    object btnSave2: TBitBtn
      Left = 166
      Top = 94
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

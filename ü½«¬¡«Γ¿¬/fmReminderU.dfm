object fmReminder: TfmReminder
  Left = 0
  Top = 0
  Caption = #1053#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103
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
  object tbReminderControl: TToolBar
    Left = 0
    Top = 0
    Width = 622
    Height = 44
    AutoSize = True
    ButtonHeight = 44
    ButtonWidth = 62
    Caption = 'tbReminderControl'
    Images = fmMainWin.ilMainImages
    ShowCaptions = True
    TabOrder = 0
    ExplicitWidth = 651
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
  object dbgReminder: TDBGridEh
    Left = 0
    Top = 44
    Width = 622
    Height = 184
    Align = alClient
    AllowedOperations = [alopUpdateEh, alopDeleteEh]
    AutoFitColWidths = True
    DataSource = data.dsrReminder
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
    OnGetCellParams = dbgReminderGetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Date1'
        Footers = <>
        MaxWidth = 68
        MinWidth = 68
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'Date2'
        Footers = <>
        MaxWidth = 68
        MinWidth = 68
        Width = 68
      end
      item
        EditButtons = <>
        FieldName = 'Val'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'Priority'
        Footers = <>
        KeyList.Strings = (
          '1'
          '2'
          '3')
        MaxWidth = 90
        MinWidth = 90
        PickList.Strings = (
          #1053#1077' '#1047#1085#1072#1095#1080#1090#1077#1083#1100#1085#1086
          #1042#1072#1078#1085#1086
          #1054#1095#1077#1085#1100' '#1042#1072#1078#1085#1086)
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'Status'
        Footers = <>
        KeyList.Strings = (
          '1'
          '2'
          '3')
        MaxWidth = 70
        MinWidth = 70
        PickList.Strings = (
          #1054#1078#1080#1076#1072#1085#1080#1077
          #1042#1099#1087#1086#1083#1085#1103#1102
          #1043#1086#1090#1086#1074#1086)
        Width = 70
      end>
  end
  object pEdtControls: TPanel
    Left = 0
    Top = 228
    Width = 622
    Height = 133
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 283
    ExplicitWidth = 651
    DesignSize = (
      622
      133)
    object Label1: TLabel
      Left = 11
      Top = 6
      Width = 69
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072':'
    end
    object Label2: TLabel
      Left = 11
      Top = 53
      Width = 94
      Height = 13
      Caption = #1044#1072#1090#1072' '#1079#1072#1074#1077#1088#1096#1077#1085#1080#1103':'
    end
    object Label3: TLabel
      Left = 124
      Top = 6
      Width = 71
      Height = 13
      Caption = #1053#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077':'
    end
    object Label4: TLabel
      Left = 124
      Top = 53
      Width = 59
      Height = 13
      Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090':'
    end
    object Label5: TLabel
      Left = 265
      Top = 53
      Width = 40
      Height = 13
      Caption = #1057#1090#1072#1090#1091#1089':'
    end
    object btnClose: TBitBtn
      Left = 544
      Top = 105
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnCloseClick
      ExplicitLeft = 573
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 11
      Top = 25
      Width = 94
      Height = 21
      DataField = 'Date1'
      DataSource = data.dsrReminder
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
    end
    object DBDateTimeEditEh2: TDBDateTimeEditEh
      Left = 11
      Top = 72
      Width = 94
      Height = 21
      DataField = 'Date2'
      DataSource = data.dsrReminder
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
    end
    object DBEditEh1: TDBEditEh
      Left = 124
      Top = 24
      Width = 488
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Val'
      DataSource = data.dsrReminder
      EditButtons = <>
      TabOrder = 3
      Visible = True
      ExplicitWidth = 517
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 124
      Top = 72
      Width = 121
      Height = 21
      DataField = 'Priority'
      DataSource = data.dsrReminder
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'Val'
      ListSource = dsrPriory
      TabOrder = 4
      Visible = True
    end
    object DBLookupComboboxEh2: TDBLookupComboboxEh
      Left = 265
      Top = 72
      Width = 121
      Height = 21
      DataField = 'Status'
      DataSource = data.dsrReminder
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'Val'
      ListSource = dsrState
      TabOrder = 5
      Visible = True
    end
    object btnAdd2: TBitBtn
      Left = 11
      Top = 105
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 6
      OnClick = btnAddClick
    end
    object btnDel2: TBitBtn
      Left = 92
      Top = 105
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 7
      OnClick = btnDeleteClick
    end
    object btnPost2: TBitBtn
      Left = 173
      Top = 105
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 8
      OnClick = btnPostClick
    end
  end
  object qPriority: TADOQuery
    Connection = data.Connect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from luRemPriorety')
    Left = 376
    Top = 128
  end
  object qState: TADOQuery
    Connection = data.Connect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from luRemState')
    Left = 464
    Top = 128
  end
  object dsrPriory: TDataSource
    DataSet = qPriority
    Left = 400
    Top = 176
  end
  object dsrState: TDataSource
    DataSet = qState
    Left = 488
    Top = 176
  end
end

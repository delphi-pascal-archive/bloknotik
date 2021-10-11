object fmSQLView: TfmSQLView
  Left = 0
  Top = 0
  Caption = 'SQL View ('#1090#1077#1089#1090#1086#1074#1099#1081' '#1084#1086#1076#1091#1083#1100' '#1076#1083#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1080#1089#1090#1086#1074')'
  ClientHeight = 546
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    688
    546)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 130
    Top = 431
    Width = 550
    Height = 42
    AutoSize = False
    Caption = 
      #1042#1085#1080#1084#1072#1085#1080#1077'! '#1045#1089#1083#1080' '#1074#1099' '#1085#1077' '#1087#1086#1085#1080#1084#1072#1077#1090#1077' SQL '#1079#1072#1082#1088#1086#1081#1090#1077' '#1101#1090#1086' '#1086#1082#1085#1086', '#1087#1086' '#1085#1077' '#1079#1085#1072#1085 +
      #1080#1102' '#1084#1086#1078#1085#1086' '#1087#1086#1074#1088#1077#1076#1080#1090#1100' '#1076#1072#1085#1085#1099#1077'!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = 20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
    OnDblClick = Label1DblClick
  end
  object dbgSQLRes: TDBGridEh
    Left = 0
    Top = 0
    Width = 688
    Height = 297
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsrSQL
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object mSQLQuery: TMemo
    Left = 0
    Top = 297
    Width = 688
    Height = 128
    Align = alTop
    Lines.Strings = (
      'Select * From Subject')
    TabOrder = 1
  end
  object btnGO: TButton
    Left = 136
    Top = 518
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'GO'
    TabOrder = 2
    OnClick = btnGOClick
  end
  object ListBox1: TListBox
    Left = 0
    Top = 429
    Width = 121
    Height = 114
    Align = alCustom
    Anchors = [akLeft, akBottom]
    ItemHeight = 13
    Items.Strings = (
      'Contact'
      'ContactType'
      'Event'
      'Image'
      'Reminder'
      'Subject'
      'SubjectCategory'
      'SubjectCategoryList')
    TabOrder = 3
    OnDblClick = ListBox1DblClick
  end
  object qSQL: TADOQuery
    Connection = data.Connect
    Parameters = <>
    Left = 592
    Top = 24
  end
  object dsrSQL: TDataSource
    DataSet = qSQL
    Left = 600
    Top = 80
  end
end

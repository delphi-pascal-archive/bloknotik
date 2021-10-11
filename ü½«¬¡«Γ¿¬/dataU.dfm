object data: Tdata
  OldCreateOrder = False
  Height = 507
  Width = 698
  object Connect: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=P:\Delphi\Projects\' +
      'Bloknot31\data\mdata.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 16
    Top = 8
  end
  object dsSubject: TADODataSet
    Connection = Connect
    CursorType = ctStatic
    AfterEdit = dsSubjectAfterEdit
    AfterPost = dsSubjectAfterPost
    BeforeDelete = dsSubjectBeforeDelete
    AfterDelete = dsSubjectAfterDelete
    CommandText = 
      'Select *, Day(Date1) as DDay, Month(Date1) as MMonth, Year(Date1' +
      ') as YYear  From Subject'
    Parameters = <>
    Left = 288
    Top = 128
    object dsSubjectID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object dsSubjectFIO: TWideStringField
      DisplayLabel = #1060'.'#1048'.'#1054'.'
      DisplayWidth = 70
      FieldName = 'FIO'
      Size = 70
    end
    object dsSubjectDate1: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1056#1086#1078#1076#1077#1085#1080#1103
      DisplayWidth = 10
      FieldName = 'Date1'
    end
    object dsSubjectDate2: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1059#1093#1086#1076#1072
      DisplayWidth = 12
      FieldName = 'Date2'
    end
    object dsSubjectComment: TWideMemoField
      FieldName = 'Comment'
      Visible = False
      BlobType = ftWideMemo
    end
  end
  object dsrSubject: TDataSource
    DataSet = dsSubject
    Left = 304
    Top = 152
  end
  object qExistsSubjectCategoryInList: TADOQuery
    Connection = Connect
    Parameters = <>
    Left = 64
    Top = 240
  end
  object dsSubjectCategoryList: TADODataSet
    Connection = Connect
    CursorType = ctStatic
    CommandText = 'Select * from SubjectCategoryList'
    DataSource = dsrSubject
    IndexFieldNames = 'SubjectID'
    MasterFields = 'ID'
    Parameters = <>
    Left = 120
    Top = 136
    object dsSubjectCategoryListID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object dsSubjectCategoryListSubjectCategoryID: TIntegerField
      FieldName = 'SubjectCategoryID'
    end
    object dsSubjectCategoryListSubjectID: TIntegerField
      FieldName = 'SubjectID'
    end
    object dsSubjectCategoryListEnable: TBooleanField
      FieldName = 'Enable'
    end
  end
  object dsrSubjectCategoryList: TDataSource
    DataSet = dsSubjectCategoryList
    Left = 136
    Top = 160
  end
  object dsSubjectCategory: TADODataSet
    Connection = Connect
    CursorType = ctStatic
    CommandText = 'Select * from SubjectCategory'
    Parameters = <>
    Left = 96
    Top = 24
    object dsSubjectCategoryID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object dsSubjectCategoryVal: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'Val'
      Size = 255
    end
  end
  object dsrSubjectCategory: TDataSource
    DataSet = dsSubjectCategory
    Left = 112
    Top = 48
  end
  object qTD: TADOQuery
    Connection = Connect
    Parameters = <>
    Left = 64
    Top = 288
  end
  object dsContactType: TADODataSet
    Connection = Connect
    CursorType = ctStatic
    CommandText = 'Select * from ContactType'#13#10'order by [Val]'
    Parameters = <>
    Left = 192
    Top = 24
    object dsContactTypeID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object dsContactTypeVal: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'Val'
      Size = 200
    end
  end
  object dsrContactType: TDataSource
    DataSet = dsContactType
    Left = 208
    Top = 48
  end
  object dsEvent: TADODataSet
    Connection = Connect
    CursorType = ctStatic
    BeforePost = dsEventBeforePost
    AfterPost = dsEventAfterPost
    AfterScroll = dsEventAfterScroll
    CommandText = 'Select * from Event'
    DataSource = dsrSubject
    Parameters = <>
    Left = 456
    Top = 184
    object dsEventID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object dsEventSubjectID: TIntegerField
      FieldName = 'SubjectID'
      Visible = False
    end
    object dsEventDateEvent: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1086#1073#1099#1090#1080#1103
      FieldName = 'DateEvent'
    end
    object dsEventVal: TWideStringField
      DisplayLabel = #1057#1086#1073#1099#1090#1080#1077
      FieldName = 'Val'
      Size = 100
    end
    object dsEventEnable: TBooleanField
      DisplayLabel = #1054#1087#1086#1074#1077#1097#1072#1090#1100
      FieldName = 'Enable'
    end
  end
  object dsReminder: TADODataSet
    Connection = Connect
    CursorType = ctStatic
    BeforePost = dsReminderBeforePost
    CommandText = 'Select * from Reminder'
    DataSource = dsrSubject
    Parameters = <>
    Left = 536
    Top = 184
    object dsReminderID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object dsReminderSubjectID: TIntegerField
      FieldName = 'SubjectID'
      Visible = False
    end
    object dsReminderDate1: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1053#1072#1095#1072#1083#1072
      DisplayWidth = 11
      FieldName = 'Date1'
    end
    object dsReminderDate2: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1047#1072#1074#1077#1088#1096#1077#1085#1080#1103
      DisplayWidth = 13
      FieldName = 'Date2'
    end
    object dsReminderVal: TWideStringField
      DisplayLabel = #1053#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      DisplayWidth = 47
      FieldName = 'Val'
      Size = 80
    end
    object dsReminderPriority: TIntegerField
      DisplayLabel = #1055#1088#1080#1086#1088#1080#1090#1077#1090
      DisplayWidth = 10
      FieldName = 'Priority'
    end
    object dsReminderStatus: TIntegerField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      DisplayWidth = 10
      FieldName = 'Status'
    end
  end
  object dsImage: TADODataSet
    Connection = Connect
    CursorType = ctStatic
    BeforePost = dsImageBeforePost
    AfterScroll = dsImageAfterScroll
    CommandText = 'Select * From [Image]'
    DataSource = dsrSubject
    Parameters = <>
    Left = 608
    Top = 184
    object dsImageID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object dsImageSubjectID: TIntegerField
      FieldName = 'SubjectID'
      Visible = False
    end
    object dsImageVal: TBlobField
      FieldName = 'Val'
      Visible = False
    end
    object dsImageName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'Name'
      Size = 50
    end
    object dsImageFileName: TWideStringField
      FieldName = 'FileName'
      Visible = False
      Size = 255
    end
  end
  object dsrEvent: TDataSource
    DataSet = dsEvent
    Left = 472
    Top = 208
  end
  object dsrReminder: TDataSource
    DataSet = dsReminder
    Left = 552
    Top = 208
  end
  object dsrImage: TDataSource
    DataSet = dsImage
    Left = 632
    Top = 208
  end
  object dsContact: TADODataSet
    Connection = Connect
    CursorType = ctStatic
    BeforePost = dsContactBeforePost
    AfterPost = dsContactAfterPost
    CommandText = 'select * from Contact'
    DataSource = dsrSubject
    Parameters = <>
    Left = 379
    Top = 184
    object dsContactID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object dsContactContactTypeID: TIntegerField
      FieldName = 'ContactTypeID'
      Visible = False
    end
    object dsContactSubjectID: TIntegerField
      FieldName = 'SubjectID'
      Visible = False
    end
    object dsContactluType: TStringField
      DisplayLabel = #1058#1080#1087' '#1088#1077#1082#1074#1080#1079#1080#1090#1072
      FieldKind = fkLookup
      FieldName = 'luType'
      LookupDataSet = dsContactType
      LookupKeyFields = 'ID'
      LookupResultField = 'Val'
      KeyFields = 'ContactTypeID'
      Lookup = True
    end
    object dsContactVal: TWideStringField
      DisplayLabel = #1047#1085#1072#1095#1077#1085#1080#1077
      FieldName = 'Val'
      Size = 100
    end
  end
  object dsrContact: TDataSource
    DataSet = dsContact
    Left = 395
    Top = 208
  end
  object dsToday: TADODataSet
    Connection = Connect
    Parameters = <>
    Left = 264
    Top = 296
  end
  object dsrToday: TDataSource
    DataSet = dsToday
    Left = 288
    Top = 320
  end
  object qDatesHB: TADOQuery
    Connection = Connect
    Parameters = <>
    Left = 64
    Top = 336
  end
  object dsHolyday: TADODataSet
    Connection = Connect
    CommandText = 'Select * From Holyday'
    Parameters = <>
    Left = 384
    Top = 272
  end
  object dsrHolyday: TDataSource
    DataSet = dsHolyday
    Left = 400
    Top = 296
  end
  object dsToDoList: TADODataSet
    Connection = Connect
    CursorType = ctStatic
    BeforePost = dsToDoListBeforePost
    AfterPost = dsToDoListAfterPost
    CommandText = 'Select * From AToDo'
    Parameters = <>
    Left = 168
    Top = 392
    object dsToDoListID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object dsToDoListFinish: TBooleanField
      DisplayLabel = #1043#1086#1090#1086#1074#1086
      FieldName = 'Finish'
    end
    object dsToDoListDoDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1042#1099#1087#1086#1083#1085#1077#1085#1080#1103
      FieldName = 'DoDate'
    end
    object dsToDoListTitle: TWideStringField
      DisplayLabel = #1047#1072#1075#1086#1083#1086#1074#1086#1082
      FieldName = 'Title'
      Size = 50
    end
    object dsToDoListDesc: TWideMemoField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'Desc'
      Visible = False
      BlobType = ftWideMemo
    end
  end
  object dsrToDoList: TDataSource
    DataSet = dsToDoList
    Left = 192
    Top = 424
  end
  object dsVisits: TADODataSet
    Connection = Connect
    CursorType = ctStatic
    BeforePost = dsVisitsBeforePost
    CommandText = 'Select * From Visits'
    Parameters = <>
    Left = 264
    Top = 392
    object dsVisitsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object dsVisitsName: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'Name'
      Size = 100
    end
    object dsVisitsAdress: TWideStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      FieldName = 'Adress'
      Size = 100
    end
    object dsVisitsTelephon: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'Telephon'
      Size = 50
    end
    object dsVisitsEMail: TWideStringField
      DisplayLabel = 'E.Mail'
      FieldName = 'EMail'
      Size = 80
    end
    object dsVisitsAdditional: TWideMemoField
      DisplayLabel = #1055#1088#1086#1095#1077#1077
      FieldName = 'Additional'
      Visible = False
      BlobType = ftWideMemo
    end
  end
  object dsrVisits: TDataSource
    DataSet = dsVisits
    Left = 296
    Top = 424
  end
  object dsLinks: TADODataSet
    Connection = Connect
    CursorType = ctStatic
    BeforePost = dsLinksBeforePost
    CommandText = 'Select * From Link'
    Parameters = <>
    Left = 368
    Top = 392
    object dsLinksID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object dsLinksLinkName: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'LinkName'
      Size = 150
    end
    object dsLinksLinkVal: TWideStringField
      DisplayLabel = #1057#1089#1099#1083#1082#1072
      FieldName = 'LinkVal'
      Size = 255
    end
    object dsLinksDescription: TWideMemoField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      FieldName = 'Description'
      Visible = False
      BlobType = ftWideMemo
    end
  end
  object dsrLinks: TDataSource
    DataSet = dsLinks
    Left = 392
    Top = 424
  end
  object dsNoteBook: TADODataSet
    Connection = Connect
    CursorType = ctStatic
    BeforePost = dsNoteBookBeforePost
    CommandText = 'Select * from DataBook'
    Parameters = <>
    Left = 472
    Top = 392
    object dsNoteBookID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object dsNoteBookADate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'ADate'
    end
    object dsNoteBookDesc: TWideStringField
      DisplayLabel = #1047#1072#1075#1086#1083#1086#1074#1086#1082
      FieldName = 'Desc'
      Size = 50
    end
    object dsNoteBookAText: TWideMemoField
      FieldName = 'AText'
      Visible = False
      BlobType = ftWideMemo
    end
  end
  object dsrNoteBook: TDataSource
    DataSet = dsNoteBook
    Left = 504
    Top = 424
  end
end

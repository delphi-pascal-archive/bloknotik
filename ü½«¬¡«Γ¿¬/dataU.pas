unit dataU;

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs, Forms, DateUtils;

type
  Tdata = class(TDataModule)
    Connect: TADOConnection;
    dsSubject: TADODataSet;
    dsrSubject: TDataSource;
    dsSubjectID: TAutoIncField;
    dsSubjectFIO: TWideStringField;
    dsSubjectDate1: TDateTimeField;
    dsSubjectDate2: TDateTimeField;
    dsSubjectComment: TWideMemoField;
    qExistsSubjectCategoryInList: TADOQuery;
    dsSubjectCategoryList: TADODataSet;
    dsrSubjectCategoryList: TDataSource;
    dsSubjectCategory: TADODataSet;
    dsSubjectCategoryID: TAutoIncField;
    dsSubjectCategoryVal: TWideStringField;
    dsrSubjectCategory: TDataSource;
    dsSubjectCategoryListID: TAutoIncField;
    dsSubjectCategoryListSubjectCategoryID: TIntegerField;
    dsSubjectCategoryListSubjectID: TIntegerField;
    dsSubjectCategoryListEnable: TBooleanField;
    qTD: TADOQuery;
    dsContactType: TADODataSet;
    dsContactTypeID: TAutoIncField;
    dsContactTypeVal: TWideStringField;
    dsrContactType: TDataSource;
    dsEvent: TADODataSet;
    dsReminder: TADODataSet;
    dsImage: TADODataSet;
    dsrEvent: TDataSource;
    dsrReminder: TDataSource;
    dsrImage: TDataSource;
    dsContact: TADODataSet;
    dsrContact: TDataSource;
    dsContactID: TAutoIncField;
    dsContactContactTypeID: TIntegerField;
    dsContactSubjectID: TIntegerField;
    dsContactVal: TWideStringField;
    dsEventID: TAutoIncField;
    dsEventSubjectID: TIntegerField;
    dsEventDateEvent: TDateTimeField;
    dsEventVal: TWideStringField;
    dsEventEnable: TBooleanField;
    dsReminderID: TAutoIncField;
    dsReminderSubjectID: TIntegerField;
    dsReminderDate1: TDateTimeField;
    dsReminderDate2: TDateTimeField;
    dsReminderVal: TWideStringField;
    dsReminderPriority: TIntegerField;
    dsReminderStatus: TIntegerField;
    dsImageID: TAutoIncField;
    dsImageSubjectID: TIntegerField;
    dsImageVal: TBlobField;
    dsImageName: TWideStringField;
    dsImageFileName: TWideStringField;
    dsContactluType: TStringField;
    dsToday: TADODataSet;
    dsrToday: TDataSource;
    qDatesHB: TADOQuery;
    dsHolyday: TADODataSet;
    dsrHolyday: TDataSource;
    dsToDoList: TADODataSet;
    dsrToDoList: TDataSource;
    dsToDoListID: TAutoIncField;
    dsToDoListFinish: TBooleanField;
    dsToDoListDoDate: TDateTimeField;
    dsToDoListTitle: TWideStringField;
    dsToDoListDesc: TWideMemoField;
    dsVisits: TADODataSet;
    dsrVisits: TDataSource;
    dsVisitsID: TAutoIncField;
    dsVisitsName: TWideStringField;
    dsVisitsAdress: TWideStringField;
    dsVisitsTelephon: TWideStringField;
    dsVisitsEMail: TWideStringField;
    dsVisitsAdditional: TWideMemoField;
    dsLinks: TADODataSet;
    dsrLinks: TDataSource;
    dsLinksID: TAutoIncField;
    dsLinksLinkName: TWideStringField;
    dsLinksLinkVal: TWideStringField;
    dsLinksDescription: TWideMemoField;
    dsNoteBook: TADODataSet;
    dsrNoteBook: TDataSource;
    dsNoteBookID: TAutoIncField;
    dsNoteBookADate: TDateTimeField;
    dsNoteBookDesc: TWideStringField;
    dsNoteBookAText: TWideMemoField;
    procedure dsSubjectAfterPost(DataSet: TDataSet);
    procedure dsSubjectBeforeDelete(DataSet: TDataSet);
    procedure dsImageAfterScroll(DataSet: TDataSet);
    procedure dsSubjectAfterDelete(DataSet: TDataSet);
    procedure dsSubjectAfterEdit(DataSet: TDataSet);
    procedure dsEventAfterScroll(DataSet: TDataSet);
    procedure dsEventAfterPost(DataSet: TDataSet);
    procedure dsEventBeforePost(DataSet: TDataSet);
    procedure dsContactBeforePost(DataSet: TDataSet);
    procedure dsReminderBeforePost(DataSet: TDataSet);
    procedure dsContactAfterPost(DataSet: TDataSet);
    procedure dsImageBeforePost(DataSet: TDataSet);
    procedure dsToDoListBeforePost(DataSet: TDataSet);
    procedure dsToDoListAfterPost(DataSet: TDataSet);
    procedure dsVisitsBeforePost(DataSet: TDataSet);
    procedure dsLinksBeforePost(DataSet: TDataSet);
    procedure dsNoteBookBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure OpenData(); //процедура открывает все датаСеты... так же выставляет запросы.
    Procedure OpenEvents(Date:TDateTime); //Отобразим события заданной даты.
  end;

var
  data: Tdata;

implementation

Uses fmMain, fmImageViewU, fmEventU, fmDataU, fmReminderU;

{$R *.dfm}

procedure Tdata.dsContactAfterPost(DataSet: TDataSet);
begin
  dsContactType.Requery;
  dsContact.Requery;
  dsContact.Last;
end;

procedure Tdata.dsContactBeforePost(DataSet: TDataSet);
begin
  dsContactSubjectID.Value := fmData.ACurrentSubID
end;

procedure Tdata.dsEventAfterPost(DataSet: TDataSet);
begin
  fmEvent.ShowDetails;
end;

procedure Tdata.dsEventAfterScroll(DataSet: TDataSet);
begin
  fmEvent.ShowDetails;
end;

procedure Tdata.dsEventBeforePost(DataSet: TDataSet);
begin
  dsEventSubjectID.Value := fmEvent.ACurrentSubID;
end;

procedure Tdata.dsImageAfterScroll(DataSet: TDataSet);
begin
  fmImageView.ShowPicture; //При скролле загружаем новую картинку из базы.
end;

procedure Tdata.dsImageBeforePost(DataSet: TDataSet);
begin
  dsImageSubjectID.Value := fmImageView.ACurrentSubID;
end;

procedure Tdata.dsLinksBeforePost(DataSet: TDataSet);
begin
  if dsLinksLinkName.IsNull then
    dsLinksLinkName.Value := '<Новая ссылка>';
end;

procedure Tdata.dsNoteBookBeforePost(DataSet: TDataSet);
begin
  If dsNoteBookADate.IsNull then
    dsNoteBookADate.Value := DateOf(Now);
  if dsNoteBookDesc.IsNull then
    dsNoteBookDesc.Value := '<Новая запись>';
end;

procedure Tdata.dsReminderBeforePost(DataSet: TDataSet);
begin
  dsReminderSubjectID.Value := fmReminder.ACurrentSubID;
end;

procedure Tdata.dsSubjectAfterDelete(DataSet: TDataSet);
begin
  fmMainWin.LoadHB();
end;

procedure Tdata.dsSubjectAfterEdit(DataSet: TDataSet);
begin
  fmMainWin.LoadHB();
end;

procedure Tdata.dsSubjectAfterPost(DataSet: TDataSet);
begin
  fmMainWin.RefreshSBCategoryList;
  fmMainWin.LoadHB();
{  Try
    if (Assigned(data)) then
      data.OpenEvents(fmMainWin.smcCalendar.CalendarDate);
//      fmMainWin.smcCalendar.PrevMonth;// CalendarDate := fmMainWin.smcCalendar.CalendarDate;
//      fmMainWin.smcCalendar.NextMonth;
  Except

  End;}
end;

////////////////////////////////////////////////////////////////////////////////
//
//  Прежде чем удалить субъект, удалим все привязанные к нему записи.
//
procedure Tdata.dsSubjectBeforeDelete(DataSet: TDataSet);
begin
  If qTD.Active then
    qTD.Close;
  qTD.SQL.Clear;
  qTD.SQL.Add('delete from [Event] where SubjectID = '+IntToStr(dsSubjectID.Value)+';');
  qTD.ExecSQL;
  qTD.Close;

  qTD.SQL.Clear;
  qTD.SQL.Add('delete from [Reminder] where SubjectID = '+IntToStr(dsSubjectID.Value)+';');
  qTD.ExecSQL;
  qTD.Close;

  qTD.SQL.Clear;
  qTD.SQL.Add('delete from [Contact] where SubjectID = '+IntToStr(dsSubjectID.Value)+';');
  qTD.ExecSQL;
  qTD.Close;

  qTD.SQL.Clear;
  qTD.SQL.Add('delete from [SubjectCategoryList] where SubjectID = '+IntToStr(dsSubjectID.Value)+';');
  qTD.ExecSQL;
  qTD.Close;

  qTD.SQL.Clear;
  qTD.SQL.Add('delete from [Image] where SubjectID = '+IntToStr(dsSubjectID.Value)+';');
  qTD.ExecSQL;
  qTD.Close;
end;

procedure Tdata.dsToDoListAfterPost(DataSet: TDataSet);
begin
  fmMainWin.LoadHB();
end;

procedure Tdata.dsToDoListBeforePost(DataSet: TDataSet);
begin
  if dsToDoListFinish.IsNull then
    dsToDoListFinish.Value := False;
  if dsToDoListDoDate.IsNull then
    dsToDoListDoDate.Value := DateOf(Now);
end;

procedure Tdata.dsVisitsBeforePost(DataSet: TDataSet);
begin
  if dsVisitsName.IsNull then
    dsVisitsName.Value := '<Новая визитка>';
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ПРОЦЕДУРА: OpenData
//
//  НАЗНАЧЕНИЕ:
//    процедура подключается к базе, открывает все таблицы.
//
procedure Tdata.OpenData;
Var
  I: Integer;
  DateFil1{, DateFil2}: String;
begin
  //Сформируем запрос к датаСету Тудей.
  DateFil1 := DateToStr(Now);
  dsToday.CommandText := '';
  if fmMainWin.cbShowEvents.Checked then
    dsToday.CommandText :=
    'select 0 as ''Type'', Subj.FIO, Ev.Val, Ev.DateEvent as ''Date'', SubjectID, Ev.ID from Event Ev '+
    'Left Outer Join Subject Subj ON '+
    '(Subj.ID = Ev.SubjectID) '+
    'where Day(Ev.DateEvent) >= Day('+QuotedStr(DateFil1)+')  and Month(Ev.DateEvent) >= Month('+QuotedStr(DateFil1)+')  and '+
    'Day(Ev.DateEvent) <= Day('+QuotedStr(DateFil1)+') and Month(Ev.DateEvent) <= Month('+QuotedStr(DateFil1)+') and '+
    'Ev.Enable = True ';
  if fmMainWin.cbShowBirthday.Checked then
  begin
    if fmMainWin.cbShowEvents.Checked then
      dsToday.CommandText := dsToday.CommandText +
      'UNION ';
    dsToday.CommandText := dsToday.CommandText +
    'Select 1 as ''Type'', sb.FIO, ''День Рождения!'', sb.Date1 as ''Date'', ID, 0 from Subject sb '+
    'where Day(sb.Date1) >= Day('+QuotedStr(DateFil1)+') and Month(sb.Date1) >= Month('+QuotedStr(DateFil1)+') and '+
    'Day(sb.Date1) <= Day('+QuotedStr(DateFil1)+') and Month(sb.Date1) <= Month('+QuotedStr(DateFil1)+') ';
  end;
  if fmMainWin.cbShowReminder.Checked then
  begin
    if (fmMainWin.cbShowEvents.Checked) or (fmMainWin.cbShowBirthday.Checked) then
      dsToday.CommandText := dsToday.CommandText +
      'UNION ';
    dsToday.CommandText := dsToday.CommandText +
    'Select '+
    '3 as ''Type'', Subjt.FIO, Rem.Val, Rem.Date2 as ''Date'', SubjectID, Rem.ID from Reminder Rem '+
    'Left Outer Join Subject Subjt ON '+
    '(Subjt.ID = Rem.SubjectID) '+
    'where Rem.Status <> 3 ';
  if fmMainWin.cbShowToDoList.Checked then
  begin
    if (fmMainWin.cbShowEvents.Checked) or (fmMainWin.cbShowBirthday.Checked) or (fmMainWin.cbShowReminder.Checked) then
      dsToday.CommandText := dsToday.CommandText +
      'UNION ';
    dsToday.CommandText := dsToday.CommandText +
    'Select '+
    '4 as ''Type'', ''Есть дело'', Title, DoDate as ''Date'', ID, 0 from AToDo  '+
    'where Finish <> True ';
  end;
  end;

//  OpenEvents(Now());

  //Подключимся к базе данных
  Try
  if Connect.Connected then
    Connect.Connected := False;
  Connect.ConnectionString := Format('Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;Persist Security Info=False',[ExtractFilePath(Application.ExeName)+'data\mdata.mdb']);
  Connect.Open;
  Except
      ShowMessage('Не обнаружена База Данных!');
      Application.Terminate;
  End;
//Opens DataSets... (Rus not work!!! O_o)
  for I := 0 to data.ComponentCount-1 do
    if (Components[I].ClassName = 'TADODataSet') and (not (Components[I] as TADODataSet).Active) then
      (Components[I] as TADODataSet).Open;
  dsToday.Fields[0].DisplayLabel := 'Тип';
  dsToday.Fields[1].DisplayLabel := 'Ф.И.О.';
  dsToday.Fields[2].DisplayLabel := 'Описание';
  dsToday.Fields[3].DisplayLabel := 'Дата';
  dsToday.Fields[4].Visible := False;
  dsToday.Fields[5].Visible := False;
  fmMainWin.dbgToDayInfo.Columns[0].MaxWidth := 22;
  fmMainWin.dbgToDayInfo.Columns[0].MinWidth := 22;
  fmMainWin.dbgToDayInfo.Columns[3].MaxWidth := 68;
  fmMainWin.dbgToDayInfo.Columns[3].MinWidth := 68;
  fmMainWin.dbgToDayInfo.Columns[0].ImageList := fmMainWin.ilToday;
end;

procedure Tdata.OpenEvents(Date: TDateTime);
var
  StrDate: String;
begin
  StrDate := DateTimeToStr(Date);
  if dsToday.Active then
    dsToday.Close;
  dsToday.CommandText := '';
    if fmMainWin.cbShowEvents.Checked then
//      dsToday.CommandText := dsToday.CommandText +
      dsToday.CommandText :=
      'select 0 as ''Type'', Subj.FIO, Ev.Val, Ev.DateEvent as ''Date'', SubjectID, Ev.ID from Event Ev '+
      'Left Outer Join Subject Subj ON '+
      '(Subj.ID = Ev.SubjectID) '+
      'where Day(Ev.DateEvent) >= Day('+QuotedStr(StrDate)+')  and Month(Ev.DateEvent) >= Month('+QuotedStr(StrDate)+')  and '+
      'Day(Ev.DateEvent) <= Day('+QuotedStr(StrDate)+') and Month(Ev.DateEvent) <= Month('+QuotedStr(StrDate)+') and '+
      'Ev.Enable = True ';
    if fmMainWin.cbShowBirthday.Checked then
    begin
      if fmMainWin.cbShowEvents.Checked then
        dsToday.CommandText := dsToday.CommandText +
        'UNION ';
      dsToday.CommandText := dsToday.CommandText +
      'Select 1 as ''Type'', sb.FIO, ''День Рождения!'', sb.Date1 as ''Date'', ID, 0 from Subject sb '+
      'where Day(sb.Date1) >= Day('+QuotedStr(StrDate)+') and Month(sb.Date1) >= Month('+QuotedStr(StrDate)+') and '+
      'Day(sb.Date1) <= Day('+QuotedStr(StrDate)+') and Month(sb.Date1) <= Month('+QuotedStr(StrDate)+') ';
    end;
    if fmMainWin.cbShowReminder.Checked then
    begin
      if (fmMainWin.cbShowEvents.Checked) or (fmMainWin.cbShowBirthday.Checked) then
        dsToday.CommandText := dsToday.CommandText +
        'UNION ';
      dsToday.CommandText := dsToday.CommandText +
      'Select '+
      '3 as ''Type'', Subjt.FIO, Rem.Val, Rem.Date2 as ''Date'', SubjectID, Rem.ID from Reminder Rem '+
      'Left Outer Join Subject Subjt ON '+
      '(Subjt.ID = Rem.SubjectID) '+
      'where Rem.Status <> 3 ';
    end;
    if fmMainWin.cbShowToDoList.Checked then
    begin
      if (fmMainWin.cbShowEvents.Checked) or (fmMainWin.cbShowBirthday.Checked) or (fmMainWin.cbShowReminder.Checked) then
        dsToday.CommandText := dsToday.CommandText +
        'UNION ';
      dsToday.CommandText := dsToday.CommandText +
      'Select '+
      '4 as ''Type'', ''Есть дело'', Title, DoDate as ''Date'', ID, 0 from AToDo  '+
      'where Finish <> True ';
    end;
  if not (dsToday.CommandText = '') then
  begin
    dsToday.Open;
    dsToday.Fields[0].DisplayLabel := 'Тип';
    dsToday.Fields[1].DisplayLabel := 'Ф.И.О.';
    dsToday.Fields[2].DisplayLabel := 'Описание';
    dsToday.Fields[3].DisplayLabel := 'Дата';
    dsToday.Fields[4].Visible := False;
    dsToday.Fields[5].Visible := False;
    fmMainWin.dbgToDayInfo.Columns[0].MaxWidth := 22;
    fmMainWin.dbgToDayInfo.Columns[0].MinWidth := 22;
    fmMainWin.dbgToDayInfo.Columns[3].MaxWidth := 68;
    fmMainWin.dbgToDayInfo.Columns[3].MinWidth := 68;
    fmMainWin.dbgToDayInfo.Columns[0].ImageList := fmMainWin.ilToday;
  end;

  if (dsToday.RecordCount < 1) or (dsToday.CommandText = '') then
    fmMainWin.pDeskForKalendar.Visible := True
  else
    fmMainWin.pDeskForKalendar.Visible := False;

  fmMainWin.spTitleCalendar.Caption := 'Календарь событий [все события за '+
  FormatDateTime('dd.mm.yyyy',fmMainWin.smcCalendar.CalendarDate)+' ]';
end;

end.

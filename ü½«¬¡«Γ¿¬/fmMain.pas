// СПИСОК ВАЖНЫХ ЗАДАЧЬ !!!
// 1. Обязательно после закрытия формочек "Напоминания", "События", "Праздники"
//    необходимо перезагружать qDatesHB и qRemDates!!!!

unit fmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, Grids, DBGrids, ComCtrls, ToolWin, ImgList,
  Buttons, GIFImg, DBCtrls, GridsEh, DBGridEh, Mask, DBCtrlsEh, DateUtils,
  sPanel, sMonthCalendar, sSkinManager, sSpeedButton, sBitBtn, sToolBar,
  sPageControl, sMaskEdit, sCustomComboEdit, sTooledit, DB, ShellAPi, xSysF;

type
  TfmMainWin = class(TForm)
    MainMenu: TMainMenu;
    miProgramm: TMenuItem;
    ilMainImages: TImageList;
    miOptions: TMenuItem;
    miData: TMenuItem;
    miImport: TMenuItem;
    miExport: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miSubject: TMenuItem;
    miSubData: TMenuItem;
    miEvent: TMenuItem;
    miReminder: TMenuItem;
    miFoto: TMenuItem;
    miCatalog: TMenuItem;
    miSubjectGroups: TMenuItem;
    miDataTypes: TMenuItem;
    miHolydays: TMenuItem;
    miLinks: TMenuItem;
    miWindow: TMenuItem;
    miToDay: TMenuItem;
    miFilters: TMenuItem;
    miInfo: TMenuItem;
    miAboutProgramm: TMenuItem;
    miHelp: TMenuItem;
    miAvtor: TMenuItem;
    miPrint: TMenuItem;
    ilForMainMenu: TImageList;
    miSQLRun: TMenuItem;
    ilToday: TImageList;
    pmSubjectAction: TPopupMenu;
    pmiContact: TMenuItem;
    pmiEvent: TMenuItem;
    pmiReminders: TMenuItem;
    pmiFoto: TMenuItem;
    N2: TMenuItem;
    pmiSort: TMenuItem;
    N3: TMenuItem;
    pmiAdd: TMenuItem;
    pmiEdit: TMenuItem;
    pmiView: TMenuItem;
    mpiDelete: TMenuItem;
    pcMainDialogs: TsPageControl;
    tsCalendar: TsTabSheet;
    tsSubjectList: TsTabSheet;
    dbgSubject: TDBGridEh;
    tbSubjectActions: TsToolBar;
    btnmAdd: TToolButton;
    btnmEdit: TToolButton;
    btnmView: TToolButton;
    btnmDelete: TToolButton;
    pReminders: TPanel;
    pCategorySelect: TPanel;
    Bevel3: TBevel;
    edtCategoryList: TEdit;
    btnClearCategoryFiltr: TBitBtn;
    btnSelectCategory: TBitBtn;
    ToolButton1: TToolButton;
    btnSort: TToolButton;
    ToolButton3: TToolButton;
    btnContacts: TToolButton;
    btnEvents: TToolButton;
    btnReminders: TToolButton;
    btnfoto: TToolButton;
    spTitleCalendar: TsPanel;
    smcCalendar: TsMonthCalendar;
    dbgToDayInfo: TDBGridEh;
    pMainSelector: TPanel;
    btnCalendarShow: TSpeedButton;
    btnPipllsShow: TSpeedButton;
    btnQKontactShow: TSpeedButton;
    pDeskForKalendar: TPanel;
    tsQKontakts: TsTabSheet;
    btnLinkShow: TSpeedButton;
    btnNotePad: TSpeedButton;
    btnToDoShow: TSpeedButton;
    tsLinks: TsTabSheet;
    tsNotePad: TsTabSheet;
    tsToDoList: TsTabSheet;
    cbShowBirthday: TCheckBox;
    cbShowEvents: TCheckBox;
    cbShowReminder: TCheckBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    dbgToDoList: TDBGridEh;
    pToDoControls: TsPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeTitleToDo: TDBEditEh;
    dbmDescToDo: TDBMemo;
    dbdtToDoDate: TDBDateTimeEditEh;
    dbcbToDoFinish: TDBCheckBoxEh;
    tbToDoListControl: TsToolBar;
    btnAddToDo: TToolButton;
    btnDeleteToDo: TToolButton;
    btnSaveToDo: TToolButton;
    Image4: TImage;
    cbShowToDoList: TCheckBox;
    dbgVisits: TDBGridEh;
    pQKontaktControls: TsPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbeVisName: TDBEditEh;
    dbeVisAdres: TDBEditEh;
    dbeVisEMail: TDBEditEh;
    dbeVisTelephon: TDBEditEh;
    dbmVisAdditional: TDBMemo;
    tbVisControls: TsToolBar;
    btnAddVisit: TToolButton;
    btnSaveVisit: TToolButton;
    btnDeleteVisit: TToolButton;
    tbLinkControls: TsToolBar;
    btnNewLink: TToolButton;
    btnSaveLink: TToolButton;
    btnDeleteLink: TToolButton;
    pLinkControls: TsPanel;
    dbgLinks: TDBGridEh;
    btnGoToLink: TToolButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbeLinkName: TDBEditEh;
    dbeLinkVal: TDBEditEh;
    dbMLinkDesc: TDBMemo;
    pDateBookControls: TsPanel;
    Label12: TLabel;
    Label13: TLabel;
    dbdDataBookDate: TDBDateTimeEditEh;
    dbeDataBookTitle: TDBEditEh;
    Label14: TLabel;
    dbmDataBook: TDBMemo;
    sToolBar1: TsToolBar;
    btnAddNotePost: TToolButton;
    btnSaveNotePost: TToolButton;
    btnDeleteNotePost: TToolButton;
    DBGridEh1: TDBGridEh;
    procedure btnAddClick(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure miFotoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miSubjectGroupsClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure miDataTypesClick(Sender: TObject);
    procedure miSubDataClick(Sender: TObject);
    procedure miEventClick(Sender: TObject);
    procedure miReminderClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure miToDayClick(Sender: TObject);
    procedure miAboutProgrammClick(Sender: TObject);
    procedure miAvtorClick(Sender: TObject);
    procedure btnSelectCategoryClick(Sender: TObject);
    procedure btnClearCategoryFiltrClick(Sender: TObject);
    procedure miSQLRunClick(Sender: TObject);
    procedure dbgSubjectGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure pmiSortClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure smcCalendarGetCellParams(Sender: TObject; Date: TDateTime;
      AFont: TFont; var Background: TColor);
    procedure smcCalendarChange(Sender: TObject);
    procedure dbgToDayInfoDblClick(Sender: TObject);
    procedure btnContactsClick(Sender: TObject);
    procedure btnEventsClick(Sender: TObject);
    procedure btnRemindersClick(Sender: TObject);
    procedure btnfotoClick(Sender: TObject);
    procedure btnCalendarShowClick(Sender: TObject);
    procedure cbShowBirthdayClick(Sender: TObject);
    procedure btnAddToDoClick(Sender: TObject);
    procedure btnDeleteToDoClick(Sender: TObject);
    procedure btnSaveToDoClick(Sender: TObject);
    procedure dbgToDayInfoGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure btnAddVisitClick(Sender: TObject);
    procedure btnSaveVisitClick(Sender: TObject);
    procedure btnDeleteVisitClick(Sender: TObject);
    procedure btnNewLinkClick(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure btnDeleteLinkClick(Sender: TObject);
    procedure btnGoToLinkClick(Sender: TObject);
    procedure btnAddNotePostClick(Sender: TObject);
    procedure btnSaveNotePostClick(Sender: TObject);
    procedure btnDeleteNotePostClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure RefreshSBCategoryList(); //Обновляет список категорий для конкретного субъекта.
    Procedure LoadHB(); //Открывает запрос содержащий все дни рождения.
    Function AddZeroToDateItem(Val:Integer): String;//для соблюдения формата даты
    procedure ShowCurrentTS(ATag: Integer);
    procedure SetCurrentTS(ATag: Integer);
    procedure SetWinPos(ALeft,ATop: Integer);
    procedure GetWinPos();
  end;

var
  fmMainWin: TfmMainWin;
  NowStart: Boolean;
  AppPath: String; //Директория от куда запущена программа.
  MainQuerySQL: String; //Для сохранения оригенала запроса перед сортировкой данных.
  ADays: String; //Массив с днями, которые необходимо выделить жирным на календаре.

implementation

uses fmEditU, fmViewSubjectU, fmImageViewU, dataU, fmCatalogU, fmDataU, fmEventU,
     fmReminderU, fmPrgVerU, fmAboutAvtorU, fmSelectCategorysU, fmSQLViewU, fmSortMainU;

{$R *.dfm}

function TfmMainWin.AddZeroToDateItem(Val: Integer): String;
begin
  Result := '';
  if Val < 10 then
    Result := '0'+IntToStr(Val)
  else
    Result := IntToStr(Val);
end;

procedure TfmMainWin.btnAddClick(Sender: TObject);
begin
  fmEdit.AddNewSubject;
end;

procedure TfmMainWin.btnAddToDoClick(Sender: TObject);
begin
  data.dsToDoList.Last;
  data.dsToDoList.Insert;
  data.dsToDoList.Post;
end;

procedure TfmMainWin.btnAddVisitClick(Sender: TObject);
begin
  data.dsVisits.Last;
  data.dsVisits.Insert;
  data.dsVisits.Post;
end;

procedure TfmMainWin.btnCalendarShowClick(Sender: TObject);
begin
  ShowCurrentTS((Sender as TSpeedButton).Tag);
end;

procedure TfmMainWin.btnClearCategoryFiltrClick(Sender: TObject);
begin
  Data.dsSubject.Close;
  Data.dsSubject.CommandText := 'Select *, Day(Date1) as DDay, Month(Date1) as MMonth, Year(Date1) as YYear  from Subject';
  edtCategoryList.Text := 'Все категории';
  Data.dsSubject.Open;
end;

procedure TfmMainWin.btnContactsClick(Sender: TObject);
begin
//  fmData.ShowModal;
  fmData.OpenKontakt(data.dsSubjectID.Value);
end;

procedure TfmMainWin.btnDeleteClick(Sender: TObject);
begin
  if data.dsSubject.RecordCount = 0 then
    exit;
  If Application.MessageBox(PChar('Вы действительно хотите удалить запись '+
  QuotedStr(data.dsSubjectFIO.AsString) + '? '+#13+'Вмести с ней вы потеряете все контакты и напоминания! Отменить действие будет невозможно!'), 'Подтверждение',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
  data.dsSubject.Delete;
end;

procedure TfmMainWin.btnDeleteLinkClick(Sender: TObject);
begin
  if data.dsLinks.RecordCount = 0 then
    exit;
  If Application.MessageBox(PChar('Вы действительно хотите удалить запись? '+#13+
  'Отменить действие будет невозможно!'), 'Подтверждение',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
  data.dsLinks.Delete;
end;

procedure TfmMainWin.btnDeleteNotePostClick(Sender: TObject);
begin
  if data.dsNoteBook.RecordCount = 0 then
    exit;
  If Application.MessageBox(PChar('Вы действительно хотите удалить запись? '+#13+
  'Отменить действие будет невозможно!'), 'Подтверждение',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
  data.dsNoteBook.Delete;
end;

procedure TfmMainWin.btnDeleteToDoClick(Sender: TObject);
begin
  if data.dsToDoList.RecordCount = 0 then
    exit;
  If Application.MessageBox(PChar('Вы действительно хотите удалить запись? '+#13+
  'Отменить действие будет невозможно!'), 'Подтверждение',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
  data.dsToDoList.Delete;
end;

procedure TfmMainWin.btnDeleteVisitClick(Sender: TObject);
begin
  if data.dsVisits.RecordCount = 0 then
    exit;
  If Application.MessageBox(PChar('Вы действительно хотите удалить запись? '+#13+
  'Отменить действие будет невозможно!'), 'Подтверждение',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
  data.dsVisits.Delete;
end;

procedure TfmMainWin.btnEditClick(Sender: TObject);
begin
  fmEdit.EditSubject;
end;

procedure TfmMainWin.btnEventsClick(Sender: TObject);
begin
//  fmEvent.ShowModal;
  fmEvent.OpenEvent(data.dsSubjectID.Value);
end;

procedure TfmMainWin.btnfotoClick(Sender: TObject);
begin
  fmImageView.OpenPictViewer(data.dsSubjectID.Value);
end;

procedure TfmMainWin.btnGoToLinkClick(Sender: TObject);
begin
  ShellExecute(GetDesktopWindow(), 'open',  pChar(data.dsLinksLinkVal.AsString), '', '', SW_SHOWDEFAULT);
end;

procedure TfmMainWin.btnNewLinkClick(Sender: TObject);
begin
  data.dsLinks.Last;
  data.dsLinks.Insert;
  data.dsLinks.Post;
end;

procedure TfmMainWin.btnRemindersClick(Sender: TObject);
begin
  fmReminder.OpenReminder(data.dsSubjectID.Value);
end;

procedure TfmMainWin.btnSaveLinkClick(Sender: TObject);
begin
  if data.dsLinks.State in [dsInsert, dsEdit] then
    data.dsLinks.Post;
end;

procedure TfmMainWin.btnSaveNotePostClick(Sender: TObject);
begin
  if data.dsNoteBook.State in [dsInsert, dsEdit] then
    data.dsNoteBook.Post;
end;

procedure TfmMainWin.btnSaveToDoClick(Sender: TObject);
begin
  if data.dsToDoList.State in [dsInsert, dsEdit] then
    data.dsToDoList.Post;
end;

procedure TfmMainWin.btnSaveVisitClick(Sender: TObject);
begin
  if data.dsVisits.State in [dsInsert, dsEdit] then
    data.dsVisits.Post;
end;

procedure TfmMainWin.btnSelectCategoryClick(Sender: TObject);
var
  pt:TPoint;
begin
  pt.X:=btnSelectCategory.Left;
  pt.Y:=btnSelectCategory.Top+btnSelectCategory.Height;
  pt.Y := pt.Y + pcMainDialogs.TabHeight + tbSubjectActions.Height{ + 26}+6;
  pt:=ClientToScreen(pt);
  fmSelectCategorys.Left := pt.X;
  fmSelectCategorys.Top := pt.Y;
  fmSelectCategorys.ShowModal;
end;

procedure TfmMainWin.btnViewClick(Sender: TObject);
begin
  fmViewSubject.OpenView();
end;

procedure TfmMainWin.cbShowBirthdayClick(Sender: TObject);
var
  K: Integer;
begin
  K:=0;
  if cbShowBirthday.Checked then
    Inc(K);
  if cbShowEvents.Checked then
    Inc(K);
  if cbShowReminder.Checked then
    Inc(K);
  if cbShowToDoList.Checked then
    Inc(K);

  if K = 0  then
    begin
      (Sender as TCheckBox).Checked := True;
      exit;
    end;

  data.OpenEvents(smcCalendar.CalendarDate);
end;

procedure TfmMainWin.dbgSubjectGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (DayOf(data.dsSubjectDate1.AsDateTime) = DayOf(Now))and
     (MonthOf(data.dsSubjectDate1.AsDateTime) = MonthOf(Now))then
    Background := clYellow;
end;

procedure TfmMainWin.dbgToDayInfoDblClick(Sender: TObject);
begin
// 0-event
// 1-Subject HB
// 3-Reminder
// 4-ToDo

  case data.dsToday.Fields[0].AsInteger of
    0:      If data.dsSubject.Locate('ID',data.dsToday.Fields[4].Value,[]) then
              fmEvent.OpenEvent(data.dsToday.Fields[4].Value,data.dsToday.Fields[5].Value)
            else
              ShowMessage('Не могу открыть запись. Возможно стоит убрать фильтр по категориям.');
    1:      If data.dsSubject.Locate('ID',data.dsToday.Fields[4].Value,[]) then
              fmViewSubject.OpenView
            else
              ShowMessage('Не могу открыть запись. Возможно стоит убрать фильтр по категориям.');
    3:      If data.dsSubject.Locate('ID',data.dsToday.Fields[4].Value,[]) then
              fmReminder.OpenReminder(data.dsToday.Fields[4].Value,data.dsToday.Fields[5].Value);
//            else
//              ShowMessage('Не могу открыть запись. Возможно стоит убрать фильтр по категориям.');
    4:      begin
              tsToDoList.Show;
              data.dsToDoList.Locate('ID',data.dsToday.Fields[4].Value,[]);
              btnToDoShow.Down := True;
            end;
  end;
end;

procedure TfmMainWin.dbgToDayInfoGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (data.dsToday.Fields[0].AsInteger = 3) and
     (DateOf(data.dsToday.Fields[3].AsDateTime) = DateOf(smcCalendar.CalendarDate)) then
    Background := clYellow;
  if (data.dsToday.Fields[0].AsInteger = 4) and
     (DateOf(data.dsToday.Fields[3].AsDateTime) = DateOf(smcCalendar.CalendarDate)) then
    Background := clYellow;
end;

procedure TfmMainWin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetWinPos(Left,Top);
end;

procedure TfmMainWin.FormCreate(Sender: TObject);
begin
  NowStart := True;
  smcCalendar.CalendarDate := Now(); //Выставим текущую дату для календаря.
end;

procedure TfmMainWin.FormShow(Sender: TObject);
begin
  if NowStart then
    Data.OpenData; //Otkroem datSets
  if NowStart then
    begin
      LoadHB(); //Загрузим даты рождений в запрос для календарика.
    end;

  AppPath := ExtractFilePath(Application.ExeName); //Определим от куда запущены

  //Установим нужную закладку.
  SetCurrentTS(IntDataFromIni('General','ActivPage',AppPath+'Data\Settings.ini'));
  //Выставим окно в нужную часть экрана.
  GetWinPos();

  NowStart := False;
end;

procedure TfmMainWin.GetWinPos();
begin
  Left := IntDataFromIni('General','WinLeft',AppPath+'Data\Settings.ini');
  Top  := IntDataFromIni('General','WinTop',AppPath+'Data\Settings.ini');
end;

procedure TfmMainWin.LoadHB;
Var
  BufStr: String;
begin
  if data.qDatesHB.Active then
    data.qDatesHB.Close;
  data.qDatesHB.SQL.Clear;
  data.qDatesHB.SQL.Text := 'Select DISTINCT Date1 From Subject ' +
                             ' Union All '+
                             ' Select DISTINCT DateDo '+
                             ' From Holyday '+ //order by Day(DateDo), Month(DateDo) конфликт с DISTINCT
                             ' Union All '+
                             ' Select DISTINCT DateEvent ' +
                             ' From Event where Enable = true';
  data.qDatesHB.Open;
  if (data.qDatesHB.Active) and (data.qDatesHB.RecordCount > 0) then
    begin
      data.qDatesHB.First;
      ADays := '';
      while not data.qDatesHB.Eof do
        begin
           BufStr := AddZeroToDateItem(DayOf(data.qDatesHB.Fields[0].AsDateTime))+'.'+
           AddZeroToDateItem(MonthOf(data.qDatesHB.Fields[0].AsDateTime));
          if POS(BufStr,ADays)=0 then
            ADays := ADays + BufStr+'/';
          data.qDatesHB.Next;
        end;
    end;
  data.qDatesHB.Close;
  data.qDatesHB.SQL.Clear;
  data.qDatesHB.SQL.Text :=  ' Select DISTINCT DoDate '+
                             ' From AToDo where Finish = false';
  data.qDatesHB.Open;
  if (data.qDatesHB.Active) and (data.qDatesHB.RecordCount > 0) then
    begin
      data.qDatesHB.First;
      while not data.qDatesHB.Eof do
        begin
           BufStr := AddZeroToDateItem(DayOf(data.qDatesHB.Fields[0].AsDateTime))+'.'+
           AddZeroToDateItem(MonthOf(data.qDatesHB.Fields[0].AsDateTime))+'.'+
           IntToStr(YearOf(data.qDatesHB.Fields[0].AsDateTime));
          if POS(BufStr,ADays)=0 then
            ADays := ADays + BufStr+'/';
          data.qDatesHB.Next;
        end;
    end;
  smcCalendar.CalendarDate := smcCalendar.CalendarDate + 0.000000001; //И не существенно и вызываем OnChange()
end;

procedure TfmMainWin.miAboutProgrammClick(Sender: TObject);
begin
  fmPrgVer.ShowModal;
end;

procedure TfmMainWin.miAvtorClick(Sender: TObject);
begin
  fmAboutAvtor.ShowModal;
end;

procedure TfmMainWin.miDataTypesClick(Sender: TObject);
begin
//Вызовим справочник "Типы Реквизитов"
  fmCatalog.OpenCatalog('ContactType','Спавочник Типов Реквизитов');
  data.dsContactType.Requery;
end;

procedure TfmMainWin.miEventClick(Sender: TObject);
begin
  fmEvent.OpenEvent(data.dsSubjectID.Value);
end;

procedure TfmMainWin.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMainWin.miFotoClick(Sender: TObject);
begin
  fmImageView.OpenPictViewer(data.dsSubjectID.Value); //ShowModal;
end;

procedure TfmMainWin.miReminderClick(Sender: TObject);
begin
  fmReminder.OpenReminder(data.dsSubjectID.Value);
end;

procedure TfmMainWin.miSQLRunClick(Sender: TObject);
begin
  fmSQLView.ShowModal;
end;

procedure TfmMainWin.miSubDataClick(Sender: TObject);
begin
  fmData.OpenKontakt(data.dsSubjectID.Value);
end;

procedure TfmMainWin.miSubjectGroupsClick(Sender: TObject);
begin
//Вызовим справочник "Группы Субъектов"
  fmCatalog.OpenCatalog('SubjectCategory','Спавочник Категорий');
//  RefreshSBCategoryList; //категории видны не всегда, нет смысла тут их обновлять. при открытии подробностей обновиьтся по любому.
end;

procedure TfmMainWin.miToDayClick(Sender: TObject);
begin
  if miToDay.Checked then
    begin
      miToDay.Checked := False;
    end
  else
    begin
      miToDay.Checked := True;
    end;
end;

procedure TfmMainWin.pmiSortClick(Sender: TObject);
begin
  fmSortMain.ShowModal;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ПРОЦЕДУРА: RefreshSBCategoryList
//
//  НАЗНАЧЕНИЕ:
//    Обновляет список категорий субъектов, для активного субъекта.
//
procedure TfmMainWin.RefreshSBCategoryList;
begin
  With data do
    begin
      dsSubjectCategoryList.Close;
      dsSubjectCategoryList.Open;
      dsSubjectCategory.Close;
      dsSubjectCategory.Open;
      dsSubjectCategoryList.Last;
      dsSubjectCategory.First;
      While not dsSubjectCategory.Eof do //  Добавляем новые категории
        begin
          if qExistsSubjectCategoryInList.Active then
            qExistsSubjectCategoryInList.Close;   //  Формируем скрипт, для проверки, есть в списке такая категория
          qExistsSubjectCategoryInList.SQL.Clear; //  или её нужно создавать.
          qExistsSubjectCategoryInList.SQL.Add('Select * From SubjectCategoryList');
          qExistsSubjectCategoryInList.SQL.Add('Where SubjectID = ' + IntToStr(dsSubjectID.Value) + ' and');
          qExistsSubjectCategoryInList.SQL.Add('SubjectCategoryID = ' + IntToStr(dsSubjectCategoryID.Value));
          qExistsSubjectCategoryInList.Open;
          If qExistsSubjectCategoryInList.RecordCount < 1 then   //если такой категории ещё нет, создаем её.
            begin
              dsSubjectCategoryList.Append;
              dsSubjectCategoryListSubjectCategoryID.Value := dsSubjectCategoryID.Value;
              dsSubjectCategoryListEnable.Value := False; //по умолчанию субъект к данной категории не относится.
              dsSubjectCategoryList.Post;
            end;
          dsSubjectCategory.Next;
        end;

      dsSubjectCategoryList.First;
      While not dsSubjectCategoryList.Eof do //  Удаляем ненужные категории
        begin
          if qExistsSubjectCategoryInList.Active then
            qExistsSubjectCategoryInList.Close;
          qExistsSubjectCategoryInList.SQL.Clear;
          qExistsSubjectCategoryInList.SQL.Add('Select * From SubjectCategory');
          qExistsSubjectCategoryInList.SQL.Add('Where ID = ' + IntToStr(dsSubjectCategoryListSubjectCategoryID.Value)); //+ 'AND Phisical = ' + IntToStr(cbGroupSelect.ItemIndex));
          qExistsSubjectCategoryInList.Open;
          If qExistsSubjectCategoryInList.RecordCount < 1 then
            begin
              dsSubjectCategoryList.Delete;
              dsSubjectCategoryList.Prior;
            end;
          dsSubjectCategoryList.Next;
        end;
    end;
//  data.dsSubjectCategory.Requery;
//  data.dsSubjectCategoryList.Requery;
end;

procedure TfmMainWin.SetCurrentTS(ATag: Integer);
begin
  case ATag of
    0: begin
         tsCalendar.Show;
         btnCalendarShow.Down := True;
       end;
    1: begin
         tsSubjectList.Show;
         btnPipllsShow.Down := True;
       end;
    2: begin
         tsQKontakts.Show;
         btnQKontactShow.Down := True;
       end;
    3: begin
         tsLinks.Show;
         btnLinkShow.Down := True;
       end;
    4: begin
         tsNotePad.Show;
         btnNotePad.Down := True;
       end;
    5: begin
         tsToDoList.Show;
         btnToDoShow.Down := True;
       end;
  end;
end;

procedure TfmMainWin.SetWinPos(ALeft, ATop: Integer);
begin
  IntDataToIni('General','WinLeft',AppPath+'Data\Settings.ini',Left);
  IntDataToIni('General','WinTop',AppPath+'Data\Settings.ini',Top);
end;

procedure TfmMainWin.ShowCurrentTS(ATag: Integer);
begin
  case ATag of
    0: tsCalendar.Show;
    1: tsSubjectList.Show;
    2: tsQKontakts.Show;
    3: tsLinks.Show;
    4: tsNotePad.Show;
    5: tsToDoList.Show;
  end;
  IntDataToIni('General','ActivPage',AppPath+'Data\Settings.ini',ATag);
end;


procedure TfmMainWin.smcCalendarChange(Sender: TObject);
begin
  Try
    if (Assigned(data)) then
      data.OpenEvents(smcCalendar.CalendarDate);
  Except

  End;
end;

procedure TfmMainWin.smcCalendarGetCellParams(Sender: TObject;
  Date: TDateTime; AFont: TFont; var Background: TColor);
Var
  SearchStr: String;
begin
  //Подсветим на календаре даты когда будут дни рождения, события, праздники,
  SearchStr := '';
  SearchStr := AddZeroToDateItem(DayOf(Date))+'.'+AddZeroToDateItem(MonthOf(Date))+'.'+IntToStr(YearOf(Date));
  if POS(SearchStr,ADays) <> 0 then
  begin
    Background := clYellow;
    AFont.Color := clRed;
  end
  else
  begin
    SearchStr := '';
    SearchStr := AddZeroToDateItem(DayOf(Date))+'.'+AddZeroToDateItem(MonthOf(Date));
    if POS(SearchStr,ADays) <> 0 then
    begin
      Background := clYellow;
      AFont.Color := clRed;
    end
  end;
end;

procedure TfmMainWin.btnAddNotePostClick(Sender: TObject);
begin
  data.dsNoteBook.Last;
  data.dsNoteBook.Insert;
  data.dsNoteBook.Post;
end;

end.

unit fmEditU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, CheckLst, DB,
  ADODB, DBCtrlsEh, DateUtils;

type
  TfmEdit = class(TForm)
    dbeFIO: TDBEdit;
    lbFio: TLabel;
    lbDate1: TLabel;
    lbDate2: TLabel;
    Image1: TImage;
    BtnOk: TBitBtn;
    BtnCancel: TBitBtn;
    Image2: TImage;
    Image3: TImage;
    chlCategoryList: TCheckListBox;
    lbCategory: TLabel;
    Image5: TImage;
    Bevel2: TBevel;
    Bevel3: TBevel;
    dbmComment: TDBMemo;
    lbComment: TLabel;
    Image6: TImage;
    btnFoto: TBitBtn;
    btnReminder: TBitBtn;
    btnData: TBitBtn;
    btnEvent: TBitBtn;
    Bevel4: TBevel;
    qSomeOper: TADOQuery;
    cbMonth: TComboBox;
    cbDay: TComboBox;
    cbYear: TComboBox;
    cbMonth2: TComboBox;
    cbDay2: TComboBox;
    cbYear2: TComboBox;
    btnClearDate1: TBitBtn;
    btnClearDate2: TBitBtn;
    Image4: TImage;
    procedure FormShow(Sender: TObject);
    procedure chlCategoryListClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDataClick(Sender: TObject);
    procedure btnEventClick(Sender: TObject);
    procedure btnReminderClick(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
    procedure cbYearCloseUp(Sender: TObject);
    procedure cbYear2CloseUp(Sender: TObject);
    procedure btnClearDate1Click(Sender: TObject);
    procedure btnClearDate2Click(Sender: TObject);
    procedure Image4DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure LoadCotegoryList(); //Загружаем список категорий, и выставляем значения - Checked
    Procedure SaveCategoryChanges(); //Сохраняет изменения в базе, по категориям субъекта.
    Procedure AddNewSubject(); //Создаем новый субъект и готовимся к отмене создания.
    Procedure EditSubject(); //Открываем на редактирование существующий субъект.
    Procedure LoadItemsToDates(Month,Year: integer; CBC: TComboBox); //Заполним итемы комбобоксов.
    Procedure ShowDate2(ShowThis: Boolean);
  end;

var
  fmEdit: TfmEdit;
  NewRecord: Boolean;

implementation

Uses DataU, fmMain, fmDataU, fmEventU, fmReminderU, fmImageViewU;

{$R *.dfm}

procedure TfmEdit.AddNewSubject;
begin
  NewRecord := True;
  fmEdit.Caption := 'Добавление новой записи';
  data.dsSubject.Append;
  data.dsSubjectDate1.AsDateTime := StrToDate('01.01.'+IntToStr(YearOf(now)-20));//DateOf(Now-7000);
  data.dsSubject.Post;
  LoadCotegoryList;
  fmEdit.ShowModal;

  //зададим цвет контролам которые желательно или обязательно заполнить
//  dbeFIO.Color  := $008080FF;
//  cbDay.Color   := $008080FF;
//  cbMonth.Color := $008080FF;
//  cbYear.Color  := $008080FF;
end;

procedure TfmEdit.BtnCancelClick(Sender: TObject);
begin
  if NewRecord then
    data.dsSubject.Delete
  else
    data.dsSubject.Cancel;
  Close;
end;

procedure TfmEdit.btnClearDate1Click(Sender: TObject);
begin
  cbDay.ItemIndex   := -1;
  cbMonth.ItemIndex := -1;
  cbYear.ItemIndex  := -1;
end;

procedure TfmEdit.btnClearDate2Click(Sender: TObject);
begin
  cbDay2.ItemIndex   := -1;
  cbMonth2.ItemIndex := -1;
  cbYear2.ItemIndex  := -1;
end;

procedure TfmEdit.btnDataClick(Sender: TObject);
begin
  fmData.OpenKontakt(data.dsSubjectID.Value);
end;

procedure TfmEdit.btnEventClick(Sender: TObject);
begin
  fmEvent.OpenEvent(data.dsSubjectID.Value);
end;

procedure TfmEdit.btnFotoClick(Sender: TObject);
begin
  fmImageView.OpenPictViewer(data.dsSubjectID.Value);
end;

procedure TfmEdit.BtnOkClick(Sender: TObject);
var
  DateStr: String;
begin
  if data.dsSubjectFIO.AsString = '' then
    begin
      ShowMessage('Пожалуйста, введите имя!');
      Exit;
    end;

  if (cbDay.ItemIndex <> -1)and(cbMonth.ItemIndex <> -1)and(cbYear.ItemIndex <> -1) then
    begin
      if (not (data.dsSubject.State in [dsInsert, dsEdit])) then
        begin
          data.dsSubject.Edit;
        end;
        DateStr := '';
        DateStr := cbDay.Items[cbDay.ItemIndex]+'.'+IntToStr(cbMonth.ItemIndex + 1)+'.'
                   +cbYear.Items[cbYear.ItemIndex];
        data.dsSubjectDate1.AsDateTime := StrToDate(DateStr);
        data.dsSubject.Post;
    end
  else
    begin
      if (not (data.dsSubject.State in [dsInsert, dsEdit])) then
        begin
          data.dsSubject.Edit;
        end;
        data.dsSubjectDate1.AsString := '';
        data.dsSubject.Post;
    end;

  if (cbDay2.ItemIndex <> -1)and(cbMonth2.ItemIndex <> -1)and(cbYear2.ItemIndex <> -1) then
    begin
      if (not (data.dsSubject.State in [dsInsert, dsEdit])) then
        begin
          data.dsSubject.Edit;
        end;
        DateStr := '';
        DateStr := cbDay2.Items[cbDay2.ItemIndex]+'.'+IntToStr(cbMonth2.ItemIndex + 1)+'.'
                   +cbYear2.Items[cbYear2.ItemIndex];
        data.dsSubjectDate2.AsDateTime := StrToDate(DateStr);
        data.dsSubject.Post;
    end
  else
    begin
      if (not (data.dsSubject.State in [dsInsert, dsEdit])) then
        begin
          data.dsSubject.Edit;
        end;
        data.dsSubjectDate2.AsString := '';
        data.dsSubject.Post;
    end;


  if data.dsSubject.State in [dsInsert, dsEdit] then
    data.dsSubject.Post;
  Close;
end;

procedure TfmEdit.btnReminderClick(Sender: TObject);
begin
  fmReminder.OpenReminder(data.dsSubjectID.Value);
end;

procedure TfmEdit.cbYear2CloseUp(Sender: TObject);
begin
  if cbYear2.ItemIndex = -1 then
    cbYear2.ItemIndex := 10;
  if cbMonth2.ItemIndex = -1 then
    cbMonth2.ItemIndex := 0;
  LoadItemsToDates(cbMonth2.ItemIndex + 1,StrToInt(cbYear2.Items[cbYear2.ItemIndex]),cbDay2);
  cbDay2.ItemIndex := 0;
end;

procedure TfmEdit.cbYearCloseUp(Sender: TObject);
begin
  if cbYear.ItemIndex = -1 then
    cbYear.ItemIndex := 10;
  if cbMonth.ItemIndex = -1 then
    cbMonth.ItemIndex := 0;
  LoadItemsToDates(cbMonth.ItemIndex + 1,StrToInt(cbYear.Items[cbYear.ItemIndex]),cbDay);
  cbDay.ItemIndex := 0;
end;

procedure TfmEdit.chlCategoryListClick(Sender: TObject);
begin
  SaveCategoryChanges;
end;

procedure TfmEdit.EditSubject;
begin
  NewRecord := False;
  fmEdit.Caption := 'Редактирование записи: ' + QuotedStr(data.dsSubjectFIO.AsString);
  fmEdit.ShowModal;
end;

procedure TfmEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  if NewRecord then
//    data.dsSubject.Delete //Незя так! Ибо убивается даже новая запись, косяк тут в общем. !!!
//  else
    if data.dsSubject.State in [dsInsert, dsEdit] then
      data.dsSubject.Post;//при закрытии сохраним изменения.
end;

procedure TfmEdit.FormShow(Sender: TObject);
var
 I: Integer;
begin
  ShowDate2(False);
  If Data.dsSubject.Active and Data.dsSubjectCategoryList.Active and Data.dsSubjectCategory.Active then
    LoadCotegoryList; //загрузим свеженький список категорий для данного субъекта.
  cbYear.Items.Clear;
  for I := 1853 to YearOf(Now) do
    cbYear.Items.Add(IntToStr(I));
  for I := 1853 to YearOf(Now) do
    cbYear2.Items.Add(IntToStr(I));
  cbYear.ItemIndex := cbYear.Items.Count - 20;
  cbYear2.ItemIndex := -1;//cbYear2.Items.Count - 20;
  cbMonth.ItemIndex := 0;
  cbMonth2.ItemIndex := -1;
  LoadItemsToDates(cbMonth.ItemIndex + 1,StrToInt(cbYear.Items[cbYear.ItemIndex]),cbDay);
  cbDay.ItemIndex := 0;
//  LoadItemsToDates(cbMonth2.ItemIndex + 1,StrToInt(cbYear2.Items[cbYear2.ItemIndex]),cbDay2);
  cbDay2.ItemIndex := -1;

  //Выставим даты если они не пусты.
  if not data.dsSubjectDate1.IsNull then
    begin
      cbYear.ItemIndex := cbYear.Items.IndexOf(IntToStr(YearOf(data.dsSubjectDate1.AsDateTime)));
      cbMonth.ItemIndex := MonthOf(data.dsSubjectDate1.AsDateTime) - 1;
      LoadItemsToDates(cbMonth.ItemIndex + 1,StrToInt(cbYear.Items[cbYear.ItemIndex]),cbDay);
      cbDay.ItemIndex := DayOf(data.dsSubjectDate1.AsDateTime) - 1;
    end;
  if not data.dsSubjectDate2.IsNull then
    begin
      cbYear2.ItemIndex := cbYear2.Items.IndexOf(IntToStr(YearOf(data.dsSubjectDate2.AsDateTime)));
      cbMonth2.ItemIndex := MonthOf(data.dsSubjectDate2.AsDateTime) - 1;
      LoadItemsToDates(cbMonth2.ItemIndex + 1,StrToInt(cbYear2.Items[cbYear2.ItemIndex]),cbDay2);
      cbDay2.ItemIndex := DayOf(data.dsSubjectDate2.AsDateTime) - 1;
    end;
end;

procedure TfmEdit.Image4DblClick(Sender: TObject);
begin
  ShowDate2(True);
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ПРОЦЕДУРА: LoadCotegoryList
//
//  НАЗНАЧЕНИЕ:
//    Загружает список категорий конкретного субъекта, и выставляешь галочки
//    тем категориям к которым относится данный субъект.
//
procedure TfmEdit.LoadCotegoryList;
//var
//  I: Integer;
begin
//  Data.dsSubjectCategory.Parameters.ParamByName('Group').Value := cbGroupSelect.ItemIndex;
  Data.dsSubjectCategory.Close;
  Data.dsSubjectCategory.Open;
  Data.dsSubjectCategoryList.Close;
  Data.dsSubjectCategoryList.Open;
//  If Data.dsSubjectCategoryList.RecordCount <> Data.dsSubjectCategory.RecordCount then
  fmMainWin.RefreshSBCategoryList; //Обновим список категорий если он не соответсвует справочнику.
  chlCategoryList.Clear;
//  data.dsSubjectCategoryList.Requery;
  Data.dsSubjectCategoryList.First;
  While not Data.dsSubjectCategoryList.Eof do
    begin
      If  not Assigned(qSomeOper) then Exit;
      If qSomeOper.Active then
        qSomeOper.Close;
      qSomeOper.SQL.Clear;
//      ShowMessage(Format('Select Val From SubjectCategory Where ID = %s',[QuotedStr(Data.dsSubjectCategoryListSubjectCategoryID.AsString)]));
      qSomeOper.SQL.Add(Format('Select Val From SubjectCategory Where ID = %s',[Data.dsSubjectCategoryListSubjectCategoryID.AsString]));
      qSomeOper.Open;
      chlCategoryList.Items.Add(qSomeOper.FieldByName('Val').AsString);
      If Data.dsSubjectCategoryListEnable.Value then
        chlCategoryList.State[chlCategoryList.Count-1] := cbChecked;
      Data.dsSubjectCategoryList.Next;
    end;
end;

procedure TfmEdit.LoadItemsToDates(Month,Year: integer; CBC: TComboBox);
var
  DateS: String;
  DateN: TDate;
  I: Integer;
begin
  CBC.Items.Clear;
  DateS := '';
  DateS := '01.' + IntToStr(Month) + '.' + IntToStr(Year);
  DateN := StrToDateTime(DateS);
  I := 1;
  while I <= DaysInAMonth(YearOf(DateN),MonthOf(DateN)) do
    begin
      CBC.Items.Add(IntToStr(I));
      Inc(I);
    end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ПРОЦЕДУРА: SaveCategoryChanges
//
//  НАЗНАЧЕНИЕ:
//    Сохраняет в базе изменения сделанные в группах субъекта.
//
//
procedure TfmEdit.SaveCategoryChanges;
Var
  I: Integer;
begin
  I := 0;
  Data.dsSubjectCategoryList.First;
  While not Data.dsSubjectCategoryList.Eof do
    begin
     If chlCategoryList.State[I] = cbChecked then
      begin
        Data.dsSubjectCategoryList.Edit;
        Data.dsSubjectCategoryListEnable.Value := True;
        Data.dsSubjectCategoryList.Post;
      end
     else
      begin
        Data.dsSubjectCategoryList.Edit;
        Data.dsSubjectCategoryListEnable.Value := False;
        Data.dsSubjectCategoryList.Post;
      end;
      Data.dsSubjectCategoryList.Next;
      Inc(I);
    end;
end;

procedure TfmEdit.ShowDate2(ShowThis: Boolean);
begin
  Image1.Visible        := ShowThis;
  lbDate2.Visible       := ShowThis;
  btnClearDate2.Visible := ShowThis;
  cbYear2.Visible       := ShowThis;
  cbMonth2.Visible      := ShowThis;
  cbDay2.Visible        := ShowThis;
end;

end.

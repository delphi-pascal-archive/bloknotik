unit fmEventU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ToolWin, DB, GridsEh, DBGridEh, StdCtrls,
  DBCtrlsEh, Mask, Buttons, ExtCtrls, xDateWork, xStringsF, DateUtils, frmCalendar;

type
  TfmEvent = class(TForm)
    tbEventControl: TToolBar;
    btnAdd: TToolButton;
    btnDelete: TToolButton;
    btnPost: TToolButton;
    dbgEvent: TDBGridEh;
    pedtControls: TPanel;
    btnClose: TBitBtn;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEditEh1: TDBEditEh;
    DBCheckBoxEh1: TDBCheckBoxEh;
    Label1: TLabel;
    Label2: TLabel;
    lbEventDetals: TLabel;
    btnAdd2: TBitBtn;
    btnDelete2: TBitBtn;
    btnSave2: TBitBtn;
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dbgEventGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    ACurrentSubID: Integer; //текущий ID субъекта по которому открыты события.
    Procedure ShowDetails();
    Function OpenLocate(ID: Integer): Boolean;
    Procedure OpenEvent(const AID: Integer; ALocate: Integer = 0);
  end;

var
  fmEvent: TfmEvent;

implementation

Uses dataU, fmMain;

{$R *.dfm}

procedure TfmEvent.btnAddClick(Sender: TObject);
begin
//  data.dsEvent.Requery;
  data.dsEvent.Last;
  data.dsEvent.Insert;
  data.dsEventEnable.AsBoolean := True;
  data.dsEventDateEvent.Value := DateOf(Now());
  data.dsEvent.Post;
  //DBDateTimeEditEh1.SetFocus;
end;

procedure TfmEvent.btnCloseClick(Sender: TObject);
begin
  fmMainWin.LoadHB;
  fmMainWin.smcCalendarChange(fmMainWin.smcCalendar);
  Close();
end;

procedure TfmEvent.btnDeleteClick(Sender: TObject);
begin
  if data.dsEvent.RecordCount = 0 then
    exit;
  If Application.MessageBox('Вы действительно хотите удалить событие?', 'Подтверждение',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
  data.dsEvent.Delete;
end;

procedure TfmEvent.btnPostClick(Sender: TObject);
begin
  if data.dsEventDateEvent.IsNull then
    begin
      ShowMessage('Дата события не может быть пустой!');
      Exit;
    end;
  if data.dsEvent.State in [dsInsert, dsEdit] then
    data.dsEvent.Post;
end;

procedure TfmEvent.dbgEventGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if (DayOf(data.dsEventDateEvent.AsDateTime) = DayOf(Now)) and
     (MonthOf(data.dsEventDateEvent.AsDateTime) = MonthOf(Now)) then
  Background := clYellow;
end;

procedure TfmEvent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (data.dsEvent.State in [dsInsert, dsEdit]) and (not data.dsEventDateEvent.IsNull) then
    data.dsEvent.Post;
  if data.qTD.Active then //Удалим все записи с пустыми идатами.
    data.qTD.Close;
  data.qTD.SQL.Clear;
  data.qTD.SQL.Text := 'Delete From [Event] where DateEvent is Null';
  data.qTD.ExecSQL;
  data.qTD.Close;
  data.dsEvent.Requery;
  data.dsToday.Requery;
end;

procedure TfmEvent.FormShow(Sender: TObject);
begin
  Caption := 'События для записи: '+ QuotedStr(data.dsSubjectFIO.AsString);
  dbgEvent.Columns[0].MinWidth := 69;
  dbgEvent.Columns[0].MaxWidth := 69;
  dbgEvent.Columns[2].MinWidth := 64;
  dbgEvent.Columns[2].MaxWidth := 64;
  ShowDetails;
end;

procedure TfmEvent.OpenEvent(const AID: Integer; ALocate: Integer);
begin
  ACurrentSubID := AID;
  if data.dsEvent.Active then
    data.dsEvent.Close;
  data.dsEvent.CommandText := Format('select * from Event where SubjectID = %s',[IntToStr(AID)]);
  data.dsEvent.Open;
  if ALocate <> 0 then
    data.dsEvent.Locate('ID',IntToStr(ALocate),[]);
  fmEvent.ShowModal;
end;

Function TfmEvent.OpenLocate(ID: Integer): Boolean;
begin
  Result := True;
  if data.dsEvent.Locate('ID',ID,[]) then
    fmEvent.ShowModal
  else
    Result := False;
end;

procedure TfmEvent.ShowDetails;
Var
  IntRes: Integer;
  daysbetw: Integer;
begin
  if data.dsEventDateEvent.IsNull then
    begin
      lbEventDetals.Caption := 'Дата не указана!';
      exit;
    end;

  IntRes := GetAgeOf(data.dsEventDateEvent.AsDateTime);
  if IntRes < 0 then
    begin
      lbEventDetals.Caption := 'Дата из будующего? О_О';
      exit;
    end;
  if IntRes = 0 then
    begin
      daysbetw := DaysBetween(Now(),data.dsEventDateEvent.AsDateTime);
      lbEventDetals.Caption :=  IntToStr(daysbetw)+NumericalWords(' день',' дня',' дней',daysbetw)+' назад.';
    end
  else
    lbEventDetals.Caption := 'Было ' + IntToStr(IntRes) + NumericalWords(' год',' года',' лет',IntRes)+' назад.';
  IntRes := GetDaysCountOf(data.dsEventDateEvent.AsDateTime);
  if IntRes = 0 then
    lbEventDetals.Caption := lbEventDetals.Caption + ' [ Время события уже сегодня! ]'
  else
    lbEventDetals.Caption := lbEventDetals.Caption+ ' [ До события осталось '+NumericalWords('остался ','осталось ','осталось ',IntRes)+IntToStr(IntRes) +NumericalWords(' день',' дня',' дней',IntRes) + ' ]';
end;

end.

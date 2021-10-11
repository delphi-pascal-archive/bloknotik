unit fmReminderU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ToolWin, GridsEh, DBGridEh, DB, ExtCtrls,
  StdCtrls, Buttons, ADODB, DBLookupEh, DBCtrlsEh, Mask;

type
  TfmReminder = class(TForm)
    tbReminderControl: TToolBar;
    btnAdd: TToolButton;
    btnDelete: TToolButton;
    btnPost: TToolButton;
    dbgReminder: TDBGridEh;
    pEdtControls: TPanel;
    btnClose: TBitBtn;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    DBEditEh1: TDBEditEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    qPriority: TADOQuery;
    qState: TADOQuery;
    dsrPriory: TDataSource;
    dsrState: TDataSource;
    btnAdd2: TBitBtn;
    btnDel2: TBitBtn;
    btnPost2: TBitBtn;
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dbgReminderGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    ACurrentSubID: Integer; //текущий ID субъекта по которому открыты события.
    Procedure OpenReminder(const AID: integer; ALocate: Integer = 0);
  end;

var
  fmReminder: TfmReminder;

implementation

Uses dataU;

{$R *.dfm}

procedure TfmReminder.btnAddClick(Sender: TObject);
begin
//  data.dsReminder.Requery;
  data.dsReminder.Last;
  data.dsReminder.Insert;
end;

procedure TfmReminder.btnCloseClick(Sender: TObject);
begin
  Close();
end;

procedure TfmReminder.btnDeleteClick(Sender: TObject);
begin
  if data.dsReminder.RecordCount = 0 then
    exit;
  If Application.MessageBox('Вы действительно хотите удалить напоминание?', 'Подтверждение',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
  data.dsReminder.Delete;
end;

procedure TfmReminder.btnPostClick(Sender: TObject);
begin
  if data.dsReminder.State in [dsInsert, dsEdit] then
    data.dsReminder.Post;
end;

procedure TfmReminder.dbgReminderGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (data.dsReminderStatus.AsInteger <> 3) and (data.dsReminderDate2.AsDateTime < Now)  then
    Background := clYellow;
end;

procedure TfmReminder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if data.dsReminder.State in [dsInsert, dsEdit] then
    data.dsReminder.Post;
  if data.qTD.Active then //Удалим все записи с пустыми идатами.
    data.qTD.Close;
  data.qTD.SQL.Clear;
  data.qTD.SQL.Text := 'Delete From [Reminder] where Date1 is Null and Date2 is Null';
  data.qTD.ExecSQL;
  data.qTD.Close;
  data.dsReminder.Requery;
  data.dsToday.Requery;
end;

procedure TfmReminder.FormShow(Sender: TObject);
begin
  Caption := 'Напоминания по записи: '+ QuotedStr(data.dsSubjectFIO.AsString);
  if not qPriority.Active then
    qPriority.Open;
  if not qState.Active then
    qState.Open;
end;

procedure TfmReminder.OpenReminder(const AID: integer; ALocate: Integer);
begin
  ACurrentSubID := AID;
  if data.dsReminder.Active then
    data.dsReminder.Close;
  data.dsReminder.CommandText := Format('select * from Reminder where SubjectID = %s',[IntToStr(AID)]);
  data.dsReminder.Open;
  if ALocate <> 0 then
    data.dsEvent.Locate('ID',IntToStr(ALocate),[]);
  fmReminder.ShowModal;
end;

end.

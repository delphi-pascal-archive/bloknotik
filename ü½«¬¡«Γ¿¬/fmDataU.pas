unit fmDataU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, Mask, ExtCtrls, ComCtrls, ToolWin,
  GridsEh, DBGridEh, DB, Buttons, DBLookupEh, DBCtrlsEh;

type
  TfmData = class(TForm)
    tbDataControl: TToolBar;
    btnAdd: TToolButton;
    btnDelete: TToolButton;
    btnPost: TToolButton;
    dbgData: TDBGridEh;
    pEditControls: TPanel;
    dbeValue: TDBEditEh;
    luReqType: TDBLookupComboboxEh;
    lTypeReq: TLabel;
    lValue: TLabel;
    btnClose: TBitBtn;
    btnAdd1: TBitBtn;
    btnDelete1: TBitBtn;
    btnPost1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ACurrentSubID: Integer; //текущий ID субъекта по которому открыты контакты.
    Procedure OpenKontakt(const ASubID: Integer; ALocate: Integer = 0);
  end;

var
  fmData: TfmData;

implementation

Uses dataU;

{$R *.dfm}

procedure TfmData.btnAddClick(Sender: TObject);
begin
//  data.dsContact.Requery;
  data.dsContact.Last;
  data.dsContact.Insert;
  data.dsContact.Post;
end;

procedure TfmData.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmData.btnDeleteClick(Sender: TObject);
begin
  if data.dsContact.RecordCount = 0 then
    exit;
  If Application.MessageBox('Вы действительно хотите удалить контакт?', 'Подтверждение',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
  data.dsContact.Delete;
end;

procedure TfmData.btnPostClick(Sender: TObject);
begin
  if data.dsContact.State in [dsInsert, dsEdit] then
    data.dsContact.Post;
end;

procedure TfmData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if data.dsContact.State in [dsInsert, dsEdit] then
    data.dsContact.Post;
end;

procedure TfmData.FormShow(Sender: TObject);
begin
  data.dsContact.Requery;
  dbgData.Columns[0].MinWidth := 160;
  Caption := 'Реквизиты (контакты) записи: '+ QuotedStr(data.dsSubjectFIO.AsString);
end;

procedure TfmData.OpenKontakt(const ASubID: Integer; ALocate: Integer);
begin
  ACurrentSubID := ASubID;
  if data.dsContact.Active then
    data.dsContact.Close;
  data.dsContact.CommandText := Format('select * from Contact where SubjectID = %s',[IntToStr(ASubID)]);
  data.dsContact.Open;
  if ALocate <> 0 then
    data.dsContact.Locate('ID',IntToStr(ALocate),[]);
  fmData.ShowModal;
end;

end.

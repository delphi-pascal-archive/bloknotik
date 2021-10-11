unit fmCatalogU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  DB, ADODB, GridsEh, DBGridEh, Buttons;

type
  TfmCatalog = class(TForm)
    tbCatalogDataControl: TToolBar;
    btnAdd: TToolButton;
    btnDelete: TToolButton;
    btnPost: TToolButton;
    dsrCatalog: TDataSource;
    dsCatalog: TADODataSet;
    dbgCatalog: TDBGridEh;
    Panel1: TPanel;
    btnAdd2: TBitBtn;
    btnDel2: TBitBtn;
    btnPost2: TBitBtn;
    btnClose: TBitBtn;
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure OpenCatalog(CatalogName, FCaption: String);
  end;

var
  fmCatalog: TfmCatalog;

implementation

Uses fmMain, dataU;

{$R *.dfm}

{ TfmCatalog }

procedure TfmCatalog.btnAddClick(Sender: TObject);
begin
  dsCatalog.Append;
end;

procedure TfmCatalog.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCatalog.btnDeleteClick(Sender: TObject);
begin
  if dsCatalog.RecordCount = 0 then
    exit;
  If Application.MessageBox('Вы действительно хотите удалить элемент справочника?', 'Подтверждение',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
  dsCatalog.Delete;
//В дальнейшем предусмотреть удаление всех имеющихся связей по категориям. Что бы база
//не засорялась.
end;

procedure TfmCatalog.btnPostClick(Sender: TObject);
begin
  if dsCatalog.State in [dsInsert, dsEdit] then
    dsCatalog.Post;
end;

procedure TfmCatalog.OpenCatalog(CatalogName, FCaption: String);
begin
  if dsCatalog.Active then
    dsCatalog.Close;
  dsCatalog.CommandText := Format('Select * From %s Order by [Val]',[CatalogName]);
  dsCatalog.Open;
  dsCatalog.Fields[0].Visible := False;
  dsCatalog.Fields[1].DisplayLabel := 'Наименование';
  fmCatalog.Caption := FCaption;
  fmCatalog.ShowModal;
  fmMainWin.RefreshSBCategoryList;
  data.dsContactType.Requery;
end;

end.

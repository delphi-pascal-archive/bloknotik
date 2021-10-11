unit fmSelectCategorysU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, CheckLst, ComCtrls, sStatusBar, sPanel;

type
  TfmSelectCategorys = class(TForm)
    sPanel1: TsPanel;
    pControls: TPanel;
    btnOk: TBitBtn;
    clbCategoryList: TCheckListBox;
    btnClose: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    Procedure LoadList(); //загружает список категорий.
  public
    { Public declarations }
  end;

{type
  TCList = Record
    CategoryID: Integer;
    CategoryCaption: String;
  end; }

var
  fmSelectCategorys: TfmSelectCategorys;
  //CatList: array of TCList;

implementation

Uses dataU, fmMain;

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
//
//  При открытии формы, загружаем список категорий.
//
procedure TfmSelectCategorys.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    Close;
end;

procedure TfmSelectCategorys.FormShow(Sender: TObject);
begin
  LoadList;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ПРОЦЕДУРА: LoadList
//
//  НАЗНАЧЕНИЕ:
//    Загружаем список категорий.
//
procedure TfmSelectCategorys.LoadList;
//var
 // I: Integer;
begin
  clbCategoryList.Clear;
  Data.dsSubjectCategory.First;
  While not Data.dsSubjectCategory.Eof do
    begin
      clbCategoryList.Items.Add(Data.dsSubjectCategoryVal.AsString);
      Data.dsSubjectCategory.Next;
    end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  При нажатии на "ОК", формируем строку со списком выбранных категорий.
//  Передаем данный список в dstSubject, и обновляем данные...  Закрываем диалог.
//
procedure TfmSelectCategorys.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSelectCategorys.btnOkClick(Sender: TObject);
var
  CatIDList: String; //Список выбранных категорий.
  I: Integer;
begin
  CatIDList := '';
  fmMainWin.edtCategoryList.Text := '';
  I := 0;
  Data.dsSubjectCategory.First;
  While  I < clbCategoryList.Items.Count do
    begin
      If clbCategoryList.State[I] = cbChecked then
        begin
          CatIDList := CatIDList + IntToStr(Data.dsSubjectCategoryID.Value)+',';
          fmMainWin.edtCategoryList.Text := fmMainWin.edtCategoryList.Text + clbCategoryList.Items[I]+'; ';
        end;
      Data.dsSubjectCategory.Next;
      Inc(I);
    end;
  if CatIDList <> '' then
    if CatIDList[Length(CatIDList)] = ',' then
      Delete(CatIDList,Length(CatIDList),1); //Удалим последнюю запятую.
  Data.dsSubject.Close;
  If CatIDList <> '' then
    begin
//    Data.dsSubject.Parameters.ParamByName('CategoryList').Value := CatIDList
      data.dsSubject.CommandText := 'select *, Day(Date1) as DDay, Month(Date1) as MMonth, Year(Date1) as YYear from Subject SBJ '+
        'where '+
        'EXISTS( '+
        'Select * from '+
        'SubjectCategoryList '+
        'where SBJ.ID = SubjectID and '+
        '(SubjectCategoryID in ('+CatIDList+')) and '+
//        '('+QuotedStr(CatIDList)+' like ''%''+(SubjectCategoryID)+''%'') '+
        'Enable = True '+
        ') ';
    end
  else
    begin
//      Data.dsSubject.Parameters.ParamByName('CategoryList').Value := null;
      data.dsSubject.CommandText := 'select *, Day(Date1) as DDay, Month(Date1) as MMonth, Year(Date1) as YYear  from Subject';
      fmMainWin.edtCategoryList.Text := 'Все категории';
    end;
  Data.dsSubject.Open;
  Close;
end;

end.

unit fmSortMainU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfmSortMain = class(TForm)
    rgType: TRadioGroup;
    rgFieldSort: TRadioGroup;
    btnOk: TBitBtn;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSortMain: TfmSortMain;

implementation

Uses dataU, fmMain;

{$R *.dfm}

procedure TfmSortMain.btnOkClick(Sender: TObject);
var
  I: Integer;
begin
  if data.dsSubject.Active then
    data.dsSubject.Close;
  MainQuerySQL := data.dsSubject.CommandText;
  I := Pos('Order',MainQuerySQL);
  If I <> 0 then
    Delete(MainQuerySQL,I,Length(MainQuerySQL)-I+1);
  if rgType.ItemIndex = 0 then
    case rgFieldSort.ItemIndex of
      0: MainQuerySQL := MainQuerySQL + ' Order By FIO ';
      1: MainQuerySQL := MainQuerySQL + ' Order By Year(Date1), Month(Date1), Day(Date1) ';
      2: MainQuerySQL := MainQuerySQL + ' Order By Month(Date1), Year(Date1), Day(Date1) ';
    end
  else if rgType.ItemIndex = 1 then
    case rgFieldSort.ItemIndex of
      0: MainQuerySQL := MainQuerySQL + ' Order By FIO DESC ';
      1: MainQuerySQL := MainQuerySQL + ' Order By Year(Date1) DESC, Month(Date1) DESC, Day(Date1) DESC ';
      2: MainQuerySQL := MainQuerySQL + ' Order By Month(Date1) DESC, Year(Date1) DESC, Day(Date1) DESC ';
    end;
  data.dsSubject.CommandText := MainQuerySQL;
  data.dsSubject.Open;
  data.dsSubject.Requery;
  Close;
end;

end.

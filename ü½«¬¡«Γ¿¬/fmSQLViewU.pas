unit fmSQLViewU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GridsEh, DBGridEh, DB, ADODB, dataU;

type
  TfmSQLView = class(TForm)
    qSQL: TADOQuery;
    dsrSQL: TDataSource;
    dbgSQLRes: TDBGridEh;
    mSQLQuery: TMemo;
    btnGO: TButton;
    ListBox1: TListBox;
    Label1: TLabel;
    procedure ListBox1DblClick(Sender: TObject);
    procedure btnGOClick(Sender: TObject);
    procedure Label1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSQLView: TfmSQLView;

implementation

{$R *.dfm}

procedure TfmSQLView.btnGOClick(Sender: TObject);
begin
  If qSQL.Active then
    qSQL.Close;
    begin
      Try
        qSQL.SQL.Text := mSQLQuery.Lines.Text;
        qSQL.Open;
      Except on E : Exception do
        Application.MessageBox(pchar(E.ClassName+' произошла ошибка, с сообщением : '+E.Message),'Ошибка',0);
      End;
    end;
end;

procedure TfmSQLView.Label1DblClick(Sender: TObject);
begin
  Label1.Visible := False;
end;

procedure TfmSQLView.ListBox1DblClick(Sender: TObject);
begin
  mSQLQuery.Lines.Add(ListBox1.Items[ListBox1.ItemIndex]);
end;

end.

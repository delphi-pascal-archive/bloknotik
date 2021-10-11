unit fmPrgVerU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmPrgVer = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrgVer: TfmPrgVer;

implementation

{$R *.dfm}

procedure TfmPrgVer.Button1Click(Sender: TObject);
begin
  Close;
end;

end.

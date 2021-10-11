unit fmAboutAvtorU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Buttons, fmBlagoU;

type
  TfmAboutAvtor = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    btnBlago: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnBlagoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAboutAvtor: TfmAboutAvtor;

implementation

{$R *.dfm}

procedure TfmAboutAvtor.btnBlagoClick(Sender: TObject);
begin
  fmBlago.Show;
end;

procedure TfmAboutAvtor.Button1Click(Sender: TObject);
begin
  close();
end;

procedure TfmAboutAvtor.FormShow(Sender: TObject);
begin
//  Label1.Caption := 'Автор программы: ';
//  Label1.Caption :=   Label1.Caption + 'Мукомело ';
//  Label1.Caption :=   Label1.Caption + 'Евгений ';
//  Label1.Caption :=   Label1.Caption + 'Богданович ака XIO ';

end;

end.

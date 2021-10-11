unit fmReminderEditU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, DBLookupEh, DBCtrlsEh, StdCtrls, Mask, Buttons;

type
  TfmReminderEdit = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBEditEh1: TDBEditEh;
    Label2: TLabel;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Label4: TLabel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    Label5: TLabel;
    btnOK: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmReminderEdit: TfmReminderEdit;

implementation

{$R *.dfm}

end.

unit fmSearchU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Mask, DBCtrlsEh, StdCtrls, Buttons, ExtCtrls;

type
  TfmSearch = class(TForm)
    pFilters: TPanel;
    gbGeneralFilters: TGroupBox;
    Bevel1: TBevel;
    lbFio: TLabel;
    lbDate: TLabel;
    lbd1: TLabel;
    lbFor: TLabel;
    cbMan: TCheckBox;
    eFIOFilter: TEdit;
    cbOnlyWithFoto: TCheckBox;
    rbDateOne: TRadioButton;
    rbDateBeetwen: TRadioButton;
    btnGStopF: TBitBtn;
    btnGStartF: TBitBtn;
    dtpOneDate: TDBDateTimeEditEh;
    dtpDateb1: TDBDateTimeEditEh;
    dtpDateb2: TDBDateTimeEditEh;
    gbAdditionalFilters: TGroupBox;
    Bevel2: TBevel;
    lbDataType: TLabel;
    lbDataVal: TLabel;
    lbReminderVal: TLabel;
    lbEventVal: TLabel;
    dbluDataType: TDBLookupComboBox;
    eDataVal: TEdit;
    eReminderStr: TEdit;
    eEventStr: TEdit;
    btnAStopF: TBitBtn;
    btnAStartF: TBitBtn;
    pFilterChecks: TPanel;
    cbGeneralF: TCheckBox;
    cbAdditionalF: TCheckBox;
    cbCategoryFilters: TCheckBox;
    gbCategory: TGroupBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSearch: TfmSearch;

implementation

{$R *.dfm}

{  gbGeneralFilters.Visible    := cbGeneralF.Checked;
  gbAdditionalFilters.Visible := cbAdditionalF.Checked;
  gbCategory.Visible          := cbCategoryFilters.Checked;

  pFilters.Height := pFilterChecks.Height + 5;

  if cbGeneralF.Checked then
    pFilters.Height := pFilters.Height + gbGeneralFilters.Height;
  if cbAdditionalF.Checked then
    pFilters.Height := pFilters.Height + gbAdditionalFilters.Height;
  if cbCategoryFilters.Checked then
    pFilters.Height := pFilters.Height + gbCategory.Height;

  gbGeneralFilters.Align    := alBottom;
  gbAdditionalFilters.Align := alBottom;
  gbCategory.Align          := alBottom;
  gbGeneralFilters.Align    := alTop;
  gbAdditionalFilters.Align := alTop;
  gbCategory.Align          := alTop;       }


{  if rbDateOne.Checked then
    begin
      dtpOneDate.Enabled := True;
      dtpDateb1.Enabled  := False;
      dtpDateb2.Enabled  := False;
      lbd1.Enabled       := False;
      lbFor.Enabled      := False;
    end;
  if rbDateBeetwen.Checked then
    begin
      dtpOneDate.Enabled := False;
      dtpDateb1.Enabled  := True;
      dtpDateb2.Enabled  := True;
      lbd1.Enabled       := True;
      lbFor.Enabled      := True;
    end;
         }

end.

program DataBook;

uses
  Forms,
  fmMain in 'fmMain.pas' {fmMainWin},
  fmEditU in 'fmEditU.pas' {fmEdit},
  fmViewSubjectU in 'fmViewSubjectU.pas' {fmViewSubject},
  fmCatalogU in 'fmCatalogU.pas' {fmCatalog},
  fmDataU in 'fmDataU.pas' {fmData},
  fmEventU in 'fmEventU.pas' {fmEvent},
  fmReminderU in 'fmReminderU.pas' {fmReminder},
  fmImageViewU in 'fmImageViewU.pas' {fmImageView},
  dataU in 'dataU.pas' {data: TDataModule},
  xDateWork in 'Units\xDateWork.pas',
  xDBFunc in 'Units\xDBFunc.pas',
  xStringsF in 'Units\xStringsF.pas',
  xSysF in 'Units\xSysF.pas',
  fmPrgVerU in 'fmPrgVerU.pas' {fmPrgVer},
  fmAboutAvtorU in 'fmAboutAvtorU.pas' {fmAboutAvtor},
  fmSelectCategorysU in 'fmSelectCategorysU.pas' {fmSelectCategorys},
  fmSQLViewU in 'fmSQLViewU.pas' {fmSQLView},
  fmSortMainU in 'fmSortMainU.pas' {fmSortMain},
  fmReminderEditU in 'fmReminderEditU.pas' {fmReminderEdit},
  fmSearchU in 'fmSearchU.pas' {fmSearch},
  frmCalendar in 'frmCalendar.pas' {fCalendar: TFrame},
  fmAvtorFotoU in 'fmAvtorFotoU.pas' {fmAvtorFoto},
  fmBlagoU in 'fmBlagoU.pas' {fmBlago};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Bloknotik 3.0';
  Application.CreateForm(TfmMainWin, fmMainWin);
  Application.CreateForm(TfmEdit, fmEdit);
  Application.CreateForm(TfmViewSubject, fmViewSubject);
  Application.CreateForm(TfmCatalog, fmCatalog);
  Application.CreateForm(TfmData, fmData);
  Application.CreateForm(TfmEvent, fmEvent);
  Application.CreateForm(TfmReminder, fmReminder);
  Application.CreateForm(TfmImageView, fmImageView);
  Application.CreateForm(Tdata, data);
  Application.CreateForm(TfmPrgVer, fmPrgVer);
  Application.CreateForm(TfmAboutAvtor, fmAboutAvtor);
  Application.CreateForm(TfmSelectCategorys, fmSelectCategorys);
  Application.CreateForm(TfmSQLView, fmSQLView);
  Application.CreateForm(TfmSortMain, fmSortMain);
  Application.CreateForm(TfmReminderEdit, fmReminderEdit);
  Application.CreateForm(TfmSearch, fmSearch);
  Application.CreateForm(TfmAvtorFoto, fmAvtorFoto);
  Application.CreateForm(TfmBlago, fmBlago);
  Application.Run;
end.

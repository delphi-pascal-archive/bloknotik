unit fmViewSubjectU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, ExtCtrls, CheckLst, Buttons,
  Grids, DBGrids, DB, ADODB, DBCtrlsEh, JPeg, xDateWork, xStringsF, GridsEh,
  DBGridEh;

type
  TfmViewSubject = class(TForm)
    qSomeOper: TADOQuery;
    btnClose: TBitBtn;
    Bevel2: TBevel;
    lbAgeDeath: TLabel;
    lbBeforeHB: TLabel;
    lbAge: TLabel;
    Image3: TImage;
    lbDate1: TLabel;
    lbFio: TLabel;
    lNull: TLabel;
    Image2: TImage;
    Image1: TImage;
    lbDate2: TLabel;
    dbeFIO: TDBEdit;
    SpeedButton1: TSpeedButton;
    dtpDate2: TDBDateTimeEditEh;
    dtpDate1: TDBDateTimeEditEh;
    iFoto: TImage;
    Bevel1: TBevel;
    lbZodiak: TLabel;
    pcBigInfo: TPageControl;
    tsCategory: TTabSheet;
    tsComment: TTabSheet;
    chlCategoryList: TCheckListBox;
    dbmComment: TDBMemo;
    procedure chlCategoryListClickCheck(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure OpenView(); //��������� ����� ���������.
    Procedure LoadCotegoryList(); //��������� ������ ���������, � ���������� �������� - Checked
  end;

var
  fmViewSubject: TfmViewSubject;

implementation

Uses DataU, fmMain, fmImageViewU, DateUtils;
{$R *.dfm}

{ TfmViewSubject }

procedure TfmViewSubject.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmViewSubject.chlCategoryListClickCheck(Sender: TObject);
begin
  LoadCotegoryList;
end;

procedure TfmViewSubject.FormShow(Sender: TObject);
var
  Jpg: TJPEGImage;
  Bmp: TBitmap;
begin
  tsCategory.Show;
  fmImageView.OpenPictViewer(data.dsSubjectID.Value,0,False);
  if data.dsSubjectDate2.IsNull then
    begin
      lbDate2.Visible    := False;
      Image1.Visible     := False;
      dtpDate2.Visible   := False;
      lbAgeDeath.Visible := False;
    end
  else
    begin
      lbDate2.Visible    := True;
      Image1.Visible     := True;
      dtpDate2.Visible   := True;
      lbAgeDeath.Visible := True;
    end;
  iFoto.Picture := nil;
  Try
    Jpg := TJPegImage.Create;
    Jpg.Assign(Data.dsImageVal);//������� ������ � ����
    if not (Data.dsImageVal.IsNull{ FieldByName('Val').Value = ''}) then
      begin
        iFoto.Picture.assign(jpg);//����� ��� � ��������� ImgView
        lNull.Visible := False;
      end
    else
      lNull.Visible := True;
  Except
    Try
      Bmp := TBitmap.Create;
      Bmp.Assign(Data.dsImageVal);//������� ������ � ����
      if not (Data.dsImageVal.IsNull{.FieldByName('Val').Value = ''}) then
        begin
          iFoto.Picture.assign(bmp);//����� ��� ���� � ��������� ImgView
          lNull.Visible := False;
        end
      else
        lNull.Visible := True;
    Except
    End;
  End;
//  iFoto.AutoSize := False;
//  iFoto.Proportional := True;
end;

procedure TfmViewSubject.LoadCotegoryList;
//var
//  I: Integer;
begin
//  Data.dsSubjectCategory.Parameters.ParamByName('Group').Value := cbGroupSelect.ItemIndex;
  Data.dsSubjectCategory.Close;
  Data.dsSubjectCategory.Open;
  Data.dsSubjectCategoryList.Close;
  Data.dsSubjectCategoryList.Open;
//  If Data.dsSubjectCategoryList.RecordCount <> Data.dsSubjectCategory.RecordCount then
    fmMainWin.RefreshSBCategoryList; //������� ������ ��������� ���� �� �� ������������ �����������.
  chlCategoryList.Clear;
//  data.dsSubjectCategoryList.Requery;
  Data.dsSubjectCategoryList.First;
  While not Data.dsSubjectCategoryList.Eof do
    begin
      If  not Assigned(qSomeOper) then Exit;
      If qSomeOper.Active then
        qSomeOper.Close;
      qSomeOper.SQL.Clear;
//      ShowMessage(Format('Select Val From SubjectCategory Where ID = %s',[QuotedStr(Data.dsSubjectCategoryListSubjectCategoryID.AsString)]));
      qSomeOper.SQL.Add(Format('Select Val From SubjectCategory Where ID = %s',[Data.dsSubjectCategoryListSubjectCategoryID.AsString]));
      qSomeOper.Open;
      chlCategoryList.Items.Add(qSomeOper.FieldByName('Val').AsString);
      If Data.dsSubjectCategoryListEnable.Value then
        chlCategoryList.State[chlCategoryList.Count-1] := cbChecked;
      Data.dsSubjectCategoryList.Next;
    end;
end;

procedure TfmViewSubject.OpenView;
var
  IntResults: Integer;
  SingnStrM: array [0..12] of String;
//  StrDat: String;
begin
  if (data.dsSubjectDate1.AsDateTime > Now) or (data.dsSubjectDate2.AsDateTime > Now) then
    begin
      lbAge.Caption := '�� ��������! �_�';
      ShowMessage('������ ����� ���� ���������, ��� ��� ���� ����  �� ���������!');
      fmViewSubject.ShowModal;
      exit;
    end;

  lbBeforeHB.Font.Style := [];
  lbBeforeHB.Font.Color := clWindowText;

  SingnStrM[0] := '';
  SingnStrM[1] := '����';
  SingnStrM[2] := '�����';
  SingnStrM[3] := '��������';
  SingnStrM[4] := '���';
  SingnStrM[5] := '���';
  SingnStrM[6] := '����';
  SingnStrM[7] := '����';
  SingnStrM[8] := '��������';
  SingnStrM[9] := '�������';
  SingnStrM[10] := '�������';
  SingnStrM[11] := '�������';
  SingnStrM[12] := '����';

//  IsLeapYear(YearOf());//����������� ��� - ���, ��� - ����.

  LoadCotegoryList();
  fmViewSubject.Caption := '�������� ������: ' + QuotedStr(data.dsSubjectFIO.AsString);
  IntResults := GetAgeOf(data.dsSubjectDate1.AsDateTime);
  if IntResults = 0 then
    begin
      IntResults := DaysBetween(Now(),data.dsSubjectDate1.AsDateTime);
      fmViewSubject.lbAge.Caption := IntToStr(IntResults)+NumericalWords(' ����',' ���',' ����',IntResults) + ' �����';
    end
  else
    fmViewSubject.lbAge.Caption := IntToStr(IntResults) + NumericalWords(' ���',' ����',' ���',IntResults);
  if not data.dsSubjectDate2.IsNull then
    begin
      IntResults := GetAgeOf(data.dsSubjectDate2.AsDateTime);
      If IntResults = 0 then
        begin
          IntResults := DaysBetween(Now(),data.dsSubjectDate2.AsDateTime);
          fmViewSubject.lbAgeDeath.Caption := IntToStr(IntResults)+NumericalWords(' ����',' ���',' ����',IntResults) + ' �����';
        end
      else
        fmViewSubject.lbAgeDeath.Caption := IntToStr(IntResults) + NumericalWords(' ���',' ����',' ���',IntResults) + ' �����';
    end;
  IntResults := GetDaysCountOf(data.dsSubjectDate1.AsDateTime);
  if IntResults = 0 then
    begin
      lbBeforeHB.Font.Style := [fsBold];
      lbBeforeHB.Font.Color := clRed;
      lbBeforeHB.Caption := '������� ���� ��������!';
    end
  else
    begin
      if IntResults <= 3 then
        begin
          lbBeforeHB.Font.Style := [fsBold];
          lbBeforeHB.Font.Color := clBlue;
        end;
      lbBeforeHB.Caption := '�� ��� ��������: ' + IntToStr(IntResults) + NumericalWords(' ����',' ���',' ����',IntResults);
    end;

  lbZodiak.Caption := '���� �������: ' + SingnStrM[GetZadiak(data.dsSubjectDate1.AsDateTime)];

  {dbgData.Columns[0].MinWidth := 160;
  dbgEvent.Columns[0].MinWidth := 64;
  dbgEvent.Columns[0].MaxWidth := 64;
  dbgEvent.Columns[2].MinWidth := 20;
  dbgEvent.Columns[2].MaxWidth := 20;
  dbgReminder.Columns[0].MinWidth := 69;
  dbgReminder.Columns[0].MaxWidth := 69;
  dbgReminder.Columns[1].MinWidth := 69;
  dbgReminder.Columns[1].MaxWidth := 69;
  dbgReminder.Columns[3].MinWidth := 90;
  dbgReminder.Columns[3].MaxWidth := 90;
  dbgReminder.Columns[4].MinWidth := 70;
  dbgReminder.Columns[4].MaxWidth := 70;    }

  if data.dsSubjectDate1.IsNull then
  begin
    lbAge.Caption := '��� ����';
    lbBeforeHB.Caption := '';
    lbZodiak.Caption := '';
  end;

  //tsGeneral.Show;
  //btnGeneral.Down := True;

  fmViewSubject.ShowModal;
end;

procedure TfmViewSubject.SpeedButton1Click(Sender: TObject);
begin
  fmImageView.OpenPictViewer(data.dsSubjectID.Value);
end;

end.

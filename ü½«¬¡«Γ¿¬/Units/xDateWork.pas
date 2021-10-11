////////////////////////////////////////////////////////////////////////////////
//             ��������� � �������� ��� ������ � ����� � ��������             //
//                �����: �������� ������� ���������� ��� XIO                  //
//                   ���� ��������:  09072009                                 //
//                   ���� ���������: 25072009                                 //
////////////////////////////////////////////////////////////////////////////////
unit xDateWork;

interface

  Const
    tbdTypeDay    = 0;
    tbdTypeHour   = 1;
    tbdTypeMinute = 2;
    tbdTypeSecond = 3;

    Function GetAgeOf(XDate: TDateTime): integer;
    Function GetDaysCountOf(XDate: TDateTime): integer;
    Function GetJubiOf(XDate: TDateTime): Byte;
    Function GetZadiak(HB_Date_L:TDateTime):integer;
    Function TimeBeforeDate(DateX: TDateTime; ResType: Byte): Integer;

implementation

Uses DateUtils, SysUtils, Variants;

////////////////////////////////////////////////////////////////////////////////
//
//  ���������: GetDateInfo
//
//  ����������: ������ ���������� ���� ���������� �� ��� ��������, � �������
//              ��������.
//
//  ���������:
//    HB_DATE - ���� �������� ��������.
//    AGE - ������� ��������.
//    Days_Before_HB - ���������� ���� ���������� �� ��� ��������.
//    Jubilee - ����� ��������� ���� ��� ���. 1/0
//
Procedure GetDateInfo(HB_DATE:TDateTime; var AGE:Integer; var Days_Before_HB:Integer; var Jubilee:Byte);
  Var
    Year_HB:    TDateTime; //��� ��������
    Year_Now:   TDateTime; //������� ���
    CountYear:  TDateTime; //���������� ���
    Now_Date:   TDateTime; //������� ����

    CountYearI : Double;   //���� ����� �� ����.. ����� ��� �� ���������???

    InkHB_Have: byte; //��������� ���� ��� �.�. � ���� ���� ��� ���.  (0-�� ������, 1-������)
    StrDate: String[20];  //���� ��������
    StrDate2: String[20]; //������� ����
    StrYear: String[20];  //������� ���
    StrYear2: String[20]; //������� ��� + 1
    Ubl1: Integer; // ������� � ������� Integer.
    Ubl2: String[20]; //��� �������� Double � String � ����� ��� � Integer...
    IntYear: integer; //��������� ��� � ����� ����� ��� �� ���������������� ���.
    I: integer; // ������� �����.
    DTDate: TDateTime; //��� �������������� ������ � ����.
    CountDays1: Integer; //���������� ���� �� ������ ���� ���� �� ����� � ����. ����.
    CountDays2: Integer; //���������� ���� �� ������ ���� �� ��
    SumCount : Integer; //����� ���������� ����, �� ���� ���������� ���� ���������� �� ��.
begin
  //������ ��������� ��������.
  Now_Date := DateOf(Now());
  Year_HB := YearOf(HB_Date);
  Year_Now := YearOf(Now());
  CountYear := Year_Now - Year_HB;
  CountYearI := CountYear;

  //���� ����� �. �������� > ��������
  //����� ������� � ���� ���� ��� �� ���������� �� 1
  If MonthOf(HB_DATE) > MonthOf(Now_Date) then
    begin
      CountYearI := CountYearI - 1;
      InkHB_Have := 0
    end //���� ����� �� = �������� � ���� �������� ������ �������� ����� ����� � ���� ���� �� ��� �� ����.
  else If (MonthOf(HB_DATE) = MonthOf(Now_Date)) and (DayOf(HB_DATE) > DayOf(Now_Date)) then
        begin
          CountYearI := CountYearI - 1;
          InkHB_Have := 0
        end
       else //����� �� ��� ���������
        InkHB_Have := 1;

//  AGE := CountYearI; // ������� ��������� �������.
  Ubl2 := FloatToStr(CountYearI);//��������� ������������ ����� � ������.
  Ubl1 := StrToInt(Ubl2); //��������� ������������ � �����.
  AGE := Ubl1; // ������� ��������� �������.
  StrDate  := DateToStr(HB_Date);
  StrDate2 := DateToStr(Now_Date);
  StrYear  := '';

  //���� ���� ������� ��� �� ��������� � ���� ����
  If InkHB_Have = 0 then
    begin  // � ���� �������� ��������� ��� �� �������. ��� ������������� ������� DaysBetween
      For I:=10 DownTo 7 do
        Delete(StrDate,I,1);
      For I:=7 to 10 do
        StrDate := StrDate + StrDate2[I];
      DTDate := StrToDate(StrDate);
      Days_Before_HB := DaysBetween(Now_Date,DTDate);
    end
  else
    begin
      For I:=7 to 10 do
        StrYear := StrYear + StrDate2[I]; //���������� ��� ������� � ���� ������.
      IntYear := StrToInt(StrYear); //��������� ������� ��� � ����� �����.
      Inc(IntYear); //��������������.
      StrYear2 := IntToStr(IntYear); //����� ��������� � ������. ��� ������������������ �������.
      For I:=10 DownTo 7 do
        Delete(StrDate,I,1);
      For I:= 1 to 4 do //� ���� �������� ��������� ��� ������� �����.
        StrDate := StrDate + StrYear[I];
      StrDate2 := DateToStr(HB_DATE);// ��������� �������� ���� �������� � ������ ������.
      For I:=10 DownTo 7 do //��������� � ���� �������� ��� �� ������� + 1
        Delete(StrDate2,I,1);
      For I:= 1 to 4 do
        StrDate2 := StrDate2 + StrYear2[I];
      DTDate := StrToDate(StrDate);

      //����� ������� ��������� ������ ��������� � ���, � ����� ���� �� ���������...
      // �������� ���������� ���� �� ������ ����
      CountDays1 := DaysBetween(Now_Date, StrToDate('31.12.'+StrYear));
      Try
        //�������� �������� ���������� ���� �� �� �� ������ ���������� ����...
        CountDays2 := DaysBetween(StrToDate('01.01.'+StrYear2), StrToDate(StrDate2));
      Except
        //���� ��� �� ����������� ������������ ���������� ��������� � �� 29 �������.
        //� ��� �� �������� ���������� ���� �� ��.
        StrDate2[2] := '8';
        CountDays2 := DaysBetween(StrToDate('01.01.'+StrYear2), StrToDate(StrDate2));
      End;
//      SumCount := CountDays1 + CountDays2; // �������� ����� ���������� ���� ���������� �� ��
      Days_Before_HB := CountDays1+CountDays2;
    end;

  If Now_Date = DTDate then //�� �������� ��� �������.
     Days_Before_HB := 0; //� ���� �������� ����.
  if Days_Before_HB = 0 then //��� ���� �������� ���� ������ �� ��� �������� ��� ������ � ������� ����������.
    If (((Ubl1) mod 5) = 0)or(Ubl1 = 16)or(Ubl1 = 18) then
      Jubilee := 1
    else
      Jubilee := 0
  else //����� �� ��� ������ �����, � ���� ��������� 1 ����� ������ ����� ������ ��� ������ ��.
    If (((Ubl1+1) mod 5) = 0)or(Ubl1+1 = 16)or(Ubl1+1 = 18) then
      Jubilee := 1
    else
      Jubilee := 0;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  �������: GetAgeOf
//
//  ����������: ���������� ������ ������� �� ���� ��������.
//
//  ���������:
//    XDate - ���� ��������, ������� �� ������� ����� ���������.
//
Function GetAgeOf(XDate: TDateTime): integer;
var
  Age_L: Integer;
  Days_L: Integer;
  Jubi: Byte;
begin
  GetDateInfo(XDate,Age_L,Days_L,Jubi);
  GetAgeOf := Age_L;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  �������: GetDaysCountOf
//
//  ����������: ���������� ������ ���������� ���� �� ���� ��������.
//
//  ���������:
//    XDate - ���� ��������, �� ������� ������� ����������� ���������� ����.
//
Function GetDaysCountOf(XDate: TDateTime): integer;
var
  Age_L: Integer;
  Days_L: Integer;
  Jubi: Byte;
begin
  GetDateInfo(XDate,Age_L,Days_L,Jubi);
  GetDaysCountOf := Days_L;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  �������: GetJubiOf
//
//  ����������: ����������, ����� ������ � ���� ���� ��� ���.
//
//  ���������:
//    XDate - ���� �������� ������� ��������� �� �����������.
//
Function GetJubiOf(XDate: TDateTime): Byte;
var
  Age_L: Integer;
  Days_L: Integer;
  Jubi: Byte;
begin
  GetDateInfo(XDate,Age_L,Days_L,Jubi);
  GetJubiOf := Round(Jubi);
end;

////////////////////////////////////////////////////////////////////////////////
//
//  �������: GetZadiak
//
//  ����������: �� ���� ��������, ���������� ���� �������.
//
//  ���������:
//    HB_Date_L - ���� ��������, �� ������� ����� �������� ���� �������.
//
Function GetZadiak(HB_Date_L:TDateTime):integer;
Var
  Month: Integer;
  Day: Integer;
begin
  Result := (-1);
  Try
    Month := MonthOf(HB_Date_L);
    Day := DayOf(HB_Date_L);
    If (Month=3) and (Day>=21) or (Month=4) and (Day<=20) then
      GetZadiak := 1; //����
    If (Month=4) and (Day>=21) or (Month=5) and (Day<=21) then
      GetZadiak := 2; //�����
    If (Month=5) and (Day>=22) or (Month=6) and (Day<=21) then
      GetZadiak := 3; //��������
    If (Month=6) and (Day>=22) or (Month=7) and (Day<=22) then
      GetZadiak := 4; //���
    If (Month=7) and (Day>=23) or (Month=8) and (Day<=23) then
      GetZadiak := 5; //���
    If (Month=8) and (Day>=24) or (Month=9) and (Day<=23) then
      GetZadiak := 6; //����
    If (Month=9) and (Day>=24) or (Month=10) and (Day<=23) then
      GetZadiak := 7; //����
    If (Month=10) and (Day>=24) or (Month=11) and (Day<=22) then
      GetZadiak := 8; //��������
    If (Month=11) and (Day>=23) or (Month=12) and (Day<=21) then
      GetZadiak := 9; //�������
    If (Month=12) and (Day>=22) or (Month=1) and (Day<=20) then
      GetZadiak := 10; //�������
    If (Month=1) and (Day>=21) or (Month=2) and (Day<=18) then
      GetZadiak := 11; //�������
    If (Month=2) and (Day>=19) or (Month=3) and (Day<=20) then
      GetZadiak := 12; //����
  Except
    GetZadiak := 0;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  �������: TimeBeforeDate
//
//  ����������: ��� ��������� ������ ���������� ���������� ����, �����, �����,
//              ������ �� ��������� ����.
//
//  ���������:
//    DateX   - ���� ���������� ���� �� ������� ���������� ���������
//    ResType - ��� ������������� ���������� (����, �����, �����, ������)
//
Function TimeBeforeDate(DateX: TDateTime; ResType: Byte): Integer;
Var
  DaysX:   Integer;
  HourX:   Integer;
  MinutX:  Integer;
  SecondX: Integer;
begin
  Result := (-1);
  DaysX   := DaysBetween(Now,VarToDateTime(DateX));
  HourX   := HoursBetween(Now,VarToDateTime(DateX));
  HourX   := HourX - (DaysX * 24);
  MinutX  := MinutesBetween(Now,VarToDateTime(DateX));
  MinutX  := MinutX - (HoursBetween(Now,VarToDateTime(DateX)) * 60) + 1;
  SecondX := SecondsBetween(Now,VarToDateTime(DateX));
  SecondX := SecondX - (MinutesBetween(Now,VarToDateTime(DateX)) * 60) + 1;
  case ResType of
    tbdTypeDay:  Result := DaysX;
    tbdTypeHour: Result := HourX;
    tbdTypeMinute: Result := MinutX;
    tbdTypeSecond: Result := SecondX;
  end;
end;

end.

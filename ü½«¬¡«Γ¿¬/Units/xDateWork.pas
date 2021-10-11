////////////////////////////////////////////////////////////////////////////////
//             ПРОЦЕДУРЫ И ФУНЦКЦИИ ДЛЯ РАБОТЫ С ДАТОЙ И ВРЕМЕНЕМ             //
//                АВТОР: МУКОМЕЛО ЕВГЕНИЙ БОГДАНОВИЧ ака XIO                  //
//                   Дата создания:  09072009                                 //
//                   Дата изменения: 25072009                                 //
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
//  ПРОЦЕДУРА: GetDateInfo
//
//  НАЗНАЧЕНИЕ: Выдает количество дней оставшихся до Дня Рождения, и возраст
//              человека.
//
//  ПАРАМЕТРЫ:
//    HB_DATE - Дата Рождения человека.
//    AGE - Возраст человека.
//    Days_Before_HB - Количество дней оставшихся до Дня Рождения.
//    Jubilee - Будет юбилейная дата или нет. 1/0
//
Procedure GetDateInfo(HB_DATE:TDateTime; var AGE:Integer; var Days_Before_HB:Integer; var Jubilee:Byte);
  Var
    Year_HB:    TDateTime; //Год рождения
    Year_Now:   TDateTime; //Текущий год
    CountYear:  TDateTime; //Количество лет
    Now_Date:   TDateTime; //Текущая дата

    CountYearI : Double;   //тоже самое по сути.. может без неё обойдемся???

    InkHB_Have: byte; //Индикатор того что Д.Р. в этом году уже был.  (0-не прошёл, 1-прошёл)
    StrDate: String[20];  //Дата рождения
    StrDate2: String[20]; //Текущая дата
    StrYear: String[20];  //текущий год
    StrYear2: String[20]; //текущий год + 1
    Ubl1: Integer; // возраст в формате Integer.
    Ubl2: String[20]; //для перевода Double в String и затем его в Integer...
    IntYear: integer; //переводим год в целое число что бы инкриментировать его.
    I: integer; // счетчик цикла.
    DTDate: TDateTime; //для преобразования строки в дату.
    CountDays1: Integer; //Количество дней до Нового года если ДР будет в след. году.
    CountDays2: Integer; //количество дней от начала года до ДР
    SumCount : Integer; //сумма количества дней, то есть количество дней оставшихся до ДР.
begin
  //Задаем начальные значения.
  Now_Date := DateOf(Now());
  Year_HB := YearOf(HB_Date);
  Year_Now := YearOf(Now());
  CountYear := Year_Now - Year_HB;
  CountYearI := CountYear;

  //Если месяц д. рождения > текущего
  //Тогда возраст в этом году ещё не прибавился на 1
  If MonthOf(HB_DATE) > MonthOf(Now_Date) then
    begin
      CountYearI := CountYearI - 1;
      InkHB_Have := 0
    end //если месяц др = текущему и день рождения больше текущего числа тогда в этом году др ещё не было.
  else If (MonthOf(HB_DATE) = MonthOf(Now_Date)) and (DayOf(HB_DATE) > DayOf(Now_Date)) then
        begin
          CountYearI := CountYearI - 1;
          InkHB_Have := 0
        end
       else //иначе ДР уже произошел
        InkHB_Have := 1;

//  AGE := CountYearI; // текущий возможный возраст.
  Ubl2 := FloatToStr(CountYearI);//переведем вещественное число в строку.
  Ubl1 := StrToInt(Ubl2); //строковое вещественное в целое.
  AGE := Ubl1; // текущий возможный возраст.
  StrDate  := DateToStr(HB_Date);
  StrDate2 := DateToStr(Now_Date);
  StrYear  := '';

  //если День Варенья ещё не произошел в этом году
  If InkHB_Have = 0 then
    begin  // у даты рождения подменяем год на текущий. для использования функции DaysBetween
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
        StrYear := StrYear + StrDate2[I]; //Записываем год текущий в виде строки.
      IntYear := StrToInt(StrYear); //Переводим текущий год в целое число.
      Inc(IntYear); //Инкрементируем.
      StrYear2 := IntToStr(IntYear); //Снова переводим в строку. уже инкрементированный вариант.
      For I:=10 DownTo 7 do
        Delete(StrDate,I,1);
      For I:= 1 to 4 do //в дате рождения подменяем год текущим годом.
        StrDate := StrDate + StrYear[I];
      StrDate2 := DateToStr(HB_DATE);// переводим значение Даты Рождения в формат строки.
      For I:=10 DownTo 7 do //Подменяем в дате Рождения год на текущий + 1
        Delete(StrDate2,I,1);
      For I:= 1 to 4 do
        StrDate2 := StrDate2 + StrYear2[I];
      DTDate := StrToDate(StrDate);

      //Далее обходим возможные ошибки связанные с тем, в каком году мы находимся...
      // Получаем количество дней до Нового Года
      CountDays1 := DaysBetween(Now_Date, StrToDate('31.12.'+StrYear));
      Try
        //пытаемся получить количество дней до ДР от начала следующего года...
        CountDays2 := DaysBetween(StrToDate('01.01.'+StrYear2), StrToDate(StrDate2));
      Except
        //если год не высокостный обрабатываем исключение связанное с ДР 29 Февраля.
        //И все же получаем количетсво дней до ДР.
        StrDate2[2] := '8';
        CountDays2 := DaysBetween(StrToDate('01.01.'+StrYear2), StrToDate(StrDate2));
      End;
//      SumCount := CountDays1 + CountDays2; // получаем сумму количества дней оставшихся до ДР
      Days_Before_HB := CountDays1+CountDays2;
    end;

  If Now_Date = DTDate then //ДР наступил уже сегодня.
     Days_Before_HB := 0; //и дней осталось нуль.
  if Days_Before_HB = 0 then //раз дней осталось нуль значит ДР уже наступил или прошёл и возраст правильный.
    If (((Ubl1) mod 5) = 0)or(Ubl1 = 16)or(Ubl1 = 18) then
      Jubilee := 1
    else
      Jubilee := 0
  else //иначе ДР ещё только будет, и надо прибавить 1 чтобы понять будет Юбилей или просто ДР.
    If (((Ubl1+1) mod 5) = 0)or(Ubl1+1 = 16)or(Ubl1+1 = 18) then
      Jubilee := 1
    else
      Jubilee := 0;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ФУНКЦИЯ: GetAgeOf
//
//  НАЗНАЧЕНИЕ: Возвращает только возраст по дате рождения.
//
//  ПАРАМЕТРЫ:
//    XDate - Дата рождения, возраст от которой нужно расчитать.
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
//  ФУНКЦИЯ: GetDaysCountOf
//
//  НАЗНАЧЕНИЕ: Возвращает только количество дней до даты рождения.
//
//  ПАРАМЕТРЫ:
//    XDate - Дата рождения, до которой считаем колличество оставшихся дней.
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
//  ФУНКЦИЯ: GetJubiOf
//
//  НАЗНАЧЕНИЕ: Определяет, будет юбилей в этом году или нет.
//
//  ПАРАМЕТРЫ:
//    XDate - Дата рождения которую проверяем на юбилейность.
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
//  ФУНКЦИЯ: GetZadiak
//
//  НАЗНАЧЕНИЕ: По дате рождения, определяет знак задиака.
//
//  ПАРАМЕТРЫ:
//    HB_Date_L - Дата рождения, по которой будет определён знак задиака.
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
      GetZadiak := 1; //Овен
    If (Month=4) and (Day>=21) or (Month=5) and (Day<=21) then
      GetZadiak := 2; //Телец
    If (Month=5) and (Day>=22) or (Month=6) and (Day<=21) then
      GetZadiak := 3; //Близнецы
    If (Month=6) and (Day>=22) or (Month=7) and (Day<=22) then
      GetZadiak := 4; //Рак
    If (Month=7) and (Day>=23) or (Month=8) and (Day<=23) then
      GetZadiak := 5; //Лев
    If (Month=8) and (Day>=24) or (Month=9) and (Day<=23) then
      GetZadiak := 6; //Дева
    If (Month=9) and (Day>=24) or (Month=10) and (Day<=23) then
      GetZadiak := 7; //Весы
    If (Month=10) and (Day>=24) or (Month=11) and (Day<=22) then
      GetZadiak := 8; //Скорпион
    If (Month=11) and (Day>=23) or (Month=12) and (Day<=21) then
      GetZadiak := 9; //Стрелец
    If (Month=12) and (Day>=22) or (Month=1) and (Day<=20) then
      GetZadiak := 10; //Козерог
    If (Month=1) and (Day>=21) or (Month=2) and (Day<=18) then
      GetZadiak := 11; //Водолей
    If (Month=2) and (Day>=19) or (Month=3) and (Day<=20) then
      GetZadiak := 12; //Рыбы
  Except
    GetZadiak := 0;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ФУНКЦИЯ: TimeBeforeDate
//
//  НАЗНАЧЕНИЕ: Как результат выдает количество оставшихся дней, часов, минут,
//              секунд до указанной даты.
//
//  ПАРАМЕТРЫ:
//    DateX   - Дата количество дней до которой необходимо расчитать
//    ResType - Тип возвращаемого результата (Дней, Часов, Минут, Секунд)
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

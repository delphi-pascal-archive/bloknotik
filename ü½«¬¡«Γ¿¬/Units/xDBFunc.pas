unit xDBFunc;

interface
  Const
    //:Типы данных устанавливаемого значения в параметр DataSet
    dspvString   = 0; {dspv = Data Set Parametr Value}
    dspvInteger  = 1;
    dspvDateTime = 2;

    Function CheckParamValue(TypeVal: Integer; SetValue: Variant): Variant;

implementation

Uses Variants, SysUtils, DateUtils;

////////////////////////////////////////////////////////////////////////////////
//
//  ФУНКЦИЯ: CheckParamValue
//
//  НАЗНАЧЕНИЕ:
//    Функция для присваивания значений параметров к TDataSet
//
//  ПАРАМЕТРЫ:
//    TypeVal  - Тип передаваемого значения (0 - строка, 1 - целое число).
//    SetValue - Значение которое нужно передать в DataSet.
//
//  РЕЗУЛЬТАТ:
//    Либо значение которое нужно передать, либо NULL
//
Function CheckParamValue(TypeVal: Integer; SetValue: Variant): Variant;
Begin
  If TypeVal = 0 then //string
    begin
      If SetValue = '' then
        Result := null
      else
        Result := SetValue;
    end;
  If TypeVal = 1 then //Integer
    begin
      If SetValue = (-1) then
        Result := null
      else
        Result := SetValue;
    end;
  If TypeVal = 2 then //DateTime
    begin
      If SetValue <= StrToDate('01.01.1891') then
        Result := null
      else
        Result := DateOf(SetValue);
    end;
end;

end.

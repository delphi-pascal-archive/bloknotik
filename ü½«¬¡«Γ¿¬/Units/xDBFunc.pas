unit xDBFunc;

interface
  Const
    //:���� ������ ���������������� �������� � �������� DataSet
    dspvString   = 0; {dspv = Data Set Parametr Value}
    dspvInteger  = 1;
    dspvDateTime = 2;

    Function CheckParamValue(TypeVal: Integer; SetValue: Variant): Variant;

implementation

Uses Variants, SysUtils, DateUtils;

////////////////////////////////////////////////////////////////////////////////
//
//  �������: CheckParamValue
//
//  ����������:
//    ������� ��� ������������ �������� ���������� � TDataSet
//
//  ���������:
//    TypeVal  - ��� ������������� �������� (0 - ������, 1 - ����� �����).
//    SetValue - �������� ������� ����� �������� � DataSet.
//
//  ���������:
//    ���� �������� ������� ����� ��������, ���� NULL
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

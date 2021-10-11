unit xStringsF;

interface

    Function NumericalWords(Word1,Word2,Word3:String;Num:integer): String;
    Function DownRegister(Str:string):String;
    Function Cript(CriptString:String):String;
    Function UnCript(UnCriptString:String):String;

implementation

Uses SysUtils;

////////////////////////////////////////////////////////////////////////////////
//
//  ФУНКЦИЯ: NumericalWords
//
//  НАЗНАЧЕНИЕ: В зависимости от числа возвращает слово в правильном падеже.
//
//  ПАРАМЕТРЫ:
//    Word1 - Слово в Именительном падеже.
//    Word2 - Слово в Родительном падеже.
//    Word3 - Слово во множественом числе и Именительном падеже.
//    Num - Число по которому будет определен правильный падеж и число.
//
Function NumericalWords(Word1,Word2,Word3:String;Num:integer): String;
Var
  NumStr: String[32];
  LenStr,TestNum: Integer;
begin
  case Num of
          1: NumericalWords := Word1;
       2..4: NumericalWords := Word2;
    5..20,0: NumericalWords := Word3;
  else
    begin
      NumStr := IntToStr(Num);
      LenStr := Length(NumStr);
      if LenStr > 1 then
        Try
          TestNum := StrToInt(NumStr[LenStr-1]);
        Except
        End;
      if TestNum > 1 then
        Try
          Delete(NumStr,1,LenStr-1);
        Except
        End
      else
        Try
          Delete(NumStr,1,LenStr-2);
        Except
        End;
      Num := StrToInt(NumStr);
      case Num of
              1: NumericalWords :=  Word1;
           2..4: NumericalWords :=  Word2;
        5..20,0: NumericalWords :=  Word3;
      end;
    end;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ФУНКЦИЯ: DownRegister
//
//  НАЗНАЧЕНИЕ: Переводит полученную строку на нижний регистр.
//
//  ПАРАМЕТРЫ:
//    Str - Строка, которую необходимо перевести на пониженый регистр.
//
Function DownRegister(Str:string):String;
Var
  RStr: string[128];
  I,DL: integer;
begin
  RStr := '';
  DL := length(Str);
  For I:=1 to DL do
    begin
      If ((ORD(Str[I])<=90) and (ORD(Str[I])>=65)) or
         ((ORD(Str[I])>=192) and (ORD(Str[I])<=223)) or (ORD(Str[I])=168)
         then
            If ORD(Str[I])=168 then
              RStr := RStr + CHR(ORD(Str[I])+16)
            else
              RStr := RStr + CHR(ORD(Str[I])+32)
         else
            RStr := RStr + Str[I];
    end;
  DownRegister := RStr;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ФУНКЦИЯ: Cript
//
//  НАЗНАЧЕНИЕ: Шифрует строку путём замены символов.
//
//  ПАРАМЕТРЫ:
//    CriptString - Строка, которую необходимо зашифровать.
//
Function Cript(CriptString:String):String;
Var
  I: integer;
  R: String;
begin
  R := CriptString;
  For I := 1 to Length(CriptString) do {40}
    CriptString[I] := Chr(Ord(R[I])+(I-20));
  Cript := CriptString;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ФУНКЦИЯ: UnCript
//
//  НАЗНАЧЕНИЕ: Дешифрует строку путём замены символов.
//
//  ПАРАМЕТРЫ:
//    UnCriptString - Строка, которую необходимо дешифровать.
//
Function UnCript(UnCriptString:String):String;
Var
  I: integer;
  R: String;
begin
  R := UnCriptString;
  For I := 1 to Length(UnCriptString) do
    UnCriptString[I] := Chr(Ord(R[I])-(I-20));
  UnCript := UnCriptString;
end;

end.

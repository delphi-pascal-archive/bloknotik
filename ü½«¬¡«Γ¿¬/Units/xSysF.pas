unit xSysF;

interface

    Procedure IntDataToIni(Section,Column,Ini_FileName:String;Int_Param:Integer);
    Function IntDataFromIni(Section,Column,Ini_FileName:String):Integer;
    Procedure StringDataToIni(Section,Column,Ini_FileName:String;String_Param:String);
    Function StringDataFromIni(Section,Column,Ini_FileName:String):String;
    Procedure BoolDataToIni(Section,Column,Ini_FileName:String;Bool_Param:Boolean);
    Function BoolDataFromIni(Section,Column,Ini_FileName:String):Boolean;

implementation

Uses ShellAPI, SysUtils, IniFiles, Dialogs, Classes, Math, ToolWin,
  Windows, Messages, Variants, Graphics, Controls, Forms,
  StdCtrls, Menus, Buttons, ExtCtrls, ComCtrls, Grids,
  Outline, CheckLst, DateUtils;

////////////////////////////////////////////////////////////////////////////////
//
//  ПРОЦЕДУРА: IntDataToIni
//
//  НАЗНАЧЕНИЕ: Записывает целые числа в файл *.ini
//
//  ПАРАМЕТРЫ:
//    Section - Наименование секции в *.ini файле.
//    Column - Наименование ячейки в секции.
//    Int_Param - Значение которое следует записать в файл.
//    Ini_FileName - Имя файла *.ini
//
Procedure IntDataToIni(Section,Column,Ini_FileName:String;Int_Param:Integer);
Var
  IniFile:TIniFile;
begin
  Try
    IniFile := TIniFile.Create(Ini_FileName);
    IniFile.WriteInteger(Section,Column,Int_Param);
    IniFile.Free;
  Except
    MessageDlg('Ошибка при записи целого числа в *.ini файл!',mtError,[mbOK],0);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ФУНКЦИЯ: IntDataFromIni
//
//  НАЗНАЧЕНИЕ: Чтение числовых данных из *.ini файла.
//
//  ПАРАМЕТРЫ:
//    Section - Наименование секции в *.ini файле.
//    Column - Наименование ячейки в секции.
//    Ini_FileName - Имя файла *.ini
//
Function IntDataFromIni(Section,Column,Ini_FileName:String):Integer;
var
  IniFile:TIniFile;
begin
  Result := 0;
  Try
    IniFile := TIniFile.Create(Ini_FileName);
    Result := IniFile.ReadInteger(Section,Column,0);
    IniFile.Free;
  Except
    MessageDlg('Ошибка при чтении целого числа из *.ini файла!',mtError,[mbOK],0);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  НАЗНАЧЕНИЕ: Записывает логические значения в файл *.ini
//
//  ПАРАМЕТРЫ:
//    Section - Наименование секции в *.ini файле.
//    Column - Наименование ячейки в секции.
//    Bool_Param - Значение которое следует записать в файл.
//    Ini_FileName - Имя файла *.ini
//
Procedure BoolDataToIni(Section,Column,Ini_FileName:String;Bool_Param:Boolean);
var
  IniFile:TIniFile;
begin
  Try
    IniFile := TIniFile.Create(Ini_FileName);
    IniFile.WriteBool(Section,Column,Bool_Param);
    IniFile.Free;
  Except
    MessageDlg('Ошибка при записи логического значения в *.ini файл!',mtError,[mbOK],0);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ФУНКЦИЯ: BoolDataFromIni
//
//  НАЗНАЧЕНИЕ: Чтение Булева значения из *.ini файла.
//
//  ПАРАМЕТРЫ:
//    Section - Наименование секции в *.ini файле.
//    Column - Наименование ячейки в секции.
//    Ini_FileName - Имя файла *.ini
//
Function BoolDataFromIni(Section,Column,Ini_FileName:String):Boolean;
var
  IniFile:TIniFile;
begin
  Result := False;
  Try
    IniFile := TIniFile.Create(Ini_FileName);
    Result := IniFile.ReadBool(Section,Column,True);
    IniFile.Free;
  Except
    MessageDlg('Ошибка при чтении логического значения из *.ini файла!',mtError,[mbOK],0);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ПРОЦЕДУРА: StringDataToIni
//
//  НАЗНАЧЕНИЕ: Записывает строковое значения в файл *.ini
//
//  ПАРАМЕТРЫ:
//    Section - Наименование секции в *.ini файле.
//    Column - Наименование ячейки в секции.
//    String_Param - Значение которое следует записать в файл.
//    Ini_FileName - Имя файла *.ini
//
Procedure StringDataToIni(Section,Column,Ini_FileName:String;String_Param:String);
var
  IniFile:TIniFile;
begin
  Try
    IniFile := TIniFile.Create(Ini_FileName);
    IniFile.WriteString(Section, Column, String_Param);
    IniFile.Free;
  Except
    MessageDlg('Ошибка при записи строки в *.ini файл!',mtError,[mbOK],0);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ФУНКЦИЯ: StringDataFromIni
//
//  НАЗНАЧЕНИЕ: Чтение строковых данных из *.ini файла.
//
//  ПАРАМЕТРЫ:
//    Section - Наименование секции в *.ini файле.
//    Column - Наименование ячейки в секции.
//    Ini_FileName - Имя файла *.ini
//
Function StringDataFromIni(Section,Column,Ini_FileName:String):String;
var
  IniFile:TIniFile;
begin
    Try
      IniFile := TIniFile.Create(Ini_FileName);
      StringDataFromIni := IniFile.ReadString(Section,Column,'...');
      IniFile.Free;
    Except
      MessageDlg('Ошибка при чтении строкового значения из *.ini файла!',mtError,[mbOK],0);
    End;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ФУНКЦИЯ: GetTempFile
//
//  НАЗНАЧЕНИЕ: Дает путь и имя файла для временного хранения(создания).
//
//  ПАРАМЕТРЫ:
//    Extension - Расширение файла который необходимо временно создать.
//
function GetTempFile(const Extension: string): string;
 var
   Buffer: array[0..MAX_PATH] of Char;
 begin
   repeat
     GetTempPath(SizeOf(Buffer) - 1, Buffer);
     GetTempFileName(Buffer, '~', 0, Buffer);
     Result := ChangeFileExt(Buffer, Extension);
   until not FileExists(Result);
 end;


end.

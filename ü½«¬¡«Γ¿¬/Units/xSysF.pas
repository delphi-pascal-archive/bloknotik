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
//  ���������: IntDataToIni
//
//  ����������: ���������� ����� ����� � ���� *.ini
//
//  ���������:
//    Section - ������������ ������ � *.ini �����.
//    Column - ������������ ������ � ������.
//    Int_Param - �������� ������� ������� �������� � ����.
//    Ini_FileName - ��� ����� *.ini
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
    MessageDlg('������ ��� ������ ������ ����� � *.ini ����!',mtError,[mbOK],0);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  �������: IntDataFromIni
//
//  ����������: ������ �������� ������ �� *.ini �����.
//
//  ���������:
//    Section - ������������ ������ � *.ini �����.
//    Column - ������������ ������ � ������.
//    Ini_FileName - ��� ����� *.ini
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
    MessageDlg('������ ��� ������ ������ ����� �� *.ini �����!',mtError,[mbOK],0);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ����������: ���������� ���������� �������� � ���� *.ini
//
//  ���������:
//    Section - ������������ ������ � *.ini �����.
//    Column - ������������ ������ � ������.
//    Bool_Param - �������� ������� ������� �������� � ����.
//    Ini_FileName - ��� ����� *.ini
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
    MessageDlg('������ ��� ������ ����������� �������� � *.ini ����!',mtError,[mbOK],0);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  �������: BoolDataFromIni
//
//  ����������: ������ ������ �������� �� *.ini �����.
//
//  ���������:
//    Section - ������������ ������ � *.ini �����.
//    Column - ������������ ������ � ������.
//    Ini_FileName - ��� ����� *.ini
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
    MessageDlg('������ ��� ������ ����������� �������� �� *.ini �����!',mtError,[mbOK],0);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  ���������: StringDataToIni
//
//  ����������: ���������� ��������� �������� � ���� *.ini
//
//  ���������:
//    Section - ������������ ������ � *.ini �����.
//    Column - ������������ ������ � ������.
//    String_Param - �������� ������� ������� �������� � ����.
//    Ini_FileName - ��� ����� *.ini
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
    MessageDlg('������ ��� ������ ������ � *.ini ����!',mtError,[mbOK],0);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  �������: StringDataFromIni
//
//  ����������: ������ ��������� ������ �� *.ini �����.
//
//  ���������:
//    Section - ������������ ������ � *.ini �����.
//    Column - ������������ ������ � ������.
//    Ini_FileName - ��� ����� *.ini
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
      MessageDlg('������ ��� ������ ���������� �������� �� *.ini �����!',mtError,[mbOK],0);
    End;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  �������: GetTempFile
//
//  ����������: ���� ���� � ��� ����� ��� ���������� ��������(��������).
//
//  ���������:
//    Extension - ���������� ����� ������� ���������� �������� �������.
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

unit fmImageViewU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ExtDlgs, JPeg, Mask, DB,
  DBCtrls, Grids, DBGrids, GridsEh, DBGridEh;

type
  TfmImageView = class(TForm)
    pnImageControls: TPanel;
    ScrollBox1: TScrollBox;
    ImgView: TImage;
    SavePictureDialog: TSavePictureDialog;
    OpenPictureDialog: TOpenPictureDialog;
    lbImageSize: TLabel;
    lbImageComment: TLabel;
    pFotoList: TPanel;
    Splitter1: TSplitter;
    dbedtImageComment: TDBEdit;
    btnLoadImage: TBitBtn;
    btnSaveImage: TBitBtn;
    pImageNavigate: TPanel;
    btnMiniSize: TBitBtn;
    btnFullSize: TBitBtn;
    btnNext: TBitBtn;
    btnBack: TBitBtn;
    geImage: TDBGridEh;
    lNull: TLabel;
    btnAddImage: TBitBtn;
    btnDeleteImage: TBitBtn;
    btnClose: TBitBtn;
    procedure btnLoadImageClick(Sender: TObject);
    procedure btnSaveImageClick(Sender: TObject);
    procedure btnDeleteImageClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedtImageCommentKeyPress(Sender: TObject; var Key: Char);
    procedure SavePictureDialogTypeChange(Sender: TObject);
    procedure btnFullSizeClick(Sender: TObject);
    procedure btnMiniSizeClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnAddImageClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    ACurrentSubID: Integer; //текущий ID субъекта по которому открыты контакты.
    Procedure ShowPicture(); //Извлекает из базы картинку при её наличии и выводит на форму.
    Procedure OpenPictViewer(Const AID: integer; ALocate: Integer = 0; AShowForm: Boolean = True);
    { Public declarations }
  end;

var
  fmImageView: TfmImageView;

implementation

Uses Math, dataU;

{$R *.dfm}

{ TfmImageView }

////////////////////////////////////////////////////////////////////////////////
//
//  ПРОЦЕДУРА: ShowPicture
//
//  НАЗНАЧЕНИЕ:
//    Извлекает из базы картинку при её наличии и выводит на форму.
//
procedure TfmImageView.ShowPicture;
var
  Jpg: TJPEGImage;
  Bmp: TBitmap;
begin
  Try
    Jpg := TJPegImage.Create;
    Jpg.Assign(Data.dsImageVal);//получил доступ к фото
    if not (Data.dsImageVal.IsNull{ FieldByName('Val').Value = ''}) then
      begin
        ImgView.Picture.assign(jpg);//вывел его в компонент ImgView
        lNull.Visible := False;
      end
    else
      lNull.Visible := True;
  Except
    Try
      Bmp := TBitmap.Create;
      Bmp.Assign(Data.dsImageVal);//получил доступ к фото
      if not (Data.dsImageVal.IsNull{.FieldByName('Val').Value = ''}) then
        begin
          ImgView.Picture.assign(bmp);//вывел его фото в компонент ImgView
          lNull.Visible := False;
        end
      else
        lNull.Visible := True;
    Except
      ImgView.Picture.Bitmap.FreeImage;
    End;
  End;
  btnMiniSizeClick(self);
  // сделаем так что бы появились СкроллБары
  lbImageSize.Left := ImgView.Width - lbImageSize.Width;
  lbImageSize.Top  := ImgView.Height - lbImageSize.Height;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  Загружаем фотографию с диска в базу и сразу отображаем её в окне.
//
procedure TfmImageView.btnLoadImageClick(Sender: TObject);
begin
  If Application.MessageBox('Вы действительно хотите загрузить другое изображение? Имеющееся изображение будет перетерто!', 'Подтверждение',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
  if OpenPictureDialog.Execute then
    begin
      Data.dsImage.Edit;
      Data.dsImageVal.LoadFromFile(OpenPictureDialog.FileName);
      Data.dsImageFileName.Value := ExtractFileName(OpenPictureDialog.FileName);
      Data.dsImage.Post;
      ShowPicture();
    end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  Выгружаем фотографию из базы на диск
//
procedure TfmImageView.btnSaveImageClick(Sender: TObject);
begin
  SavePictureDialog.DefaultExt := 'jpg';
  SavePictureDialog.FileName := ExtractFileName(Data.dsImageFileName.Value);
  if SavePictureDialog.Execute then
    begin
      Data.dsImageVal.SaveToFile(SavePictureDialog.FileName);
    end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  Удаляем фотографию из БД
//
procedure TfmImageView.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmImageView.btnDeleteImageClick(Sender: TObject);
begin
  If Application.MessageBox('Вы действительно хотите удалить фотографию?', 'Подтверждение',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
      begin
        Data.dsImage.Edit;
        Data.dsImageVal.Clear;
        Data.dsImage.Post;
        ImgView.Picture := nil;
        ImgView.Height := 100;
        ImgView.Width  := 100;
        lbImageSize.Left := 1;
        lbImageSize.Top  := 1;
        Data.dsImage.Delete;
      end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  При открытии формы загружаем изображение при его наличии либо выводим пустой фон
//
procedure TfmImageView.FormShow(Sender: TObject);
begin
  Caption := 'Фотографии записи: '+ QuotedStr(data.dsSubjectFIO.AsString);
  ImgView.Picture := nil;
  ImgView.Height := 100;
  ImgView.Width  := 100;
  lbImageSize.Left := 1;
  lbImageSize.Top  := 1;
  ShowPicture();
end;

procedure TfmImageView.OpenPictViewer(const AID: integer; ALocate: Integer = 0; AShowForm: Boolean = True);
begin
  ACurrentSubID := AID;
  if data.dsImage.Active then
    data.dsImage.Close;
  data.dsImage.CommandText := Format('select * from [Image] where SubjectID = %s',[IntToStr(AID)]);
  data.dsImage.Open;
  if ALocate <> 0 then
    data.dsImage.Locate('ID',IntToStr(ALocate),[]);
  if AShowForm then
    fmImageView.ShowModal;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  При нажатии "Enter" во время ввода комментария к фото, сохраняем его(Коммент).
//
procedure TfmImageView.dbedtImageCommentKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
    If Data.dsImage.State in [dsEdit, dsInsert]  then
      Data.dsImage.Post;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  При выборе фильтра, расширение выставляем.
//
procedure TfmImageView.SavePictureDialogTypeChange(Sender: TObject);
begin
  if SavePictureDialog.FilterIndex = 1 then
    SavePictureDialog.DefaultExt := 'jpg'
  else If SavePictureDialog.FilterIndex = 2 then
    SavePictureDialog.DefaultExt := 'bmp';
end;

////////////////////////////////////////////////////////////////////////////////
//
//  Отобразим картинку в оригенальном размере (разрешении)
//
procedure TfmImageView.btnFullSizeClick(Sender: TObject);
begin
  ImgView.Align := alNone;
  ImgView.AutoSize := True;
  ImgView.Stretch := False;
  ImgView.Center := False;
  // сделаем так что бы появились СкроллБары
  lbImageSize.Left := ImgView.Width - lbImageSize.Width;
  lbImageSize.Top  := ImgView.Height - lbImageSize.Height;
  ImgView.Align := alClient;
  ImgView.Center := True;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  Растянем изображение в соответствии с размероми окна.
//
procedure TfmImageView.btnMiniSizeClick(Sender: TObject);
begin
  lbImageSize.Left := 0;
  lbImageSize.Top  := 0;
  ImgView.AutoSize := False;
  ImgView.Align := alClient;
  ImgView.Proportional := True;
  ImgView.Stretch := True;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  Сделаем так что бы картинка всегда была по центру поля с изображением.
//
procedure TfmImageView.FormResize(Sender: TObject);
begin
  If ((ImgView.Picture.Height < ScrollBox1.Height) or (ImgView.Picture.Width < ScrollBox1.Width)) then
    begin
      ImgView.Align := alClient;
      ImgView.Center := True;
    end;
end;

////////////////////////////////////////////////////////////////////////////////
//
//  Добавим новую картинку (фотографию)
//
procedure TfmImageView.btnAddImageClick(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
    begin
      Data.dsImage.Insert;
      Data.dsImageVal.LoadFromFile(OpenPictureDialog.FileName);
      Data.dsImageFileName.Value := OpenPictureDialog.FileName;
      Data.dsImageName.Value := ExtractFileName(OpenPictureDialog.FileName);
      Data.dsImage.Post;
      ShowPicture();
    end;
end;

end.

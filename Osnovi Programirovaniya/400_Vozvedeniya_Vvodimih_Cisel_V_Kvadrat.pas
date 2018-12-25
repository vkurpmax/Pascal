unit MainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type


  { TMainForm }

  TMainForm = class(TForm)
    NextButton: TButton;
    ExitButton: TButton;
    InputEdit: TEdit;
    OutPutEdit: TEdit;
    InputLabel: TLabel;
    OutPutLabel: TLabel;
    procedure ExitButtonClick(Sender: TObject);
{    procedure FormCreate(Sender: TObject); }
    procedure InputEditChange(Sender: TObject);
    procedure InputLabelClick(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure InputEditKeyPress(Sender: TObject; var Key:Char);
    procedure FormActive(Sender: TObject);
  private

  public

  end;

{var

  MainForm: TMainForm;}

implementation
uses UnitNumber;  {описание класса TNumber}

{$R *.lfm}

{ TMainForm }

procedure TMainForm.ExitButtonClick(Sender: TObject);
begin
  close;
end;    {закрываем окно и завершаем приложение}

procedure TMainForm.FormActive(Sender: TObject);
begin
  OutputEdit.Visible:=false;  {сделать редактор вывода невидимым}
  OutputLabel.Visible:=false;  {сделать метку вывода невидимой}
  NextButton.Enabled:=false;  {сделать лкнопку Следующий}

  InputEdit.Clear;  {очистить редактор ввода}
  InputEdit.ReadOnly:=false;  {разрешить ввод}
  InputEdit.SetFocus;  {установить фокус ввода на редактор ввода}
end;

procedure TMainForm.InputEditChange(Sender: TObject);
begin

end;

procedure TMainForm.InputEditkeyPress(Sender: TObject; var Key:char);
var k:single; code:integer;
begin
  if Key=#13 then
    begin
      key:=#10;  {чтобы не выдавался звуковой сигнал}
      val(InputEdit.Text,k,code);
      if code=0 then
        begin
          N:=TNumber.Create(strtofloat(InputEdit.Text));  {создать объект}
          OutPutEdit.Text:=floattostr(N.SqrNumber);  {вывести результат}
          N.Destroy;  {уничтожить объект - деструктор TObject}
          OutPutEdit.Visible:=true;  {сделать редактор вывода видимым}
          OutputLabel.Visible:=true;  {сделать метку вывода видимой}
          InputEdit.ReadOnly:=true;  {запретить ввод}
          NextButton.Enabled:=true;  {сделать кнопку Следующий доступной}
          NextButton.SetFocus;  {установить фокус ввода на кнопку Следующий}
        end
      else {вывести сообщение об ошибке}
        MessageDlg('Stroka soderzhit nedopustimie simvoli',mtError,[mbOk],0)
    end;
  end;

procedure TMainForm.InputLabelClick(Sender: TObject);
begin

end;

procedure TMainForm.NextButtonClick(Sender: TObject);
begin
  FormActive(NextButton);
end;                     {вызываем метод}

{ TMainForm }


end.

unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

var Sum:double;
    operation:char='@';



procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure Operate;
var s:string;  code:integer;  n:double;
begin
  s:=Form1.Edit1.text;  {читаем сроку из Edit1.text}
  Form1.Edit1.clear;  {очищаем Edit1}
  val(s,n,code);  {преобразуем строку в число}
  case operation of  {выполняем операцию}
    '@':sum:=n;
    '+':sum:=sum+n;
    '-':sum:=sum-n;
    '*':sum:=sum*n;
    '/':sum:=sum/n;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Edit1.Clear;  {очистить окно компонента Edit1}
  operation:='@';  {установить состояние "первая операция"}
  Edit1.setfocus;  {установить активным окно компонента Edit1}
end;

procedure TForm1.Button2Click(Sender: TObject);
var s:string;
begin
  operate;  {выполнить предыдущую операцию}
  operation:='=';  {установить состояние "операция ="}
  Str(sum:6:3,s);  {преобразовать результат в строку}
  Edit1.text:=s;  {вывести строку в окно компонента Edit1}
  Button1.SetFocus;  {установить курсор на кнопку Button1}
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Close;  {завершить работу приложения}
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  operate;  {выполнить предыдущю операцию}
  operation:='+';  {установить состояние "операция +"}
  Edit1.setfocus;  {учтановить активным окно компонента Edit1}
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  operate;  {выполнить предыдущую операцию}
  operation:='-';  {установить состояние "операция -"}
  Edit1.setfocus;  {установить активным окно компонента Edit1}
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  operate;  {выполнить предыдущую операцию}
  operation:='*';  {установить состояние "операция *"}
  Edit1.setfocus;  {установить активным окно компонента Edit1}
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  operate;  {выполнить предыдущую опeрацию}
  operation:='/';  {установить состояние "операция /"}
  Edit1.setfocus;  {установить активным окно компонента Edit1}
end;

end.

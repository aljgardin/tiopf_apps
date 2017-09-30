unit autodialogMainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  frmagtieditdialog,
  frmagtiAutoEditDialog,
  FtiPerAutoEditDialog,
  tiObject,
  agtiTestData,
  mapper;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Data: TtiObject;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Data := agtiTestData.TagtiTestClass.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  data.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  frmagtieditdialog.TagTIEditDialog.Execute(Data);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  frmagtiautoeditdialog.TagTIAutoEditDialog.Execute(Data);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  FtiPerAutoEditDialog.TFormTIPerAutoEditDialog.Execute(Data);
end;

end.


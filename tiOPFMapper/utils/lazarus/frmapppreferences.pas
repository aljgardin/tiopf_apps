unit frmAppPreferences;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, frmDefault;

type

  { TDefaultForm1 }

  TDefaultForm1 = class(TDefaultForm)
    edttimapLocation: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  DefaultForm1: TDefaultForm1;

implementation

{$R *.lfm}

{ TDefaultForm1 }

procedure TDefaultForm1.FormCreate(Sender: TObject);
begin

end;

end.


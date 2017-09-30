unit frmPreferences;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, frmDefault;

type

  { TPreferencesFrm }

  TPreferencesFrm = class(TDefaultForm)
    edttimaplocation: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private

  public
    procedure SetupMediators(AValue: TtiObject);

  end;

var
  PreferencesFrm: TPreferencesFrm;

implementation

{$R *.lfm}

{ TPreferencesFrm }

procedure TPreferencesFrm.FormCreate(Sender: TObject);
begin

end;

end.


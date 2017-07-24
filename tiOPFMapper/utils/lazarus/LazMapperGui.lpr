program LazMapperGui;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  frmMGMain,
  frmDefault,
  frmClassEdit,
  frmClassPropertyEdit,
  frmProjectSettings,
  mgView,
  MGDataManager, uRunTimap, frmViewCode;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TMGMainForm, MGMainForm);
  Application.CreateForm(TdlgProjectSettings, dlgProjectSettings);
  Application.Run;
end.


unit frm_fpLazMapperGui_Main;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, fpg_base, fpg_main, fpg_form;

type

  TfpLazMapperGui_Main = class(TfpgForm)
  private
    {@VFD_HEAD_BEGIN: fpLazMapperGui_Main}
    {@VFD_HEAD_END: fpLazMapperGui_Main}
  public
    procedure AfterCreate; override;
  end;

{@VFD_NEWFORM_DECL}

implementation

{@VFD_NEWFORM_IMPL}

procedure TfpLazMapperGui_Main.AfterCreate;
begin
  {%region 'Auto-generated GUI code' -fold}
  {@VFD_BODY_BEGIN: fpLazMapperGui_Main}
  Name := 'fpLazMapperGui_Main';
  SetPosition(494, 325, 300, 250);
  WindowTitle := 'fpLazMapperGui_Main';
  Hint := '';
  IconName := '';

  {@VFD_BODY_END: fpLazMapperGui_Main}
  {%endregion}
end;


end.

unit validator_edit_view;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, base_dialog_view, StdCtrls;

type
  TValidatorEditView = class(TBaseDialogView)
    eValue: TEdit;
    lblValue: TLabel;
    lblClassProp: TLabel;
    cboClassProp: TComboBox;
    cboValidatorType: TComboBox;
    lblValidatorType: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ValidatorEditView: TValidatorEditView;

implementation

{$R *.dfm}

end.

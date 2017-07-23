unit frmClassPropertyEdit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, frmDefault, tiObject, Mapper;

type

  { TdlgClassPropertyEdit }

  TdlgClassPropertyEdit = class(TDefaultForm)
    cbClassPropertytype: TComboBox;
    chbxClassPropertyIsReadOnly: TCheckBox;
    edlClassPropertyName: TLabeledEdit;
    edlClassPropertyTypeName: TLabeledEdit;
    pnlTop: TPanel;
    stClassPropertyType: TStaticText;
  private
  protected
    procedure SetData(AValue: TtiObject); override;//virtual; abstract;

  public
    procedure SetupMediators(AValue: TtiObject); override;//virtual; Abstract;
    class function Execute(const AData: TtiObject; pReadOnly: Boolean = false): Integer; override;
  end;

var
  dlgClassPropertyEdit: TdlgClassPropertyEdit;

implementation

{$R *.lfm}

{ TdlgClassPropertyEdit }

procedure TdlgClassPropertyEdit.SetData(AValue: TtiObject);
begin
  inherited SetData(AValue);

  SetupMediators(AValue);
end;

procedure TdlgClassPropertyEdit.SetupMediators(AValue: TtiObject);
begin
  ////AddComposite('<Fieldname>(<length>,"<Display>")', <GUIComponent>);
  //cTMapClassPropDefCols: crTMapClassPropDefCols = (
  //  (Field: 'Name'; Display: 'Name'; Length: 200 ),
  //  (Field: 'PropertyType'; Display: 'Property Type'; Length: 100 ),
  //  (Field: 'PropTypeName'; Display: 'Property Type Name'; Length: 200),
  //  (Field: 'IsReadOnly'; Display: 'Read Only'; Length: 100 ) );

  Mediator.AddProperty('Name', edlClassPropertyName);
  Mediator.AddProperty('PropertyType', cbClassPropertyType);
  Mediator.AddProperty('PropertyTypeName', edlClassPropertyTypeName);
  Mediator.AddProperty('IsReadOnly', chbxClassPropertyIsReadOnly);

  Mediator.Subject := AValue;
  Mediator.Active := true;
  AValue.NotifyObservers();
end;

class function TdlgClassPropertyEdit.Execute(const AData: TtiObject;
  pReadOnly: Boolean): Integer;
var
  aDlg: TdlgClassPropertyEdit;
begin
  { TODO : Need to handle:
  ReadOnly;
  Undo. }

  result := -1;

  aDlg := Create(nil);
  try
    aDlg.Data := AData;
    result := aDlg.ShowModal;
  finally
    aDlg.Free;
  end;
end;

end.


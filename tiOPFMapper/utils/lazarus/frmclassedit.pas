unit frmClassEdit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ComCtrls, Grids, Menus, frmDefault, tiObject, Mapper, tiModelMediator;

type

  { TdlgClassEdit }

  TdlgClassEdit = class(TDefaultForm)
    cbDefType: TComboBox;
    cbOIDType: TComboBox;
    chbxAutoCreateBase: TCheckBox;
    chbxAutoCreateListClass: TCheckBox;
    chbxAutoMap: TCheckBox;
    chbxForwardDeclare: TCheckBox;
    chbxNotifyObservers: TCheckBox;
    edlBaseClassName: TLabeledEdit;
    edlBaseClassParent: TLabeledEdit;
    edlBaseUnitName: TLabeledEdit;
    edlCrud: TLabeledEdit;
    edlORMClassName: TLabeledEdit;
    edtClassPk: TLabeledEdit;
    edtDBPKFieldname: TLabeledEdit;
    edtTableName: TLabeledEdit;
    lblDefType: TStaticText;
    lblOIDType: TStaticText;
    lblPropertyMaps: TStaticText;
    MenuItem2: TMenuItem;
    miClassPropertyAdd: TMenuItem;
    miClassPropertyDebug: TMenuItem;
    miClassPropertyEdit: TMenuItem;
    pcClass: TPageControl;
    pmClassProperties: TPopupMenu;
    pnlOrmTop: TPanel;
    pnlTop: TPanel;
    sgProperties: TStringGrid;
    sgPropertyMaps: TStringGrid;
    sgSelections: TStringGrid;
    sgValidators: TStringGrid;
    Splitter1: TSplitter;
    StaticText1: TStaticText;
    tsClass: TTabSheet;
    tsProperties: TTabSheet;
    tsSelections: TTabSheet;
    tsValidators: TTabSheet;

    procedure sgPropertiesSelection(Sender: TObject; aCol, aRow: Integer);
  private

  protected
    procedure SetData(AValue: TtiObject); override;//virtual; abstract;

  public
    //constructor Create(TheOwner: TComponent); override;
    //Destructor Destroy; override;

    mProperties: TtiModelMediator;

    procedure SetupMediators(AValue: TtiObject); override;//virtual; Abstract;
    class function Execute(const AData: TtiObject; pReadOnly: Boolean = false): Integer; override;

  end;

var
  dlgClassEdit: TdlgClassEdit;

implementation

{$R *.lfm}

{ TdlgClassEdit }

procedure TdlgClassEdit.sgPropertiesSelection(Sender: TObject; aCol,
  aRow: Integer);
begin
  { TODO : NEED TO FINISH }
  //Manager.UpdateCurrentClassProperty;
  //UpdateUnitChangeMediators;
end;

procedure TdlgClassEdit.SetData(AValue: TtiObject);
begin
  inherited SetData(AValue);

  SetupMediators(AValue);
end;

procedure TdlgClassEdit.SetupMediators(AValue: TtiObject);
begin
  //AddComposite('<Fieldname>(<length>,"<Display>")', <GUIComponent>);

  //AValue = TMapClassDef

  //Class:
  Mediator.AddProperty('BaseClassName', edlBaseClassName);
  Mediator.AddProperty('BaseClassParent', edlBaseClassParent);
  Mediator.AddProperty('BaseUnitName', edlBaseUnitName);
  Mediator.AddProperty('BaseUnitName', edlBaseUnitName);
  Mediator.AddProperty('Crud', edlCrud);
  Mediator.AddProperty('ORMClassName', edlOrmClassName);

  Mediator.AddProperty('AutoCreateBase', chbxAutoCreateBase);
  Mediator.AddProperty('AutoCreateListClass', chbxAutoCreateListClass);
  Mediator.AddProperty('AutoMap', chbxAutoMap);
  Mediator.AddProperty('ForwardDeclare', chbxForwardDeclare);
  Mediator.AddProperty('NotifyObserversOfPropertyChanges', chbxNotifyObservers);

  Mediator.AddProperty('DefType', cbDefType);

  Mediator.Subject := AValue;
  Mediator.Active := true;
  AValue.NotifyObservers();

 //Class.Properties: AValue.Properties
 //sgProperties:
   //cTMapClassPropDefCols: crTMapClassPropDefCols = (
   // (Field: 'Name'; Display: 'Name'; Length: 200 ),
   // (Field: 'PropertyType'; Display: 'Property Type'; Length: 100 ),
   // (Field: 'PropTypeName'; Display: 'Property Type Name'; Length: 200),
   // (Field: 'IsReadOnly'; Display: 'Read Only'; Length: 100 ) );
// Mediator.AddComposite('', sgProperties);

  //TMapClassPropList
  if Not(Assigned(mProperties)) then
    mProperties := TtiModelMediator.Create(self);
  { TODO : Direct to Propertydatamanager }
  //  mProperties.AddComposite(Manager.ClassPropertyDefCols, sgProperties);
  mProperties.Subject := TMapClassDef(AValue).ClassProps;
  mProperties.Active := true;

end;

class function TdlgClassEdit.Execute(const AData: TtiObject; pReadOnly: Boolean
  ): Integer;
var
  aDlg: TdlgClassEdit;
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

Initialization

Finalization

end.


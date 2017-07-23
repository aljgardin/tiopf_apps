unit frmDefault;

{$mode objfpc}{$H+}

interface

uses
  Classes
  , SysUtils
  , FileUtil
  , Forms
  , Controls
  , Graphics
  , Dialogs
  , ExtCtrls
  , StdCtrls
  , Mapper
  , mgView
  , TiObject
  , tiModelMediator
  , tiMediators
  , tiListMediators
  ;

type

  { TDefaultForm }

  TDefaultForm = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    btnDebug: TButton;
    Panel1: TPanel;
  private
    FData: TtiObject;

  protected
    { Mediators: }
    FMediator: TtiModelMediator;
    procedure SetData(AValue: TtiObject); virtual;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    property Mediator: TtiModelMediator read FMediator;
    property Data: TtiObject read FData write SetData;

    procedure SetupMediators(AValue: TtiObject); virtual; Abstract;
    class function Execute(const AData: TtiObject; pReadOnly: Boolean = false): Integer; virtual; abstract;
  end;

var
  DefaultForm: TDefaultForm;

implementation

{$R *.lfm}

{ TDefaultForm }

procedure TDefaultForm.SetData(AValue: TtiObject);
begin
  if AValue <> FData then
  begin
    FData := AValue;
  end;
end;

constructor TDefaultForm.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FMediator := TtiModelMediator.Create(self);
end;

destructor TDefaultForm.Destroy;
begin
  FMediator.Active := false;
  FMediator.subject := nil;

  inherited Destroy;
end;

Initialization
  RegisterFallBackMediators;
  RegisterFallBackListMediators;

end.


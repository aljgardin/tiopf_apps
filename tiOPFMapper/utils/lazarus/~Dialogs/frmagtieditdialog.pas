unit frmagTIEditDialog;

{Modified from FtiPerEditDialog}

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  FileUtil,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  ExtCtrls,
  ActnList,
  StdCtrls,
  tiObject,
  tiReadOnly;

type

  { TagTIEditDialog }

  TagTIEditDialog = class(TForm)
    actCancel: TAction;
    actAsDebugString: TAction;
    actOK: TAction;
    EditActionList: TActionList;
    btnCancel: TButton;
    btnOK: TButton;
    btnDebug: TButton;
    cbEnterAsTab: TCheckBox;
    pnlButtons: TPanel;
    sbEdit: TScrollBox;
    procedure actCancelExecute(Sender: TObject);
    procedure cbEnterAsTabChange(Sender: TObject);
    procedure EditActionListUpdate(AAction: TBasicAction; var Handled: Boolean);
    procedure actOKExecute(Sender: TObject);
    procedure btnDebugClick(Sender: TObject);
    procedure cbEnterAsTabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    FData: TtiObject;
    FDataBuffer: TtiObject;
    FRO: TtiReadOnly;

  protected
    property Databuffer: TtiObject read FDataBuffer write FDataBuffer;

    // Implement these in the concrete...
    procedure SetData(const AValue: TtiObject); virtual;
    function FormIsValid: boolean; virtual;
    function FormIsEdited: boolean; virtual;
    procedure SetupButtons;

  public
    property Data: TtiObject read FData write SetData;
    property RO: TtiReadOnly read FRO write FRO;
    class function Execute(const AData: TtiObject;
      pReadOnly: boolean = False): boolean; virtual;

  end;

var
  agTIEditDialog: TagTIEditDialog;

implementation

uses
  tiGUIINI;

{$R *.lfm}

{ TagTIEditDialog }

procedure TagTIEditDialog.FormCreate(Sender: TObject);
begin
  gGUIINI.ReadFormState(self);

  RO := TtiReadOnly.Create(self);

  cbEnterAsTab.Checked := gGUIINI.ReadBool(Name, 'EnterAsTab', False);
end;

procedure TagTIEditDialog.FormDestroy(Sender: TObject);
begin
  gGUIINI.WriteFormState(self);

  RO.Free;
  FDataBuffer.Free;
end;

procedure TagTIEditDialog.cbEnterAsTabClick(Sender: TObject);
begin
  SetupButtons;
end;

procedure TagTIEditDialog.actOKExecute(Sender: TObject);
begin
  Assert(FData <> nil, 'FData not assigned');
  Assert(FDataBuffer <> nil, 'FDataBuffer not assigned');
  FData.Assign(FDataBuffer);
  FData.Dirty := True;
  ModalResult := mrOk;
end;

procedure TagTIEditDialog.btnDebugClick(Sender: TObject);
begin
  ShowMessage(Data.AsDebugString());
end;

procedure TagTIEditDialog.actCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TagTIEditDialog.cbEnterAsTabChange(Sender: TObject);
begin

end;

procedure TagTIEditDialog.EditActionListUpdate(AAction: TBasicAction;
  var Handled: Boolean);
begin
  actOK.Enabled := FormIsValid and FormIsEdited;
  btnCancel.Default := (not cbEnterAsTab.Checked) and (not actOK.Enabled);
  Handled := true;
end;

procedure TagTIEditDialog.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  ActiveControl := nil;
end;

procedure TagTIEditDialog.FormShow(Sender: TObject);
begin
  SelectFirst;
end;

procedure TagTIEditDialog.SetData(const AValue: TtiObject);
begin
  FData := AValue;
  FreeAndNil(FDataBuffer);
  if FData <> nil then
    FDataBuffer := FData.Clone;
  SetupButtons;
end;

function TagTIEditDialog.FormIsValid: boolean;
begin
  Result := True;
end;

function TagTIEditDialog.FormIsEdited: boolean;
begin
  if FData = nil then
    Result := False
  else
    Result := not FData.Equals(FDataBuffer);
end;

procedure TagTIEditDialog.SetupButtons;
begin
  // No data
  if (FData = nil) or (FDataBuffer = nil) then
  begin
    actOK.Enabled := False;
    btnCancel.Default := True;
    Exit; //==>
  end;

  btnCancel.Default := False;
  btnOK.Default := not cbEnterAsTab.Checked;
  KeyPreview := cbEnterAsTab.Checked;
end;

class function TagTIEditDialog.Execute(const AData: TtiObject;
  pReadOnly: boolean): boolean;
var
  lForm: TagTIEditDialog;
begin
  lForm := Create(nil);
  try
    lForm.Data := AData;
    if pReadOnly then
      lForm.RO.Enabled := True;
    lForm.RO.ReadOnly := pReadOnly;
    Result := lForm.ShowModal = mrOk;
  finally
    lForm.Free;
  end;
end;

end.

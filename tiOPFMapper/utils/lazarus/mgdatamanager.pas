unit MGDataManager;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF WIN32}
  Classes,  //Win32
  SysUtils,  //Win32
  Forms,  //Win32
  {$ENDIF}
  Dialogs,  //LCL
  Controls,  //LCL
  typinfo,
  TiObject,
  tiopfManager,
  tiCommandLineParams,
  tiLog,
  tiLogToConsole,
  tiLogToGUI,
  tiLogToFile,
  tiLogToDebugSvr,
  agtiPropertyGUIManager,
  Mapper;

type

  { TMGDataManager }

  TMGDataManager = class(TtiObject)
  private
    FCurrentUnit: TMapUnitDef;
    FDummyUnit: TMapUnitDef;
    FCurrentClass: TMapClassDef;
    FDummyClass: TMapClassDef;
    FData: TtiObject;
    FDataBuffer: TtiObject;
    FFilename: String;
    function GetCurrentClass: TMapClassDef;
    function GetCurrentUnit: TMapUnitDef;
    procedure SetCurrentClass(AValue: TMapClassDef);
    procedure SetCurrentUnit(AValue: TMapUnitDef);
    procedure SetFilename(AValue: String);
    procedure SetData(AValue: TtiObject);
    procedure SetMapProject(AValue: TMapProject);

  protected
    FMapProject: TMapProject;

    property DataBuffer: TtiObject read FDataBuffer write FDataBuffer;
    function DataEdited: Boolean;
    procedure SetBuffer;

    //Override these methods in descendants:
    function DoSaveData: Boolean; virtual;  //override to save data.
    function DoSaveDataAs: Boolean; virtual;  //override to save data.
    function DoOpenData(aFilename: String): Boolean; Virtual;  //override to open-load data.
    procedure QuerySaveData; virtual;  //on close, open new check to save data.

    //Call These normally, Move to Public when ready.
    procedure SaveData;
    procedure SaveDataAs(aFilename: String);
    procedure OpenData(aFilename: String);

  public
//    property Data: TtiObject read FData write SetData;
    property MapProject: TMapProject read FMapProject write SetMapProject;
    property Filename: String read FFilename write SetFilename;

    property CurrentUnit: TMapUnitDef read GetCurrentUnit write SetCurrentUnit;
    property CurrentClass: TMapClassDef read GetCurrentClass write SetCurrentClass;

    procedure Log(const AMessage : string;
                  const ASeverity : TtiLogSeverity = lsNormal);// overload;
    procedure Log(const AMessage : string;
                  const AArray : Array of Const;
                  const ASeverity : TtiLogSeverity = lsNormal);// overload;

    Constructor Create; Override;
    Destructor Destroy; Override;

    function ProjectActive: Boolean;
    function UnitActive: Boolean;
    function ClassActive: Boolean;

  published

  end;


Var
  gMGManager: TMGDataManager;

implementation

uses
  frmMGMain;

{ tagiDefaultManager }

procedure TMGDataManager.SetFilename(AValue: String);
begin
  Log('TMGDataManager.SetFilename(String); Fired.');
  if FFilename = AValue then Exit;
  FFilename := AValue;
end;

procedure TMGDataManager.SetCurrentUnit(AValue: TMapUnitDef);
begin
  Log('procedure TMGDataManager.SetCurrentUnit(AValue: TMapUnitDef); Called.');
  if FCurrentUnit = AValue then Exit;
  FCurrentUnit := AValue;
end;

function TMGDataManager.GetCurrentClass: TMapClassDef;
var
  cci: integer;
begin
  Log('function TMGDataManager.GetCurrentClass: TMapClassDef; Called.');
  // Return dummy class or Selected class.
  if Not(assigned(MGMainForm)) or (MGMainForm = nil) then
  begin
    raise Exception.Create('MGMainForm not Assigned or nil.  In function TMGDataManager.GetCurrentClass: TMapClassDef;');
    result := FDummyClass;
    exit;
  end;

  cci := MGMainForm.GetSelectedClassIDX;
  if cci < 0 then
    FCurrentClass := FDUmmyClass
  else
    FCurrentClass := GetCurrentUnit.UnitClasses[cci];

  result := FCurrentClass;
end;

function TMGDataManager.GetCurrentUnit: TMapUnitDef;
var
  cui: Integer;
begin
  Log('function TMGDataManager.GetCurrentUnit: TMapUnitDef; Called.');
  { TODO : SHould this check be donw somewhere else? }

  if Not(assigned(MGMainForm)) or (MGMainForm = nil) then
  begin
    raise Exception.Create('MGMainForm not Assigned or nil.  In function TMGDataManager.GetCurrentUnit: TMapUnitDef;');
    result := FDummyUnit;
    exit;
  end;

  cui := MGMainForm.GetSelectedUnitIDX;
  if cui < 0 then
    FCurrentUnit := FDummyUnit
  else
    FCurrentUnit := MapProject.Units[cui];

  result := FCurrentUnit;
end;

procedure TMGDataManager.SetCurrentClass(AValue: TMapClassDef);
begin
  Log('procedure TMGDataManager.SetCurrentClass(AValue: TMapClassDef); Called.');
  if FCurrentClass = AValue then exit;
  FCurrentClass := AValue;
end;

procedure TMGDataManager.SetData(AValue: TtiObject);
begin
  Log('procedure TMGDataManager.SetData(AValue: TtiObject); Called.');
  if FData = AValue then Exit;
  FData := AValue;
end;

function TMGDataManager.ProjectActive: Boolean;
begin
  if Length(MapProject.FileName) > 5 then
    Result := true
  else
    result := false;
end;

function TMGDataManager.UnitActive: Boolean;
begin
  if CurrentUnit.Name = 'Not Assigned' then
    result := false
  else
    result := true;
end;

function TMGDataManager.ClassActive: Boolean;
begin
  if CurrentClass.BaseClassName = 'Not Assigned' then
    result := false
  else
    result := true;
end;

procedure TMGDataManager.SetMapProject(AValue: TMapProject);
begin
  Log('procedure TMGDataManager.SetMapProject(AValue: TMapProject); Called.');
  if FMapProject = AValue then Exit;
  FMapProject := AValue;
end;

function TMGDataManager.DataEdited: Boolean;
begin
  Log('TMGDataManager.DataEdited; Fired.');
  result := not FData.Equals(FDataBuffer);
end;

function TMGDataManager.DoSaveData: Boolean;
begin
  Log('TMGDataManager.DoSaveData; Fired.');
  result := false;
end;

function TMGDataManager.DoSaveDataAs: Boolean;
begin
  Log('TMGDataManager.DoSaveDataAs; Fired.');
  result := false;
end;

function TMGDataManager.DoOpenData(aFilename: String): Boolean;
begin
  Log('TMGDataManager.DoOpenData(String); Fired.');
  result := false;
end;

procedure TMGDataManager.QuerySaveData;
begin
  Log('TMGDataManager.QuerySaveData; Fired.');
  if Dialogs.QuestionDlg('Data Not Saved.', 'Data has not been saved.  Save Data Now?', mtCustom, [mrYes, mrNo], '') = mrYes then
    SaveData;
end;

procedure TMGDataManager.SaveData;
begin
  Log('TMGDataManager.SaveData; Fired.');
  if DoSaveData then
  begin
    SetBuffer;
  end;
end;

procedure TMGDataManager.SaveDataAs(aFilename: String);
begin
  Log('TMGDataManager.SaveDataAs(String); Fired.');
  if DoSaveDataAs then
  begin
    SetBuffer;
  end;
end;

procedure TMGDataManager.OpenData(aFilename: String);
begin
  Log('TMGDataManager.OpenData(String); Fired.');
  if DoOpenData(aFilename) then
  begin
    SetBuffer;
  end;
end;

procedure TMGDataManager.SetBuffer;
begin
  Log('procedure TMGDataManager.SetBuffer; Fired.');
  FreeAndNil(FDataBuffer);
  if FData <> nil then
    FDataBuffer := FData.Clone;
end;

procedure TMGDataManager.Log(const AMessage: string;
  const ASeverity: TtiLogSeverity);
begin
  gLog.Log(AMessage, ASeverity);
end;

procedure TMGDataManager.Log(const AMessage: string;
  const AArray: array of const; const ASeverity: TtiLogSeverity);
begin
  gLog.Log(AMessage, AArray, aSeverity);
end;

constructor TMGDataManager.Create;
begin
  inherited Create;

  FMapProject := TMapProject.Create;
  FData := FMapProject;
  SetBuffer;

  FDummyUnit := TMapUnitDef.Create;
  FDummyUnit.Name := 'Not Assigned';
  FDummyClass := TMapClassDef.Create;
  FDummyClass.BaseClassName := 'Not Assigned';

  // Logging
  //csLog         = 'l'; // Command line parameter to turn logging on (default log to file)
  //csLogVisual   = 'lv'; // Command line parameter to turn visual logging on
  //csLogConsole  = 'lc'; // Command line parameter to turn console logging on
  //csLogDebugSvr = 'ls'; // Command line parameter to turn debug server logging on
  if gCommandLineParams.IsParam(csLogConsole) then
    gLog.RegisterLog(TtiLogToConsole);
  if gCommandLineParams.IsParam(csLog) then
    gLog.RegisterLog(TtiLogToFile.CreateWithFileName('',ExtractFilename(Application.ExeName), True));
  if gCommandLineParams.IsParam(csLogVisual) then
    gLog.RegisterLog(TtiLogToGUI.Create);
  if gCommandLineParams.IsParam(csLogDebugSvr) then
    gLog.RegisterLog(TtiLogToDebugSvr);

end;

destructor TMGDataManager.Destroy;
begin
  Log('TMGDataManager.Destroy; Fired.');

  if DataEdited then
    QuerySaveData;

  FreeAndNil(FMapProject);
  FreeAndNil(FData);
  FreeAndNil(FDataBuffer);

  FreeAndNil(FDummyClass);
  FreeAndNil(FDummyUnit);

  inherited Destroy;
end;

Initialization
  gMGManager := TMGDataManager.Create;

Finalization
  gMGManager.Free;

end.



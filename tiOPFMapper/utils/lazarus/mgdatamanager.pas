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
  stdCtrls,
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
  Mapper,
  Test_GMapper,
  agtifpc_schema_Reader,
  agtiMapper_Project_Writer,
  mgView;

type

  { TMGDataManager }

  TMGDataManager = class(TtiObject)
  private
    FDUmmyProject: TGMapProject;
    FDummyUnit: TGMapUnitDef;
    FDummyClass: TMapClassDef;
    FDummyProperty: TMapClassProp;
    FData: TtiObject;
    FDataBuffer: TtiObject;
    FFilename: String;
    procedure SetDummyUnit(AValue: TGMapUnitDef);
    procedure SetFilename(AValue: String);
    procedure SetData(AValue: TtiObject);
    procedure SetMapProject(AValue: TGMapProject);

  protected
    FMapProject: TGMapProject;

    property DataBuffer: TtiObject read FDataBuffer write FDataBuffer;
    procedure SetBuffer;

    procedure NewDummyProject;
    procedure NewDummyUnit;
    procedure NewDummyClass;
    procedure NewDummyProperty;
    procedure NewDummyAll;

    //Override these methods in descendants:
    function DoSaveData: Boolean; virtual;  //override to save data.
    function DoSaveDataAs: Boolean; virtual;  //override to save data.
    function DoOpenData(aFilename: String): Boolean; Virtual;  //override to open-load data.


    procedure ClearAll;

    procedure SetupTestProject;

  public
//    property Data: TtiObject read FData write SetData;
    property MapProject: TGMapProject read FMapProject write SetMapProject;
    property Filename: String read FFilename write SetFilename;

    property DummyUnit: TGMapUnitDef read FDummyUnit write SetDummyUnit;

    procedure Log(const AMessage : string;
                  const ASeverity : TtiLogSeverity = lsNormal);// overload;
    procedure Log(const AMessage : string;
                  const AArray : Array of Const;
                  const ASeverity : TtiLogSeverity = lsNormal);// overload;

    function ProjectActive: Boolean;

    Constructor Create; Override;
    Destructor Destroy; Override;

    //Call These normally, Move to Public when ready.
    procedure SaveData;
    procedure SaveDataAs(aFilename: String);
    procedure OpenData(aFilename: String);
    function QuerySaveData: Boolean; virtual;  //on close, open new check to save data.

    function IsDataEdited: Boolean;

  published

  end;


Var
  gMGManager: TMGDataManager;

implementation

uses
  frmMGMain;

procedure TMGDataManager.SetFilename(AValue: String);
begin
  Log('TMGDataManager.SetFilename(String); Fired.' +
    ':: AValue: String = ' + AValue + '  FFilename = ' + FFileName);
  if FFilename = AValue then Exit;
  FFilename := AValue;
end;

procedure TMGDataManager.SetDummyUnit(AValue: TGMapUnitDef);
begin
  if FDummyUnit = AValue then Exit;
  FDummyUnit := AValue;
end;

procedure TMGDataManager.SetData(AValue: TtiObject);
begin
  Log('procedure TMGDataManager.SetData(AValue: TtiObject); Called.');
  if FData = AValue then Exit;
  FData := AValue;
end;

function TMGDataManager.ProjectActive: Boolean;
begin
  Log('function TMGDataManager.ProjectActive: Boolean; Called.');
  if (Length(MapProject.FileName) > 4) and (MapProject.FileName <> 'Not Assigned') then
    Result := true
  else
    result := false;
end;

procedure TMGDataManager.SetMapProject(AValue: TGMapProject);
begin
  Log('procedure TMGDataManager.SetMapProject(AValue: TMapProject); Called.');
  if FMapProject = AValue then Exit;
  FMapProject := AValue;
end;

function TMGDataManager.IsDataEdited: Boolean;
begin
  Log('TMGDataManager.IsDataEdited; Fired.');
  result := not FData.Equals(FDataBuffer);
end;

function TMGDataManager.DoSaveData: Boolean;
begin
  Log('TMGDataManager.DoSaveData; Fired.');
  result := true;
end;

function TMGDataManager.DoSaveDataAs: Boolean;
begin
  Log('TMGDataManager.DoSaveDataAs; Fired.');
  result := true;
end;

function TMGDataManager.DoOpenData(aFilename: String): Boolean;
begin
  Log('TMGDataManager.DoOpenData(String); Fired.');
  result := true;
end;

function TMGDataManager.QuerySaveData: Boolean;
begin
  Log('TMGDataManager.QuerySaveData; Fired.');
  if Dialogs.QuestionDlg('Data Not Saved.', 'Data has not been saved.  Save Data Now?', mtCustom, [mrYes, mrNo], '') = mrYes then
    SaveData;
end;

procedure TMGDataManager.ClearAll;
begin
  Log('procedure TMGDataManager.ClearAll; Called.');
  //Clears all data.  Dummy's and main data.
  FMapProject.ClearAll;
  NewDummyAll;
end;

procedure TMGDataManager.SetupTestProject;
var
  iu, ic, ie, ir, icp: Integer;
  mu: TGMapUnitDef;
  uclass: TMapClassDef;
  ue: TMapEnum;
  ur: TGMapUnitReference;
  cp: TMapClassProp;

  type
  rName = record
    Name: String;
  end;

  const
  crNames: Array[1..5] of rName = (
    (name: 'One'),
    (name: 'Two'),
    (name: 'Three'),
    (name: 'Four'),
    (name: 'Five'));

begin
  for iu := Low(crNames) to High(crNames) do
  begin
    mu := TGMapUnitDef.Create;
    mu.Name := 'u' + crNames[iu].name;

    MapProject.Units.Add(mu);

    for ic := Low(crNames) to High(crNames) do
    begin
      uclass := TMapClassDef.Create;
      uclass.BaseClassName := mu.Name + 'c' + crNames[ic].name;

      for icp := Low(crNames) to High(crNames) do
      begin
        cp := TMapClassProp.Create;
        cp.Name := 'c' + crNames[icp].name + '_' + uclass.BaseClassName;
        cp.PropertyType := ptString;

        uclass.ClassProps.Add(cp);
      end;

      mu.UnitClasses.Add(uclass);
    end;

    for ie := Low(crNames) to High(crNames) do
    begin
      ue := TMapEnum.Create;
      ue.EnumName := 'e' + crNames[ie].name;

      mu.UnitEnums.Add(ue);
    end;

    for ir := Low(crNames) to High(crNames) do
    begin
      ur := TGMapUnitReference.Create;
      ur.Reference := 'ref' + crNames[ir].name;

      mu.UnitReferences.Add(ur);
    end;
  end;
end;

procedure TMGDataManager.SaveData;
var
  fsw: TagtiProjectWriter;
begin
  Log('TMGDataManager.SaveData; Fired.');
  if DoSaveData then
  begin
    try
      fsw := TagtiProjectWriter.Create;
      fsw.WriteProject(MapProject, MapProject.FileName);
      SetBuffer;
    finally
      fsw.Free;
    end;
  end;
end;

procedure TMGDataManager.SaveDataAs(aFilename: String);
var
  fsw: TagtiProjectWriter;
begin
  Log('TMGDataManager.SaveData; Fired.');
  if DoSaveData then
  begin
    try
      fsw := TagtiProjectWriter.Create;
      fsw.WriteProject(MapProject, aFilename);
{ TODO : Ask to change project filename }
      SetBuffer;
    finally
      fsw.Free;
    end;
  end;
end;

procedure TMGDataManager.OpenData(aFilename: String);
var
  fsr: TagtiFPCSchemaXMLReader;
  c: Integer;
  s: string;
begin
  Log('TMGDataManager.OpenData(String); Fired.');
  if DoOpenData(aFilename) then
  begin
    if IsDataEdited then
      QuerySaveData;

    MapProject.ClearAll;
    fsr := TagtiFPCSchemaXMLReader.Create;
    fsr.ReadSchema(MapProject, aFilename);
    fsr.Free;
    SetBuffer;

    MapProject.NotifyObservers();
    MapProject.Units.NotifyObservers();

    {$IFDEF DEBUG}
    s := MapProject.Units.AsDebugString();
    if MapProject.Units.Count > 0 then
    begin
      s := s + #10#13 + MapProject.Units[0].AsDebugString();
    end;
    ShowMessage(s);
    {$ENDIF}
  end;
end;

procedure TMGDataManager.SetBuffer;
begin
  Log('procedure TMGDataManager.SetBuffer; Fired.');
  FreeAndNil(FDataBuffer);
  if FData <> nil then
    FDataBuffer := FData.Clone;
end;

procedure TMGDataManager.NewDummyProject;
begin
  Log('procedure TMGDataManager.NewDummyProject; Called.');
  if Not(Assigned(FDummyProject)) then
    FDummyProject := TGMapProject.Create;

  FDummyProject.FileName := 'Not Assigned';
  FDummyProject.NotifyObservers();
end;

procedure TMGDataManager.NewDummyUnit;
begin
  Log('procedure TMGDataManager.NewDummyUnit; Called.');
  if not(Assigned(FDummyUnit)) then
    FDummyUnit := TGMapUnitDef.Create;

  FDummyUnit.Name := 'Not Assigned';
  FDummyUnit.NotifyObservers();
end;

procedure TMGDataManager.NewDummyClass;
begin
  Log('procedure TMGDataManager.NewDummyClass; Called.');
  if Not(Assigned(FDummyClass)) then
    FDummyClass := TMapClassDef.Create;

  FDummyClass.BaseClassName := 'Not Assigned';
  FDummyClass.NotifyObservers();
end;

procedure TMGDataManager.NewDummyProperty;
begin
  Log('procedure TMGDataManager.NewDummyProperty; Called.');
  if Not(Assigned(FDummyProperty)) then
    FDummyProperty := TMapClassProp.Create;

  FDummyProperty.Name := 'Not Assigned';
  FDummyProperty.NotifyObservers();
end;

procedure TMGDataManager.NewDummyAll;
begin
  Log('procedure TMGDataManager.NewDummyAll; Called.');
  NewDummyProject;
  NewDummyUnit;
  NewDummyClass;
  NewDummyProperty;
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
var
  logfile: String;
begin
  inherited Create;

  FMapProject := TGMapProject.Create;
  FData := FMapProject;
  SetBuffer;

  {$ifdef debug}
  FMapProject.FileName := 'TestProject.xml';
  FMapProject.ProjectName := 'Test Project';

  SetupTestProject;
  {$endif}

  NewDummyAll;

  // Logging
  //csLog         = 'l'; // Command line parameter to turn logging on (default log to file)
  //csLogVisual   = 'lv'; // Command line parameter to turn visual logging on
  //csLogConsole  = 'lc'; // Command line parameter to turn console logging on
  //csLogDebugSvr = 'ls'; // Command line parameter to turn debug server logging on
  logfile := ChangeFileExt(ExtractFilename(Application.ExeName), '.log');
  if gCommandLineParams.IsParam(csLogConsole) then
    gLog.RegisterLog(TtiLogToConsole);
  if gCommandLineParams.IsParam(csLog) then
    gLog.RegisterLog(TtiLogToFile.CreateWithFileName('',logfile, True));
  if gCommandLineParams.IsParam(csLogVisual) then
    gLog.RegisterLog(TtiLogToGUI.Create);
  if gCommandLineParams.IsParam(csLogDebugSvr) then
    gLog.RegisterLog(TtiLogToDebugSvr);

end;

destructor TMGDataManager.Destroy;
begin
  Log('TMGDataManager.Destroy; Fired.');

  if IsDataEdited then
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



unit frmMGMain;

{ TODO : Create function to set column width to fit header.
  For:  Classes, Stringgrids}


{$mode objfpc}{$H+}

interface

uses
  Classes
  , SysUtils
  , FileUtil
  , mrumanager
  , Forms
  , Controls
  , Graphics
  , Dialogs
  , Menus
  , ExtCtrls
  , StdCtrls
  , ComCtrls
  , ActnList
  , Grids
  , Mapper, fpc_schema_reader
  , Test_GMapper
  , agtiMapper_Project_Writer, agtifpc_schema_reader
  , mgDataManager
  , mgView
  , tiObject
  , tiModelMediator
  , tiListMediators
  ;

type

  { TMGMainForm }

  TMGMainForm = class(TForm)
    actClassesAdd: TAction;
    actClassesEdit: TAction;
    actClassesDelete: TAction;
    actEnvironmentVars: TAction;
    actClassesDebug: TAction;
    actClassesSort: TAction;
    actAppPreferences: TAction;
    actEnumerationAdd: TAction;
    actEnumerationEdit: TAction;
    actEnumerationDelete: TAction;
    actEnumerationDebug: TAction;
    actReferencesDebug: TAction;
    actReferenceDelete: TAction;
    actReferenceEdit: TAction;
    actReferenceAdd: TAction;
    actUnitCount: TAction;
    actShowViewCodeForm: TAction;
    actProjectGenerateInternal: TAction;
    actProjectFont: TAction;
    actUnitAsDebugString: TAction;
    actProjectClose: TAction;
    actProjectExit: TAction;
    actProjectAsDebugString: TAction;
    actUnitSort: TAction;
    actUnitDelete: TAction;
    actUnitRename: TAction;
    actUnitAdd: TAction;
    actProjectSettings: TAction;
    actProjectRecent: TAction;
    actProjectSaveAs: TAction;
    actProjectSave: TAction;
    actProjectOpen: TAction;
    actProjectNew: TAction;
    alMain: TActionList;
    apMainProps: TApplicationProperties;
    FontDlg: TFontDialog;
    lblCurrentUnit: TLabel;
    lblCurrentClass: TLabel;
    lblCurrentUnitHeader: TLabel;
    lblCurrentClassHeader: TLabel;
    lblProjectFilename: TLabel;
    lblProjectNameHeader: TLabel;
    lblProjectName: TLabel;
    lblProjectFilenameHeader: TLabel;
    lblUnits: TLabel;
    lvEnum: TListView;
    miEnumerationDebug: TMenuItem;
    miEnumerationDelete: TMenuItem;
    miEnumerationEdit: TMenuItem;
    miEnumerationAdd: TMenuItem;
    miProjectSettings: TMenuItem;
    miUnitCount: TMenuItem;
    miSelectedUnit: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    miPreferences: TMenuItem;
    miClassAsDebugString: TMenuItem;
    miAsDebugString: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    miProjectAsDebugString: TMenuItem;
    miClassDebug: TMenuItem;
    miFont: TMenuItem;
    moLog: TMemo;
    MenuItem1: TMenuItem;
    miCopy: TMenuItem;
    miPaste: TMenuItem;
    miCut: TMenuItem;
    miEdit: TMenuItem;
    miUnitSort: TMenuItem;
    miUnitAdd: TMenuItem;
    miUnitRename: TMenuItem;
    miUnitDelete: TMenuItem;
    mmMain: TMainMenu;
    miGenerate: TMenuItem;
    miExit: TMenuItem;
    miDivider2: TMenuItem;
    miCloseProject: TMenuItem;
    miProjectsRecent: TMenuItem;
    miDivider1: TMenuItem;
    miSaveProjectAs: TMenuItem;
    miFile: TMenuItem;
    miNewProject: TMenuItem;
    miOpenProject: TMenuItem;
    miSaveProject: TMenuItem;
    mru1: TMRUMenuManager;
    ODProject: TOpenDialog;
    pnlBottom: TPanel;
    pcMain: TPageControl;
    pnlCurrentUnit: TPanel;
    pnlProjectFilename: TPanel;
    pnlRight: TPanel;
    pnlProjectName: TPanel;
    pmUnits: TPopupMenu;
    pmClasses: TPopupMenu;
    pmEnumerations: TPopupMenu;
    SDProject: TSaveDialog;
    sgEnumerations: TStringGrid;
    Splitter1: TSplitter;
    pnlUnits: TPanel;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    sgClasses: TStringGrid;
    sgUnits: TStringGrid;
    sgReferences: TStringGrid;
    tsReferences: TTabSheet;
    tsClasses: TTabSheet;
    tsEnum: TTabSheet;
    procedure actAppPreferencesExecute(Sender: TObject);
    procedure actClassesAddExecute(Sender: TObject);
    procedure actClassesAddUpdate(Sender: TObject);
    procedure actClassesDebugExecute(Sender: TObject);
    procedure actClassesDebugUpdate(Sender: TObject);
    procedure actClassesDeleteExecute(Sender: TObject);
    procedure actClassesDeleteUpdate(Sender: TObject);
    procedure actClassesEditExecute(Sender: TObject);
    procedure actClassesEditUpdate(Sender: TObject);
    procedure actClassesSortExecute(Sender: TObject);
    procedure actClassesSortUpdate(Sender: TObject);
    procedure actClassPropertyAddExecute(Sender: TObject);
    procedure actClassPropertyAddUpdate(Sender: TObject);
    procedure actClassPropertyDebugExecute(Sender: TObject);
    procedure actClassPropertyEditExecute(Sender: TObject);
    procedure actClassPropertyEditUpdate(Sender: TObject);
    procedure actClearUnitsExecute(Sender: TObject);
    procedure actEnumerationAddExecute(Sender: TObject);
    procedure actEnumerationAddUpdate(Sender: TObject);
    procedure actEnumerationDebugExecute(Sender: TObject);
    procedure actEnumerationDebugUpdate(Sender: TObject);
    procedure actEnumerationDeleteExecute(Sender: TObject);
    procedure actEnumerationDeleteUpdate(Sender: TObject);
    procedure actEnumerationEditExecute(Sender: TObject);
    procedure actEnumerationEditUpdate(Sender: TObject);
    procedure actEnvironmentVarsExecute(Sender: TObject);
    procedure actIncludesAddExecute(Sender: TObject);
    procedure actIncludesDebugExecute(Sender: TObject);
    procedure actIncludesDeleteExecute(Sender: TObject);
    procedure actIncludesEditExecute(Sender: TObject);
    procedure actProjectAsDebugStringExecute(Sender: TObject);
    procedure actProjectAsDebugStringUpdate(Sender: TObject);
    procedure actProjectCloseExecute(Sender: TObject);
    procedure actProjectCloseUpdate(Sender: TObject);
    procedure actProjectExitExecute(Sender: TObject);
    procedure actProjectExitUpdate(Sender: TObject);
    procedure actProjectFontExecute(Sender: TObject);
    procedure actProjectFontUpdate(Sender: TObject);
    procedure actProjectGenerateInternalExecute(Sender: TObject);
    procedure actProjectGenerateUpdate(Sender: TObject);
    procedure actProjectNewUpdate(Sender: TObject);
    procedure actProjectOpenExecute(Sender: TObject);
    procedure actProjectOpenUpdate(Sender: TObject);
    procedure actProjectRecentExecute(Sender: TObject);
    procedure actProjectRecentUpdate(Sender: TObject);
    procedure actProjectSaveAsExecute(Sender: TObject);
    procedure actProjectSaveAsUpdate(Sender: TObject);
    procedure actProjectSaveExecute(Sender: TObject);
    procedure actProjectSaveUpdate(Sender: TObject);
    procedure actProjectSettingsExecute(Sender: TObject);
    procedure actProjectNewExecute(Sender: TObject);
    procedure actProjectSettingsUpdate(Sender: TObject);
    procedure actReferenceAddExecute(Sender: TObject);
    procedure actReferenceAddUpdate(Sender: TObject);
    procedure actReferenceDeleteExecute(Sender: TObject);
    procedure actReferenceDeleteUpdate(Sender: TObject);
    procedure actReferenceEditExecute(Sender: TObject);
    procedure actReferenceEditUpdate(Sender: TObject);
    procedure actReferencesDebugExecute(Sender: TObject);
    procedure actReferencesDebugUpdate(Sender: TObject);
    procedure actSelectedUnitExecute(Sender: TObject);
    procedure actSelectedUnitUpdate(Sender: TObject);
    procedure actShowViewCodeFormExecute(Sender: TObject);
    procedure actUnitAddExecute(Sender: TObject);
    procedure actUnitAddUpdate(Sender: TObject);
    procedure actUnitAsDebugStringExecute(Sender: TObject);
    procedure actUnitAsDebugStringUpdate(Sender: TObject);
    procedure actUnitCountExecute(Sender: TObject);
    procedure actUnitCountUpdate(Sender: TObject);
    procedure actUnitDeleteExecute(Sender: TObject);
    procedure actUnitDeleteUpdate(Sender: TObject);
    procedure actUnitEditUpdate(Sender: TObject);
    procedure actUnitRenameExecute(Sender: TObject);
    procedure actUnitRenameUpdate(Sender: TObject);
    procedure actUnitSortExecute(Sender: TObject);
    procedure actUnitSortUpdate(Sender: TObject);
    procedure apMainActivate(Sender: TObject);
    procedure apMainPropsActivate(Sender: TObject);
    procedure apMainPropsIdle(Sender: TObject; var Done: Boolean);
    procedure FontDlgApplyClicked(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sgClassesDblClick(Sender: TObject);
    procedure sgClassesSelection(Sender: TObject; aCol, aRow: Integer);
    procedure sgUnitsSelection(Sender: TObject; aCol, aRow: Integer);

  private
    FCurrentUnitIDX: Integer;
    FMapProject: TGMapProject;
    function GetCurrentUnitIDX: Integer;
    procedure SetCurrentUnitIDX(AValue: Integer);
    procedure SetMapProject(AValue: TGMapProject);

  protected
    property MapProject: TGMapProject read FMapProject write SetMapProject;
    property CurrentUnitIDX: Integer read GetCurrentUnitIDX write SetCurrentUnitIDX;
    function GetCurrentUnit: TGMapUnitDef;
    function IsUnitActive: boolean;

  public
    { public declarations }

    {Mediator Classes:}

    {mMapProject, mediator for current project.}
    mMapProject: TtiModelMediator;

    {mMapProjectUnit, mediator for current Unit.}
    {  props: Name.}
    mMapProjectUnit: TtiModelMediator;

    {mUnitsSG: Mediator for Units stringrid.}
    mUnitsSG: TMapProject_Units_TStringGrid_Mediator;

    {mClassesSG: Medaitor for Classes stringrid.}
    mClassesSG: TMapProject_Classes_TStringgrid_Mediator;

    {mEnumerationsSG: Mediator for Enumerations stringrid.}
    mEnumerationsSG: TMapProject_Unit_Enumerations_StringGrid_Mediator;

    {mReferencesSG: Mediator for References stringrid.}
    mReferencesSG: TMapProject_Unit_References_StringGrid_Mediator;

    {End Mediators.}

    procedure SetupMediators;

    procedure SetupProjectMediators(ASubject: TGMapProject);
    procedure SetupUnitsMediators(ASubject: TGMapUnitDefList);
    procedure SetupUnitMediators(ASubject: TGMapUnitDef);
    procedure SetupUnitClassesMediators(ASubject: TMapClassDefList);
    procedure SetupUnitEnumerationsMediators(ASubject: TMapEnumList);
    procedure SetupUnitReferencesMediators(ASubject: TGMapUnitReferenceList);

    procedure FreeMediators;

    procedure Log(Msg: String);
    function Manager: TMGDataManager;  // returns uManager.Manager.

  published

end;

function GetMyVendorName: string;

var
  MGMainForm: TMGMainForm;

implementation

uses
  frmProjectSettings, agtiPropertyGUIManager, frmClassEdit, frmViewCode, frmClassPropertyEdit;

function GetMyVendorName: string;
begin
  Result := 'AG Automated Systems';
end;

{$R *.lfm}

{ TMGMainForm }

procedure TMGMainForm.SetupMediators;
var
  cUnit: TGMapUnitDef;
begin
  Log('procedure TMGMainForm.SetupMediators; Called.');

  {Project}
  SetupProjectMediators(MapProject);

  {Units}
  SetupUnitsMediators(MapProject.Units);

  // Establish Current Unit:
  cUnit := GetCurrentUnit;
  if Not(cUnit.IsValid) then
  begin
    log('::cUnit: TGMapUnitDef, returned from GetCurrentUnit is Invalid.  Using Dummy Unit.');
    cUnit := Manager.DummyUnit;
  end;

  {Unit}
  SetupUnitMediators(cUnit);

  {Unit Classes}
  SetupUnitClassesMediators(cUnit.UnitClasses);

  {Unit Enumerations}
  SetupUnitEnumerationsMediators(cUnit.UnitEnums);

  {Unit References}
  SetupUnitReferencesMediators(cUnit.UnitReferences);
end;

procedure TMGMainForm.SetupProjectMediators(ASubject: TGMapProject);
begin
  Log('procedure TMGMainForm.SetupProjectMediators(ASubject: TGMapProject); Called.');

  {Project}
  if Not(Assigned(mMapProject)) then
  begin
    mMapProject := TtiModelMediator.Create(self);
    mMapproject.AddProperty('ProjectName', lblProjectName);
    mMapproject.AddProperty('Filename', lblProjectFilename);
  end;
  mMapProject.Active := false;
  mMapProject.Subject := ASubject;
  mMapProject.Active := true;
end;

procedure TMGMainForm.SetupUnitsMediators(ASubject: TGMapUnitDefList);
begin
  Log('procedure TMGMainForm.SetupUnitsMediators(ASubject: TtiObject); Called.');

  {Units}
  if Not(Assigned(mUnitsSG)) then
  begin
    mUnitsSG := TMapProject_Units_TStringGrid_Mediator.CreateCustom(
      ASubject,
      sgUnits,
      'Name',
      true);
    mUnitsSG.View.FixedRows := 1;
    mUnitsSG.View.FixedCols := 0;
  end;
  mUnitsSG.Active := false;
  mUnitsSG.Subject := ASubject;
  mUnitsSG.Active := true;
end;

procedure TMGMainForm.SetupUnitMediators(ASubject: TGMapUnitDef);
begin
  Log('procedure TMGMainForm.SetupUnitMediators(ASubject: TtiObject); Called.');

  {Unit  ie UnitName Label.}
  if Not(Assigned(mMapProjectUnit)) then
  begin
    mMapProjectUnit := TtiModelMediator.Create(self);
    mMapProjectUnit.AddProperty('Name', lblCurrentUnit);
  end;
  mMapProjectUnit.Active := false;
  mMapProjectUnit.Subject := ASubject;
  mMapProjectUnit.Active := true;

  {Unit Enumerations}
  SetupUnitEnumerationsMediators(ASubject.UnitEnums);

  {Unit References}
  SetupUnitReferencesMediators(ASubject.UnitReferences);

  {Unit Classes}
  SetupUnitClassesMediators(ASubject.UnitClasses);
end;

procedure TMGMainForm.SetupUnitClassesMediators(ASubject: TMapClassDefList);
var
  compstr: string;
begin
  Log('procedure TMGMainForm.SetupUnitClassesMediators(ASubject: TtiObject); Called.');

  {Unit Classes}
  if Not(Assigned(mClassesSG)) then
  begin
    compstr := gPropertyGUIManager.GetCompositeStr(TMapClassDef);
    Log('::TMapClassDef Composite String = "'+ compstr + '"');

    mClassesSG := TMapProject_Classes_TStringgrid_Mediator.CreateCustom(
      ASubject,
      sgClasses,
      compstr,// Calls function to return string.
      true);
    mClassesSG.View.FixedCols := 0;
    mClassesSG.View.Font.Size := 8;
  end;
  mClassesSG.Active := false;
  mClassesSG.Subject := ASubject;
  mClassesSG.Active := true;
end;

procedure TMGMainForm.SetupUnitEnumerationsMediators(ASubject: TMapEnumList);
var
  compstr: String;
begin
  Log('procedure TMGMainForm.SetupUnitEnumerationsMediators(ASubject: TMapEnumList); Called.');

  {Unit Enumerations}
  if Not(Assigned(mEnumerationsSG)) then
  begin
    compstr := gPropertyGUIManager.GetCompositeStr(TMapEnum);
    log('TMapenum Composite String = "' + compstr + '".');

    MEnumerationsSG := TMapProject_Unit_Enumerations_StringGrid_Mediator.CreateCustom(
      ASubject,
      sgEnumerations,
      compstr,
      true);
    mEnumerationsSG.View.FixedRows := 1;
    mEnumerationsSG.view.FixedCols := 0;
  end;

  mEnumerationsSG.Active := false;
  mEnumerationsSG.Subject := ASubject;
  mEnumerationsSG.Active := true;
end;

procedure TMGMainForm.SetupUnitReferencesMediators(ASubject: TGMapUnitReferenceList);
var
  compstr: String;
begin
  Log('procedure TMGMainForm.SetupUnitReferencesMediators(ASubject: TtiObject); Called.');

  {Unit References}
  if Not(Assigned(mReferencesSG)) then
  begin
    compstr := gPropertyGUIManager.GetCompositeStr(TGMapUnitReference);
    Log('TMGReference Composite String = "' + compstr + '".');

    mReferencesSG := TMapProject_Unit_References_StringGrid_Mediator.CreateCustom(
      ASubject,
      sgReferences,
      compstr,
      true);
    mReferencesSG.View.FixedRows := 1;
    mReferencesSG.View.FixedCols := 0;
  end;
  mReferencesSG.Active := false;
  mReferencesSG.Subject := ASubject;
  mReferencesSG.Active := true;
end;

procedure TMGMainForm.FreeMediators;
begin
  Log('procedure TMGMainForm.FreeMediators; Called.');
  FreeAndNil(mMapProject);
  FreeAndNil(mMapProjectUnit);
  FreeAndNil(mUnitsSG);
  FreeAndNil(mClassesSG);
  FreeAndNil(mEnumerationsSG);
  FreeAndNil(mReferencesSG);
end;

procedure TMGMainForm.Log(Msg: String);
begin
  moLog.Lines.Add(DateTimeToStr(Now) + '::' + Msg);
  Manager.Log(Msg);
end;

function TMGMainForm.Manager: TMGDataManager;
begin
  //Log('function TMGMainForm.Manager: TMGDataManager; Called.');
  if Not(Assigned(MGDataManager.gMGManager)) or (MGDataManager.gMGManager = nil) then
  begin
    raise Exception.Create('MGDataManager.gMGManager Not Assigned or nil!');
    Log('function TMGMainForm.Manager: TMGDataManager; MGDataManager.gMGManager NOT Assigned or Nil.');
    exit;
  end;
  result := MGDataManager.gMGManager;
end;

procedure TMGMainForm.FormCreate(Sender: TObject);
begin
  //Log('procedure TMGMainForm.FormCreate(Sender: TObject); Called.');
  FMapProject := Manager.MapProject;

  SetupMediators;
end;

procedure TMGMainForm.FormDestroy(Sender: TObject);
begin
  Log('procedure TMGMainForm.FormDestroy(Sender: TObject); Called.');

  FreeMediators;
end;

procedure TMGMainForm.sgClassesDblClick(Sender: TObject);
var
  MapClass: TMapClassDef;
begin
  Log('procedure TMGMainForm.sgClassesDblClick(Sender: TObject); Called.');

  //Show ClassEdit Form if Class Selection is valid.
  if mClassesSG.SelectedObject <> nil then
  begin
    MapClass := TMapClassDef(mClassesSG.SelectedObject);
    frmClassEdit.dlgClassEdit.Execute(MapClass);
  end;
end;

procedure TMGMainForm.sgClassesSelection(Sender: TObject; aCol, aRow: Integer);
begin
  Log('procedure TMGMainForm.sgClassesSelection(Sender: TObject; aCol, aRow: Integer); Called.');
  //Do Nothing for now.
end;

procedure TMGMainForm.sgUnitsSelection(Sender: TObject; aCol, aRow: Integer);
var
  idx: Integer;
begin
  Log('procedure TMGMainForm.sgUnitsSelection(Sender: TObject; aCol, aRow: Integer); Called.');
  if mUnitsSG.SelectedObject = nil then
  begin
    {$IFDEF DEBUG}
    ShowMessage('Unit Selected is invalid.');
    {$endif}
    log(':: Unit Selected is Invalid.');
    Exit;
  end;
  idx := mUnitsSG.SelectedObject.Index;
  if idx <> FCurrentUnitIDX then
  begin
    FCurrentUnitIDX := idx;
    log(':: Unit Selected, Index = ' + IntToStr(idx) + '.');
    SetupMediators;
  end;
end;

procedure TMGMainForm.SetCurrentUnitIDX(AValue: Integer);
begin
  if FCurrentUnitIDX = AValue then Exit;
  FCurrentUnitIDX := AValue;
end;

procedure TMGMainForm.SetMapProject(AValue: TGMapProject);
begin
  if FMapProject = AValue then Exit;
  FMapProject := AValue;
end;

function TMGMainForm.GetCurrentUnit: TGMapUnitDef;
begin
  if (FCurrentUnitIDX < 0) or (FCurrentUnitIDX > (MapProject.Units.Count - 1) ) then
  begin
    Result := Manager.DummyUnit;
    FCurrentUnitIDX := -1;
    log('::CurrentUnitIDX is Invalid, Changed to -1.  FDummyUnit will be used.');
  end
  else
  begin
    Result := MapProject.Units[FCurrentUnitIDX];
  end;
end;

function TMGMainForm.IsUnitActive: boolean;
var
  cu: TGMapUnitDef;
begin
  Log('function TMGMainForm.IsUnitActive: boolean; Called.');
  cu := GetCurrentUnit;
  result := false;
  if cu.Name <> 'NotAssigned' then
    result := true;
end;

function TMGMainForm.GetCurrentUnitIDX: Integer;
begin
  result := FCurrentUnitIDX;
end;

procedure TMGMainForm.actProjectNewExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectNewExecute(Sender: TObject); Called.');

  if Manager.IsDataEdited then
  begin
    Manager.QuerySaveData;
  end;

  if ODProject.Execute then
  begin
    MapProject.ClearAll;
    MapProject.FileName:=ODProject.FileName;
    MapProject.NotifyObservers;

    { TODO : Add, fix MRu Recent filename. }
//    MRU1.Recent.Add(MapProject.FileName);

  end;
end;

procedure TMGMainForm.actProjectSettingsUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectSettingsUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := Manager.ProjectActive;
end;

procedure TMGMainForm.actReferenceAddExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actReferenceAddExecute(Sender: TObject); Called.');

  { TODO : need to complete }
end;

procedure TMGMainForm.actReferenceAddUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actReferenceAddUpdate(Sender: TObject); Called.');

  (Sender as TAction).Enabled := (mUnitsSG.SelectedObject <> nil);
end;

procedure TMGMainForm.actReferenceDeleteExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actReferenceDeleteExecute(Sender: TObject); Called.');

  { TODO : need to complete }
end;

procedure TMGMainForm.actReferenceDeleteUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (mReferencesSG.SelectedObject <> nil);
end;

procedure TMGMainForm.actReferenceEditExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actReferenceEditExecute(Sender: TObject); Called.');

  { TODO : need to complete }
end;

procedure TMGMainForm.actReferenceEditUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actReferenceEditUpdate(Sender: TObject); Called.');

  (Sender as TAction).Enabled := (mReferencesSG.SelectedObject <> nil);
end;

procedure TMGMainForm.actReferencesDebugExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actReferencesDebugExecute(Sender: TObject); Called.');

  { TODO : need to complete }
end;

procedure TMGMainForm.actReferencesDebugUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actReferencesDebugUpdate(Sender: TObject); Called.');

  (Sender as TAction).Enabled := (mUnitsSG.SelectedObject <> nil);
end;

procedure TMGMainForm.actSelectedUnitExecute(Sender: TObject);
begin
  end;

procedure TMGMainForm.actSelectedUnitUpdate(Sender: TObject);
var
  idx: Integer;
begin
  if mUnitsSG.SelectedObject = nil then
    idx := -1
  else
    idx := mUnitsSG.SelectedObject.Index;

  (Sender as TAction).Caption := 'Selected Unit = ' + IntToStr(idx);
end;

procedure TMGMainForm.actShowViewCodeFormExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actShowViewCodeFormExecute(Sender: TObject); Called.');
  frmViewCode.ViewCodeForm.Execute(MapProject, true);
end;

procedure TMGMainForm.actUnitAddExecute(Sender: TObject);
var
  aUnitname: String;
  aMapUnitDef: TGMapUnitDef;
begin
  Log('procedure TMGMainForm.actUnitAddExecute(Sender: TObject); Called.');

  aUnitName := '';
  if InputQuery('Unit Name.', 'Unit Name:', aUnitName) then
  begin
    aMapUnitDef := TGMapUnitDef.Create;
    aMapUnitDef.Name:=aUnitName;
    MapProject.Units.Add(aMapUnitDef);
  end;
end;

procedure TMGMainForm.actUnitAddUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actUnitAddUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := Manager.ProjectActive;
end;

procedure TMGMainForm.actUnitAsDebugStringExecute(Sender: TObject);
var
  cu: TGMapUnitDef;
begin
  Log('procedure TMGMainForm.actUnitAsDebugStringExecute(Sender: TObject); Called.');

  if mUnitsSG.SelectedObject <> nil then
  begin
    cu := TGMapUnitDef(mUnitsSG.SelectedObject);
    ShowMessage(cu.AsDebugString());
  end;
end;

procedure TMGMainForm.actUnitAsDebugStringUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actUnitAsDebugStringUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := IsUnitActive;
end;

procedure TMGMainForm.actUnitCountExecute(Sender: TObject);
begin
  //Log('procedure TMGMainForm.actUnitCountExecute(Sender: TObject); Called.');
end;

procedure TMGMainForm.actUnitCountUpdate(Sender: TObject);
begin
  //Log('procedure TMGMainForm.actUnitCountUpdate(Sender: TObject); Called.');
  (Sender as TAction).Caption := 'Unit Count = ' + intToStr(MapProject.Units.Count);
end;

procedure TMGMainForm.actUnitDeleteExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actUnitDeleteExecute(Sender: TObject); Called.');
  { TODO : NEED TO COMPLETE
    1)  is a unit selected?
    2)  Store copy of unit for restore. }
end;

procedure TMGMainForm.actUnitDeleteUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actUnitDeleteUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := IsUnitActive
end;

procedure TMGMainForm.actUnitEditUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actUnitEditUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := IsUnitActive
end;

procedure TMGMainForm.actUnitRenameExecute(Sender: TObject);
var
  aUnitName: String;
  cu: TGMapUnitDef;
begin
  Log('procedure TMGMainForm.actUnitRenameExecute(Sender: TObject); Called.');

  if mUnitsSG.SelectedObject <> nil then
  begin
    cu := TGMapUnitDef(mUnitsSG.SelectedObject);
    aUnitName := cu.Name;
    if InputQuery('Unit Name.', 'Unit Name:', aUnitName) then
    begin
      cu.Name := aUnitName;
      cu.NotifyObservers();
      MapProject.Units.NotifyObservers;
//      MapProject.NotifyObservers();
    end;
  end
  else
    Log(':: Unit Selection is Invalid.');
end;

procedure TMGMainForm.actUnitRenameUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actUnitRenameUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := IsUnitActive
end;

procedure TMGMainForm.actUnitSortExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actUnitSortExecute(Sender: TObject); Called.');
  { TODO : NEED TO COMPLETE. }
end;

procedure TMGMainForm.actUnitSortUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actUnitSortUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := (Manager.MapProject.Units.Count > 1);
end;

procedure TMGMainForm.apMainActivate(Sender: TObject);
begin
  Log('procedure TMGMainForm.apMainActivate(Sender: TObject); Called.');
end;

procedure TMGMainForm.apMainPropsActivate(Sender: TObject);
begin
  Log('procedure TMGMainForm.apMainPropsActivate(Sender: TObject); Called.');
end;

procedure TMGMainForm.apMainPropsIdle(Sender: TObject; var Done: Boolean);
begin
  //Log('procedure TMGMainForm.apMainPropsIdle(Sender: TObject; var Done: Boolean); Called.');
end;

procedure TMGMainForm.FontDlgApplyClicked(Sender: TObject);
begin
  Log('procedure TMGMainForm.FontDlgApplyClicked(Sender: TObject); Called.');
  Self.Font := FontDlg.Font;
end;

procedure TMGMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Log('procedure TMGMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction); Called.');
end;

procedure TMGMainForm.actProjectSettingsExecute(Sender: TObject);
var
  dlg: TdlgProjectSettings;
begin
  Log('procedure TMGMainForm.actProjectSettingsExecute(Sender: TObject); Called.');

  { TODO : Change Project settings dialog to TDefaultForm }
  dlg := TdlgProjectSettings.Create(self);
  dlg.ShowModal;
end;

procedure TMGMainForm.actProjectAsDebugStringExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectAsDebugStringExecute(Sender: TObject); Called.');
  ShowMessage(MapProject.AsDebugString());
end;

procedure TMGMainForm.actProjectAsDebugStringUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectAsDebugStringUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := Manager.ProjectActive;
end;

procedure TMGMainForm.actProjectCloseExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectCloseExecute(Sender: TObject); Called.');
  { TODO : NOT COMPLETE.
    1:  Is Data Saved? }
end;

procedure TMGMainForm.actProjectCloseUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectCloseUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := Manager.ProjectActive;
end;

procedure TMGMainForm.actProjectExitExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectExitExecute(Sender: TObject); Called.');

  { TODO :
    1)  project active?
    2)  check if dirty
    3)  Save data?
    4)  Clear all data.
    5)  Save Logs.
    6) Close. }
end;

procedure TMGMainForm.actProjectExitUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectExitUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := true;
end;

procedure TMGMainForm.actClassesAddExecute(Sender: TObject);
var
  aClass: TMapClassDef;
  cu: TGMapUnitDef;

begin
  Log('procedure TMGMainForm.actClassesAddExecute(Sender: TObject); Called.');

  if mClassesSG.SelectedObject <> nil then
  begin
    if mUnitsSG.SelectedObject <> nil then
    begin
      cu := TGMapUnitDef(mUnitsSG.SelectedObject);

      aClass := TMapClassDef.Create;
      cu.UnitClasses.Add(aClass);

      frmClassEdit.TdlgClassEdit.Execute(aClass);

      aClass.NotifyObservers();
      cu.NotifyObservers();
    end;
  end;
end;

procedure TMGMainForm.actAppPreferencesExecute(Sender: TObject);
begin

end;

procedure TMGMainForm.actClassesAddUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actClassesAddUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := IsUnitActive
end;

procedure TMGMainForm.actClassesDebugExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actClassesDebugExecute(Sender: TObject); Called.');
  //ShowMessage(GetCurrentClass.AsDebugString);
end;

procedure TMGMainForm.actClassesDebugUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actClassesDebugUpdate(Sender: TObject); Called.');

  if mClassesSG.SelectedObject <> nil then
    (Sender as TAction).Enabled := (mClassesSG.SelectedObject <> nil);
end;

procedure TMGMainForm.actClassesDeleteExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actClassesDeleteExecute(Sender: TObject); Called.');
  { TODO : NEED TO COMPLETE. }
end;

procedure TMGMainForm.actClassesDeleteUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actClassesDeleteUpdate(Sender: TObject); Called.');

  if mClassesSG.SelectedObject <> nil then
    (Sender as TAction).Enabled := (mClassesSG.SelectedObject <> nil);
end;

procedure TMGMainForm.actClassesEditExecute(Sender: TObject);
var
  cc: TMapClassDef;
begin
  Log('procedure TMGMainForm.actClassesEditExecute(Sender: TObject); Called.');

  if mClassesSG.SelectedObject <> nil then
  begin
    cc := TMapClassDef(mClassesSG.SelectedObject);

    frmClassEdit.TdlgClassEdit.Execute(cc);
    cc.NotifyObservers();
  end;
end;

procedure TMGMainForm.actClassesEditUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actClassesEditUpdate(Sender: TObject); Called.');

  if mClassesSG.SelectedObject <> nil then
    (Sender as TAction).Enabled := (mClassesSG.SelectedObject <> nil);
end;

procedure TMGMainForm.actClassesSortExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actClassesSortExecute(Sender: TObject); Called.');

  { TODO : NEED TO COMPLETE. }
end;

procedure TMGMainForm.actClassesSortUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actClassesSortUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := IsUnitActive and (GetCurrentUnit.UnitClasses.Count > 1);
end;

procedure TMGMainForm.actClassPropertyAddExecute(Sender: TObject);
var
  aClassProp: TMapClassProp;
begin
  Log('procedure TMGMainForm.actClassPropertyAddExecute(Sender: TObject); Called.');



  //frmClassPropertyEdit.TdlgClassPropertyEdit.Execute(aClassProp);
end;

procedure TMGMainForm.actClassPropertyAddUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actClassPropertyAddUpdate(Sender: TObject); Called.');
  //(Sender as TAction).Enabled := Manager.ClassActive;
end;

procedure TMGMainForm.actClassPropertyDebugExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actClassPropertyDebugExecute(Sender: TObject); Called.');
  //ShowMessage(Manager.CurrentClass.AsDebugString);
end;

procedure TMGMainForm.actClassPropertyEditExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actClassPropertyEditExecute(Sender: TObject); Called.');
  //frmClassPropertyEdit.TdlgClassPropertyEdit.Execute(Manager.CurrentProperty);
end;

procedure TMGMainForm.actClassPropertyEditUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actClassPropertyEditUpdate(Sender: TObject); Called.');
  //(Sender as TAction).Enabled := Manager.CurrentClassIDX > -1;
end;

procedure TMGMainForm.actClearUnitsExecute(Sender: TObject);
begin
  //Log('procedure TMGMainForm.actClearUnitsExecute(Sender: TObject); Called.');
end;

procedure TMGMainForm.actEnumerationAddExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actEnumerationAddExecute(Sender: TObject); Called.');

  { TODO : NEED TO COMPLETE. }
end;

procedure TMGMainForm.actEnumerationAddUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actEnumerationAddUpdate(Sender: TObject); Called.');

  (Sender as TAction).Enabled := (mUnitsSG.SelectedObject <> nil);
end;

procedure TMGMainForm.actEnumerationDebugExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actEnumerationDebugExecute(Sender: TObject); Called.');

  { TODO : need to complete }
end;

procedure TMGMainForm.actEnumerationDebugUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actEnumerationDebugUpdate(Sender: TObject); Called.');

  (Sender as TAction).Enabled := (mEnumerationsSG.SelectedObject <> nil);
end;

procedure TMGMainForm.actEnumerationDeleteExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actEnumerationDeleteExecute(Sender: TObject); Called.');

  { TODO : need to complete }
end;

procedure TMGMainForm.actEnumerationDeleteUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actEnumerationDeleteUpdate(Sender: TObject); Called.');

  (Sender as TAction).Enabled := (mEnumerationsSG.SelectedObject <> nil);
end;

procedure TMGMainForm.actEnumerationEditExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actEnumerationEditExecute(Sender: TObject); Called.');

end;

procedure TMGMainForm.actEnumerationEditUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actEnumerationEditUpdate(Sender: TObject); Called.');

  (Sender as TAction).Enabled := (mEnumerationsSG.SelectedObject <> nil);
end;

procedure TMGMainForm.actEnvironmentVarsExecute(Sender: TObject);
begin
  { TODO : NEED TO COMPLETE. }
end;

procedure TMGMainForm.actIncludesAddExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actIncludesAddExecute(Sender: TObject); Called.');
  { TODO : Need to complete. }
end;

procedure TMGMainForm.actIncludesDebugExecute(Sender: TObject);
begin

end;

procedure TMGMainForm.actIncludesDeleteExecute(Sender: TObject);
begin

end;

procedure TMGMainForm.actIncludesEditExecute(Sender: TObject);
begin

end;

procedure TMGMainForm.actProjectFontExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectFontExecute(Sender: TObject); Called.');
  FontDlg.Font := Self.Font;
  if FontDlg.Execute then
    Self.Font := FontDlg.Font;
end;

procedure TMGMainForm.actProjectFontUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectFontUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := true;
end;

procedure TMGMainForm.actProjectGenerateInternalExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectGenerateInternalExecute(Sender: TObject); Called.');
  frmViewCode.ViewCodeForm.Execute(MapProject, true);
end;

procedure TMGMainForm.actProjectGenerateUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectGenerateUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := Manager.ProjectActive;
end;

procedure TMGMainForm.actProjectNewUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectNewUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := true;
end;

procedure TMGMainForm.actProjectOpenExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectOpenExecute(Sender: TObject); Called.');
  if ODProject.Execute then
  begin
    Manager.OpenData(ODProject.FileName);
  end;
end;

procedure TMGMainForm.actProjectOpenUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectOpenUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := true;
end;

procedure TMGMainForm.actProjectRecentExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectRecentExecute(Sender: TObject); Called.');
  { TODO : Not Complete. }
end;

procedure TMGMainForm.actProjectRecentUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectRecentUpdate(Sender: TObject); Called.');
{ TODO : NEED TO COMPLETE. }
end;

procedure TMGMainForm.actProjectSaveAsExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectSaveAsExecute(Sender: TObject); Called.');
  if SDProject.Execute then
  begin
    Manager.SaveDataAs(SDProject.FileName);
  end;
end;

procedure TMGMainForm.actProjectSaveAsUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectSaveAsUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := Manager.ProjectActive;
end;

procedure TMGMainForm.actProjectSaveExecute(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectSaveExecute(Sender: TObject); Called.');
  Manager.SaveData;
end;

procedure TMGMainForm.actProjectSaveUpdate(Sender: TObject);
begin
  Log('procedure TMGMainForm.actProjectSaveUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := Manager.ProjectActive;
end;

end.


unit frmMGMain;

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
  , Mapper
//  , uManager
  , mgDataManager
  , mgView
  , frmClassEdit
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
    actIncludesAdd: TAction;
    actIncludesEdit: TAction;
    actIncludesDelete: TAction;
    actIncludesDebug: TAction;
    actClassesDebug: TAction;
    actClassPropertyAdd: TAction;
    actClassPropertyEdit: TAction;
    actClassPropertyDelete: TAction;
    actClassPropertyDebug: TAction;
    actClassesSort: TAction;
    actProjectGenerate: TAction;
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
    apMain: TApplicationProperties;
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
    MenuItem2: TMenuItem;
    miClassAsDebugString: TMenuItem;
    miUnitAsDebugString: TMenuItem;
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
    miProjectSettings: TMenuItem;
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
    procedure actClassesAddExecute(Sender: TObject);
    procedure actClassesAddUpdate(Sender: TObject);
    procedure actClassesDebugExecute(Sender: TObject);
    procedure actClassesDebugUpdate(Sender: TObject);
    procedure actClassesDeleteExecute(Sender: TObject);
    procedure actClassesEditExecute(Sender: TObject);
    procedure actClassesEditUpdate(Sender: TObject);
    procedure actClassesSortExecute(Sender: TObject);
    procedure actClassesSortUpdate(Sender: TObject);
    procedure actClassPropertyAddExecute(Sender: TObject);
    procedure actClassPropertyDebugExecute(Sender: TObject);
    procedure actEnvironmentVarsExecute(Sender: TObject);
    procedure actIncludesAddExecute(Sender: TObject);
    procedure actProjectAsDebugStringExecute(Sender: TObject);
    procedure actProjectAsDebugStringUpdate(Sender: TObject);
    procedure actProjectCloseExecute(Sender: TObject);
    procedure actProjectCloseUpdate(Sender: TObject);
    procedure actProjectExitExecute(Sender: TObject);
    procedure actProjectExitUpdate(Sender: TObject);
    procedure actProjectFontExecute(Sender: TObject);
    procedure actProjectFontUpdate(Sender: TObject);
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
    procedure actUnitAddExecute(Sender: TObject);
    procedure actUnitAddUpdate(Sender: TObject);
    procedure actUnitAsDebugStringExecute(Sender: TObject);
    procedure actUnitAsDebugStringUpdate(Sender: TObject);
    procedure actUnitDeleteExecute(Sender: TObject);
    procedure actUnitDeleteUpdate(Sender: TObject);
    procedure actUnitEditUpdate(Sender: TObject);
    procedure actUnitRenameExecute(Sender: TObject);
    procedure actUnitEditExecute(Sender: TObject);
    procedure actUnitRenameUpdate(Sender: TObject);
    procedure actUnitSortExecute(Sender: TObject);
    procedure actUnitSortUpdate(Sender: TObject);
    procedure FontDlgApplyClicked(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListBox1SelectionChange(Sender: TObject; User: boolean);
    procedure miGenerateClick(Sender: TObject);
    procedure sgClassesDblClick(Sender: TObject);
    procedure sgClassesSelection(Sender: TObject; aCol, aRow: Integer);
    procedure sgUnitsDblClick(Sender: TObject);
    procedure sgUnitsSelection(Sender: TObject; aCol, aRow: Integer);

  private
    procedure SetupMediators;
    procedure FreeMediators;

  protected

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

    function MapProject: TMapProject;  // returns Manager.MapProject.
    function Manager: TMGDataManager;  // returns uManager.Manager.

    //procedure UpdateMyActions;
    procedure UpdateUnitMediators;


    function GetSelectedUnitIDX: integer;
    function GetSelectedClassIDX: integer;
  published

end;

function GetMyVendorName: string;

var
  MGMainForm: TMGMainForm;

implementation

uses
  frmProjectSettings, agtiPropertyGUIManager;

function GetMyVendorName: string;
begin
  Result := 'AG Automated Systems';
end;

{$R *.lfm}

{ TMGMainForm }

procedure TMGMainForm.SetupMediators;
var
  compstr: String;
begin
  {Project}
  if Not(Assigned(mMapProject)) then
  begin
    mMapProject := TtiModelMediator.Create(self);
    mMapproject.AddProperty('ProjectName', lblProjectName);
    mMapproject.AddProperty('Filename', lblProjectFilename);
  end;
  mMapProject.Subject := MapProject;
  mMapProject.Active := true;

  {Unit}
  if Not(Assigned(mMapProjectUnit)) then
  begin
   mMapProjectUnit := TtiModelMediator.Create(self);
   mMapProjectUnit.AddProperty('Name', lblCurrentUnit);
  end;
  mMapProjectUnit.Subject := Manager.CurrentUnit;
  mMapProjectUnit.Active := true;

  if Not(Assigned(mUnitsSG)) then
  begin
   mUnitsSG := TMapProject_Units_TStringGrid_Mediator.CreateCustom(
    MapProject.Units,
    sgUnits,
    'Name',
    true);
   mUnitsSG.View.FixedRows := 1;
   mUnitsSG.View.FixedCols := 0;
  end;
  mUnitsSG.Subject := MapProject.Units;
  mUnitsSG.Active := true;

  {Classes}
  if Not(Assigned(mClassesSG)) then
  begin
    compstr := gPropertyGUIManager.GetCompositeStr(TMapClassDef);
    manager.Log('TMapClassDef Composite String = "'+ compstr + '"');
    mClassesSG := TMapProject_Classes_TStringgrid_Mediator.CreateCustom(
      Manager.CurrentUnit.UnitClasses,
      sgClasses,
      compstr,// Calls function to return string.
      true);
    mClassesSG.View.FixedCols := 0;
    mClassesSG.View.Font.Size := 8;
  end;
  mClassesSG.Subject := Manager.CurrentUnit.UnitClasses;
  mClassesSG.Active := true;

  {Enumerations}
  if Not(Assigned(mEnumerationsSG)) then
  begin
    compstr := gPropertyGUIManager.GetCompositeStr(TMapEnum);
    Manager.Log('TMapEnumDef Composite String = "' + compstr + '"');
    mEnumerationsSG := TMapProject_Unit_Enumerations_StringGrid_Mediator.CreateCustom(
      Manager.CurrentUnit.UnitEnums,
      sgEnumerations,
      compstr,
      true);
    mEnumerationsSG.View.FixedCols := 0;
    mEnumerationsSG.View.FixedRows := 1;
  end;
  mEnumerationsSG.Subject := Manager.CurrentUnit.UnitEnums;
  mEnumerationsSG.Active := true;

  {References}
  if Not(Assigned(mReferencesSG)) then
  begin
    compstr := gPropertyGUIManager.GetCompositeStr(TMGReference);
    Manager.Log('TMGReference Composite String = "' + compstr + '"');
    mReferencesSG := TMapProject_Unit_References_StringGrid_Mediator.CreateCustom(
      Manager.CurrentUnit.UnitReferences,
      sgReferences,
      compstr,
      true);
    mReferencesSG.View.FixedRows := 1;
    mReferencesSG.View.FixedCols := 0;
  end;
  mReferencesSG.Subject := Manager.CurrentUnit.UnitReferences;
  mReferencesSG.Active := true;

  Manager.Log('TMGMainForm.SetupMediators');
end;

procedure TMGMainForm.FreeMediators;
begin
  FreeAndNil(mUnitsSG);
  FreeAndNil(mMapProject);
  FreeAndNil(mClassesSG);
  FreeAndNil(mMapProjectUnit);

  Manager.Log('TMGMainForm.FreeMediators');
end;

function TMGMainForm.MapProject: TMapProject;
begin
  Result := gMGManager.MapProject;
end;

function TMGMainForm.Manager: TMGDataManager;
begin
  result := MGDataManager.gMGManager;
end;

//procedure TMGMainForm.UpdateMyActions;
//var
//  aBool: boolean;
//begin
//
//  aBool := Manager.ProjectActive;
//  //Unit Menu / Actions:
//  actUnitAdd.Enabled := aBool;
//
//  //Main Menu / actions:
//  actProjectNew.Enabled:=true;//aBool;  //Always Enabled.
//  actProjectOpen.Enabled:=true;//aBool;  //Always Enabled.
//  actProjectSave.Enabled:=aBool;
//  actProjectSaveAs.Enabled:=aBool;
//  actProjectRecent.Enabled:=true;//aBool;  //Always Enabled.
//  actProjectClose.Enabled:=aBool;
//  actProjectSettings.Enabled:=aBool;
//  actProjectAsDebugString.Enabled:=aBool;
//  actProjectExit.Enabled:=true;//aBool;  //always true.
//
//  aBool := Manager.UnitActive;
//  // Unit Menu / Actions:
//  actUnitRename.Enabled := aBool;
//  actUnitDelete.Enabled := aBool;
//  actUnitSort.Enabled := aBool;
//  actUnitEdit.Enabled := aBool;
//
//  //Do Check for Edit Menu:
//  { TODO : Need to complete
// }
//
// Manager.Log('TMGMainForm.UpdateMyActions');
//end;

procedure TMGMainForm.FormCreate(Sender: TObject);
{$ifdef debug}
  var
    aUnit: TMapUnitDef;
{$endif}
begin
  Manager.Log('TMGMainForm.FormCreate(TObject);.');
  SetupMediators;

  {$ifdef debug}
    Manager.Log('Debug Mode.');
    MapProject.ProjectName := 'TestProject1';
    MapProject.FileName := 'c:\TestProject.xml';
    MapProject.NotifyObservers();
    aUnit := TMapUnitDef.Create;
    aUnit.Owner := MapProject;
    aUnit.Name := 'uOne';
    MapProject.Units.Add(aUnit);
    MapProject.Units.NotifyObservers();
  {$endif}

end;

procedure TMGMainForm.FormDestroy(Sender: TObject);
begin
  Manager.Log('TMGMainForm.FormDestroy(TObject);.');
  FreeMediators;
end;

procedure TMGMainForm.ListBox1SelectionChange(Sender: TObject; User: boolean);
begin

end;

procedure TMGMainForm.miGenerateClick(Sender: TObject);
begin

end;

procedure TMGMainForm.sgClassesDblClick(Sender: TObject);
begin
  Manager.Log('TMGMainForm.sgClassesDblClick(TObject);.');
  if  Manager.CurrentUnit.UnitClasses.Count > 0 then
  begin
    actClassesEdit.Execute;
  end;
end;

procedure TMGMainForm.sgClassesSelection(Sender: TObject; aCol, aRow: Integer);
begin
  Manager.Log('TMGMainForm.sgClassesSelection.');
end;

procedure TMGMainForm.sgUnitsDblClick(Sender: TObject);
begin
  Manager.Log('TMGMainForm.sgUnitsDblClick(TObject);.');
end;

procedure TMGMainForm.sgUnitsSelection(Sender: TObject; aCol, aRow: Integer);
begin
  Manager.Log('TMGMainForm.sgUnitsSelection(TObject;,Integer);.');
  UpdateUnitMediators;
end;

procedure TMGMainForm.UpdateUnitMediators;
begin
  mMapProjectUnit.Active := false;
  mMapProjectUnit.Subject := Manager.CurrentUnit;
  mMapProjectUnit.Active := true;

  mClassesSG.Active := false;
  mClassesSG.Subject := Manager.CurrentUnit.UnitClasses;
  mClassesSG.Active := true;

  Manager.Log('TMGMainForm.UpdateUnitMediators.');
end;

function TMGMainForm.GetSelectedUnitIDX: integer;
begin
  result := -1;
  if Not(Assigned(mUnitsSG)) or (mUnitsSG = nil) then
    exit;
  if mUnitsSG.SelectedObject = nil then
    Exit;
  result := mUnitsSG.SelectedObject.Index;
end;

function TMGMainForm.GetSelectedClassIDX: integer;
begin
  result := -1;
  if Not(Assigned(mClassesSG)) or (mClassesSG = nil) then
    exit;
  if mClassesSG.SelectedObject = nil then
    exit;
  result := mClassesSG.SelectedObject.Index;
end;

procedure TMGMainForm.actProjectNewExecute(Sender: TObject);
begin

  { TODO : Check if existing project has been saved.
 }


  if ODProject.Execute then
  begin
    MapProject.ClearAll;
    MapProject.FileName:=ODProject.FileName;
    MapProject.NotifyObservers;

    { TODO : Add, fix MRu Recent filename. }
//    MRU1.Recent.Add(MapProject.FileName);

  end;

  Manager.Log('TMGMainForm.actProjectNewExecute.');
end;

procedure TMGMainForm.actProjectSettingsUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Manager.ProjectActive;

  Manager.Log('TMGMainForm.actProjectSettingsUpdate.');
end;

procedure TMGMainForm.actUnitAddExecute(Sender: TObject);
var
  aUnitname: String;
  aMapUnitDef: TMapUnitDef;
begin
  aUnitName := '';
  if InputQuery('Unit Name.', 'Unit Name:', aUnitName) then
  begin
    aMapUnitDef := TMapUnitDef.Create;
    aMapUnitDef.Name:=aUnitName;
    MapProject.Units.Add(aMapUnitDef);

    MapProject.Units.NotifyObservers;
    MapProject.NotifyObservers();
  end;

  Manager.Log('procedure TMGMainForm.actUnitAddExecute(Sender: TObject); Unit: ' + aUnitName + ' Added.');
end;

procedure TMGMainForm.actUnitAddUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Manager.ProjectActive;

  Manager.Log('TMGMainForm.actUnitAddUpdate(TObject);.');
end;

procedure TMGMainForm.actUnitAsDebugStringExecute(Sender: TObject);
begin
  if Manager.UnitActive then
    ShowMessage(Manager.CurrentUnit.AsDebugString());

  Manager.Log('TMGMainForm.actUnitAsDebugStringExecute(TObject);.');
end;

procedure TMGMainForm.actUnitAsDebugStringUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Manager.UnitActive;

  Manager.Log('TMGMainForm.actUnitAsDebugStringUpdate(TObject);.');
end;

procedure TMGMainForm.actUnitDeleteExecute(Sender: TObject);
begin
  { TODO : NEED TO COMPLETE
    1)  is a unit selected?
    2)  Store copy of unit for restore. }

  Manager.Log('TMGMainForm.actUnitDeleteExecute(TObject);.');

end;

procedure TMGMainForm.actUnitDeleteUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Manager.UnitActive;

  Manager.Log('TMGMainForm.actUnitDeleteUpdate(TObject);.');
end;

procedure TMGMainForm.actUnitEditUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Manager.UnitActive;

  Manager.Log('TMGMainForm.actUnitEditUpdate(TObject);.');
end;

procedure TMGMainForm.actUnitRenameExecute(Sender: TObject);
var
  aUnitName: String;
  prev: string;
begin
  if Manager.UnitActive then
  begin
    aUnitName := Manager.CurrentUnit.Name;
    prev := aUnitName;
    if InputQuery('Unit Name.', 'Unit Name:', aUnitName) then
    begin
      Manager.CurrentUnit.Name := aUnitName;
      MapProject.Units.NotifyObservers;
      MapProject.NotifyObservers();
    end;
  end;

  Manager.Log('TMGMainForm.actUnitRenameExecute(TObject);. Unit: ' + prev + ' renamed to: ' + aUnitName + '.');
end;

procedure TMGMainForm.actUnitEditExecute(Sender: TObject);
var
  aUnitname: String;
  aMapUnitDef: TMapUnitDef;
begin
  if Manager.UnitActive then
  begin
    aMapUnitDef := TMapUnitDef.Create;
    aMapUnitDef.Name:=aUnitName;
    MapProject.Units.Add(aMapUnitDef);

    MapProject.Units.NotifyObservers;
    MapProject.NotifyObservers();
  end;

  Manager.Log('TMGMainForm.actUnitEditExecute(TObject);.  NOT COMPLETED.');
end;

procedure TMGMainForm.actUnitRenameUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Manager.UnitActive;

  Manager.Log('TMGMainForm.actUnitRenameUpdate(TObject);.');
end;

procedure TMGMainForm.actUnitSortExecute(Sender: TObject);
begin
  { TODO : NEED TO COMPLETE. }

  Manager.Log('TMGMainForm.actUnitSortExecute(TObject);.');
end;

procedure TMGMainForm.actUnitSortUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (Manager.MapProject.Units.Count > 1);

  Manager.Log('TMGMainForm.actUnitSortUpdate(TObject);.');
end;

procedure TMGMainForm.FontDlgApplyClicked(Sender: TObject);
begin
  Self.Font := FontDlg.Font;

  Manager.Log('TMGMainForm.FontDialogApplyClicked.');
end;

procedure TMGMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

procedure TMGMainForm.actProjectSettingsExecute(Sender: TObject);
var
  dlg: TdlgProjectSettings;
begin

  { TODO : Change Project settings dialog to TDefaultForm }

  dlg := TdlgProjectSettings.Create(self);
  dlg.ShowModal;

  Manager.Log('TMGMainForm.actProjectSettingsExecute.  NOT COMPLETED.  CHnage to defaultform.');
end;

procedure TMGMainForm.actProjectAsDebugStringExecute(Sender: TObject);
begin
  ShowMessage(MapProject.AsDebugString());
  Manager.Log('TMGMainForm.actProjectDebugStringExecute.');
end;

procedure TMGMainForm.actProjectAsDebugStringUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Manager.ProjectActive;

  Manager.Log('TMGMainForm.actProjectAsDebugStringUpdate(TObject);.');
end;

procedure TMGMainForm.actProjectCloseExecute(Sender: TObject);
begin
  { TODO : NOT COMPLETE. }

  Manager.Log('TMGMainForm.actProjectCloseExecute.  NOT COMPLETED.');
end;

procedure TMGMainForm.actProjectCloseUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Manager.ProjectActive;

  Manager.Log('TMGMainForm.actProjectCloseUpdate.');
end;

procedure TMGMainForm.actProjectExitExecute(Sender: TObject);
begin
  { TODO : 1)  project active?
2)  check if dirty
3)  Save data?
4)  Clear all data.
5)  Save Logs.
5) Close. }

  Manager.Log('TMGMainForm.actProjectExitExecute.  NOT COMPLETED.');
end;

procedure TMGMainForm.actProjectExitUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := true;

  Manager.Log('TMGMainForm.actProjectExitUpdate.');
end;

procedure TMGMainForm.actClassesAddExecute(Sender: TObject);
var
  aClass: TMapClassDef;

begin
  if Manager.UnitActive then
  begin
    aClass := TMapClassDef.Create;
    Manager.CurrentUnit.UnitClasses.Add(aClass);
    Manager.CurrentUnit.NotifyObservers();

    dlgClassEdit.Execute(aClass);

    Manager.CurrentUnit.UnitClasses.NotifyObservers();
  end;

  Manager.Log('TMGMainForm.actClassesAddExecute(TObject);.');
end;

procedure TMGMainForm.actClassesAddUpdate(Sender: TObject);
begin
  Manager.Log('procedure TMGMainForm.actClassesAddUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := Manager.UnitActive;
end;

procedure TMGMainForm.actClassesDebugExecute(Sender: TObject);
begin
  Manager.Log('procedure TMGMainForm.actClassesDebugExecute(Sender: TObject); Called.');
  ShowMessage(Manager.CurrentClass.AsDebugString);
end;

procedure TMGMainForm.actClassesDebugUpdate(Sender: TObject);
begin
  Manager.Log('procedure TMGMainForm.actClassesDebugUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := Manager.ClassActive;
end;

procedure TMGMainForm.actClassesDeleteExecute(Sender: TObject);
begin
  { TODO : NEED TO COMPLETE. }

  Manager.Log('TMGMainForm.actClassesDeleteExecute.');
end;

procedure TMGMainForm.actClassesEditExecute(Sender: TObject);
begin
  if Manager.UnitActive then
  begin
    dlgClassEdit.Execute(Manager.Currentclass);
  end;

  Manager.Log('TMGMainForm.actClassesEditExecute.');
end;

procedure TMGMainForm.actClassesEditUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Manager.UnitActive and Manager.ClassActive;
  Manager.Log('procedure TMGMainForm.actClassesEditUpdate(Sender: TObject); Called.');
end;

procedure TMGMainForm.actClassesSortExecute(Sender: TObject);
begin
  Manager.Log('procedure TMGMainForm.actClassesSortExecute(Sender: TObject); Called.');

  { TODO : NEED TO COMPLETE. }
end;

procedure TMGMainForm.actClassesSortUpdate(Sender: TObject);
begin
  Manager.Log('procedure TMGMainForm.actClassesSortUpdate(Sender: TObject); Called.');
  (Sender as TAction).Enabled := Manager.UnitActive and (Manager.CurrentUnit.UnitClasses.Count > 1);
end;

procedure TMGMainForm.actClassPropertyAddExecute(Sender: TObject);
begin
  Manager.Log('procedure TMGMainForm.actClassPropertyAddExecute(Sender: TObject); Called.');


end;

procedure TMGMainForm.actClassPropertyDebugExecute(Sender: TObject);
begin
  Manager.Log('procedure TMGMainForm.actClassPropertyDebugExecute(Sender: TObject); Called.');
  ShowMessage(Manager.CurrentClass.AsDebugString);
end;

procedure TMGMainForm.actEnvironmentVarsExecute(Sender: TObject);
begin

end;

procedure TMGMainForm.actIncludesAddExecute(Sender: TObject);
var
  aInclude: TMGInclude;
begin
  if Not(Manager.ProjectActive) then exit;

  { TODO : Add Message to start new project. }
  { TODO : NEED TO COMPLETE. }

  Manager.Log('TMGMainForm.actIncludesAddExecute.');
end;

procedure TMGMainForm.actProjectFontExecute(Sender: TObject);
begin
  FontDlg.Font := Self.Font;
  if FontDlg.Execute then
    Self.Font := FontDlg.Font;

  Manager.Log('TMGMainForm.actProjectFontExecute(TObject);.');
end;

procedure TMGMainForm.actProjectFontUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := true;
  Manager.Log('TMGMainForm.actProjectFontUpdate(TObject);.');
end;

procedure TMGMainForm.actProjectGenerateUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Manager.ProjectActive;
  Manager.Log('TMGMainForm.actProjectGenerateUpdate.');
end;

procedure TMGMainForm.actProjectNewUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := true;
  Manager.Log('TMGMainForm.actProjectNewUpdate.');
end;

procedure TMGMainForm.actProjectOpenExecute(Sender: TObject);
begin
  Manager.Log('TMGMainForm.actProjectOpenExecute.');
  { TODO : not completed. }
end;

procedure TMGMainForm.actProjectOpenUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := true;

  Manager.Log('TMGMainForm.actProjectOpenUpdate.');
end;

procedure TMGMainForm.actProjectRecentExecute(Sender: TObject);
begin
  { TODO : Not Complete. }
  Manager.Log('TMGMainForm.actProjectRecentExecute.');
end;

procedure TMGMainForm.actProjectRecentUpdate(Sender: TObject);
begin
  {Nothing to do}
end;

procedure TMGMainForm.actProjectSaveAsExecute(Sender: TObject);
begin
  Manager.Log('TMGMainForm.actProjectSaveAsExecute.');
end;

procedure TMGMainForm.actProjectSaveAsUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Manager.ProjectActive;
  Manager.Log('TMGMainForm.actProjectSaveAsUpdate.');
end;

procedure TMGMainForm.actProjectSaveExecute(Sender: TObject);
begin
  { TODO : NEED TO COMPLETE. }
  Manager.Log('TMGMainForm.actProjectSaveExecute.');
end;

procedure TMGMainForm.actProjectSaveUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Manager.ProjectActive;

  Manager.Log('TMGMainForm.actProjectSaveUpdate.');
end;

end.


unit uManager;

// Manager for Laz Mapper Gui
// Holds the Mapper TMapProject object.
//

{$mode objfpc}{$H+}

interface
{ TODO : DO somehing with Logfile. }
uses
  Classes
  ,SysUtils
  ,StdCtrls
  ,mapper
  ,LCLType
  ,TiObject
  ,tiopfManager
//  ,MapProjectAdd_model
  ,uMapProjectInc
  ;

type
  TemgDlg = (
    mdNone,
    {Projects}
    mdProjects,           //TMapProjectList
    {Project}
    mdProject,            //TMapProject
    mdProjectEnums,       //TMapEnumList
    mdProjectIncludes,    //TMapProject.Includes:
    mdProjectUnits,       //TMapUnitDefList
    mdProjectEnum,        //TMapEnum
    mdProjectInclude,     //TMapProject.Includes[x]
    {unit}
    mdUnit,               //TMapUnitDef
    mdUnitEnums,          //TMapEnumList
    mdUnitReferences,     //TMapUnitDef.References
    mdUnitclasses,        //TMapClassDefList
    mdUnitEnum,           //TMapEnum
    mdUnitReference,      //TMapUnitDef.References[x]
    mdUnitClass,          //TMapClassDef
    {Class}
    mdClassProps, mdClassMapping, mdClassSelections, mdClassValidators);


  { TmgManager }

  TmgManager = class(TtiObject)
    private
      FCurrentClass: TMapClassDef;
      FCurrentUnit: TMapUnitDef;
      FDataBuffer: TtiObject;
      FDummyUnit: TMapUnitDef;
      FDummyClass: TMapClassDef;
      FIncludes: TMGIncludeList;
      FLogFile: TStrings;
      FLogMemo: TMemo;
      FMapProject: TMapProject;
      procedure SetLogMemo(AValue: TMemo);
      procedure SetMapProject(AValue: TMapProject);

    protected
      property DataBuffer: TtiObject read FDataBuffer write FDataBuffer;
      function IsDirty: Boolean;

    public
      constructor Create; override;
      destructor Destroy; override;

      procedure Log(text: String);
      procedure LogStrs(Text: TStrings);
      procedure LogSep;

      procedure ClearAll;

      property Logfile: TStrings read FLogFile;
      property LogMemo: TMemo read FLogMemo Write SetLogMemo;
      property MapProject: TMapProject read FMapProject write SetMapProject; //Data of project
      property Includes: TMGIncludeList read FIncludes;
      property CurrentUnit: TMapUnitDef read FCurrentUnit;
      property CurrentClass: TMapClassDef read FCurrentClass;

      function MapClassDefCols: String;
      function MapClassDefCol(const aCol: Integer; var aDef: String): boolean; overload;
      function MapClassDefCol(const aField: String; var aDef: String): boolean; overload;
      function MapClassDefCol(const aField: String): String; overload;

      function ClassPropertyDefCols: String;

      procedure UpdateCurrentUnit;
      procedure UpdateCurrentClass;

      function ProjectActive: Boolean;virtual;
      function UnitActive: Boolean; virtual;

    published

end;

type
  rmgColumns = record
    Field: string;
    Display: String;
    Length: Integer;
  end;



  crTMapClassDefCols =  Array[1..10] of rmgcolumns;
  crTMapEnumDefCols = array[1..2] of rmgColumns;
  crTMapClassPropDefCols = array[1..4] of rmgColumns;
  crTMapPropMapCols = array[1..6] of rmgColumns;

const
  //(DataType: ''; Field: ''; Display: ''; Length: ),


  //(Field: ''; Display: ''; Length: ),
  cTMapClassDefCols:  crTMapClassDefCols = (
    (Field: 'BaseClassName'; Display: 'Class Name'; Length: 200),
    (Field: 'BaseClassParent'; Display: 'Base (Super) Class'; Length: 200),
    (Field: 'AutoCreateBase'; Display: 'Auto Base'; Length: 100),
    (Field: 'AutoCreateListClass'; Display: 'Auto List'; Length: 100 ),
    (Field: 'AutoMap'; Display: 'Auto Map'; Length: 100),
    (Field: 'BaseUnitName'; Display: 'Unit Name'; Length: 200),
    (Field: 'DefType'; Display: 'TClassDefType'; Length: 100 ),
    (Field: 'ForwardDeclare'; Display: 'Forward'; Length: 100 ),
    (Field: 'ORMClassName'; Display: 'ORM Class Name'; Length: 200 ),
    (Field: 'NotifyObserversOfPropertyChanges'; Display: 'Notify Observers'; Length: 100) );

  cTMapEnumDefCols: crTMapEnumDefCols = (
    (Field: 'EnumName'; Display: 'Enum Name'; Length: 200),
    (Field: 'Values'; Display: 'Values'; Length: 200) );

  cTMapClassPropDefCols: crTMapClassPropDefCols = (
    (Field: 'Name'; Display: 'Name'; Length: 200 ),
    (Field: 'PropertyType'; Display: 'Property Type'; Length: 100 ),
    (Field: 'PropTypeName'; Display: 'Property Type Name'; Length: 200),
    (Field: 'IsReadOnly'; Display: 'Read Only'; Length: 100 ) );

  cTMapPropMapCols: crTMapPropMapCols = (
    (Field: 'PropName'; Display: 'Property Name'; Length: 200),
    (Field: 'FieldName'; Display: 'DB Field Name'; Length: 200),
    (Field: 'PropertyType'; Display: 'Property Type'; Length: 200),
    (Field: 'PropertyGetter'; Display: 'Property Getter'; Length: 200),
    (Field: 'PropertySetter'; Display: 'Property Setter'; Length: 200),
    (Field: 'PropertyAccesorsAreAbstract'; Display: 'Property Acesors Are Abstract'; Length: 200) );

function gmgManager: TmgManager;

implementation

uses
  dialogs
  , frmMGMain;

var
  zManager: TmgManager;

function gmgManager: TmgManager;
begin
  if Not(Assigned(zManager)) then
    zManager := TmgManager.Create;

  result := zManager;
end;

{ TmgManager }

procedure TmgManager.SetLogMemo(AValue: TMemo);
begin
  if FLogMemo = AValue then Exit;
  FLogMemo := AValue;
end;

procedure TmgManager.SetMapProject(AValue: TMapProject);
begin
  if FMapProject = AValue then Exit;
  FMapProject := AValue;
end;

procedure TmgManager.UpdateCurrentUnit;
begin
  Log('TmgManager.UpdateCurrentUnit.');
  FCurrentUnit := FDUmmyUnit;
  if UnitActive then
  begin
    if MGMainForm.mUnitsSG.SelectedObject <> nil then
    begin
      FCurrentUnit := TMapUnitDef(MapProject.Units[MGMainForm.mUnitsSG.SelectedObject.Index]);
      Log('Units Index = ' + intToStr(MGMainForm.mUnitsSG.SelectedObject.Index) + '.' );
    end;
  end;
end;

procedure TmgManager.UpdateCurrentClass;
begin
  Log('TmgManager.UpdateCurrentClass.');
  FCurrentClass := FDUmmyClass;
  if UnitActive then
  begin
    if MGMainForm.mClassesSG.SelectedObject <> nil then
    begin
      FCurrentClass := TMapClassDef(FCurrentUnit.UnitClasses[MGMainForm.mClassesSG.SelectedObject.Index]);
      Log('Classes Index = ' + IntToStr(MGMainForm.mClassesSG.SelectedObject.Index) + '.');
    end;
  end;
end;

function TmgManager.ProjectActive: Boolean;
begin
  Log('tmgManager.ProjectActive');
  result := false;
  if MapProject.FileName <> '' then
    result := true;
end;

function TmgManager.UnitActive: Boolean;
begin

  result := false;
  if (MGMainForm.mUnitsSG.SelectedObject <> nil) then
    result := true;
end;

constructor TmgManager.Create;
begin
  inherited Create;

  FMapProject := TMapProject.Create;
  FMapProject.Owner := self;

  FMapProject.BeginEndTabs := 2;
  FMapProject.TabSpaces := 2;
  FMapProject.BeginEndTabs := 2;
  FMapProject.VisibilityTabs := 2;

  FDummyUnit := TMapUnitDef.Create;
  FCurrentUnit := FDummyUnit;

  FDummyClass := TMapClassDef.Create;
  FCurrentClass := FDummyClass;

  FLogFile := TStringlist.Create;

  FIncludes := TMGIncludeList.Create;
  FIncludes.Owner := self;

end;

destructor TmgManager.Destroy;
begin
  FMapProject.Free;
  FIncludes.Free;
  FDummyUnit.Free;
  FDummyClass.Free;

  FDataBuffer.Free;

  FLogFile.Free;

  inherited Destroy;
end;

procedure TmgManager.Log(text: String);
begin
  FLogFile.Add(text);
  if Assigned(FLogMemo) then
    FLogMemo.Lines.Add(Text);
end;

procedure TmgManager.LogStrs(Text: TStrings);
begin
  FLogFile.AddStrings(Text);
  if Assigned(FLogMemo) then
    FLogMemo.Lines.AddStrings(Text);
end;

procedure TmgManager.LogSep;
begin
  FLogfile.Add('----------------------------------------');
  if Assigned(FLogMemo) then
    FLogMemo.Lines.Add('----------------------------------------');
end;

procedure TmgManager.ClearAll;
begin
  FIncludes.Clear;
  FMapProject.ClearAll;

  Log('TmgManager.ClearAll');
end;

function TmgManager.IsDirty: Boolean;
begin

end;

function TmgManager.MapClassDefCols: String;
var
  i: Integer;
begin
  result := '';
  for i := Low(cTMapClassDefCols) to High(cTMapClassDefCols) do
  begin
    //AddComposite('<Fieldname>(<length>,"<Display>"));
    Result := Result +
      cTMapClassDefCols[i].Field +
      '(' +
      IntToStr(cTMapClassDefCols[i].Length) +
      ',"' +
      cTMapClassDefCols[i].Display +
      '")';
    if i < High(crTMapClassDefCols) then
     result := result + ';';
  end;
end;

function TmgManager.MapClassDefCol(const aField: String; var aDef: String
  ): boolean;
var
  ic: Integer;
begin
  result := false;
  for ic := Low(cTMapClassDefCols) to High(cTMapClassDefCols) do
  begin
    if LowerCase(cTMapClassDefCols[ic].Field) = LowerCase(aField) then
    begin
      aDef :=
        cTMapClassDefCols[ic].Field +
        '(' +
        IntToStr(cTMapClassDefCols[ic].Length) +
        ',"' +
        cTMapClassDefCols[ic].Display +
        '")';
       result := true;
       break;
    end;
  end;
end;

function TmgManager.MapClassDefCol(const aField: String): String;
var
  aStr: String;
begin
  result := '';
  aStr := '';
  if MapClassDefCol(aField, aStr) then
    result := aStr;
end;

function TmgManager.ClassPropertyDefCols: String;
var
  ic: integer;
begin
  //AddComposite('<Fieldname>(<length>,"<Display>")', <GUIComponent>);
  //  'ClientName(200,"Client name");ClientID(80,"Client ID")'

    //cTMapClassPropDefCols: crTMapClassPropDefCols = (
    //(Field: 'Name'; Display: 'Name'; Length: 200 ),
    //(Field: 'PropertyType'; Display: 'Property Type'; Length: 100 ),
    //(Field: 'PropTypeName'; Display: 'Property Type Name'; Length: 200),
    //(Field: 'IsReadOnly'; Display: 'Read Only'; Length: 100 ) );
  result := '';
  for ic := low(cTMapClassPropDefCols) to high(cTMapClassPropDefCols) do
  begin
    result := result + cTMapClassPropDefCols[ic].Field +
      '(' + IntToStr(cTMapClassPropDefCols[ic].Length) + ',"' +
      cTMapClassPropDefCols[ic].Display + '")';
    if ic < high(cTMapClassPropDefCols) then
      result := result + ';';
  end;
end;

function TmgManager.MapClassDefCol(const aCol: Integer; var aDef: String
  ): boolean;
begin
  result := false;
  if (aCol < Low(crTMapClassDefCols)) or (aCol> High(crTMapClassDefCols)) then
   begin
     { TODO : RAISE EXCEPTION }
     Exit;
   end;
  aDef := cTMapClassDefCols[aCol].Field +
    '(' + IntToStr(cTMapClassDefCols[aCol].Length) + ',"' +
    cTMapClassDefCols[aCol].Display + '")';
  result := true;
end;

Initialization
  if not(assigned(zManager)) then
    zManager := TmgManager.Create;

Finalization
//  gManager.Logfile.Add('Manager Finalization at ' + DateTimeToStr(Now));

  if assigned(zManager) then
     zManager.Free;
//  freeandnil(uManager);
end.


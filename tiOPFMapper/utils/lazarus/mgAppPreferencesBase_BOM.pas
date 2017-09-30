

unit mgAppPreferencesBase_BOM;
// ---------------------------------------------------------
// Automatically generated on 7/25/2017 21:17:47
// Warning: 
//   If you rerun timap, your changes in this file will be lost
// ---------------------------------------------------------


{$IFDEF FPC}
{$mode objfpc}{$H+}
{$ENDIF}


interface


uses
  SysUtils
  ,tiObject
  ,tiAutoMap
  ,tiOPFManager
  ,tiVisitorDB
  ,tiVisitorCriteria
  ,tiCriteria
  ,tiSQLParser
  ,mapper
  ;

type


  // ---------------------------------------------
  // Forward Declares
  // ---------------------------------------------
  // ---------------------------------------------
  // Generated Classes
  // ---------------------------------------------


  TmgAPFilenameClass = class of TmgAPFilename;
  { Generated Class: TmgAPFilename}
  TmgAPFilename = class(TtiObject)
  protected
    FFilename: String;
    procedure   SetFilename(const AValue: String); virtual;
  public
    procedure   Read; override;
    procedure   Save; override;
  published
    property    Filename: String read FFilename write SetFilename;
  end;
  
  { List of TmgAPFilename.  TtiMappedFilteredObjectList descendant. }
  TmgAPFilenameList = class(TtiMappedFilteredObjectList)
  private
    class var FItemClass: TmgAPFilenameClass;
  protected
    procedure   SetItems(i: integer; const AValue: TmgAPFilename); reintroduce;
    function    GetItems(i: integer): TmgAPFilename; reintroduce;
  public
    property    Items[i:integer] : TmgAPFilename read GetItems write SetItems;
    procedure   Add(AObject: TmgAPFilename); reintroduce;
    procedure   Read; override;
    procedure   Save; override;
    class property ItemClass: TmgAPFilenameClass read FItemClass write FItemClass;
    { Return count (1) if successful. }
    function    FindByOID(const AOID: string): integer;
  end;
  
  TmgAppPreferencesBaseClass = class of TmgAppPreferencesBase;
  { Generated Class: TmgAppPreferencesBase}
  TmgAppPreferencesBase = class(TtiObject)
  protected
  public
    procedure   Read; override;
    procedure   Save; override;
  published
  end;
  
  { List of TmgAppPreferencesBase.  TtiMappedFilteredObjectList descendant. }
  TmgAppPreferencesBaseList = class(TtiMappedFilteredObjectList)
  private
    class var FItemClass: TmgAppPreferencesBaseClass;
  protected
    procedure   SetItems(i: integer; const AValue: TmgAppPreferencesBase); reintroduce;
    function    GetItems(i: integer): TmgAppPreferencesBase; reintroduce;
  public
    property    Items[i:integer] : TmgAppPreferencesBase read GetItems write SetItems;
    procedure   Add(AObject: TmgAppPreferencesBase); reintroduce;
    procedure   Read; override;
    procedure   Save; override;
    class property ItemClass: TmgAppPreferencesBaseClass read FItemClass write FItemClass;
    { Return count (1) if successful. }
    function    FindByOID(const AOID: string): integer;
  end;
  
  { Read Visitor for TmgAPFilename }
  TmgAPFilename_Read = class(TtiVisitorSelect)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
    procedure   MapRowToObject; override;
  end;
  
  { Create Visitor for TmgAPFilename }
  TmgAPFilename_Create = class(TtiVisitorUpdate)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
  end;
  
  { Update Visitor for TmgAPFilename }
  TmgAPFilename_Update = class(TtiVisitorUpdate)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
  end;
  
  { Delete Visitor for TmgAPFilename }
  TmgAPFilename_Delete = class(TtiVisitorUpdate)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
  end;
  
  { List Read Visitor for TmgAPFilenameList }
  TmgAPFilenameList_Read = class(TtiVisitorSelect)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   MapRowToObject; override;
  end;
  
  { Read Visitor for TmgAppPreferencesBase }
  TmgAppPreferencesBase_Read = class(TtiVisitorSelect)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
    procedure   MapRowToObject; override;
  end;
  
  { Create Visitor for TmgAppPreferencesBase }
  TmgAppPreferencesBase_Create = class(TtiVisitorUpdate)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
  end;
  
  { Update Visitor for TmgAppPreferencesBase }
  TmgAppPreferencesBase_Update = class(TtiVisitorUpdate)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
  end;
  
  { Delete Visitor for TmgAppPreferencesBase }
  TmgAppPreferencesBase_Delete = class(TtiVisitorUpdate)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
  end;
  
  { List Read Visitor for TmgAppPreferencesBaseList }
  TmgAppPreferencesBaseList_Read = class(TtiVisitorSelect)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   MapRowToObject; override;
  end;
  

  { Visitor Manager Registrations }
  procedure RegisterVisitors;

  { Register Auto Mappings }
  procedure RegisterMappings;


implementation


uses
  tiUtils
  ,tiLog
  ,tiRTTI
  ;

procedure RegisterMappings;
begin
  { Automap registrations for TmgAPFilename }
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TmgAPFilename, 
    'mgAppPreferences', 'OID', 'OID', [pktDB]);
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TmgAPFilename,
    'mgAppPreferences','Filename', 'tiMapFilename');
  GTIOPFManager.ClassDBMappingMgr.RegisterCollection(TmgAPFilenameList, TmgAPFilename);
  
end;

procedure RegisterVisitors;
begin
  { NOTE: The most reliable order of registering visitors are
          Read, Delete, Update, Create }
  GTIOPFManager.VisitorManager.RegisterVisitor('LoadmgAPFilenameList', TmgAPFilenameList_Read);
  GTIOPFManager.VisitorManager.RegisterVisitor('LoadmgAPFilename', TmgAPFilename_Read);
  GTIOPFManager.VisitorManager.RegisterVisitor('SavemgAPFilename', TmgAPFilename_Delete);
  GTIOPFManager.VisitorManager.RegisterVisitor('SavemgAPFilename', TmgAPFilename_Update);
  GTIOPFManager.VisitorManager.RegisterVisitor('SavemgAPFilename', TmgAPFilename_Create);
  
  { NOTE: The most reliable order of registering visitors are
          Read, Delete, Update, Create }
  GTIOPFManager.VisitorManager.RegisterVisitor('LoadmgAppPreferencesBaseList', TmgAppPreferencesBaseList_Read);
  GTIOPFManager.VisitorManager.RegisterVisitor('LoadmgAppPreferencesBase', TmgAppPreferencesBase_Read);
  GTIOPFManager.VisitorManager.RegisterVisitor('SavemgAppPreferencesBase', TmgAppPreferencesBase_Delete);
  GTIOPFManager.VisitorManager.RegisterVisitor('SavemgAppPreferencesBase', TmgAppPreferencesBase_Update);
  GTIOPFManager.VisitorManager.RegisterVisitor('SavemgAppPreferencesBase', TmgAppPreferencesBase_Create);
  
end;

procedure TmgAPFilename.SetFilename(const AValue: String);
begin
  if FFilename = AValue then
    Exit;
  FFilename := AValue;
end;

procedure TmgAPFilename.Read;
begin
  GTIOPFManager.VisitorManager.Execute('LoadmgAPFilename', self);
end;

procedure TmgAPFilename.Save;
begin
  GTIOPFManager.VisitorManager.Execute('SavemgAPFilename', self);
end;

 {TmgAPFilenameList }

procedure TmgAPFilenameList.Add(AObject: TmgAPFilename);
begin
  inherited Add(AObject);
end;

function TmgAPFilenameList.GetItems(i: integer): TmgAPFilename;
begin
  result := inherited GetItems(i) as TmgAPFilename;
end;

procedure TmgAPFilenameList.Read;
begin
  GTIOPFManager.VisitorManager.Execute('LoadmgAPFilenameList', self);
end;

procedure TmgAPFilenameList.Save;
begin
  GTIOPFManager.VisitorManager.Execute('SavemgAPFilename', self);
end;

procedure TmgAPFilenameList.SetItems(i: integer; const AValue: TmgAPFilename);
begin
  inherited SetItems(i, AValue);
end;

function TmgAPFilenameList.FindByOID(const AOID: string): integer;
begin
  if self.Count > 0 then
    self.Clear;
    
  Criteria.ClearAll;
  Criteria.AddEqualTo('OID', AOID);
  Read;
  result := Count;
end;

procedure TmgAppPreferencesBase.Read;
begin
  GTIOPFManager.VisitorManager.Execute('LoadmgAppPreferencesBase', self);
end;

procedure TmgAppPreferencesBase.Save;
begin
  GTIOPFManager.VisitorManager.Execute('SavemgAppPreferencesBase', self);
end;

 {TmgAppPreferencesBaseList }

procedure TmgAppPreferencesBaseList.Add(AObject: TmgAppPreferencesBase);
begin
  inherited Add(AObject);
end;

function TmgAppPreferencesBaseList.GetItems(i: integer): TmgAppPreferencesBase;
begin
  result := inherited GetItems(i) as TmgAppPreferencesBase;
end;

procedure TmgAppPreferencesBaseList.Read;
begin
  GTIOPFManager.VisitorManager.Execute('LoadmgAppPreferencesBaseList', self);
end;

procedure TmgAppPreferencesBaseList.Save;
begin
  GTIOPFManager.VisitorManager.Execute('SavemgAppPreferencesBase', self);
end;

procedure TmgAppPreferencesBaseList.SetItems(i: integer; const AValue: TmgAppPreferencesBase);
begin
  inherited SetItems(i, AValue);
end;

function TmgAppPreferencesBaseList.FindByOID(const AOID: string): integer;
begin
  if self.Count > 0 then
    self.Clear;
    
  Criteria.ClearAll;
  Criteria.AddEqualTo('OID', AOID);
  Read;
  result := Count;
end;

{ TmgAPFilename_Create }
function TmgAPFilename_Create.AcceptVisitor: Boolean;
begin
  result := (Visited is TmgAPFilename) and (Visited.ObjectState = posCreate);
  Log([ClassName, Visited.ClassName, Visited.ObjectStateAsString, Result], lsAcceptVisitor);
end;

procedure TmgAPFilename_Create.Init;
begin
  Query.SQLText :=
    'INSERT INTO mgAppPreferences(' +
    ' OID, ' +
    ' tiMapFilename' +
    ') VALUES (' +
    ' :OID, ' +
    ' :tiMapFilename' +
    ') ';
end;

procedure TmgAPFilename_Create.SetupParams;
var
  lObj: TmgAPFilename;
begin
  lObj := TmgAPFilename(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
  Query.ParamAsString['tiMapFilename'] := lObj.Filename;
end;

{ TmgAPFilename_Update }
function TmgAPFilename_Update.AcceptVisitor: Boolean;
begin
  result := (Visited is TmgAPFilename) and (Visited.ObjectState = posUpdate);
  Log([ClassName, Visited.ClassName, Visited.ObjectStateAsString, Result], lsAcceptVisitor);
end;

procedure TmgAPFilename_Update.Init;
begin
  Query.SQLText :=
    'UPDATE mgAppPreferences SET ' +
    ' tiMapFilename = :tiMapFilename ' +
    'WHERE OID = :OID' ;
end;

procedure TmgAPFilename_Update.SetupParams;
var
  lObj: TmgAPFilename;
begin
  lObj := TmgAPFilename(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
  Query.ParamAsString['tiMapFilename'] := lObj.Filename;
end;

{ TmgAPFilename_Read }
function TmgAPFilename_Read.AcceptVisitor: Boolean;
begin
  result := (Visited is TmgAPFilename) and ((Visited.ObjectState = posPK) OR (Visited.ObjectState = posClean));
  Log([ClassName, Visited.ClassName, Visited.ObjectStateAsString, Result], lsAcceptVisitor);
end;

procedure TmgAPFilename_Read.Init;
begin
  Query.SQLText :=
    'SELECT ' +
    ' OID, ' +
    ' tiMapFilename ' +
    'FROM mgAppPreferences WHERE OID = :OID' ;
end;

procedure TmgAPFilename_Read.SetupParams;
var
  lObj: TmgAPFilename;
begin
  lObj := TmgAPFilename(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
end;

procedure TmgAPFilename_Read.MapRowToObject;
var
  lObj: TmgAPFilename;
begin
  lObj := TmgAPFilename(Visited);
  lObj.OID.AssignFromTIQuery('OID',Query);
  lObj.Filename := Query.FieldAsString['tiMapFilename'];
end;

{ TmgAPFilename_Delete }
function TmgAPFilename_Delete.AcceptVisitor: Boolean;
begin
  result := (Visited is TmgAPFilename) and (Visited.ObjectState = posDelete);
  Log([ClassName, Visited.ClassName, Visited.ObjectStateAsString, Result], lsAcceptVisitor);
end;

procedure TmgAPFilename_Delete.Init;
begin
  Query.SQLText := 
    'DELETE FROM mgAppPreferences ' +
    'WHERE OID = :OID';
end;

procedure TmgAPFilename_Delete.SetupParams;
var
  lObj: TmgAPFilename;
begin
  lObj := TmgAPFilename(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
end;

{ TmgAPFilenameList_Read }
function TmgAPFilenameList_Read.AcceptVisitor: Boolean;
begin
  result := (Visited.ObjectState = posEmpty);
  Log([ClassName, Visited.ClassName, Visited.ObjectStateAsString, Result], lsAcceptVisitor);
end;

procedure TmgAPFilenameList_Read.Init;
var
  lFiltered: ItiFiltered;
  lWhere: string;
  lOrder: string;
  lSQL: string;
begin
  if Supports(Visited, ItiFiltered, lFiltered) then
  begin
    if lFiltered.GetCriteria.HasCriteria then
      lWhere := ' WHERE ' + tiCriteriaAsSQL(lFiltered.GetCriteria)
    else
      lWhere := '';
    if lFiltered.GetCriteria.hasOrderBy then
      lOrder := tiCriteriaOrderByAsSQL(lFiltered.GetCriteria)
    else
      lOrder := '';
  end;
  
  lSQL :=
    'SELECT ' +
    ' OID, ' +
    ' tiMapFilename ' +
    'FROM  mgAppPreferences %s %s ;';
  
  Query.SQLText := gFormatSQL(Format(lSQL, [lWhere, lOrder]), TmgAPFilename);
  
end;

procedure TmgAPFilenameList_Read.MapRowToObject;
var
  lObj: TmgAPFilename;
  lItemClass: TmgAPFilenameClass;
begin
  lItemClass := TmgAPFilename;
  if Assigned(TmgAPFilenameList.ItemClass) then
    lItemClass := TmgAPFilenameList.ItemClass;
  lObj := lItemClass.Create;
  lObj.OID.AssignFromTIQuery('OID',Query);
  lObj.Filename := Query.FieldAsString['tiMapFilename'];
  lObj.ObjectState := posClean;
  TtiObjectList(Visited).Add(lObj);
end;

{ TmgAppPreferencesBase_Create }
function TmgAppPreferencesBase_Create.AcceptVisitor: Boolean;
begin
  result := (Visited is TmgAppPreferencesBase) and (Visited.ObjectState = posCreate);
  Log([ClassName, Visited.ClassName, Visited.ObjectStateAsString, Result], lsAcceptVisitor);
end;

procedure TmgAppPreferencesBase_Create.Init;
begin
  Query.SQLText :=
    'INSERT INTO mgAppPreferences(' +
    ' OID, ' +
    ') VALUES (' +
    ' :OID, ' +
    ') ';
end;

procedure TmgAppPreferencesBase_Create.SetupParams;
var
  lObj: TmgAppPreferencesBase;
begin
  lObj := TmgAppPreferencesBase(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
end;

{ TmgAppPreferencesBase_Update }
function TmgAppPreferencesBase_Update.AcceptVisitor: Boolean;
begin
  result := (Visited is TmgAppPreferencesBase) and (Visited.ObjectState = posUpdate);
  Log([ClassName, Visited.ClassName, Visited.ObjectStateAsString, Result], lsAcceptVisitor);
end;

procedure TmgAppPreferencesBase_Update.Init;
begin
  Query.SQLText :=
    'UPDATE mgAppPreferences SET ' +
    'WHERE OID = :OID' ;
end;

procedure TmgAppPreferencesBase_Update.SetupParams;
var
  lObj: TmgAppPreferencesBase;
begin
  lObj := TmgAppPreferencesBase(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
end;

{ TmgAppPreferencesBase_Read }
function TmgAppPreferencesBase_Read.AcceptVisitor: Boolean;
begin
  result := (Visited is TmgAppPreferencesBase) and ((Visited.ObjectState = posPK) OR (Visited.ObjectState = posClean));
  Log([ClassName, Visited.ClassName, Visited.ObjectStateAsString, Result], lsAcceptVisitor);
end;

procedure TmgAppPreferencesBase_Read.Init;
begin
  Query.SQLText :=
    'SELECT ' +
    ' OID, ' +
    'FROM mgAppPreferences WHERE OID = :OID' ;
end;

procedure TmgAppPreferencesBase_Read.SetupParams;
var
  lObj: TmgAppPreferencesBase;
begin
  lObj := TmgAppPreferencesBase(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
end;

procedure TmgAppPreferencesBase_Read.MapRowToObject;
var
  lObj: TmgAppPreferencesBase;
begin
  lObj := TmgAppPreferencesBase(Visited);
  lObj.OID.AssignFromTIQuery('OID',Query);
end;

{ TmgAppPreferencesBase_Delete }
function TmgAppPreferencesBase_Delete.AcceptVisitor: Boolean;
begin
  result := (Visited is TmgAppPreferencesBase) and (Visited.ObjectState = posDelete);
  Log([ClassName, Visited.ClassName, Visited.ObjectStateAsString, Result], lsAcceptVisitor);
end;

procedure TmgAppPreferencesBase_Delete.Init;
begin
  Query.SQLText := 
    'DELETE FROM mgAppPreferences ' +
    'WHERE OID = :OID';
end;

procedure TmgAppPreferencesBase_Delete.SetupParams;
var
  lObj: TmgAppPreferencesBase;
begin
  lObj := TmgAppPreferencesBase(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
end;

{ TmgAppPreferencesBaseList_Read }
function TmgAppPreferencesBaseList_Read.AcceptVisitor: Boolean;
begin
  result := (Visited.ObjectState = posEmpty);
  Log([ClassName, Visited.ClassName, Visited.ObjectStateAsString, Result], lsAcceptVisitor);
end;

procedure TmgAppPreferencesBaseList_Read.Init;
var
  lFiltered: ItiFiltered;
  lWhere: string;
  lOrder: string;
  lSQL: string;
begin
  if Supports(Visited, ItiFiltered, lFiltered) then
  begin
    if lFiltered.GetCriteria.HasCriteria then
      lWhere := ' WHERE ' + tiCriteriaAsSQL(lFiltered.GetCriteria)
    else
      lWhere := '';
    if lFiltered.GetCriteria.hasOrderBy then
      lOrder := tiCriteriaOrderByAsSQL(lFiltered.GetCriteria)
    else
      lOrder := '';
  end;
  
  lSQL :=
    'SELECT ' +
    ' OID, ' +
    'FROM  mgAppPreferences %s %s ;';
  
  Query.SQLText := gFormatSQL(Format(lSQL, [lWhere, lOrder]), TmgAppPreferencesBase);
  
end;

procedure TmgAppPreferencesBaseList_Read.MapRowToObject;
var
  lObj: TmgAppPreferencesBase;
  lItemClass: TmgAppPreferencesBaseClass;
begin
  lItemClass := TmgAppPreferencesBase;
  if Assigned(TmgAppPreferencesBaseList.ItemClass) then
    lItemClass := TmgAppPreferencesBaseList.ItemClass;
  lObj := lItemClass.Create;
  lObj.OID.AssignFromTIQuery('OID',Query);
  lObj.ObjectState := posClean;
  TtiObjectList(Visited).Add(lObj);
end;

initialization
  RegisterVisitors;
  RegisterMappings;


end.

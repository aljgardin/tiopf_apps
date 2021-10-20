

unit person_bom;
// ---------------------------------------------------------
// Automatically generated on 10/16/2021 22:30:22
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
  ,typinfo
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
// Enumerations
  TGenderType = (gtFemale = 0
    ,gtMale = 1);

  TPersonType = (ptEmployee
    ,ptCustomer
    ,ptVendor);



  // ---------------------------------------------
  // Generated Classes
  // ---------------------------------------------


  TPersonClass = class of TPerson;
  { Generated Class: TPerson}
  TPerson = class(TtiObject)
  protected
    FActiveDate: TDateTime;
    FAge: Integer;
    FEmail: String;
    FFirstName: String;
    FGender: TGenderType;
    FIsActive: Boolean;
    FLastName: String;
    FPersonType: TPersonType;
    procedure   SetActiveDate(const AValue: TDateTime); virtual;
    procedure   SetAge(const AValue: Integer); virtual;
    procedure   SetEmail(const AValue: String); virtual;
    procedure   SetFirstName(const AValue: String); virtual;
    procedure   SetGender(const AValue: TGenderType); virtual;
    procedure   SetIsActive(const AValue: Boolean); virtual;
    procedure   SetLastName(const AValue: String); virtual;
    procedure   SetPersonType(const AValue: TPersonType); virtual;
  public
    procedure AssignClassProps(ASource: TtiObject); reintroduce;
    function   Clone: TPerson; reintroduce;
    //Read: This method uses Gtiopfmanager.defaultdbconnection and defaultpersistencelayername.
    procedure   Read; override;
    //Save: This method uses Gtiopfmanager.defaultdbconnection and defaultpersistencelayername.
    procedure   Save; override;
    function    IsValid(const AErrors: TtiObjectErrors): boolean; overload; override;
  published
    property    ActiveDate: TDateTime read FActiveDate write SetActiveDate;
    property    Age: Integer read FAge write SetAge;
    property    Email: String read FEmail write SetEmail;
    property    FirstName: String read FFirstName write SetFirstName;
    property    Gender: TGenderType read FGender write SetGender;
    property    IsActive: Boolean read FIsActive write SetIsActive;
    property    LastName: String read FLastName write SetLastName;
    property    PersonType: TPersonType read FPersonType write SetPersonType;
  end;
  
  { List of TPerson.  TtiMappedFilteredObjectList descendant. }
  TPersonList = class(TtiMappedFilteredObjectList)
  private
    class var FItemClass: TPersonClass;
  protected
    procedure   SetItems(i: integer; const AValue: TPerson); reintroduce;
    function    GetItems(i: integer): TPerson; reintroduce;
  public
    constructor Create; override;
    destructor Destroy; override;
    property    Items[i:integer] : TPerson read GetItems write SetItems;
    function    Add(AObject: TPerson): Integer; reintroduce;
    //   function Add returns a new FItemClass Item.
    function    Add: TPerson; reintroduce; overload;
    //   function Clone, returns a new object that is a clone of this one.
    function    Clone: TPersonList; reintroduce;
    procedure AssignClassProps(ASource: TtiObject); reintroduce;
    //Read, Save: Method uses Gtiopfmanager.defaultdbconnection and defaultpersistencelayername.
    procedure   Read; override;
    procedure   Save; override;
    class property ItemClass: TPersonClass read FItemClass write FItemClass;
    { Return count (1) if successful. }
    function    FindByOID(const AOID: string): integer;
    { Returns Number of objects retrieved. }
    function    FindByGender(const AGender: enum): integer;
    { Returns Number of objects retrieved. }
    function    FindByFirstNameMatch(const AName: String): integer;
  end;
  
  { Read Visitor for TPerson }
  TPerson_Read = class(TtiVisitorSelect)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
    procedure   MapRowToObject; override;
  end;
  
  { Create Visitor for TPerson }
  TPerson_Create = class(TtiVisitorUpdate)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
  end;
  
  { Update Visitor for TPerson }
  TPerson_Update = class(TtiVisitorUpdate)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
  end;
  
  { Delete Visitor for TPerson }
  TPerson_Delete = class(TtiVisitorUpdate)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
  end;
  
  { List Read Visitor for TPersonList }
  TPersonList_Read = class(TtiVisitorSelect)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   MapRowToObject; override;
  end;
  
  { TPersonList_FindByGenderVis }
  TPersonList_FindByGenderVis = class(TtiMapParameterListReadVisitor)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   MapRowToObject; override;
    procedure   SetupParams; override;
  end;
  
  { TPersonList_FindByFirstNameMatchVis }
  TPersonList_FindByFirstNameMatchVis = class(TtiMapParameterListReadVisitor)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   MapRowToObject; override;
    procedure   SetupParams; override;
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
  { Automap registrations for TPerson }
  {   Used when Read(aDBConnection, aPersistencelayer called.}
  {   DefaultDatabasename and defaultpersistencelayername must be set.}
  {   Gtiopfmanager.read is called wich uses cuStandardTask_Read etc classes.}
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TPerson, 
    'person', 'OID', 'OID', [pktDB]);
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TPerson,
    'person','FirstName', 'first_name');
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TPerson,
    'person','LastName', 'last_name');
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TPerson,
    'person','Age', 'age');
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TPerson,
    'person','Gender', 'gender');
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TPerson,
    'person','PersonType', 'person_type');
  GTIOPFManager.ClassDBMappingMgr.RegisterCollection(TPersonList, TPerson);
  
end;

procedure RegisterVisitors;
begin
  { NOTE: The most reliable order of registering visitors are
  {        Read, Delete, Update, Create }
  { These are used when Read() is called.}
  GTIOPFManager.VisitorManager.RegisterVisitor('LoadPersonList', TPersonList_Read);
  GTIOPFManager.VisitorManager.RegisterVisitor('LoadPerson', TPerson_Read);
  GTIOPFManager.VisitorManager.RegisterVisitor('SavePerson', TPerson_Delete);
  GTIOPFManager.VisitorManager.RegisterVisitor('SavePerson', TPerson_Update);
  GTIOPFManager.VisitorManager.RegisterVisitor('SavePerson', TPerson_Create);
  GTIOPFManager.VisitorManager.RegisterVisitor('TPersonList_FindByGenderVis', TPersonList_FindByGenderVis);
  GTIOPFManager.VisitorManager.RegisterVisitor('TPersonList_FindByFirstNameMatchVis', TPersonList_FindByFirstNameMatchVis);
  
end;

procedure TPerson.AssignClassProps(ASource: TtiObject);
begin
end;

function TPerson.Clone: TPerson;
var
  lClass: TtiClass;
begin
  lClass := TtiClass(ClassType);
  result := TPerson(lClass.Create);
  result.Assign(self);
end;

procedure TPerson.SetActiveDate(const AValue: TDateTime);
begin
  if FActiveDate = AValue then
    Exit;
  FActiveDate := AValue;
end;

procedure TPerson.SetAge(const AValue: Integer);
begin
  if FAge = AValue then
    Exit;
  FAge := AValue;
end;

procedure TPerson.SetEmail(const AValue: String);
begin
  if FEmail = AValue then
    Exit;
  FEmail := AValue;
end;

procedure TPerson.SetFirstName(const AValue: String);
begin
  if FFirstName = AValue then
    Exit;
  FFirstName := AValue;
end;

procedure TPerson.SetGender(const AValue: TGenderType);
begin
  if FGender = AValue then
    Exit;
  FGender := AValue;
end;

procedure TPerson.SetIsActive(const AValue: Boolean);
begin
  if FIsActive = AValue then
    Exit;
  FIsActive := AValue;
end;

procedure TPerson.SetLastName(const AValue: String);
begin
  if FLastName = AValue then
    Exit;
  FLastName := AValue;
end;

procedure TPerson.SetPersonType(const AValue: TPersonType);
begin
  if FPersonType = AValue then
    Exit;
  FPersonType := AValue;
end;

procedure TPerson.Read;
begin
  GTIOPFManager.VisitorManager.Execute('LoadPerson', self);
end;

procedure TPerson.Save;
begin
  GTIOPFManager.VisitorManager.Execute('SavePerson', self);
end;

function TPerson.IsValid(const AErrors: TtiObjectErrors): boolean;
var
  lMsg: string;
begin
  Result := inherited IsValid(AErrors);
  if not result then exit;
  
  if Age < 18 then
    begin
      lMsg := ValidatorStringClass.CreateGreaterOrEqualValidatorMsg(self, 'Age', Age);
      AErrors.AddError(lMsg);
    end;
  
  if FirstName = '' then 
    begin
      lMsg := ValidatorStringClass.CreateRequiredValidatorMsg(self, 'FirstName');
      AErrors.AddError(lMsg);
    end;
  
  if LastName = '' then 
    begin
      lMsg := ValidatorStringClass.CreateRequiredValidatorMsg(self, 'LastName');
      AErrors.AddError(lMsg);
    end;
  
  result := AErrors.Count = 0;
end;

 {TPersonList }

function TPersonList.Add(AObject: TPerson): integer;
begin
  result := inherited Add(AObject);
end;

constructor TPersonList.Create;
begin
  Inherited Create;
  FItemClass := TPerson;
end;

destructor TPersonList.Destroy;
begin
  inherited Destroy;
end;

function TPersonList. Add: TPerson;
var
  aItem: TPerson;
begin
  aItem := TPerson.Create;
  Add(aItem);
  result := aItem;
end;

function TPersonList.Clone: TPersonList;
var
  lClass: TtiClass;
begin
  lClass := TtiClass(ClassType);
  result := TPersonList(lClass.Create);
  result.Assign(self);
end;

procedure TPersonList.AssignClassProps(ASource: TtiObject);
begin
//Only call inherited if it inherits from other than TtiVisited or TtiObject or TtiMappedFilteredObjectList.
//inherited AssignClassProps(ASource);
end;

function TPersonList.GetItems(i: integer): TPerson;
begin
  result := inherited GetItems(i) as TPerson;
end;

procedure TPersonList.Read;
begin
  GTIOPFManager.VisitorManager.Execute('LoadPersonList', self);
end;

procedure TPersonList.Save;
begin
  GTIOPFManager.VisitorManager.Execute('SavePerson', self);
end;

procedure TPersonList.SetItems(i: integer; const AValue: TPerson);
begin
  inherited SetItems(i, AValue);
end;

function TPersonList.FindByOID(const AOID: string): integer;
begin
  if self.Count > 0 then
    self.Clear;
    
  Criteria.ClearAll;
  Criteria.AddEqualTo('OID', AOID);
  Read;
  result := Count;
end;

function TPersonList.FindByGender(const AGender: enum): integer;
begin
  if self.Count > 0 then
    self.Clear;
    
  Params.Clear;
  AddParam('AGender', 'gender_type', ptEnum, AGender);
  self.SQL := 
    ' SELECT PERSON.OID , PERSON.FIRST_NAME, PERSON.LAST_NAME,  ' + 
    ' PERSON.AGE, PERSON.GENDER, PERSON.PERSON_TYPEFROM  ' + 
    ' PERSONWHERE PERSON.GENDER = :gender_type'; 
  GTIOPFManager.VisitorManager.Execute('TPersonList_FindByGenderVis', self);
  result := self.Count;
end;

function TPersonList.FindByFirstNameMatch(const AName: String): integer;
begin
  if self.Count > 0 then
    self.Clear;
    
  Params.Clear;
  AddParam('AName', 'user_first', ptString, AName);
  self.SQL := 
    ' SELECT PERSON.OID , PERSON.FIRST_NAME, PERSON.LAST_NAME,  ' + 
    ' PERSON.AGE, PERSON.GENDER, PERSON.PERSON_TYPEFROM  ' + 
    ' PERSONWHERE PERSON.FIRST_NAME STARTING WITH :USER_FIRSTORDER  ' + 
    ' BY PERSON.FIRST_NAME, PERSON.LAST_NAME'; 
  GTIOPFManager.VisitorManager.Execute('TPersonList_FindByFirstNameMatchVis', self);
  result := self.Count;
end;

{ TPerson_Create }
function TPerson_Create.AcceptVisitor: Boolean;
begin
  result := (Visited is TPerson) and (Visited.ObjectState = posCreate);
  Log([ClassName, Visited.ClassName, Visited.ObjectStateAsString, Result], lsAcceptVisitor);
end;

procedure TPerson_Create.Init;
begin
  Query.SQLText :=
    'INSERT INTO person(' +
    ' OID, ' +
    ' first_name, ' +
    ' last_name, ' +
    ' age, ' +
    ' gender, ' +
    ' person_type' +
    ') VALUES (' +
    ' :OID, ' +
    ' :first_name, ' +
    ' :last_name, ' +
    ' :age, ' +
    ' :gender, ' +
    ' :person_type' +
    ') ';
end;

procedure TPerson_Create.SetupParams;
var
  lObj: TPerson;
begin
  lObj := TPerson(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
  Query.ParamAsString['first_name'] := lObj.FirstName;
  Query.ParamAsString['last_name'] := lObj.LastName;
  Query.ParamAsInteger['age'] := lObj.Age;
  Query.ParamAsInteger['gender'] := Integer(lObj.Gender);
  Query.ParamAsInteger['person_type'] := Integer(lObj.PersonType);
end;

{ TPerson_Update }
function TPerson_Update.AcceptVisitor: Boolean;
begin
  result := (Visited is TPerson) and (Visited.ObjectState = posUpdate);
  Log([ClassName, Visited.ClassName, Visited.ObjectStateAsString, Result], lsAcceptVisitor);
end;

procedure TPerson_Update.Init;
begin
  Query.SQLText :=
    'UPDATE person SET ' +
    ' first_name = :first_name, ' +
    ' last_name = :last_name, ' +
    ' age = :age, ' +
    ' gender = :gender, ' +
    ' person_type = :person_type ' +
    'WHERE OID = :OID' ;
end;

procedure TPerson_Update.SetupParams;
var
  lObj: TPerson;
begin
  lObj := TPerson(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
  Query.ParamAsString['first_name'] := lObj.FirstName;
  Query.ParamAsString['last_name'] := lObj.LastName;
  Query.ParamAsInteger['age'] := lObj.Age;
  Query.ParamAsInteger['gender'] := Integer(lObj.Gender);
  Query.ParamAsInteger['person_type'] := Integer(lObj.PersonType);
end;

{ TPerson_Read }
function TPerson_Read.AcceptVisitor: Boolean;
begin
  result := (Visited is TPerson) and ((Visited.ObjectState = posPK) OR (Visited.ObjectState = posClean));
  Log([ClassName, Visited.ClassName, Visited.ObjectStateAsString, Result], lsAcceptVisitor);
end;

procedure TPerson_Read.Init;
begin
  Query.SQLText :=
    'SELECT ' +
    ' OID, ' +
    ' first_name, ' +
    ' last_name, ' +
    ' age, ' +
    ' gender, ' +
    ' person_type ' +
    'FROM person WHERE OID = :OID' ;
end;

procedure TPerson_Read.SetupParams;
var
  lObj: TPerson;
begin
  lObj := TPerson(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
end;

procedure TPerson_Read.MapRowToObject;
var
  lObj: TPerson;
begin
  lObj := TPerson(Visited);
  lObj.OID.AssignFromTIQuery('OID',Query);
  lObj.FirstName := Query.FieldAsString['first_name'];
  lObj.LastName := Query.FieldAsString['last_name'];
  lObj.Age := Query.FieldAsInteger['age'];
  lObj.Gender := TGenderType(Query.FieldAsInteger['gender']);
  lObj.PersonType := TPersonType(Query.FieldAsInteger['person_type']);
end;

{ TPerson_Delete }
function TPerson_Delete.AcceptVisitor: Boolean;
begin
  result := (Visited is TPerson) and (Visited.ObjectState = posDelete);
  Log([ClassName, Visited.ClassName, Visited.ObjectStateAsString, Result], lsAcceptVisitor);
end;

procedure TPerson_Delete.Init;
begin
  Query.SQLText := 
    'DELETE FROM person ' +
    'WHERE OID = :OID';
end;

procedure TPerson_Delete.SetupParams;
var
  lObj: TPerson;
begin
  lObj := TPerson(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
end;

{ TPersonList_Read }
function TPersonList_Read.AcceptVisitor: Boolean;
begin
  result := (Visited.ObjectState = posEmpty);
  Log([ClassName, Visited.ClassName, Visited.ObjectStateAsString, Result], lsAcceptVisitor);
end;

procedure TPersonList_Read.Init;
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
    ' first_name, ' +
    ' last_name, ' +
    ' age, ' +
    ' gender, ' +
    ' person_type ' +
    'FROM  person %s %s ;';
  
  Query.SQLText := gFormatSQL(Format(lSQL, [lWhere, lOrder]), TPerson);
  
end;

procedure TPersonList_Read.MapRowToObject;
var
  lObj: TPerson;
  lItemClass: TPersonClass;
begin
  lItemClass := TPerson;
  if Assigned(TPersonList.ItemClass) then
    lItemClass := TPersonList.ItemClass;
  lObj := lItemClass.Create;
  lObj.OID.AssignFromTIQuery('OID',Query);
  lObj.FirstName := Query.FieldAsString['first_name'];
  lObj.LastName := Query.FieldAsString['last_name'];
  lObj.Age := Query.FieldAsInteger['age'];
  lObj.Gender := TGenderType(Query.FieldAsInteger['gender']);
  lObj.PersonType := TPersonType(Query.FieldAsInteger['person_type']);
  lObj.ObjectState := posClean;
  TtiObjectList(Visited).Add(lObj);
end;

{ TPersonList_FindByGenderVis }
function TPersonList_FindByGenderVis.AcceptVisitor: Boolean;
begin
  result := (Visited.ObjectState = posEmpty);
end;

procedure TPersonList_FindByGenderVis.MapRowToObject;
var
  lObj: TPerson;
begin
  lObj := TPerson.Create;
  lObj.OID.AssignFromTIQuery('OID',Query);
  lObj.FirstName := Query.FieldAsString['first_name'];
  lObj.LastName := Query.FieldAsString['last_name'];
  lObj.Age := Query.FieldAsInteger['age'];
  lObj.Gender := TGenderType(Query.FieldAsInteger['gender']);
  lObj.PersonType := TPersonType(Query.FieldAsInteger['person_type']);
  lObj.ObjectState := posClean;
  TtiObjectList(Visited).Add(lObj);
end;

procedure TPersonList_FindByGenderVis.SetupParams;
var
  lCtr: integer;
  lParam: TSelectParam;
  lList: TtiMappedFilteredObjectList;
begin
  lList := TtiMappedFilteredObjectList(Visited);
  
  lParam := TSelectParam(lList.Params.FindByProps(['ParamName'], ['AGender']));
  Query.ParamAsInteger['gender_type'] := Integer(enum(lParam.Value));
end;

{ TPersonList_FindByFirstNameMatchVis }
function TPersonList_FindByFirstNameMatchVis.AcceptVisitor: Boolean;
begin
  result := (Visited.ObjectState = posEmpty);
end;

procedure TPersonList_FindByFirstNameMatchVis.MapRowToObject;
var
  lObj: TPerson;
begin
  lObj := TPerson.Create;
  lObj.OID.AssignFromTIQuery('OID',Query);
  lObj.FirstName := Query.FieldAsString['first_name'];
  lObj.LastName := Query.FieldAsString['last_name'];
  lObj.Age := Query.FieldAsInteger['age'];
  lObj.Gender := TGenderType(Query.FieldAsInteger['gender']);
  lObj.PersonType := TPersonType(Query.FieldAsInteger['person_type']);
  lObj.ObjectState := posClean;
  TtiObjectList(Visited).Add(lObj);
end;

procedure TPersonList_FindByFirstNameMatchVis.SetupParams;
var
  lCtr: integer;
  lParam: TSelectParam;
  lList: TtiMappedFilteredObjectList;
begin
  lList := TtiMappedFilteredObjectList(Visited);
  
  lParam := TSelectParam(lList.Params.FindByProps(['ParamName'], ['AName']));
  Query.ParamAsString['user_first'] := lParam.Value;
end;

initialization
  RegisterVisitors;
  RegisterMappings;


end.

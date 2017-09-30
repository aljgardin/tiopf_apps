

unit agtipropertygui_BOM;


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
  // Generated Classes
  // ---------------------------------------------


  { Generated Class: TagtiPropertyGUIDef}
  TagtiPropertyGUIDef = class(TtiObject)
  protected
    FtiClassName: String;
    FtiPropertyName: String;
    FGUILabelCaption: String;
    FGUIEditLengthChars: Integer;
    FGUIEditLengthPixels: Integer;
    FIsReadOnly: Boolean;
    FFieldName: String;
    FFieldLength: Integer;
    FLanguageID: Integer;
    procedure SettiClassName(const AValue: String); virtual;
    procedure SettiPropertyName(const AValue: String); virtual;
    procedure SetGUILabelCaption(const AValue: String); virtual;
    procedure SetGUIEditLengthChars(const AValue: Integer); virtual;
    procedure SetGUIEditLengthPixels(const AValue: Integer); virtual;
    procedure SetIsReadOnly(const AValue: Boolean); virtual;
    procedure SetFieldName(const AValue: String); virtual;
    procedure SetFieldLength(const AValue: Integer); virtual;
    procedure SetLanguageID(const AValue: Integer); virtual;
  public
    procedure   Read; override;
    procedure   Save; override;
  published
    property    tiClassName: String read FtiClassName write SettiClassName;
    property    tiPropertyName: String read FtiPropertyName write SettiPropertyName;
    property    GUILabelCaption: String read FGUILabelCaption write SetGUILabelCaption;
    property    GUIEditLengthChars: Integer read FGUIEditLengthChars write SetGUIEditLengthChars;
    property    GUIEditLengthPixels: Integer read FGUIEditLengthPixels write SetGUIEditLengthPixels;
    property    IsReadOnly: Boolean read FIsReadOnly write SetIsReadOnly;
    property    FieldName: String read FFieldName write SetFieldName;
    property    FieldLength: Integer read FFieldLength write SetFieldLength;
    property    LanguageID: Integer read FLanguageID write SetLanguageID;
  end;
  
  { List of TagtiPropertyGUIDef.  TtiMappedFilteredObjectList descendant. }
  TagtiPropertyGUIDefList = class(TtiMappedFilteredObjectList)
  protected
    procedure   SetItems(i: integer; const AValue: TagtiPropertyGUIDef); reintroduce;
    function    GetItems(i: integer): TagtiPropertyGUIDef; reintroduce;
  public
    property    Items[i:integer] : TagtiPropertyGUIDef read GetItems write SetItems;
    procedure   Add(AObject: TagtiPropertyGUIDef); reintroduce;
    procedure   Read; override;
    procedure   Save; override;
    { Return count (1) if successful. }
    function    FindByOID(const AOID: string): integer;
  end;
  
  { Read Visitor for TagtiPropertyGUIDef }
  TagtiPropertyGUIDef_Read = class(TtiVisitorSelect)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
    procedure   MapRowToObject; override;
  end;
  
  { Create Visitor for TagtiPropertyGUIDef }
  TagtiPropertyGUIDef_Create = class(TtiVisitorUpdate)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
  end;
  
  { Update Visitor for TagtiPropertyGUIDef }
  TagtiPropertyGUIDef_Save = class(TtiVisitorUpdate)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
  end;
  
  { Delete Visitor for TagtiPropertyGUIDef }
  TagtiPropertyGUIDef_Delete = class(TtiVisitorUpdate)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
  end;
  
  { List Read Visitor for TagtiPropertyGUIDefList }
  TagtiPropertyGUIDefList_Read = class(TtiVisitorSelect)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   MapRowToObject; override;
  end;
  
  { List Create Visitor for TagtiPropertyGUIDefList }
  TagtiPropertyGUIDefList_Create = class(TtiVisitorUpdate)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
  end;
  
  { List Update Visitor for TagtiPropertyGUIDefList }
  TagtiPropertyGUIDefList_Save = class(TtiVisitorUpdate)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
  end;
  
  { List Delete Visitor for TagtiPropertyGUIDefList }
  TagtiPropertyGUIDefList_Delete = class(TtiVisitorUpdate)
  protected
    function    AcceptVisitor: Boolean; override;
    procedure   Init; override;
    procedure   SetupParams; override;
  end;
  

  { Visitor Manager Registrations }
  procedure RegisterVisitors;

  { Register Auto Mappings }
  procedure RegisterMappings;


implementation


procedure RegisterMappings;
begin
  { Automap registrations for TagtiPropertyGUIDef }
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TagtiPropertyGUIDef, 
    'MGPropertyGUIDefs', 'OID', 'OID', [pktDB]);
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TagtiPropertyGUIDef,
    'MGPropertyGUIDefs','tiClassName', 'tiClassName');
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TagtiPropertyGUIDef,
    'MGPropertyGUIDefs','tiPropertyName', 'tiPropertyName');
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TagtiPropertyGUIDef,
    'MGPropertyGUIDefs','GUILabelCaption', 'GUILabelCaption');
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TagtiPropertyGUIDef,
    'MGPropertyGUIDefs','GUIEditLengthChars', 'GUIEditLengthChars');
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TagtiPropertyGUIDef,
    'MGPropertyGUIDefs','GUIEditLengthPixels', 'GuiEditLengthPixels');
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TagtiPropertyGUIDef,
    'MGPropertyGUIDefs','IsReadOnly', 'IsReadOnly');
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TagtiPropertyGUIDef,
    'MGPropertyGUIDefs','FieldName', 'FieldName');
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TagtiPropertyGUIDef,
    'MGPropertyGUIDefs','FieldLength', 'FieldName');
  GTIOPFManager.ClassDBMappingMgr.RegisterMapping(TagtiPropertyGUIDef,
    'MGPropertyGUIDefs','LanguageID', 'LanguageID');
  GTIOPFManager.ClassDBMappingMgr.RegisterCollection(TagtiPropertyGUIDefList, TagtiPropertyGUIDef);
  
end;

procedure RegisterVisitors;
begin
  { Register Visitors for TagtiPropertyGUIDef }
  GTIOPFManager.VisitorManager.RegisterVisitor('TagtiPropertyGUIDefList_listread', TagtiPropertyGUIDefList_Read);
  GTIOPFManager.VisitorManager.RegisterVisitor('TagtiPropertyGUIDefList_listsave', TagtiPropertyGUIDefList_Create);
  GTIOPFManager.VisitorManager.RegisterVisitor('TagtiPropertyGUIDefList_listsave', TagtiPropertyGUIDefList_Save);
  GTIOPFManager.VisitorManager.RegisterVisitor('TagtiPropertyGUIDefList_listsave', TagtiPropertyGUIDefList_Delete);
  GTIOPFManager.VisitorManager.RegisterVisitor('TagtiPropertyGUIDefread', TagtiPropertyGUIDef_Read);
  GTIOPFManager.VisitorManager.RegisterVisitor('TagtiPropertyGUIDefsave', TagtiPropertyGUIDef_Save);
  GTIOPFManager.VisitorManager.RegisterVisitor('TagtiPropertyGUIDefdelete', TagtiPropertyGUIDef_Delete);
  GTIOPFManager.VisitorManager.RegisterVisitor('TagtiPropertyGUIDefcreate', TagtiPropertyGUIDef_Create);
  
end;

procedure TagtiPropertyGUIDef.SettiClassName(const AValue: String);
begin
  if FtiClassName <> AValue then
    FtiClassName := AValue;
end;

procedure TagtiPropertyGUIDef.SettiPropertyName(const AValue: String);
begin
  if FtiPropertyName <> AValue then
    FtiPropertyName := AValue;
end;

procedure TagtiPropertyGUIDef.SetGUILabelCaption(const AValue: String);
begin
  if FGUILabelCaption <> AValue then
    FGUILabelCaption := AValue;
end;

procedure TagtiPropertyGUIDef.SetGUIEditLengthChars(const AValue: Integer);
begin
  if FGUIEditLengthChars <> AValue then
    FGUIEditLengthChars := AValue;
end;

procedure TagtiPropertyGUIDef.SetGUIEditLengthPixels(const AValue: Integer);
begin
  if FGUIEditLengthPixels <> AValue then
    FGUIEditLengthPixels := AValue;
end;

procedure TagtiPropertyGUIDef.SetIsReadOnly(const AValue: Boolean);
begin
  if FIsReadOnly <> AValue then
    FIsReadOnly := AValue;
end;

procedure TagtiPropertyGUIDef.SetFieldName(const AValue: String);
begin
  if FFieldName <> AValue then
    FFieldName := AValue;
end;

procedure TagtiPropertyGUIDef.SetFieldLength(const AValue: Integer);
begin
  if FFieldLength <> AValue then
    FFieldLength := AValue;
end;

procedure TagtiPropertyGUIDef.SetLanguageID(const AValue: Integer);
begin
  if FLanguageID <> AValue then
    FLanguageID := AValue;
end;

procedure TagtiPropertyGUIDef.Read;
begin
  GTIOPFManager.VisitorManager.Execute(ClassName + 'read', self);
end;

procedure TagtiPropertyGUIDef.Save;
begin
  Case ObjectState of
    posDelete: GTIOPFManager.VisitorManager.Execute('TagtiPropertyGUIDefdelete', self);
    posUpdate: GTIOPFManager.VisitorManager.Execute('TagtiPropertyGUIDefsave', self);
    posCreate: GTIOPFManager.VisitorManager.Execute('TagtiPropertyGUIDefcreate', self);
  end;
end;

 {TagtiPropertyGUIDefList }

procedure TagtiPropertyGUIDefList.Add(AObject: TagtiPropertyGUIDef);
begin
  inherited Add(AObject);
end;

function TagtiPropertyGUIDefList.GetItems(i: integer): TagtiPropertyGUIDef;
begin
  result := inherited GetItems(i) as TagtiPropertyGUIDef;
end;

procedure TagtiPropertyGUIDefList.Read;
begin
  GTIOPFManager.VisitorManager.Execute('TagtiPropertyGUIDefList_listread', self);
end;

procedure TagtiPropertyGUIDefList.Save;
begin
  GTIOPFManager.VisitorManager.Execute('TagtiPropertyGUIDefList_listsave', self);
end;

procedure TagtiPropertyGUIDefList.SetItems(i: integer; const AValue: TagtiPropertyGUIDef);
begin
  inherited SetItems(i, AValue);
end;
function TagtiPropertyGUIDefList.FindByOID(const AOID: string): integer;
begin
  if self.Count > 0 then
    self.Clear;
    
  Criteria.ClearAll;
  Criteria.AddEqualTo('OID', AOID);
  Read;
  result := Count;
end;

{ TagtiPropertyGUIDef_Create }
function TagtiPropertyGUIDef_Create.AcceptVisitor: Boolean;
begin
  result := Visited.ObjectState = posCreate;
end;

procedure TagtiPropertyGUIDef_Create.Init;
begin
  Query.SQLText := 
    'INSERT INTO MGPropertyGUIDefs(' + 
    ' OID, ' + 
    ' tiClassName, ' + 
    ' tiPropertyName, ' + 
    ' GUILabelCaption, ' + 
    ' GUIEditLengthChars, ' + 
    ' GuiEditLengthPixels, ' + 
    ' IsReadOnly, ' + 
    ' FieldName, ' + 
    ' FieldName, ' + 
    ' LanguageID' + 
    ') VALUES (' +
    ' :OID, ' +
    ' :tiClassName, ' + 
    ' :tiPropertyName, ' + 
    ' :GUILabelCaption, ' + 
    ' :GUIEditLengthChars, ' + 
    ' :GuiEditLengthPixels, ' + 
    ' :IsReadOnly, ' + 
    ' :FieldName, ' + 
    ' :FieldName, ' + 
    ' :LanguageID' + 
    ') ';
end;

procedure TagtiPropertyGUIDef_Create.SetupParams;
var
  lObj: TagtiPropertyGUIDef;
begin
  lObj := TagtiPropertyGUIDef(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
  Query.ParamAsString['tiClassName'] := lObj.tiClassName;
  Query.ParamAsString['tiPropertyName'] := lObj.tiPropertyName;
  Query.ParamAsString['GUILabelCaption'] := lObj.GUILabelCaption;
  Query.ParamAsInteger['GUIEditLengthChars'] := lObj.GUIEditLengthChars;
  Query.ParamAsInteger['GuiEditLengthPixels'] := lObj.GUIEditLengthPixels;
  Query.ParamAsBoolean['IsReadOnly'] := lObj.IsReadOnly;
  Query.ParamAsString['FieldName'] := lObj.FieldName;
  Query.ParamAsInteger['FieldName'] := lObj.FieldLength;
  Query.ParamAsInteger['LanguageID'] := lObj.LanguageID;
end;

{ TagtiPropertyGUIDef_Save }
function TagtiPropertyGUIDef_Save.AcceptVisitor: Boolean;
begin
  result := Visited.ObjectState = posUpdate;
end;

procedure TagtiPropertyGUIDef_Save.Init;
begin
  Query.SQLText := 
    'UPDATE MGPropertyGUIDefs SET ' +
    ' tiClassName = :tiClassName, ' + 
    ' tiPropertyName = :tiPropertyName, ' + 
    ' GUILabelCaption = :GUILabelCaption, ' + 
    ' GUIEditLengthChars = :GUIEditLengthChars, ' + 
    ' GuiEditLengthPixels = :GuiEditLengthPixels, ' + 
    ' IsReadOnly = :IsReadOnly, ' + 
    ' FieldName = :FieldName, ' + 
    ' FieldName = :FieldName, ' + 
    ' LanguageID = :LanguageID ' + 
    'WHERE OID = :OID' ;
end;

procedure TagtiPropertyGUIDef_Save.SetupParams;
var
  lObj: TagtiPropertyGUIDef;
begin
  lObj := TagtiPropertyGUIDef(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
  Query.ParamAsString['tiClassName'] := lObj.tiClassName;
  Query.ParamAsString['tiPropertyName'] := lObj.tiPropertyName;
  Query.ParamAsString['GUILabelCaption'] := lObj.GUILabelCaption;
  Query.ParamAsInteger['GUIEditLengthChars'] := lObj.GUIEditLengthChars;
  Query.ParamAsInteger['GuiEditLengthPixels'] := lObj.GUIEditLengthPixels;
  Query.ParamAsBoolean['IsReadOnly'] := lObj.IsReadOnly;
  Query.ParamAsString['FieldName'] := lObj.FieldName;
  Query.ParamAsInteger['FieldName'] := lObj.FieldLength;
  Query.ParamAsInteger['LanguageID'] := lObj.LanguageID;
end;

{ TagtiPropertyGUIDef_Read }
function TagtiPropertyGUIDef_Read.AcceptVisitor: Boolean;
begin
  result := (Visited.ObjectState = posPK) OR (Visited.ObjectState = posClean);
end;

procedure TagtiPropertyGUIDef_Read.Init;
begin
  Query.SQLText := 
    'SELECT ' + 
    ' OID, ' +
    ' tiClassName, ' + 
    ' tiPropertyName, ' + 
    ' GUILabelCaption, ' + 
    ' GUIEditLengthChars, ' + 
    ' GuiEditLengthPixels, ' + 
    ' IsReadOnly, ' + 
    ' FieldName, ' + 
    ' FieldName, ' + 
    ' LanguageID ' + 
    'FROM  MGPropertyGUIDefs WHERE OID = :OID' ;
end;

procedure TagtiPropertyGUIDef_Read.SetupParams;
var
  lObj: TagtiPropertyGUIDef;
begin
  lObj := TagtiPropertyGUIDef(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
end;

procedure TagtiPropertyGUIDef_Read.MapRowToObject;
var
  lObj: TagtiPropertyGUIDef;
begin
  lObj := TagtiPropertyGUIDef(Visited);
  lObj.OID.AssignFromTIQuery('OID',Query);
  lObj.tiClassName := Query.FieldAsString['tiClassName'];
  lObj.tiPropertyName := Query.FieldAsString['tiPropertyName'];
  lObj.GUILabelCaption := Query.FieldAsString['GUILabelCaption'];
  lObj.GUIEditLengthChars := Query.FieldAsInteger['GUIEditLengthChars'];
  lObj.GUIEditLengthPixels := Query.FieldAsInteger['GuiEditLengthPixels'];
  lObj.IsReadOnly := Query.FieldAsBoolean['IsReadOnly'];
  lObj.FieldName := Query.FieldAsString['FieldName'];
  lObj.FieldLength := Query.FieldAsInteger['FieldName'];
  lObj.LanguageID := Query.FieldAsInteger['LanguageID'];
end;

{ TagtiPropertyGUIDef_Delete }
function TagtiPropertyGUIDef_Delete.AcceptVisitor: Boolean;
begin
  result := Visited.ObjectState = posDelete;
end;

procedure TagtiPropertyGUIDef_Delete.Init;
begin
  Query.SQLText := 
    'DELETE FROM MGPropertyGUIDefs ' +
    'WHERE OID = :OID';
end;

procedure TagtiPropertyGUIDef_Delete.SetupParams;
var
  lObj: TagtiPropertyGUIDef;
begin
  lObj := TagtiPropertyGUIDef(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
end;

{ TagtiPropertyGUIDefList_Read }
function TagtiPropertyGUIDefList_Read.AcceptVisitor: Boolean;
begin
  result := (Visited.ObjectState = posEmpty);
end;

procedure TagtiPropertyGUIDefList_Read.Init;
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
    ' tiClassName, ' + 
    ' tiPropertyName, ' + 
    ' GUILabelCaption, ' + 
    ' GUIEditLengthChars, ' + 
    ' GuiEditLengthPixels, ' + 
    ' IsReadOnly, ' + 
    ' FieldName, ' + 
    ' FieldName, ' + 
    ' LanguageID ' + 
    'FROM  MGPropertyGUIDefs %s %s ;';
  
  Query.SQLText := gFormatSQL(Format(lSQL, [lWhere, lOrder]), TagtiPropertyGUIDef);
  
end;

procedure TagtiPropertyGUIDefList_Read.MapRowToObject;
var
  lObj: TagtiPropertyGUIDef;
begin
  lObj := TagtiPropertyGUIDef.Create;
  lObj.OID.AssignFromTIQuery('OID',Query);
  lObj.tiClassName := Query.FieldAsString['tiClassName'];
  lObj.tiPropertyName := Query.FieldAsString['tiPropertyName'];
  lObj.GUILabelCaption := Query.FieldAsString['GUILabelCaption'];
  lObj.GUIEditLengthChars := Query.FieldAsInteger['GUIEditLengthChars'];
  lObj.GUIEditLengthPixels := Query.FieldAsInteger['GuiEditLengthPixels'];
  lObj.IsReadOnly := Query.FieldAsBoolean['IsReadOnly'];
  lObj.FieldName := Query.FieldAsString['FieldName'];
  lObj.FieldLength := Query.FieldAsInteger['FieldName'];
  lObj.LanguageID := Query.FieldAsInteger['LanguageID'];
  lObj.ObjectState := posClean;
  TtiObjectList(Visited).Add(lObj);
end;

{ TagtiPropertyGUIDefList_Create }
function TagtiPropertyGUIDefList_Create.AcceptVisitor: Boolean;
begin
  result := Visited.ObjectState = posCreate;
end;

procedure TagtiPropertyGUIDefList_Create.Init;
begin
  Query.SQLText := 
    'INSERT INTO MGPropertyGUIDefs(' + 
    ' OID, ' + 
    ' tiClassName, ' + 
    ' tiPropertyName, ' + 
    ' GUILabelCaption, ' + 
    ' GUIEditLengthChars, ' + 
    ' GuiEditLengthPixels, ' + 
    ' IsReadOnly, ' + 
    ' FieldName, ' + 
    ' FieldName, ' + 
    ' LanguageID' + 
    ') VALUES (' +
    ' :OID, ' +
    ' :tiClassName, ' + 
    ' :tiPropertyName, ' + 
    ' :GUILabelCaption, ' + 
    ' :GUIEditLengthChars, ' + 
    ' :GuiEditLengthPixels, ' + 
    ' :IsReadOnly, ' + 
    ' :FieldName, ' + 
    ' :FieldName, ' + 
    ' :LanguageID' + 
    ') ';
end;

procedure TagtiPropertyGUIDefList_Create.SetupParams;
var
  lObj: TagtiPropertyGUIDef;
begin
  lObj := TagtiPropertyGUIDef(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
  Query.ParamAsString['tiClassName'] := lObj.tiClassName;
  Query.ParamAsString['tiPropertyName'] := lObj.tiPropertyName;
  Query.ParamAsString['GUILabelCaption'] := lObj.GUILabelCaption;
  Query.ParamAsInteger['GUIEditLengthChars'] := lObj.GUIEditLengthChars;
  Query.ParamAsInteger['GuiEditLengthPixels'] := lObj.GUIEditLengthPixels;
  Query.ParamAsBoolean['IsReadOnly'] := lObj.IsReadOnly;
  Query.ParamAsString['FieldName'] := lObj.FieldName;
  Query.ParamAsInteger['FieldName'] := lObj.FieldLength;
  Query.ParamAsInteger['LanguageID'] := lObj.LanguageID;
end;

{ TagtiPropertyGUIDefList_Delete }
function TagtiPropertyGUIDefList_Delete.AcceptVisitor: Boolean;
begin
  result := Visited.ObjectState = posDelete;
end;

procedure TagtiPropertyGUIDefList_Delete.Init;
begin
  Query.SQLText := 
    'DELETE FROM MGPropertyGUIDefs ' +
    'WHERE OID = :OID';
end;

procedure TagtiPropertyGUIDefList_Delete.SetupParams;
var
  lObj: TagtiPropertyGUIDef;
begin
  lObj := TagtiPropertyGUIDef(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
end;
{ TagtiPropertyGUIDefList_Save }
function TagtiPropertyGUIDefList_Save.AcceptVisitor: Boolean;
begin
  result := Visited.ObjectState = posUpdate;
end;

procedure TagtiPropertyGUIDefList_Save.Init;
begin
  Query.SQLText := 
    'UPDATE MGPropertyGUIDefs SET ' +
    ' tiClassName = :tiClassName, ' + 
    ' tiPropertyName = :tiPropertyName, ' + 
    ' GUILabelCaption = :GUILabelCaption, ' + 
    ' GUIEditLengthChars = :GUIEditLengthChars, ' + 
    ' GuiEditLengthPixels = :GuiEditLengthPixels, ' + 
    ' IsReadOnly = :IsReadOnly, ' + 
    ' FieldName = :FieldName, ' + 
    ' FieldName = :FieldName, ' + 
    ' LanguageID = :LanguageID ' + 
    'WHERE OID = :OID' ;
end;

procedure TagtiPropertyGUIDefList_Save.SetupParams;
var
  lObj: TagtiPropertyGUIDef;
begin
  lObj := TagtiPropertyGUIDef(Visited);
  lObj.OID.AssignToTIQuery('OID',Query);
  Query.ParamAsString['tiClassName'] := lObj.tiClassName;
  Query.ParamAsString['tiPropertyName'] := lObj.tiPropertyName;
  Query.ParamAsString['GUILabelCaption'] := lObj.GUILabelCaption;
  Query.ParamAsInteger['GUIEditLengthChars'] := lObj.GUIEditLengthChars;
  Query.ParamAsInteger['GuiEditLengthPixels'] := lObj.GUIEditLengthPixels;
  Query.ParamAsBoolean['IsReadOnly'] := lObj.IsReadOnly;
  Query.ParamAsString['FieldName'] := lObj.FieldName;
  Query.ParamAsInteger['FieldName'] := lObj.FieldLength;
  Query.ParamAsInteger['LanguageID'] := lObj.LanguageID;
end;

initialization
  RegisterVisitors;
  RegisterMappings;


end.

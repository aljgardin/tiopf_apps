unit agtipropertyguimanager;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, typinfo, tiObject, agtipropertygui_BOM, mapper;

//property    tiClassName: String read FtiClassName write SettiClassName;
//property    tiPropertyName: String read FtiPropertyName write SettiPropertyName;
//property    GUILabelCaption: String read FGUILabelCaption write SetGUILabelCaption;
//property    GUIEditLengthChars: Integer read FGUIEditLengthChars write SetGUIEditLengthChars;
//property    GUIEditLengthPixels: Integer read FGUIEditLengthPixels write SetGUIEditLengthPixels;
//property    IsReadOnly: Boolean read FIsReadOnly write SetIsReadOnly;
//property    FieldName: String read FFieldName write SetFieldName;
//property    FieldLength: Integer read FFieldLength write SetFieldLength;
//property    LanguageID: Integer read FLanguageID write SetLanguageID;

//*** NOTE:  Each PropertyName should have only one entry for each languageID.

Const
  cagtiDefaultColumnWidth: Integer = 100;

type

  { TagtiPropertyGUIManager }

  TagtiPropertyGUIManager = class(TtiObject)
  private
    function GetGUIPropDefs: TagtiPropertyGUIDefList;
    procedure SetGUIPropDefs(AValue: TagtiPropertyGUIDefList);

  protected
    FGUIPropDefs: TagtiPropertyGUIDefList;

  public
    Constructor Create; Override;
    Destructor Destroy; override;

    procedure RegProperty(
      aClassName: String;
      aPropName: String;
      aGUILabelCaption: String;
      aGUIEditLengthChars: Integer;
      aGUIEditLengthPixels: Integer = 100;
      aFieldName: String = '';
      aFieldLength: Integer = 20;
      aIsReadOnly: Boolean = false;
      aLanguageID: Integer = 409); // 409 = english.

    Function Find(aClassName: String; aPropName: String; var aItem: TagtiPropertyGUIDef; aLanguageID: Integer = 409): Boolean; virtual;

    //Returns a Caption string defined in PropertyManager for that classname and propertyname.
    Function GetLabelCaption(aClassName: String; aPropName: String; aLanguageID: integer = 409): String; virtual;

    function GetCompositeStr(aClassName: String; aPropName: String; aDefColWidth: Integer = 100; aLanguageID: Integer = 409): String; virtual; overload;
    function GetCompositeStr(aClassName: String; aPropName: String; Var strCol: String; aDefColWidth: Integer = 100; aLanguageID: Integer = 409): Boolean; virtual; overload;
    function GetCompositeStr(aObject: TtiObject; aDefColWidth: Integer = 100; aLanguageID: Integer = 409): String; virtual; overload;
    function GetCompositeStr(aClass: TClass; aDefColWidth: Integer = 100; aLanguageID: Integer = 409): String; virtual; overload;

  published
    //Property List is READ ONLY:
    property GUIPropDefs: TagtiPropertyGUIDefList read GetGUIPropDefs write SetGUIPropDefs;

  end;


Function GetPublishedPropsAsStrings( Obj: TObject; var List: TStrings ): Integer;

var
  gPropertyGUIManager: TagtiPropertyGUIManager;

implementation

//Uses

var
  vagtiDefaultLanguage: Integer;

Function GetPublishedPropsAsStrings( Obj: TObject; var List: TStrings ): Integer;
var
  pt:			PTypeInfo;
  ptd:			PTypeData;
  pplist:		PPropList;
  tkinds:		TTypeKinds;
  pc:			Integer;		// propcount
  loop:			Integer;
  s:				String;
begin
  Result := -1;	// default to -1 to show failed or error
  List.Clear;
  tkinds := tkinds + tkAny;
  tkinds := tkinds - [tkMethod];
  try
  	pt := PTypeInfo( Obj.ClassInfo );
  except
    raise Exception.Create('Failed to get TypeInfo of Object. GetPublishedPropsAsStrings(TObject;TStrings);.');
  	Exit;
  end;
  // Get TypeData of object
  ptd := Typinfo.GetTypeData( pt );
  // set memory for pplist: PPropList
  GetMem(pplist, pc * SizeOf(Pointer));
  // Result := # properties returned in proplist
  Result := Typinfo.GetPropList( pt, tkinds, pplist );

  if Result < 1 then exit;

  for loop := 0 to Result - 1 do
  begin
  	s := pplist^[loop]^.Name;
    //Do not add property Caption:
    if LowerCase(s) <> 'caption' then
  	  List.Add( s );
  end;

  result := List.Count;

  freemem(pplist);
end;

{ TagtiPropertyGUIManager }

function TagtiPropertyGUIManager.GetGUIPropDefs: TagtiPropertyGUIDefList;
begin
  result := FGUIPropDefs;
end;

procedure TagtiPropertyGUIManager.SetGUIPropDefs(AValue: TagtiPropertyGUIDefList
  );
begin
  //READ ONLY.
end;

constructor TagtiPropertyGUIManager.Create;
begin
  inherited Create;

  FGUIPropDefs := TagtiPropertyGUIDefList.Create;
end;

destructor TagtiPropertyGUIManager.Destroy;
begin
  FGUIPropDefs.Free;

  inherited Destroy;
end;

procedure TagtiPropertyGUIManager.RegProperty(
  aClassName: String;
  aPropName: String;
  aGUILabelCaption: String;
  aGUIEditLengthChars: Integer;
  aGUIEditLengthPixels: Integer;
  aFieldName: String; // if blank, use aPropName.
  aFieldLength: Integer; // default 20.
  aIsReadOnly: Boolean;  // default false.
  aLanguageID: Integer); // default = 409 = english.
var
  aItem: TagtiPropertyGUIDef;
begin
  aItem := TagtiPropertyGUIDef.Create;

  //Check for Duplicate:
  if Find(aClassName, aPropName, aItem, aLanguageID) then
    begin
      { TODO : SHOW ERROR DIALOG, Item Already in List. }

      aItem.Free;
      Exit;
    end;

  aItem.tiClassName := aClassName;
  aItem.tiPropertyName := aPropName;
  aItem.GUILabelCaption := aGuiLabelCaption;
  aItem.GUIEditLengthChars := aGUIEditLengthChars;
  aItem.GUIEditLengthPixels := aGUIEditLengthPixels;
  aItem.IsReadOnly := aIsReadOnly;
  aItem.LanguageID := aLanguageID;
  aItem.FieldName := aFieldName;
  aItem.FieldLength := aFieldLength;

  FGUIPropDefs.Add(aItem);
end;

function TagtiPropertyGUIManager.Find(aClassName: String;
  aPropName: String; var aItem: TagtiPropertyGUIDef; aLanguageID: Integer): Boolean;
var
  i: Integer;
  temp: tagtipropertyGUIDef;
begin
  result := false;
  if (aClassName = '') or (aPropName = '') or (aLanguageID < 0) then
  begin
    Exit;
  end;

  for i := 0 to FGUIPropDefs.Count - 1 do
  begin
    if (LowerCase(aClassName) = LowerCase(FGUIPropDefs.Items[i].tiClassName)) and
      (LowerCase(aPropName) = LowerCase(FGUIPropDefs.Items[i].tiPropertyName)) and
      (aLanguageID = FGUIPropDefs.Items[i].LanguageID)
      then
    begin
      if Not(Assigned(aItem)) then exit;
      if aItem = nil then exit;
      { TODO : ADD MESSAGE, AItem Must be valid. }

      temp := FGUIPropDefs.Items[i];
      aItem.tiClassName := temp.tiClassName;
      aItem.tiPropertyName := temp.tiPropertyName;
      aItem.GUILabelCaption := temp.GUILabelCaption;
      aItem.GUIEditLengthChars := temp.GUIEditLengthChars;
      aItem.GUIEditLengthPixels := temp.GUIEditLengthPixels;
      aItem.LanguageID := temp.LanguageID;
      aItem.FieldName := temp.FieldName;
      aItem.FieldLength := temp.FieldLength;

      result := true;
      break;
    end;
  end;
end;

function TagtiPropertyGUIManager.GetLabelCaption(aClassName: String;
  aPropName: String; aLanguageID: integer): String;
var
  temp: tagtipropertyGUIDef;
begin
  temp := tagtiPropertyGUIDef.Create;
  if Find(aClassName, aPropName, temp, aLanguageID) then
  begin
    result := temp.GUILabelCaption
  end
  else
    result := aPropName;

  temp.Free;
end;

function TagtiPropertyGUIManager.GetCompositeStr(aClassName: String;
  aPropName: String; aDefColWidth: Integer; aLanguageID: Integer): String;
var
  strCol: String;
begin
  //returns one column definition in a composite mediator.
  // '[Fieldname]([Length],"[Caption]")'.  ie.. 'FirstName(30,"First Name")'.
  strcol := '';
  if GetCompositeStr(aClassName, aPropName, strCol, aDefColWidth, aLanguageID) then
  begin
    Result := strCol;
  end;
end;

function TagtiPropertyGUIManager.GetCompositeStr(aClassName: String;
  aPropName: String; var strCol: String; aDefColWidth: Integer; aLanguageID: Integer): Boolean;
var
  pgd: tagtipropertyGUIDef;
begin
  //returns one column definition in a composite mediator as strCol: String.
  //  returns true if found in manager.
  //  returns false if not found in manager, creates from defaults.
  // '[Fieldname]([Length],"[Caption]")'.  ie.. 'FirstName(30,"First Name")'.
  result := false;
  strCol := '';
  pgd := TagtiPropertyGUIDef.Create;
  if Find(aClassName, aPropName, pgd, aLanguageID) then
  begin
    strCol := pgd.tiPropertyName + '(' +
      IntToStr(pgd.GUIEditLengthPixels) + ',"' +
      pgd.GUILabelCaption + '")';
    result := true;
  end
  else
  begin
    strCol := '';
    strCol := pgd.tiPropertyName + '(' +
      IntToStr(aDefColWidth) + ',"' +
      pgd.tiPropertyName + '")';
    result := true;
  end;
  pgd.Free;
end;

function TagtiPropertyGUIManager.GetCompositeStr(aObject: TtiObject; aDefColWidth: Integer; aLanguageID: Integer): String;
var
  loop: Integer;
  props: TStrings;
  pcount: integer;
  cap: String;
  propdef: TagtiPropertyGUIDef;
  col: string;
  collen: Integer;
begin
  // returns all columns of  aObject.Classname properties published.
  // will try to find in GuiManager.
  //   if not found, use defaults.
  result := '';
  props := TStringList.Create;
  propdef := TagtiPropertyGUIDef.Create;

  try
    pcount := GetPublishedPropsAsStrings(aObject, props);

    if pcount < 1 then
    begin
     raise Exception.Create(' No Published properties in AObject.  GetCompositeStr(aObject: TtiObject; aDefColWidth: Integer; aLanguageID: Integer): String;');     exit;
    end;
    //AddComposite('<Fieldname>(<length>,"<Display>"));
    for loop := 0 to props.Count - 1 do
    begin
      collen := -1;
      if find(aObject.ClassName, props[loop], propdef, aLanguageID) then
      begin
        cap := propdef.GUIlabelCaption;
        collen := propdef.GUIEditLengthPixels
      end
      else
      begin
        cap := props[loop];
      end;
      if collen < 1 then collen := aDefColWidth;
      if collen < 1 then collen := 50;

      col := props[loop] + '(' + IntToStr(collen) + ',"' + cap + '")';
      result := result + col;
      if loop < (props.Count - 1) then
        result := result + ';';
    end;
  finally
    props.Free;
    propdef.Free;
  end;

end;

function TagtiPropertyGUIManager.GetCompositeStr(aClass: TClass;
  aDefColWidth: Integer; aLanguageID: Integer): String;
var
  aObject: TtiObject;
begin
  // returns all columns of  aObject.Classname properties published.
  // will try to find in GuiManager.
  //   if not found, use defaults.
  aObject := TtiObject(aClass.Create);
  result := GetCompositeStr(aObject, aDefColWidth, aLanguageID);
  aObject.Free;
end;

Initialization
  vagtiDefaultLanguage := SysLocale.DefaultLCID;

  if not(Assigned(gPropertyGUIManager)) then
    gPropertyGUIManager := TagtiPropertyGUIManager.Create;

Finalization
  gPropertyGUIManager.Free;

end.


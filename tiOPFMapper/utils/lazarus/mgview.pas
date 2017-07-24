unit mgView;

//  Laz Mapper GUI Model View
//  Sets up view of Mapper TMapProject
//

{$mode objfpc}{$H+}

interface

uses
  Classes
  //,SysUtils
  ,tiMediators
  , tiListMediators
  , typinfo
  , agtiPropertyGUIManager
  , Test_GMapper
  , mapper;

type
//   declare your mediator view classes here:
  { TMemo - Name }
  //TPerson_Name_Memo_Mediator = class(TtiMemoMediatorView)
  //protected
  //  procedure SetupGUIandObject; override;
  //end;

  //TMapProject -
    //property    FileName: string read FFileName write SetFileName;
    //property    ProjectName: string read FProjectName write SetProjectName;
    //property    Includes: TStringList read FIncludes;
    //property    OrigOutDirectory: string read FOrigOutDirectory write SetOrigOutDirectory;
    //property    OutputDirectory: string read FOutputDirectory write SetOutputDirectory;
    //property    BaseDirectory: string read FBaseDirectory write SetBaseDirectory;
    //property    TabSpaces: integer read FTabSpaces write SetTabSpaces;
    //property    BeginEndTabs: integer read FBeginEndTabs write SetBeginEndTabs;
    //property    VisibilityTabs: integer read FVisibilityTabs write SetVisibilityTabs;
    //property    MaxEditorCodeWidth: integer read FMaxEditorCodeWidth write SetMaxEditorCodeWidth;
    //property    EnumType: TEnumType read FEnumType write SetEnumType;

  TMapProject_ProjectName_TEdit_Mediator = class(TtiEditMediatorView)
  end;

  TMapProject_ProjectName_TLabel_Mediator = Class(TtiStaticTextMediatorView)
  end;

  TMapProject_Filename_TEdit_Mediator = class(TtiEditMediatorView)
  end;

  TMapProject_Filename_TLabel_Mediator = class(TtiStaticTextMediatorView)
  end;

  { TMapProject_Units_TStringGrid_Mediator }

  TMapProject_Units_TStringGrid_Mediator = class(TtiStringGridMediatorView)
  protected

  public
    procedure HandleSelectionChanged; override;//virtual; // Called from the GUI to trigger events
  end;

  TMapProject_Classes_TStringgrid_Mediator = class(TtiStringgridMediatorView)
  end;

  TMapProject_Unit_Name_TLabel_Mediator = class(TtistaticTextMediatorView)
  end;

  TMapProject_ClassProperties_StringGrid_Mediator = class(TtiStringGridMediatorView)
  end;

  TMapProject_Unit_Enumerations_StringGrid_Mediator = class(TtiStringGridMediatorView)
  end;

  TMapProject_Unit_References_StringGrid_Mediator = class(TtiStringGridMediatorView)
  end;

  TMapProject_IncludeFiles_StringGrid_Mediator = class(TtiStringGridMediatorView)
  end;

  { TEnumCombobox_Mediator }

  TEnumCombobox_Mediator = class(TtiComboBoxMediatorView)
  protected
    procedure   SetupGUIandObject; override;
  public
  end;

  { TMapProject_EnumType_ComboBox_Mediator }

  TMapProject_EnumType_ComboBox_Mediator = class(TtiComboBoxMediatorView)
  protected
    procedure   SetupGUIandObject; override;
  end;

implementation

uses
//  Mapper
  tiBaseMediator
  , stdctrls
  , dialogs
  ;

procedure RegisterMediators;
begin
  // Fallbacks (generic)
  RegisterFallBackMediators;
  RegisterFallBackListMediators;

  // Specific
  //ie..gMediatorManager.RegisterMediator(TPerson_Name_Memo_Mediator, TPerson, 'Name');
  //Project:
  gMediatorManager.RegisterMediator(TMapProject_ProjectName_TEdit_Mediator, TGMapProject, 'ProjectName' );
  gMediatorManager.RegisterMediator(TMapProject_ProjectName_TLabel_Mediator, TGMapProject, 'ProjectName');
  gMediatorManager.RegisterMediator(TMapProject_Filename_Tedit_Mediator, TGMapProject, 'Filename');
  gMediatorManager.RegisterMediator(TMapProject_Filename_TLabel_Mediator, TGMapProject, 'Filename');
  //Unit:
  gMediatorManager.RegisterMediator(TMapProject_Unit_Name_TLabel_Mediator, TMapUnitDef, 'Name');

  //StringGrid Mediators:
  //gMediatorManager.RegisterMediator(TMapProject_ClassProperties_StringGrid_Mediator, TMapClassDef);
  gMediatorManager.RegisterMediator(TMapProject_Units_TStringGrid_Mediator, TGMapProject, 'Units');
  gMediatorManager.RegisterMediator(TMapProject_Classes_TStringgrid_Mediator, TMapClassDefList);
  gMediatorManager.RegisterMediator(TMapProject_Unit_Enumerations_StringGrid_Mediator, TMapEnumList);
  gMediatorManager.RegisterMediator(TMapProject_Unit_References_StringGrid_Mediator, TGMapUnitReferenceList);
  gMediatorManager.RegisterMediator(TMapProject_IncludeFiles_StringGrid_Mediator, TGMapProject, 'IncludeFiles' );


  // Enumeration mediators:
  gMediatorManager.RegisterMediator(TEnumComboBox_Mediator, TGMapProject, 'EnumType');
  gMediatorManager.RegisterMediator(TEnumComboBox_Mediator, TMapClassDef, 'DefType');
  gMediatorManager.RegisterMediator(TEnumComboBox_Mediator, TFilterDef, 'FilterType');
  gMediatorManager.RegisterMediator(TEnumComboBox_Mediator, TClassMapping, 'OIDType');
  gMediatorManager.RegisterMediator(TEnumComboBox_Mediator, TMapValidator, 'ValidatorType');

end;

{ TMapProject_Units_TStringGrid_Mediator }

procedure TMapProject_Units_TStringGrid_Mediator.HandleSelectionChanged;
begin
  ShowMessage('Stringgrid Selection change.');
end;

{ TEnumCombobox_Mediator }

Procedure TEnumCombobox_Mediator.SetupGUIandObject;
var
  loop: Integer;
  str: string;
  ptd: PTypeData;
  ppi: PPropInfo;
begin
  inherited SetupGUIandObject;

  if Assigned(Subject) then
  begin
    //try to determine typekind from properties of subject.
    //  self.FieldName := Propname of subject of enum.
    ppi := typinfo.GetPropInfo(Subject, self.FieldName);
    ptd := typinfo.GetTypeData(ppi^.PropType);

    if Assigned(View) and (ppi^.PropType^.Kind = tkEnumeration)  then
    begin
      view.Items.Clear;
      for loop := ptd^.MinValue to ptd^.MaxValue do
      begin
        str := typinfo.GetEnumName(ppi^.PropType, loop);
        // str := typinfo.GetEnumName(FpEnum, loop);
        view.Items.Add(str);
      end;
    end;
  end;

end;

{ TMapProject_EnumType_ComboBox_Mediator }

procedure TMapProject_EnumType_ComboBox_Mediator.SetupGUIandObject;
var
  loop: TEnumType;
  str: string;
begin
  inherited SetupGUIandObject;

  if Assigned(View) then
  begin
    view.Items.Clear;
    for loop := low(TEnumType) to High(TEnumType) do
    begin
      str := typinfo.GetEnumName(typeinfo(TEnumType), Integer(loop));
      view.Items.Add(str);
    end;
  end;
end;

initialization
{ Register all your Mediator Views here }
  RegisterMediators;
finalization

end.


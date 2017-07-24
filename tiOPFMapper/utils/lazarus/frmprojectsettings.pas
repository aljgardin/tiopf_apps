unit frmProjectSettings;

{$mode objfpc}{$H+}

interface

uses
  Classes
  , SysUtils
  , FileUtil
  , Forms
  , Controls
  , Graphics
  , Dialogs
  , StdCtrls
  , ExtCtrls
  , Spin
  , ComCtrls
  , Menus
  , Grids
  , Mapper
  , Test_GMapper
  , mgDataManager
  , mgView
  , tiModelMediator
  , tiListMediators
  ;

type

  { TdlgProjectSettings }

  TdlgProjectSettings = class(TForm)
    btnClose: TButton;
    btnDebugIncludes: TButton;
    btnDebugMapProject: TButton;
    cbEnumType: TComboBox;
    edtOutputDirectory: TLabeledEdit;
    edtProjectName: TLabeledEdit;
    edtFilename: TLabeledEdit;
    lblEnumType: TLabel;
    lblBeginEndTabs: TLabel;
    lblIncludes: TLabel;
    lblMaxEditorCodeWidth: TLabel;
    lblOutputDirectory: TBoundLabel;
    lblTabSpaces: TLabel;
    lblVisibilityTabs: TLabel;
    miAdd: TMenuItem;
    miDelete: TMenuItem;
    miEdit: TMenuItem;
    Panel1: TPanel;
    pmIncludes: TPopupMenu;
    seBeginEndTabs: TSpinEdit;
    seMaxEditorCodeWidth: TSpinEdit;
    seTabSpaces: TSpinEdit;
    seVisibilityTabs: TSpinEdit;
    sgIncludeFiles: TStringGrid;
    procedure actIncludesEditExecute(Sender: TObject);
    procedure btnDebugIncludesClick(Sender: TObject);
    procedure btnDebugMapProjectClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cbEnumTypeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { private declarations }
    { Mediators: }
    FMediator: TtiModelMediator;
    mIncludeFilesSG: TMapProject_IncludeFiles_StringGrid_Mediator;

    procedure SetupMediators;

    function MapProject: TGMapProject;
    function Manager: TMGDataManager;

  public
    { public declarations }
  end;

var
  dlgProjectSettings: TdlgProjectSettings;

implementation

//uses
//  typinfo;

{$R *.lfm}

{ TdlgProjectSettings }

procedure TdlgProjectSettings.FormDestroy(Sender: TObject);
begin
  FMediator.Free;
//  mIncludes.Free;
end;

procedure TdlgProjectSettings.btnCloseClick(Sender: TObject);
begin
  MapProject.NotifyObservers();
  self.Close;
end;

procedure TdlgProjectSettings.cbEnumTypeChange(Sender: TObject);
begin
end;

procedure TdlgProjectSettings.FormCreate(Sender: TObject);
begin
  SetupMediators;
end;

procedure TdlgProjectSettings.btnDebugMapProjectClick(Sender: TObject);
begin
  ShowMessage(MapProject.AsDebugString());
end;

procedure TdlgProjectSettings.btnDebugIncludesClick(Sender: TObject);
begin
  ShowMessage(Manager.MapProject.IncludeFiles.AsDebugString());
end;

procedure TdlgProjectSettings.actIncludesEditExecute(Sender: TObject);
begin

end;

procedure TdlgProjectSettings.SetupMediators;
var
  aCol: TGridColumn;
begin
  if Not(Assigned(FMediator)) then
  begin
    FMediator := TtiModelMediator.Create(self);
    FMediator.AddProperty('ProjectName', edtProjectName);
    FMediator.AddProperty('Filename', edtFilename);
    FMediator.AddProperty('OutputDirectory', edtOutputDirectory);
    FMediator.AddProperty('TabSpaces', seTabSpaces);
    FMediator.AddProperty('BeginEndTabs', seBeginEndTabs);
    FMediator.AddProperty('VisibilityTabs', seVisibilityTabs);
    FMediator.AddProperty('MaxEditorCodeWidth', seMaxEditorCodeWidth);

    FMediator.AddProperty('EnumType', cbEnumType);

  end;
  FMediator.Subject := MapProject;
  FMediator.Active := true;

  if Not(Assigned(mIncludeFilesSG)) then
  begin
    mIncludeFilesSG := TMapProject_IncludeFiles_StringGrid_Mediator.CreateCustom(
      MapProject.IncludeFiles,
      sgIncludeFiles,
      'IncludeFilename(200,"Include Filename")' ,
      true);
    mIncludeFilesSG.View.FixedCols := 0;
    mIncludeFilesSG.View.FixedRows := 1;
  end;
  mIncludeFIlesSG.Subject := Manager.MapProject.IncludeFiles;
  mIncludeFilesSG.Active := true;

end;

function TdlgProjectSettings.MapProject: TGMapProject;
begin
  result := gMGManager.MapProject;
end;

function TdlgProjectSettings.Manager: TMGDataManager;
begin
  result := gMGManager;
end;

end.


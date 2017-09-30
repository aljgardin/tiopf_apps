unit mgAppPreferences_BOM;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, tiObject, mapper, mgAppPreferencesBase_BOM;

type

  { TmgAppPref }

  TmgAppPref = class(TmgAppPreferencesBase)

  private
    FtiMapFilename: string;
    FtiMapLocations: TmgAPFilenameList;
    procedure SettiMapFilename(AValue: string);
    procedure SettiMapLocations(AValue: TmgAPFilenameList);
  public
    property tiMapLocations: TmgAPFilenameList read FtiMapLocations write SettiMapLocations;

    constructor Create; override;
    Destructor Destroy; Override;

  published
    property tiMapFilename: string read FtiMapFilename write SettiMapFilename;

  end;

implementation

{ TmgAppPref }

procedure TmgAppPref.SettiMapFilename(AValue: string);
begin
  if FtiMapFilename = AValue then Exit;
  FtiMapFilename := AValue;
end;

procedure TmgAppPref.SettiMapLocations(AValue: TmgAPFilenameList);
begin
  if FtiMapLocations = AValue then Exit;
  FtiMapLocations := AValue;
end;

constructor TmgAppPref.Create;
begin
  inherited Create;
  FtiMapLocations := tmgAPFilenameList.Create;
end;

destructor TmgAppPref.Destroy;
begin
  FtiMapLocations.Free;
  inherited Destroy;
end;

end.


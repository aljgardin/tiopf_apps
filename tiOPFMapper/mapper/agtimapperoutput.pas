unit agtiMapperOutput;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fgl;

type
  { TagtiMapperOutput }

  TagtiMapperOutput = class(TPersistent)
  private
    FFilename: TFilename;
    FpasOutput: TStringlist;
    FpasPath: String;
    procedure SetFilename(AValue: TFilename);
    procedure SetpasOutput(AValue: TStringlist);
    procedure SetpasPath(AValue: String);
  protected
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;

    procedure Clear;

    procedure SaveToFile; overload;

  published
    property pasOutput: TStringlist read FpasOutput write SetpasOutput;
    property pasFilename: TFilename read FFilename write SetFilename;
    property pasPath: String read FpasPath write SetpasPath;
  end;

  TagtiMapperOutputList = specialize TFPGObjectList<TagtiMapperOutput>;


implementation

{ TagtiMapperOutput }

procedure TagtiMapperOutput.SetFilename(AValue: TFilename);
begin
  if FFilename=AValue then Exit;
  FFilename:=AValue;
end;

procedure TagtiMapperOutput.SetpasOutput(AValue: TStringlist);
begin
  if FpasOutput.Text=AValue.Text then Exit;
  FpasOutput.Assign(AValue);
end;

procedure TagtiMapperOutput.SetpasPath(AValue: String);
begin
  if FpasPath=AValue then Exit;
  FpasPath:=AValue;
end;

constructor TagtiMapperOutput.Create;
begin
  inherited Create;
  FpasOutput := TStringlist.Create;
end;

destructor TagtiMapperOutput.Destroy;
begin
  FpasOutput.Free;
  inherited Destroy;
end;

procedure TagtiMapperOutput.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if Source is TagtiMapperOutput then
    begin
      self.pasOutput.Assign((Source as TagtiMapperOutput).FpasOutput);
      self.FFilename:=(Source as TagtiMapperOutput).FFilename;
    end;
end;

procedure TagtiMapperOutput.Clear;
begin
  FpasOutput.Clear;
  FFilename := '';
end;

procedure TagtiMapperOutput.SaveToFile;
begin
  if DirectoryExists(FpasPath) and (FFilename <> '') then
  begin
    try
      pasOutput.SaveToFile(sysutils.IncludeTrailingPathDelimiter(fPasPath) + FFilename + '.pas');
    except
      on E: Exception do
      begin

      end;
    end;
  end;
end;


end.


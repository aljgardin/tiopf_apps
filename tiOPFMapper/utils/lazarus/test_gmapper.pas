unit Test_GMapper;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, tiObject, mapper;

type

  { GMapProject }

  GMapProject = class(TMapProject)

  private
    FStrProperty: string;
    procedure SetStrProperty(AValue: string);
  published
    property StrProperty: string read FStrProperty write SetStrProperty;
  end;

implementation



{ GMapProject }

procedure GMapProject.SetStrProperty(AValue: string);
begin
  if FStrProperty = AValue then Exit;
  FStrProperty := AValue;
end;

end.


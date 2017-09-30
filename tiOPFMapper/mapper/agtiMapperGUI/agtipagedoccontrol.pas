unit agtiPageDocControl;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls;

type

  { TagtiTStringListList }

  TagtiTStringListList = class(TList)

  end;

  { TagtiPageDocControl }

  TagtiPageDocControl = class(TPanel)
  private
    FPageControl: TPageControl;
    procedure SetPageControl(AValue: TPageControl);

  protected
    property PageControl: TPageControl read FPageControl write SetPageControl;


  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;


  published

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('AG',[TagtiPageDocControl]);
end;

{ TagtiPageDocControl }

procedure TagtiPageDocControl.SetPageControl(AValue: TPageControl);
begin
  if FPageControl = AValue then Exit;
  FPageControl := AValue;
end;

constructor TagtiPageDocControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FPageControl := TPageControl.Create(self);
  FPageControl.Parent := self;
end;

destructor TagtiPageDocControl.Destroy;
begin
  inherited Destroy;
end;

end.

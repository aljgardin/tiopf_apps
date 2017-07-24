{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit agtipropertymanagerlazr;

{$warn 5023 off : no warning about unused units}
interface

uses
  agtiPropertyGui_Inc, agtipropertygui_BOM, agtipropertyguimanager, 
  agtiViewBuilder, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('agtipropertymanagerlazr', @Register);
end.

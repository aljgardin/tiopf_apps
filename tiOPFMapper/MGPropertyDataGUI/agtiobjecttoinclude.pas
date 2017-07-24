unit agtiObjectToInclude;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, tiObject, agtiinc, agtipropertyguimanager;


function tiObjectToagtiInculdeFile(
  aData: TtiObject;
  var aOutput: TStrings;
  aLanguageID: Integer = 409;
  aZeroArray: boolean = true): integer;

implementation

function tiObjectToagtiInculdeFile(
  aData: TtiObject;
  var aOut: TStrings;
  aLanguageID: Integer = 409;
  aZeroArray: boolean = true): integer;
var
  ztab: Integer;
  aunitname, afilename, rdg, cdg: string;
  props: TStrings;
  propcount: integer;

procedure iTab;
begin
  Inc(ztab, 2);
end;

procedure DecTab;
begin
  Dec(zTab, 2);
  if zTab < 0 then zTab := 0;
end;

function Tabs: string;
begin
  result := '';
  if ztab > 0 then
    result := stringofchar(' ', ztab);
end;

procedure wln(ln: String);
begin
  aOut.Add(tabs + ln);
end;

procedure wbr;
begin
  aOut.Add();
end;

begin
  ztab := 0;
  result := -1;
  if not(Assigned(aData)) or (aData = nil) then exit;
  if not(Assigned(aOut)) or (aOut = nil) then exit;

  aOut.Clear;
  props := TStringlist.Create;
  propcount := agtipropertyguimanager.GetPublishedPropsAsStrings(aData, props);
  if propcount < 1 then
  begin
    result := 0;
    exit;
  end;

  aunitname := aData.ClassName + 'Inc';
  afilename := aunitname + '.pas';
  rdg := 'r' + aData.ClassName + 'DG';  // record array name.
  cdg := 'c' + rdg;  // constant record array name.

  wln('Unit ' + aunitname + ';');
  wbr;
  wln('{$mode objfpc}{$H+}');
  wbr;
  wln('interface');
  wbr;
  wln('Uses');
  iTab;
  wln('Classes, SysUtils, tiObject, agtiInc, agtiPropertyGUIManager;');
  wbr;
  dTab;
  wln('type');
  iTab;
  if aZeroArray then
    wln(rdg + ' = array[0..' + IntToStr(propcount - 1) + '] of ragtiDataGUI;')
  else
    wln(rdg + ' = array[1..' + IntToStr(propcount) + '] of ragtiDataGUI;')
  wbr;
  dTab;
  wln('Const');
  wbr;
  //crMapPorjectDataGUI:  rMapProjectDataGui = (
    //  TMapClassDef:
    //{1} (tiClassName: 'TMapClassDef'; tiPropertyName: 'BaseClassName'; GUICaption: 'Class Name'; GUILengthChars: 200; GUILengthPixels: 0; IsReadOnly: false; LanguageID: 409),
  iTab;
  wln(cdg + ': ' + rdg + ' = (');
  iTab;


end;

end.


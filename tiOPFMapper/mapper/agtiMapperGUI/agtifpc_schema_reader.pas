unit agtifpc_schema_reader;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  mapper,
  fpc_schema_reader,
  DOM,
  XMLWrite;

type

  { TagtiFPCSchemaXMLReader }

  TagtiFPCSchemaXMLReader = class(TFPCSchemaXMLReader)

  public
    procedure   ReadSchema(AProject: TMapProject; const AFileName: string = ''); overload; override;

  end;

  { TagtiProjectWriter }

  TagtiProjectWriter = class(TProjectWriter)
  private
  public
    procedure WriteProject(AProject: TMapProject; const ADirectory: string; const AFileName: string); override; overload;
    procedure WriteProject(Aproject: TMapProject; const AFilePath: string); override; overload;
    procedure WriteProject(AProject: TMapProject; var ASL: TStrings); virtual; overload;

    constructor Create; override;
  end;


implementation

{ TagtiFPCSchemaXMLReader }

procedure TagtiFPCSchemaXMLReader.ReadSchema(AProject: TMapProject;
  const AFileName: string);
begin
  inherited ReadSchema(AProject, AFileName);
end;

{ TagtiProjectWriter }

procedure TagtiProjectWriter.WriteProject(AProject: TMapProject;
  const ADirectory: string; const AFileName: string);
begin
  inherited WriteProject(AProject, ADirectory, AFileName);
end;

procedure TagtiProjectWriter.WriteProject(Aproject: TMapProject;
  const AFilePath: string);
begin
  inherited WriteProject(Aproject, AFilePath);
end;

procedure TagtiProjectWriter.WriteProject(AProject: TMapProject; var ASL: TStrings);
var
  lDocElem: TDOMElement;
  lNewElem: TDOMElement;
  lIncNode: TDomElement;
  lDir: string;
  lIncludesNode: TDomNode;
  lIncludeElement: TDomElement;
  ic: integer;
  lComment: TDOMComment;
  mem: TMemoryStream;
begin
  if FDoc <> nil then
    begin
      FreeAndNil(FDoc);
    end;

  FWriterProject := AProject;

  FDoc := TXMLDocument.Create;

  // Setup the <project> root node
  lDocElem := FDoc.CreateElement('project');
  lDocElem.SetAttribute('tab-spaces', IntToStr(FWriterProject.TabSpaces));
  lDocElem.SetAttribute('begin-end-tabs', IntToStr(FWriterProject.BeginEndTabs));
  lDocElem.SetAttribute('visibility-tabs', IntToStr(FWriterProject.VisibilityTabs));
  lDocElem.SetAttribute('project-name', FWriterProject.ProjectName);
  lDocElem.SetAttribute('outputdir', FWriterProject.OrigOutDirectory);

  if FWriterProject.EnumType = etInt then
    lDocElem.SetAttribute('enum-type', 'int')
  else
    lDocElem.SetAttribute('enum-type', 'string');

  //Added write props:
  lDocElem.SetAttribute('origoutdir', FWriterProject.OrigOutDirectory);
  lDocElem.SetAttribute('max-editor-code', intToStr(FWriterProject.MaxEditorCodeWidth));
  lDocElem.SetAttribute('base-directory', FWriterProject.BaseDirectory);

  FDoc.AppendChild(lDocElem);

  //Added write Includes:
  lComment := FDoc.CreateComment('Includes are Schema files added to this schema before build-time.');
  lDocElem.AppendChild(lComment);
  lComment := FDoc.CreateComment('<includes>');
  lDocElem.AppendChild(lComment);
  lComment := FDoc.CreateComment('  <item file-name="{aFilename}" />');
  lDocElem.AppendChild(lComment);
  lComment := FDoc.CreateComment('</includes>');
  lDocElem.AppendChild(lComment);
  if FWriterProject.Includes.Count > 0 then
  begin
    lIncludesNode := FDoc.CreateElement('includes');
    for ic := 0 to FWriterProject.Includes.Count - 1 do
      begin
        lIncludeElement := FDoc.CreateElement('item');
        lIncludeElement.SetAttribute('file-name', FWriterProject.Includes.Strings[ic]);
        lIncludesNode.AppendChild(lIncludeElement);
      end;
    lDocElem.AppendChild(lIncludesNode);
  end;
  lComment := FDoc.CreateComment('End Includes.');
  lDocElem.AppendChild(lComment);

  WriteProjectUnits(FWriterProject, lDocElem);

//  WriteXMLFile(FDoc, AFilePath);
  if not (Assigned(ASL)) then
    exit;
  mem := TMemoryStream.Create;
  ASL.Clear;
  xmlWrite.WriteXML(FDOC, mem);
  asl.LoadFromStream(mem);
  mem.Free;
end;

constructor TagtiProjectWriter.Create;
begin
  inherited Create;
end;

end.

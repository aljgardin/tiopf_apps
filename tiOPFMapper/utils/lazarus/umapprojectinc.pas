unit uMapProjectInc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, agtiinc, agtiPropertyGUIManager;

type
  rMapProjectDataGui = Array[1..22] of ragtiDataGUI;

const
  //property    tiClassName: String read FtiClassName write SettiClassName;
  //property    tiPropertyName: String read FtiPropertyName write SettiPropertyName;
  //property    GUICaption: String read FGUICaption write SetGUICaption;
  //property    GUILengthChars: Integer read FGUILengthChars write SetGUILengthChars;
  //property    GUILengthPixels: Integer read FGUILengthPixels write SetGUILengthPixels;
  //property    IsReadOnly: Boolean read FIsReadOnly write SetIsReadOnly;
  //property    LanguageID: Integer

  crMapProjectDataGUI:  rMapProjectDataGui = (
    //  TMapClassDef:
{1} (tiClassName: 'TMapClassDef'; tiPropertyName: 'BaseClassName'; GUICaption: 'Class Name'; GUILengthChars: 200; GUILengthPixels: 0; FieldName: 'ClassName'; FieldLength: 50; IsReadOnly: false; LanguageID: 409),
    (tiClassName: 'TMapClassDef'; tiPropertyName: 'BaseClassParent'; GUICaption: 'Base (Super) Class'; GUILengthChars: 200; GUILengthPixels: 0; FieldName: 'BaseClass'; FieldLength: 50; IsReadOnly: false; LanguageID: 409),
    (tiClassName: 'TMapClassDef'; tiPropertyName: 'AutoCreateBase'; GUICaption: 'Auto Base'; GUILengthChars: 100; GUILengthPixels: 0;  FieldName: 'AutoBase'; FieldLength: 50; IsReadOnly: false; LanguageID: 409),
    (tiClassName: 'TMapClassDef'; tiPropertyName: 'AutoCreateListClass'; GUICaption: 'Auto List'; GUILengthChars: 100; GUILengthPixels: 0;  FieldName: 'AutoList'; FieldLength: 50; IsReadOnly: false; LanguageID: 409),
    (tiClassName: 'TMapClassDef'; tiPropertyName: 'AutoMap'; GUICaption: 'Auto Map'; GUILengthChars: 100; GUILengthPixels: 0;  FieldName: 'AutoMap'; FieldLength: 50; IsReadOnly: false; LanguageID: 409),
    (tiClassName: 'TMapClassDef'; tiPropertyName: 'BaseUnitName'; GUICaption: 'Unit Name'; GUILengthChars: 200; GUILengthPixels: 0;  FieldName: 'UnitName'; FieldLength: 50; IsReadOnly: false; LanguageID: 409),
    (tiClassName: 'TMapClassDef'; tiPropertyName: 'DefType'; GUICaption: 'TClassDefType'; GUILengthChars: 100; GUILengthPixels: 0;  FieldName: 'TClassDefType'; FieldLength: 50; IsReadOnly: false; LanguageID: 409 ),
    (tiClassName: 'TMapClassDef'; tiPropertyName: 'ForwardDeclare'; GUICaption: 'Forward'; GUILengthChars: 100; GUILengthPixels: 0;  FieldName: 'Forward'; FieldLength: 50; IsReadOnly: false; LanguageID: 409 ),
    (tiClassName: 'TMapClassDef'; tiPropertyName: 'ORMClassName'; GUICaption: 'ORM Class Name'; GUILengthChars: 200; GUILengthPixels: 0;  FieldName: 'OrmClassName'; FieldLength: 50; IsReadOnly: false; LanguageID: 409 ),
{10}(tiClassName: 'TMapClassDef'; tiPropertyName: 'NotifyObserversOfPropertyChanges'; GUICaption: 'Notify Observers'; GUILengthChars: 100;  GUILengthPixels: 0; FieldName: 'NotifyObservers'; FieldLength: 50; IsReadOnly: false; LanguageID: 409),
    // TMapEnumDef:
    (tiClassName: 'TMapEnumDef'; tiPropertyName: 'EnumName'; GUICaption: 'Enum Name'; GUILengthChars: 200; GUILengthPixels: 0;  FieldName: 'EnumName'; FieldLength: 50; IsReadOnly: false; LanguageID: 409),
{12}(tiClassName: 'TMapEnumDef'; tiPropertyName: 'Values'; GUICaption: 'Values'; GUILengthChars: 200; GUILengthPixels: 0;  FieldName: 'Values'; FieldLength: 50; IsReadOnly: false; LanguageID: 409),
    // TMapClassPropDef:
    (tiClassName: 'TMapClassPropDef'; tiPropertyName: 'Name'; GUICaption: 'Name'; GUILengthChars: 200; GUILengthPixels: 0;  FieldName: 'Name'; FieldLength: 50; IsReadOnly: false; LanguageID: 409 ),
    (tiClassName: 'TMapClassPropDef'; tiPropertyName: 'PropertyType'; GUICaption: 'Property Type'; GUILengthChars: 100; GUILengthPixels: 0;  FieldName: 'Propertytype'; FieldLength: 50; IsReadOnly: false; LanguageID: 409 ),
    (tiClassName: 'TMapClassPropDef'; tiPropertyName: 'ProptiClassName'; GUICaption: 'Property Type Name'; GUILengthChars: 200; GUILengthPixels: 0;  FieldName: 'PropertytypeName'; FieldLength: 50; IsReadOnly: false; LanguageID: 409),
{16}(tiClassName: 'TMapClassPropDef'; tiPropertyName: 'IsReadOnly'; GUICaption: 'Is Read Only'; GUILengthChars: 100; GUILengthPixels: 0;  FieldName: 'IsReadOnly'; FieldLength: 50; IsReadOnly: false; LanguageID: 409 ),
    // TMapPropMap:
    (tiClassName: 'TMapPropMap'; tiPropertyName: 'PropName'; GUICaption: 'Property Name'; GUILengthChars: 200; GUILengthPixels: 0;  FieldName: 'PropName'; FieldLength: 50; IsReadOnly: false; LanguageID: 409),
    (tiClassName: 'TMapPropMap'; tiPropertyName: 'tiPropertyNameName'; GUICaption: 'DB tiPropertyName Name'; GUILengthChars: 200; GUILengthPixels: 0;  FieldName: 'DBtiPropertyName'; FieldLength: 50; IsReadOnly: false; LanguageID: 409),
    (tiClassName: 'TMapPropMap'; tiPropertyName: 'PropertyType'; GUICaption: 'Property Type'; GUILengthChars: 200; GUILengthPixels: 0;  FieldName: 'PropertyType'; FieldLength: 50; IsReadOnly: false; LanguageID: 409),
    (tiClassName: 'TMapPropMap'; tiPropertyName: 'PropertyGetter'; GUICaption: 'Property Getter'; GUILengthChars: 200; GUILengthPixels: 0;  FieldName: 'PropertyGetter'; FieldLength: 50; IsReadOnly: false; LanguageID: 409),
    (tiClassName: 'TMapPropMap'; tiPropertyName: 'PropertySetter'; GUICaption: 'Property Setter'; GUILengthChars: 200; GUILengthPixels: 0;  FieldName: 'PropertySetter'; FieldLength: 50; IsReadOnly: false; LanguageID: 409),
{22}(tiClassName: 'TMapPropMap'; tiPropertyName: 'PropertyAccesorsAreAbstract'; GUICaption: 'Property Acesors Are Abstract'; GUILengthChars: 200; GUILengthPixels: 0;  FieldName: 'PropertyAcesorsAreAbstract'; FieldLength: 50; IsReadOnly: false; LanguageID: 409) );

procedure RegData;

implementation

procedure RegData;
var
  i: Integer;
begin
  //ragtiDataGUI = record
  //    tiClassName: String;
  //    tiPropertyName: String;
  //    GUICaption: String;
  //    GUILengthChars: Integer;
  //    GUILengthPixels: Integer;
  //    FieldName: String;
  //    FieldLength: Integer;
  //    IsReadOnly: Boolean;
  //    LanguageID: Integer;
  //  end;
  //Registers PropertyData in gPropertyGUIManager.
  for i := Low(crMapProjectDataGUI) to High(crMapProjectDataGUI) do
  begin
    gPropertyGUIManager.RegProperty(
      crMapProjectDataGUI[i].tiClassName,
      crMapProjectDataGUI[i].tiPropertyName,
      crMapProjectDataGUI[i].GUICaption,
      crMapProjectDataGUI[i].GUILengthChars,
      crMapProjectDataGUI[i].GUILengthPixels,
      crMapProjectDataGUI[i].FieldName,
      crMapProjectDataGUI[i].FieldLength,
      crMapProjectDataGUI[i].IsReadOnly,
      crMapProjectDataGUI[i].LanguageID
    );
  end;
end;

Initialization
  RegData;

end.


unit agtiPropertyGui_Inc;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  //property    tiClassName: String read FtiClassName write SettiClassName;
  //property    tiPropertyName: String read FtiPropertyName write SettiPropertyName;
  //property    GUICaption: String read FGUICaption write SetGUICaption;
  //property    GUILengthChars: Integer read FGUILengthChars write SetGUILengthChars;
  //property    GUILengthPixels: Integer read FGUILengthPixels write SetGUILengthPixels;
  //property    IsReadOnly: Boolean read FIsReadOnly write SetIsReadOnly;
  //property    LanguageID: Integer

  //record to hold DataType: TtiObject.Typename
  // Field = TtiObject.[Field]
  // Display = Gui Display Text.  UserName becomes 'User Name';
  // Length = Gui Display length in characters.
  ragtiDataGUI = record
    tiClassName: String;
    tiPropertyName: String;
    GUICaption: String;
    GUILengthChars: Integer;
    GUILengthPixels: Integer;
    FieldName: String;
    FieldLength: Integer;
    IsReadOnly: Boolean;
    LanguageID: Integer;
  end;

  //*** NOTE:  Each PropertyName should have only one entry for each languageID.

implementation

end.


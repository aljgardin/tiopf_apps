unit frmViewCode;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  FileUtil,
  SynHighlighterXML,
  SynHighlighterPas,
  SynEdit,
  Forms,
  Controls,
  Graphics,
  Dialogs,
  ExtCtrls,
  StdCtrls,
  ComCtrls,
  frmDefault;

type

  { TViewCodeForm }

  TViewCodeForm = class(TDefaultForm)
    PageControl1: TPageControl;
    pcCode:     TPageControl;
    seXML:      TSynEdit;
    SynPasSyn1: TSynPasSyn;
    SynXMLSyn1: TSynXMLSyn;
    TabSheet1:  TTabSheet;
    TabSheet2:  TTabSheet;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  ViewCodeForm: TViewCodeForm;

implementation

uses
  MGDataManager;

{$R *.lfm}

{ TViewCodeForm }
procedure TViewCodeForm.FormCreate(Sender: TObject);
begin
  // get the xml:
//  seXML.Lines.Assign(gmgManager.XML);

  // Get the PAS outputs:

end;

end.

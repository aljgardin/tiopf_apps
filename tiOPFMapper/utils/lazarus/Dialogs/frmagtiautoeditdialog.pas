unit frmagtiAutoEditDialog;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, ActnList, Menus, frmagTIEditDialog, tiObject,
  tiModelMediator, tiMediators, tiListMediators, contnrs;

type

  { TagTIAutoEditDialog }

  TagTIAutoEditDialog = class(TagTIEditDialog)
    Edit1: TEdit;
    FontDialog1: TFontDialog;
    Label1: TLabel;
    MenuItem1: TMenuItem;
    PopupMenu1: TPopupMenu;
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure sbEditClick(Sender: TObject);
  private
    FMediators: TtiModelMediatorList;
    procedure SetMediators(AValue: TtiModelMediatorList);

  protected
    property Mediators: TtiModelMediatorList read FMediators write SetMediators;

  public
    procedure SetData(const AValue: TtiObject); override;

  end;

var
  agTIAutoEditDialog: TagTIAutoEditDialog;

implementation

uses
  tiPerAwareCtrls
  ,TypInfo
  ,tiRTTI
  ,spin
 ;

{$R *.lfm}

{ TagTIAutoEditDialog }

procedure TagTIAutoEditDialog.FormKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
  begin
    Key := #0; // Eat the Beep
    SelectNext(ActiveControl AS TWinControl, True, True) // Forward
  end
  else
  if Key = #2 then
    SelectNext(ActiveControl AS TWinControl, False, True) // Backward
end;

procedure TagTIAutoEditDialog.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);

  FMediators := TtiModelMediatorList.Create(self);
end;

procedure TagTIAutoEditDialog.FormDestroy(Sender: TObject);
begin
  FMediators.Free;
  inherited FormDestroy(Sender);
end;

procedure TagTIAutoEditDialog.MenuItem1Click(Sender: TObject);
begin
  FontDialog1.Font := sbEdit.Font;
  if FontDialog1.Execute then
    sbEdit.Font := FontDialog1.Font;
end;

procedure TagTIAutoEditDialog.SetMediators(AValue: TtiModelMediatorList);
begin
  if FMediators = AValue then Exit;
  FMediators := AValue;
end;

procedure TagTIAutoEditDialog.SetData(const AValue: TtiObject);
var
  lsl : TStringList;
  i  : integer;
//  lpa : TtiPerAwareAbs;

  lComp: TControl;
  pComp: TControl;
  atypekind: TtiTypekind;
  lMediator: TtiModelMediator;
  lLabel: TLabel;
  pLabel: TLabel;
  lidx: Integer;
  totHeight, totWidth: Integer;
  lblWidth: Integer;
const
  cBorder = 12;
  cCtrlWidth  = 300;
begin

  inherited SetData(AValue);

  if AValue = nil then
    Caption := ' No data available'
  else
    if RO.ReadOnly then
      Caption := ' View ' + AValue.Caption
    else
      Caption := ' Edit ' + AValue.Caption;

  RO.Enabled:=true;
  lsl := TStringList.Create;  //Property Names

  pLabel := nil;  //Previous Label
  pComp := nil;   //Previous Comp or edit.

  try
    tiGetPropertyNames(TtiObject(AValue),
                        lsl,
                        ctkSimple + [tkVariant, tkEnumeration]);

    lsl.Sorted := true;
    lsl.Sort;
    // We don't need caption.
    if lsl.Find('Caption', lidx) then
      lsl.Delete(lidx);

    for i := 0 to lsl.Count - 1 do
    begin

      //Create The Label:
      lLabel := TLabel.Create(self);
      lLabel.Parent := sbEdit;
      lLabel.Caption := lsl.Strings[i];
      lLabel.Width := cCtrlWidth; { TODO : Make this a property? }

      // anchor this label.
        lLabel.AnchorSideLeft.Control := sbEdit;
        lLabel.AnchorSideLeft.Side := asrLeft;
        if pLabel = nil then
        begin
          lLabel.AnchorSideTop.Control := sbEdit;
          lLabel.AnchorSideTop.Side := asrTop;
        end
        else
        begin
          lLabel.AnchorSideTop.Control := plabel;
          lLabel.AnchorSideTop.Side := asrBottom;
        end;
        lLabel.Anchors := [akTop, akLeft];
        lLabel.BorderSpacing.Top := cBorder;
        lLabel.BorderSpacing.Right := cBorder;
        lLabel.BorderSpacing.Bottom := cBorder;
        lLabel.BorderSpacing.Left := cBorder;

        if lLabel.Width > lblWidth then
          lblWidth := lLabel.Width;

      pLabel := lLabel;

      // What type of control to create:
      atypekind := tiGetSimplePropType(TtiObject(AValue), lsl.Strings[i]);
      case atypekind of
        tiTKString:
          begin
            lcomp := TEdit.Create(self);
            TEdit(lcomp).ReadOnly := RO.ReadOnly;
            lcomp.Width := cCtrlWidth;
          end;

        titkInteger:
          begin
            lcomp := TSpinEdit.Create(self);
            TSpinEdit(lcomp).ReadOnly := RO.ReadOnly;
            lcomp.Width := cCtrlWidth;
          end;

        {$IFDEF FPC}
        titkBoolean:
          begin
            lcomp := TCheckBox.Create(self);
            TCheckBox(lcomp).Enabled := RO.ReadOnly;
            lcomp.Width := cCtrlWidth;
          end;
        {$ENDIF}

        titkFloat:
          begin
            lcomp := TFloatSpinEdit.Create(self);
            TFloatSpinEdit(lcomp).ReadOnly := RO.ReadOnly;
            lcomp.Width := cCtrlWidth;
          end;

        tiTKDateTime:
          begin
            lcomp := TDateTimePicker.Create(self);
            TDateTimePicker(lcomp).ReadOnly := RO.ReadOnly;
            lcomp.Width := cCtrlWidth;
          end;
      else
        lcomp := TEdit.Create(self);
        TEdit(lcomp).ReadOnly := RO.ReadOnly;
        lcomp.Width := cCtrlWidth;
      end;

      lcomp.Parent := sbEdit;

      // Set Anchors of Edit:
        lcomp.AnchorSideLeft.Control := lLabel;
        lcomp.AnchorSideLeft.Side := asrRight;
        lcomp.AnchorSideBottom.Control := lLabel;
        lComp.AnchorSideBottom.Side := asrBottom;
        //lcomp.AnchorSideTop.Control := lLabel;
        //lcomp.AnchorSideTop.Side := asrTop;
        lcomp.Anchors := [akLeft, akBottom];


      lMediator := Mediators.Add(lsl.Strings[i]);
      lMediator.AddProperty(lsl.Strings[i], lcomp);
      lMediator.Subject := Data;
      lMediator.Active := true;

      pComp := lComp;

      //Calculate client width of SBedit.
      if (lLabel.Width + lComp.Width) > totWidth then
        totWidth := (lLabel.Width + lComp.Width) + 20;

      if lLabel.Height > lComp.Height then
      begin
        totHeight := lLabel.Top + lLabel.Height + lLabel.BorderSpacing.Top +
          lLabel.BorderSpacing.Bottom + lLabel.BorderSpacing.Around;
      end
      else
      begin
        totHeight := lComp.Top + lcomp.Height + lcomp.BorderSpacing.Top +
          lcomp.BorderSpacing.Bottom + lcomp.BorderSpacing.Around;
      end;
    end;

    if totWidth > 800 then totWidth := 800;

    sbEdit.ClientHeight := totHeight;
    sbEdit.ClientWidth := totWidth;
  finally
    lsl.Free;
  end;
  self.Position := poScreenCenter;

  //for i := 0 to sbEdit.ComponentCount -1 do
  //begin
  //  if sbEdit.Components[i] is TLabel then
  //  begin
  //    TLabel(sbEdit.Components[i]).AnchorSideRight;
  //    TLabel(sbEdit.Components[i]).Width := lblWidth;
  //  end;
  //end;

end;

initialization
  RegisterFallBackMediators;
  RegisterFallBackListMediators;

end.


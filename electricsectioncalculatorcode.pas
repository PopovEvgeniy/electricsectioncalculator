unit electricsectioncalculatorcode;

{
 This sofware was made by Popov Evgeniy Alekseyevich.
 It is distributed under the GNU GENERAL PUBLIC LICENSE (Version 2 or higher).
}

{$mode objfpc}
{$H+}

interface

uses Classes, SysUtils, Forms, Controls, Dialogs, ExtCtrls, StdCtrls, LCLType;

type

  { TMainWindow }

  TMainWindow = class(TForm)
    CalculateButton: TButton;
    LengthField: TLabeledEdit;
    PowerField: TLabeledEdit;
    ResistanceField: TLabeledEdit;
    AmperageField: TLabeledEdit;
    SectionField: TLabeledEdit;
    procedure CalculateButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LengthFieldChange(Sender: TObject);
    procedure PowerFieldChange(Sender: TObject);
    procedure ResistanceFieldChange(Sender: TObject);
    procedure AmperageFieldChange(Sender: TObject);
    procedure LengthFieldKeyPress(Sender: TObject; var Key: char);
    procedure PowerFieldKeyPress(Sender: TObject; var Key: char);
    procedure ResistanceFieldKeyPress(Sender: TObject; var Key: char);
    procedure AmperageFieldKeyPress(Sender: TObject; var Key: char);
  private
    function check_field():boolean;
    procedure window_setup();
    procedure interface_setup();
    procedure language_setup();
    procedure setup();
  public
    { public declarations }
  end; 

var MainWindow: TMainWindow;

implementation

{$R *.lfm}

function calculate_section(const measures:extended;const resistance:extended;const amperage:extended;const power:extended): extended;
begin
 Result:=(measures*resistance*amperage*amperage)/power;
end;

procedure restrict_input(var key:char);
begin
 if not (key in ['0'..'9']) then
 begin
  if not (key in [','..'.']) then
  begin
   if ord(key)<>VK_BACK then key:=#0;
  end;

 end;

end;

function TMainWindow.check_field():boolean;
begin
 Result:=(Self.LengthField.Text<>'') and (Self.PowerField.Text<>'') and (Self.ResistanceField.Text<>'') and (Self.AmperageField.Text<>'');
end;

procedure TMainWindow.window_setup();
begin
 Application.Title:='Electrical cable section calculator';
 Self.Caption:='Electrical cable section calculator 1.5.8';
 Self.BorderStyle:=bsDialog;
 Self.Font.Name:=Screen.MenuFont.Name;
 Self.Font.Size:=14;
end;

procedure TMainWindow.interface_setup();
begin
 Self.CalculateButton.ShowHint:=False;
 Self.CalculateButton.Enabled:=False;
 Self.SectionField.Enabled:=False;
 Self.LengthField.LabelPosition:=lpLeft;
 Self.PowerField.LabelPosition:=lpLeft;
 Self.ResistanceField.LabelPosition:=lpLeft;
 Self.AmperageField.LabelPosition:=lpLeft;
 Self.SectionField.LabelPosition:=lpLeft;
 Self.LengthField.Text:='';
 Self.PowerField.Text:='';
 Self.ResistanceField.Text:='';
 Self.AmperageField.Text:='';
 Self.SectionField.Text:='';
end;

procedure TMainWindow.language_setup();
begin
 Self.CalculateButton.Caption:='Calculate';
 Self.LengthField.EditLabel.Caption:='Length in mm';
 Self.PowerField.EditLabel.Caption:='Power in watts';
 Self.ResistanceField.EditLabel.Caption:='Resistance in ohms';
 Self.AmperageField.EditLabel.Caption:='Amperage in amperes';
 Self.SectionField.EditLabel.Caption:='Electric cable section';
end;

procedure TMainWindow.setup();
begin
 Self.window_setup();
 Self.interface_setup();
 Self.language_setup();
end;

{ TMainWindow }

procedure TMainWindow.FormCreate(Sender: TObject);
begin
 Self.setup();
end;

procedure TMainWindow.CalculateButtonClick(Sender: TObject);
var section:extended;
begin
 try
  section:=calculate_section(StrToFloat(LengthField.Text),StrToFloat(ResistanceField.Text),StrToFloat(AmperageField.Text),StrToFloat(PowerField.Text));
  Self.SectionField.Text:=FloatToStr(section);
 except
  ShowMessage('You set an invalid value');
  Self.SectionField.Text:='';
 end;

end;

procedure TMainWindow.LengthFieldChange(Sender: TObject);
begin
 Self.CalculateButton.Enabled:=Self.check_field();
end;

procedure TMainWindow.PowerFieldChange(Sender: TObject);
begin
 Self.CalculateButton.Enabled:=Self.check_field();
end;

procedure TMainWindow.ResistanceFieldChange(Sender: TObject);
begin
 Self.CalculateButton.Enabled:=Self.check_field();
end;

procedure TMainWindow.AmperageFieldChange(Sender: TObject);
begin
 Self.CalculateButton.Enabled:=Self.check_field();
end;

procedure TMainWindow.LengthFieldKeyPress(Sender: TObject; var Key: char);
begin
 restrict_input(Key);
end;

procedure TMainWindow.PowerFieldKeyPress(Sender: TObject; var Key: char);
begin
 restrict_input(Key);
end;

procedure TMainWindow.ResistanceFieldKeyPress(Sender: TObject; var Key: char);
begin
 restrict_input(Key);
end;

procedure TMainWindow.AmperageFieldKeyPress(Sender: TObject; var Key: char);
begin
 restrict_input(Key);
end;

{ TMainWindow }

end.

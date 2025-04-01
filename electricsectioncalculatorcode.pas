unit electricsectioncalculatorcode;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Dialogs, ExtCtrls,
  StdCtrls, LCLType;

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
    procedure LengthFieldKeyPress(Sender: TObject; var Key: char);
    procedure PowerFieldChange(Sender: TObject);
    procedure PowerFieldKeyPress(Sender: TObject; var Key: char);
    procedure ResistanceFieldChange(Sender: TObject);
    procedure ResistanceFieldKeyPress(Sender: TObject; var Key: char);
    procedure AmperageFieldChange(Sender: TObject);
    procedure AmperageFieldKeyPress(Sender: TObject; var Key: char);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var MainWindow: TMainWindow;

implementation

{$R *.lfm}

procedure restrict_input(var key:char);
begin
 if (ord(key)<ord('0')) or (ord(key)>ord('9')) then
 begin
  if (key<>'.') or (key<>',') then
  begin
   if ord(key)<>VK_BACK then key:=#0;
  end;

 end;

end;

procedure window_setup();
begin
 Application.Title:='Electrical cable section calculator';
 MainWindow.Caption:='Electrical cable section calculator 1.5.2';
 MainWindow.BorderStyle:=bsDialog;
 MainWindow.Font.Name:=Screen.MenuFont.Name;
 MainWindow.Font.Size:=14;
end;

procedure interface_setup();
begin
 MainWindow.CalculateButton.ShowHint:=False;
 MainWindow.CalculateButton.Enabled:=False;
 MainWindow.SectionField.Enabled:=False;
 MainWindow.LengthField.LabelPosition:=lpLeft;
 MainWindow.PowerField.LabelPosition:=MainWindow.LengthField.LabelPosition;
 MainWindow.ResistanceField.LabelPosition:=MainWindow.LengthField.LabelPosition;
 MainWindow.AmperageField.LabelPosition:=MainWindow.LengthField.LabelPosition;
 MainWindow.SectionField.LabelPosition:=MainWindow.LengthField.LabelPosition;
 MainWindow.LengthField.Text:='';
 MainWindow.PowerField.Text:=MainWindow.LengthField.Text;
 MainWindow.ResistanceField.Text:=MainWindow.LengthField.Text;
 MainWindow.AmperageField.Text:=MainWindow.LengthField.Text;
 MainWindow.SectionField.Text:=MainWindow.LengthField.Text;
end;

procedure language_setup();
begin
 MainWindow.CalculateButton.Caption:='Calculate';
 MainWindow.LengthField.EditLabel.Caption:='Length in mm';
 MainWindow.PowerField.EditLabel.Caption:='Power in watts';
 MainWindow.ResistanceField.EditLabel.Caption:='Resistance in ohms';
 MainWindow.AmperageField.EditLabel.Caption:='Amperage in amperes';
 MainWindow.SectionField.EditLabel.Caption:='Electric cable section';
end;

procedure setup();
begin
 window_setup();
 interface_setup();
 language_setup();
end;

{ TMainWindow }

procedure TMainWindow.FormCreate(Sender: TObject);
begin
 setup();
end;

function calculate_section(const measures:extended;const resistance:extended;const amperage:extended;const power:extended): extended;
begin
 calculate_section:=(measures*resistance*amperage*amperage)/power;
end;

procedure TMainWindow.CalculateButtonClick(Sender: TObject);
var section:double;
begin
 MainWindow.SectionField.Text:='';
 if StrToFloat(MainWindow.PowerField.Text)=0 then
 begin
  ShowMessage('Invalid power');
 end
 else
 begin
  section:=calculate_section(StrToFloat(LengthField.Text),StrToFloat(ResistanceField.Text),StrToFloat(AmperageField.Text),StrToFloat(PowerField.Text));
  MainWindow.SectionField.Text:=FloatToStr(section);
 end;

end;

procedure TMainWindow.LengthFieldChange(Sender: TObject);
begin
 MainWindow.CalculateButton.Enabled:=(MainWindow.LengthField.Text<>'') and (MainWindow.PowerField.Text<>'') and (MainWindow.ResistanceField.Text<>'') and (MainWindow.AmperageField.Text<>'');
end;

procedure TMainWindow.LengthFieldKeyPress(Sender: TObject; var Key: char);
begin
 restrict_input(Key);
end;

procedure TMainWindow.PowerFieldChange(Sender: TObject);
begin
 MainWindow.CalculateButton.Enabled:=(MainWindow.LengthField.Text<>'') and (MainWindow.PowerField.Text<>'') and (MainWindow.ResistanceField.Text<>'') and (MainWindow.AmperageField.Text<>'');
end;

procedure TMainWindow.PowerFieldKeyPress(Sender: TObject; var Key: char);
begin
 restrict_input(Key);
end;

procedure TMainWindow.ResistanceFieldChange(Sender: TObject);
begin
 MainWindow.CalculateButton.Enabled:=(MainWindow.LengthField.Text<>'') and (MainWindow.PowerField.Text<>'') and (MainWindow.ResistanceField.Text<>'') and (MainWindow.AmperageField.Text<>'');
end;

procedure TMainWindow.ResistanceFieldKeyPress(Sender: TObject; var Key: char);
begin
 restrict_input(Key);
end;

procedure TMainWindow.AmperageFieldChange(Sender: TObject);
begin
 MainWindow.CalculateButton.Enabled:=(MainWindow.LengthField.Text<>'') and (MainWindow.PowerField.Text<>'') and (MainWindow.ResistanceField.Text<>'') and (MainWindow.AmperageField.Text<>'');
end;

procedure TMainWindow.AmperageFieldKeyPress(Sender: TObject; var Key: char);
begin
 restrict_input(Key);
end;

{ TMainWindow }

end.

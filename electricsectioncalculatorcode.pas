unit electricsectioncalculatorcode;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Dialogs, ExtCtrls,
  StdCtrls, LCLType;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure LabeledEdit1KeyPress(Sender: TObject; var Key: char);
    procedure LabeledEdit2Change(Sender: TObject);
    procedure LabeledEdit2KeyPress(Sender: TObject; var Key: char);
    procedure LabeledEdit3Change(Sender: TObject);
    procedure LabeledEdit3KeyPress(Sender: TObject; var Key: char);
    procedure LabeledEdit4Change(Sender: TObject);
    procedure LabeledEdit4KeyPress(Sender: TObject; var Key: char);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var Form1: TForm1;

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
 Form1.Caption:='Electrical cable section calculator 1.5.1';
 Form1.BorderStyle:=bsDialog;
 Form1.Font.Name:=Screen.MenuFont.Name;
 Form1.Font.Size:=14;
end;

procedure interface_setup();
begin
 Form1.Button1.ShowHint:=False;
 Form1.Button1.Enabled:=False;
 Form1.LabeledEdit5.Enabled:=False;
 Form1.LabeledEdit1.LabelPosition:=lpLeft;
 Form1.LabeledEdit2.LabelPosition:=Form1.LabeledEdit1.LabelPosition;
 Form1.LabeledEdit3.LabelPosition:=Form1.LabeledEdit1.LabelPosition;
 Form1.LabeledEdit4.LabelPosition:=Form1.LabeledEdit1.LabelPosition;
 Form1.LabeledEdit5.LabelPosition:=Form1.LabeledEdit1.LabelPosition;
 Form1.LabeledEdit1.Text:='';
 Form1.LabeledEdit2.Text:=Form1.LabeledEdit1.Text;
 Form1.LabeledEdit3.Text:=Form1.LabeledEdit1.Text;
 Form1.LabeledEdit4.Text:=Form1.LabeledEdit1.Text;
 Form1.LabeledEdit5.Text:=Form1.LabeledEdit1.Text;
end;

procedure language_setup();
begin
 Form1.Button1.Caption:='Calculate';
 Form1.LabeledEdit1.EditLabel.Caption:='Length in mm';
 Form1.LabeledEdit2.EditLabel.Caption:='Power in watts';
 Form1.LabeledEdit3.EditLabel.Caption:='Resistance in ohms';
 Form1.LabeledEdit4.EditLabel.Caption:='Amperage in amperes';
 Form1.LabeledEdit5.EditLabel.Caption:='Electric cable section';
end;

procedure setup();
begin
 window_setup();
 interface_setup();
 language_setup();
end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
 setup();
end;

function calculate_section(const measures:extended;const resistance:extended;const amperage:extended;const power:extended): extended;
begin
 calculate_section:=(measures*resistance*amperage*amperage)/power;
end;

procedure TForm1.Button1Click(Sender: TObject);
var section:double;
begin
 Form1.LabeledEdit5.Text:='';
 if StrToFloat(Form1.LabeledEdit2.Text)=0 then
 begin
  ShowMessage('Invalid power');
 end
 else
 begin
  section:=calculate_section(StrToFloat(LabeledEdit1.Text),StrToFloat(LabeledEdit3.Text),StrToFloat(LabeledEdit4.Text),StrToFloat(LabeledEdit2.Text));
  Form1.LabeledEdit5.Text:=FloatToStr(section);
 end;

end;

procedure TForm1.LabeledEdit1Change(Sender: TObject);
begin
 Form1.Button1.Enabled:=(Form1.LabeledEdit1.Text<>'') and (Form1.LabeledEdit2.Text<>'') and (Form1.LabeledEdit3.Text<>'') and (Form1.LabeledEdit4.Text<>'');
end;

procedure TForm1.LabeledEdit1KeyPress(Sender: TObject; var Key: char);
begin
 restrict_input(Key);
end;

procedure TForm1.LabeledEdit2Change(Sender: TObject);
begin
 Form1.Button1.Enabled:=(Form1.LabeledEdit1.Text<>'') and (Form1.LabeledEdit2.Text<>'') and (Form1.LabeledEdit3.Text<>'') and (Form1.LabeledEdit4.Text<>'');
end;

procedure TForm1.LabeledEdit2KeyPress(Sender: TObject; var Key: char);
begin
 restrict_input(Key);
end;

procedure TForm1.LabeledEdit3Change(Sender: TObject);
begin
 Form1.Button1.Enabled:=(Form1.LabeledEdit1.Text<>'') and (Form1.LabeledEdit2.Text<>'') and (Form1.LabeledEdit3.Text<>'') and (Form1.LabeledEdit4.Text<>'');
end;

procedure TForm1.LabeledEdit3KeyPress(Sender: TObject; var Key: char);
begin
 restrict_input(Key);
end;

procedure TForm1.LabeledEdit4Change(Sender: TObject);
begin
 Form1.Button1.Enabled:=(Form1.LabeledEdit1.Text<>'') and (Form1.LabeledEdit2.Text<>'') and (Form1.LabeledEdit3.Text<>'') and (Form1.LabeledEdit4.Text<>'');
end;

procedure TForm1.LabeledEdit4KeyPress(Sender: TObject; var Key: char);
begin
 restrict_input(Key);
end;

{ TForm1 }

end.

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Math, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LaengeEdit: TEdit;
    BreiteEdit: TEdit;
    HoeheEdit: TEdit;
    BerechnenBtn: TButton;
    Label5: TLabel;
    VolumeEdit: TEdit;
    OberflaecheEdit: TEdit;
    Label6: TLabel;
    ResetBtn: TButton;
    ExitBtn: TButton;
    MantelflaecheEdit: TEdit;
    Label7: TLabel;
    Image1: TImage;
    Label8: TLabel;
    dF1Edit: TEdit;
    dF2Edit: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    dF3Edit: TEdit;
    Label11: TLabel;
    dREdit: TEdit;
    procedure BerechnenBtnClick(Sender: TObject);
    procedure ResetBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BerechnenBtnClick(Sender: TObject);
var a,b,c,V,Ao,M, dF1, dF2, dF3, dR : Double;
begin
  // Ausgabfelder leeren
  VolumeEdit.Clear;
  OberflaecheEdit.Clear;
  MantelflaecheEdit.Clear;
  dF1Edit.Clear;
  dF2Edit.Clear;
  dF3Edit.Clear;
  dREdit.Clear;

  // Überprüfen ob Länge, Breite, Höhe auch ein string gesetzt ist.
  if (LaengeEdit.Text = string.Empty) or (BreiteEdit.Text = string.Empty) or (HoeheEdit.Text = string.Empty) then
  begin
    showMessage('Bitte Werte eingeben.');
    Exit;
  end;

  // Eingabe zu Float converten
  a:=StrToFloat(LaengeEdit.Text);
  b:=StrToFloat(BreiteEdit.Text);
  c:=StrToFloat(HoeheEdit.Text);


  if (a=0) or (b=0) or (c=0)then
  begin
      showMessage('Rechung mit 0 ist nicht möglich.');
      Exit;
  end;


  // Berechnen des  V, Ao, M, dF1, dF2, dF3, dR
  var Vu:= a*b*c;
  var Aou:= 2*a*b + 2*b*c + 2*a*c;
  var Mu:= (a+b)*2;

  var dF1u:= Sqrt(Power(a, 2)+Power(b, 2));
  var dF2u:= Sqrt(Power(b, 2)+Power(c,2));
  var dF3u:= Sqrt(Power(a,2)+Power(c,2));
  var dRu:= Sqrt(Power(a, 2)+Power(b,2)+Power(c,2));

  // Runden auf 2 Nachkommastellen
  V:=RoundTo(Vu, -2);
  Ao:=RoundTo(Aou, -2);
  M:=RoundTo(Mu, -2);
  dF1:= RoundTo(dF1u, -2);
  dF2:= RoundTo(dF2u, -2);
  dF3:= RoundTo(dF3u, -2);
  dR:= RoundTo(dRu, -2);

  // Einsetzen der Werte.
  VolumeEdit.Text:='≈ '+FloatToStr(V);
  OberflaecheEdit.Text:='≈ '+FloatToStr(Ao);
  MantelflaecheEdit.Text:='≈ '+FloatToStr(M);
  dF1Edit.Text:='≈ '+FloatToStr(dF1);
  dF2Edit.Text:='≈ '+FloatToStr(dF2);
  dF3Edit.Text:='≈ '+FloatToStr(dF3);
  dREdit.Text:='≈ '+FloatToStr(dR);
end;

procedure TForm1.ExitBtnClick(Sender: TObject);
begin
  // Schließen
  Form1.Close;
end;

procedure TForm1.ResetBtnClick(Sender: TObject);
begin
  // Alle Felder leeren
  LaengeEdit.Clear;
  BreiteEdit.Clear;
  HoeheEdit.Clear;
  VolumeEdit.Clear;
  OberflaecheEdit.Clear;
  MantelflaecheEdit.Clear;
  dF1Edit.Clear;
  dF2Edit.Clear;
  dF3Edit.Clear;
  dREdit.Clear;

  showMessage('Alles wurde zurückgesetzt.');
end;

end.

unit uAcercade;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfrmAcercaDe }

  TfrmAcercaDe = class(TForm)
    bCerrarAcercaDe: TPanel;
    Image1: TImage;
    lblVersion: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Timer1: TTimer;
    procedure bCerrarAcercaDeClick(Sender: TObject);
    procedure bCerrarAcercaDeMouseEnter(Sender: TObject);
    procedure bCerrarAcercaDeMouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure MoveLabelUp(ALabel:Tlabel);
  private

  public

  end;

var
  frmAcercaDe: TfrmAcercaDe;

implementation

{$R *.lfm}

{ TfrmAcercaDe }

procedure TfrmAcercaDe.bCerrarAcercaDeClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAcercaDe.bCerrarAcercaDeMouseEnter(Sender: TObject);
begin
  bCerrarAcercaDe.Color := TColor($00826C49);
end;

procedure TfrmAcercaDe.bCerrarAcercaDeMouseLeave(Sender: TObject);
begin
  bCerrarAcercaDe.Color := TColor($005E4934);
end;

procedure TfrmAcercaDe.FormShow(Sender: TObject);
begin
  Timer1.Interval := 50;
  Label2.Top:=ClientHeight;
  Label3.Top:=ClientHeight+50;
  Label5.Top:=ClientHeight+100;
  Label6.Top:=ClientHeight+150;
  Label7.Top:=ClientHeight+200;
  Label8.Top:=ClientHeight+250;
end;

procedure TfrmAcercaDe.Timer1Timer(Sender: TObject);
var
  AllLabelsOut: Boolean;
begin
  AllLabelsOut := True;

  MoveLabelUp(Label2);
  MoveLabelUp(Label3);
  MoveLabelUp(Label5);
  MoveLabelUp(Label6);
  MoveLabelUp(Label7);
  MoveLabelUp(Label8);

  if (Label2.Top + Label2.Height >= 0) or
     (Label3.Top + Label3.Height >= 0) or
     (Label5.Top + Label5.Height >= 0) or
     (Label6.Top + Label6.Height >= 0) or
     (Label7.Top + Label7.Height >= 0) or
     (Label8.Top + Label8.Height >= 0) then
    AllLabelsOut := False;

  if AllLabelsOut then
  begin
    Label2.Top := ClientHeight;
    Label3.Top := ClientHeight + 50;
    Label5.Top := ClientHeight + 100;
    Label6.Top := ClientHeight + 150;
    Label7.Top := ClientHeight + 200;
    Label8.Top := ClientHeight + 250;
  end;
end;

procedure TfrmAcercaDe.MoveLabelUp(ALabel:Tlabel);
begin
  ALabel.Top:=ALabel.Top-2;
end;

end.


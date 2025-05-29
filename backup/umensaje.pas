unit uMensaje;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfrmMensaje }

  TfrmMensaje = class(TForm)
    lblTexto: TLabel;
    bOk: TPanel;
    Panel1: TPanel;
    procedure bOkClick(Sender: TObject);
    procedure bOkMouseEnter(Sender: TObject);
    procedure bOkMouseLeave(Sender: TObject);
  private

  public

  end;

var
  frmMensaje: TfrmMensaje;

implementation

{$R *.lfm}

{ TfrmMensaje }

procedure TfrmMensaje.bOkMouseEnter(Sender: TObject);
begin
  bOk.Color := TColor($00826C49);
end;

procedure TfrmMensaje.bOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMensaje.bOkMouseLeave(Sender: TObject);
begin
  bOk.Color:= TColor($005E4934);
end;

end.


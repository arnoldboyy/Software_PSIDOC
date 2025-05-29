unit uRedApoyo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, DB, mysql80conn, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, uVarios, uMensaje;

type

  { TfrmRedApoyo }

  TfrmRedApoyo = class(TForm)
    bAgregar: TPanel;
    bSalirRedApoyo: TPanel;
    Connection: TMySQL80Connection;
    DataSource1: TDataSource;
    eEdad: TEdit;
    eMatricula: TEdit;
    eNombre: TEdit;
    eOcupacion: TEdit;
    eTelefono: TEdit;
    eTipoApoyo: TEdit;
    lblEdad: TLabel;
    lblExplicacion: TLabel;
    lblMatricula: TLabel;
    lblNombre: TLabel;
    lblOcupacion: TLabel;
    lblTelefono: TLabel;
    lblTipoApoyo: TLabel;
    Panel1: TPanel;
    Query: TSQLQuery;
    Transacion: TSQLTransaction;
    procedure bAgregarClick(Sender: TObject);
    procedure bAgregarMouseEnter(Sender: TObject);
    procedure bAgregarMouseLeave(Sender: TObject);
    procedure bSalirRedApoyoClick(Sender: TObject);
    procedure bSalirRedApoyoMouseEnter(Sender: TObject);
    procedure bSalirRedApoyoMouseLeave(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure LimpiarCampos;

  public
    procedure SetMatricula(const AMatricula : string);
  end;

var
  frmRedApoyo: TfrmRedApoyo;

implementation

{$R *.lfm}

{ TfrmRedApoyo }

procedure TfrmRedApoyo.SetMatricula(const AMatricula: String);
begin
  eMatricula.Text:= AMatricula
end;

procedure TfrmRedApoyo.bAgregarMouseEnter(Sender: TObject);
begin
  bAgregar.Color := TColor($00826C49);
end;

procedure TfrmRedApoyo.bAgregarClick(Sender: TObject);
var
  guardadoRed: Boolean;
begin
  // Validar campos numéricos y campos vacíos
    if not CamposVacios([eNombre, eEdad, eTelefono, eTipoApoyo, eOcupacion ]) then
    begin
      // Insertar datos en la tabla Red de Apoyo
      guardadoRed := uVarios.insertarRedApoyo(Connection,StrToInt(eMatricula.Text),StrToInt(eEdad.Text),
      eNombre.Text, eTelefono.Text, eTipoApoyo.Text,
      eOcupacion.Text);

      LimpiarCampos;
    end
    else
    begin
      MostrarError('Error: Hay campos vacios.');
    end;

end;

procedure TfrmRedApoyo.bAgregarMouseLeave(Sender: TObject);
begin
  bAgregar.Color:= TColor($005E4934);
end;

procedure TfrmRedApoyo.bSalirRedApoyoClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRedApoyo.bSalirRedApoyoMouseEnter(Sender: TObject);
begin
  bSalirRedApoyo.Color := TColor($00826C49);
end;

procedure TfrmRedApoyo.bSalirRedApoyoMouseLeave(Sender: TObject);
begin
  bSalirRedApoyo.Color := TColor($005E4934);
end;

procedure TfrmRedApoyo.FormCreate(Sender: TObject);
begin
   uVarios.conectarBD(Connection, Transacion);
end;

procedure TfrmRedApoyo.LimpiarCampos;
begin
  eNombre.Clear;
  eTelefono.Clear;
  eEdad.Clear;
  eTipoApoyo.Clear;
  eOcupacion.Clear;
end;

end.


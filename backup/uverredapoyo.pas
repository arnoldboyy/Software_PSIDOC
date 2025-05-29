unit uVerRedApoyo;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, DB, mysql80conn, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, uVarios, uMensaje;

type
  TRedApoyoData = array[0..4] of String;

  { TfrmVerRedApoyo }

  TfrmVerRedApoyo = class(TForm)
    bAnteriorRedApoyo: TPanel;
    bSiguienteRedApoyo: TPanel;
    bSalirVisualizarRedApoyo: TPanel;
    Connection: TMySQL80Connection;
    DataSource1: TDataSource;
    eEdadRedApoyo: TEdit;
    eMatricula: TEdit;
    eNombreRedApoyo: TEdit;
    eOcupacionRedApoyo: TEdit;
    eTelefonoRedApoyo: TEdit;
    eTipoApoyoRedApoyo: TEdit;
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
    procedure bAnteriorRedApoyoClick(Sender: TObject);
    procedure bAnteriorRedApoyoMouseEnter(Sender: TObject);
    procedure bAnteriorRedApoyoMouseLeave(Sender: TObject);
    procedure bSalirVisualizarRedApoyoClick(Sender: TObject);
    procedure bSalirVisualizarRedApoyoMouseEnter(Sender: TObject);
    procedure bSalirVisualizarRedApoyoMouseLeave(Sender: TObject);
    procedure bSiguienteRedApoyoClick(Sender: TObject);
    procedure bSiguienteRedApoyoMouseEnter(Sender: TObject);
    procedure bSiguienteRedApoyoMouseLeave(Sender: TObject);
    procedure bSiguienteRedApoyoMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);


  private
    procedure LlenarRedApoyo(matriculaPaciente: Integer);
    procedure MostrarRedApoyo(Index: Integer);
  public

  end;

var
  frmVerRedApoyo: TfrmVerRedApoyo;
  RedApoyo: array of TRedApoyoData;
  CurrentRedApoyoIndex: Integer;

implementation

{$R *.lfm}

{ TfrmVerRedApoyo }

procedure TfrmVerRedApoyo.bSalirVisualizarRedApoyoClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVerRedApoyo.bAnteriorRedApoyoClick(Sender: TObject);
begin
  if CurrentRedApoyoIndex > 0 then
    begin
      Dec(CurrentRedApoyoIndex);
      MostrarRedApoyo(CurrentRedApoyoIndex);
    end
  else
    begin
      uVarios.MostrarError('Estás en el primer registro de red de apoyo.');
    end;
end;

procedure TfrmVerRedApoyo.bAnteriorRedApoyoMouseEnter(Sender: TObject);
begin
  bAnteriorRedApoyo.Color := TColor($00826C49);
end;

procedure TfrmVerRedApoyo.bAnteriorRedApoyoMouseLeave(Sender: TObject);
begin
  bAnteriorRedApoyo.Color := TColor($005E4934);
end;

procedure TfrmVerRedApoyo.bSalirVisualizarRedApoyoMouseEnter(Sender: TObject);
begin
  bSalirVisualizarRedApoyo.Color := TColor($00826C49);
end;

procedure TfrmVerRedApoyo.bSalirVisualizarRedApoyoMouseLeave(Sender: TObject);
begin
  bSalirVisualizarRedApoyo.Color := TColor($005E4934);
end;

procedure TfrmVerRedApoyo.bSiguienteRedApoyoClick(Sender: TObject);
begin
  if CurrentRedApoyoIndex < Length(RedApoyo) - 1 then
    begin
      Inc(CurrentRedApoyoIndex);
      MostrarRedApoyo(CurrentRedApoyoIndex);
    end
  else
    begin
      uVarios.MostrarError('Estás en el último registro de red de apoyo.');
    end;
end;

procedure TfrmVerRedApoyo.bSiguienteRedApoyoMouseEnter(Sender: TObject);
begin
  bSiguienteRedApoyo.Color := TColor($00826C49);
end;

procedure TfrmVerRedApoyo.bSiguienteRedApoyoMouseLeave(Sender: TObject);
begin
  bSiguienteRedApoyo.Color := TColor($005E4934);
end;

procedure TfrmVerRedApoyo.bSiguienteRedApoyoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TfrmVerRedApoyo.FormCreate(Sender: TObject);
begin
  uVarios.conectarBD(Connection, Transacion);
end;

procedure TfrmVerRedApoyo.FormShow(Sender: TObject);
begin
  LlenarRedApoyo(StrToInt(eMatricula.Text));
  if Length(RedApoyo) = 0 then
    Close;
end;

procedure TfrmVerRedApoyo.LlenarRedApoyo(matriculaPaciente: Integer);
var
  I: Integer;
begin
  Query.DataBase := Connection;
  Query.Close;
  Query.SQL.Text := 'SELECT nombre, telefono, edad, ocupacion, tipoApoyo FROM redApoyo WHERE matriculaPaciente = :matriculaPaciente';
  Query.Params.ParamByName('matriculaPaciente').AsInteger := StrToInt(eMatricula.Text);
  Query.Open;

  SetLength(RedApoyo, Query.RecordCount);
  I := 0;

  while not Query.EOF do
    begin
      RedApoyo[I][0] := Query.FieldByName('nombre').AsString;
      RedApoyo[I][1] := Query.FieldByName('telefono').AsString;
      RedApoyo[I][2] := Query.FieldByName('edad').AsString;
      RedApoyo[I][3] := Query.FieldByName('ocupacion').AsString;
      RedApoyo[I][4] := Query.FieldByName('tipoApoyo').AsString;
      Query.Next;
      Inc(I);
    end;

  Query.Close;

  if Length(RedApoyo) > 0 then
    begin
      CurrentRedApoyoIndex := 0;
      MostrarRedApoyo(CurrentRedApoyoIndex);
    end
  else
    begin
      uVarios.MostrarError('No se encontraron datos de red de apoyo para esta matrícula.');
    end;
end;

procedure TfrmVerRedApoyo.MostrarRedApoyo(Index: Integer);
begin
  if (Index >= 0) and (Index < Length(RedApoyo)) then
    begin
      eNombreRedApoyo.Text := RedApoyo[Index][0];
      eTelefonoRedApoyo.Text := RedApoyo[Index][1];
      eEdadRedApoyo.Text := RedApoyo[Index][2];
      eOcupacionRedApoyo.Text := RedApoyo[Index][3];
      eTipoApoyoRedApoyo.Text := RedApoyo[Index][4];
    end;
end;


end.


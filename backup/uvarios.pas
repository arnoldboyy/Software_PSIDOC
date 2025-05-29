unit uVarios;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, DB, mysql80conn, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, ComCtrls, DBCtrls, uMensaje, StdCtrls;

function conectarBD(var Connection: TMySQL80Connection; var Transacion: TSQLTransaction): Boolean;
function insertarPaciente(Connection: TMySQL80Connection;
  nombre, licenciatura, grupo: string; matricula, edad: Integer;
  fechaNac, telefono, correo, lugarOrigen, estadoCivil, sexo: string): Boolean;
function insertarEnfermedadesFisicas(Connection: TMySQL80Connection; matricula: Integer; enfermedad: string): Boolean;
function insertarPerfil(Connection: TMySQL80Connection; matricula: Integer;
  antecedentesAdicciones, enojadoCuando, felizCuando, tristeCuando,
  miedoCuando, desagradoCuando, observacionCuestionario: string): Boolean;
function insertarRedApoyo(Connection: TMySQL80Connection; matricula, edad: Integer;
  nombre, telefono, tipoApoyo, ocupacion: string): Boolean;
function ValidarCamposNumericos(EditList: array of TEdit): Boolean;
function BuscarPorMatricula(const matricula: string; Connection: TMySQL80Connection): TDataSet;
function MatriculaExistente(Connection: TMySQL80Connection;
                             matricula: Integer): Boolean;
function insertarSesion(Connection: TMySQL80Connection;
  motivo, observacion: string; matricula: Integer): Boolean;
function CamposVacios(const campos: array of TEdit; const memo: TMemo = nil): Boolean;
procedure MostrarError(const mensaje: string);

implementation

function conectarBD(var Connection: TMySQL80Connection; var Transacion: TSQLTransaction): Boolean;
begin
  try
    Connection.HostName := '127.0.0.1';
    Connection.Password := 'CETI';
    Connection.Port := 3306;
    Connection.DatabaseName := 'PSIDOC';
    Connection.UserName := 'root';
    Connection.Connected := True;
    Connection.KeepConnection := True;

    Transacion.DataBase := Connection;
    Transacion.Action := caCommit;
    Transacion.Active := True;

    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

function insertarPaciente(Connection: TMySQL80Connection;
  nombre, licenciatura, grupo: string; matricula, edad: Integer;
  fechaNac, telefono, correo, lugarOrigen, estadoCivil, sexo: string): Boolean;
var
  Query: TSQLQuery;
begin
  Result:= False;
  Query:= TSQLQuery.Create(nil);
  try
    Query.DataBase:= Connection;

    if MatriculaExistente(Connection, matricula) then
    begin
      frmMensaje.lblTexto.Caption := 'La matrícula ya existe';
      frmMensaje.ShowModal;
      Result:= False;
      Exit;
    end
    else
    begin
      Query.DataBase := Connection;
      Query.SQL.Text := 'INSERT INTO paciente (nombre, licenciatura, grupo, matricula, edad, fechaNac, telefono, correo, lugarOrigen, estadoCivil, sexo) ' +
                        'VALUES (:nombre, :licenciatura, :grupo, :matricula, :edad, :fechaNac, :telefono, :correo, :lugarOrigen, :estadoCivil, :sexo)';
      Query.Params.ParamByName('nombre').AsString := nombre;
      Query.Params.ParamByName('licenciatura').AsString := licenciatura;
      Query.Params.ParamByName('grupo').AsString := grupo;
      Query.Params.ParamByName('matricula').AsInteger := matricula;
      Query.Params.ParamByName('edad').AsInteger := edad;
      Query.Params.ParamByName('fechaNac').AsString := fechaNac;
      Query.Params.ParamByName('telefono').AsString := telefono;
      Query.Params.ParamByName('correo').AsString := correo;
      Query.Params.ParamByName('lugarOrigen').AsString := lugarOrigen;
      Query.Params.ParamByName('estadoCivil').AsString := estadoCivil;
      Query.Params.ParamByName('sexo').AsString := sexo;
      Query.ExecSQL;
      Connection.Transaction.Commit;
      Result := True;
    end;
  finally
    Query.Free;
  end;
end;

function insertarEnfermedadesFisicas(Connection: TMySQL80Connection; matricula: Integer; enfermedad: string): Boolean;
var
  Query: TSQLQuery;
begin
  try
    Query := TSQLQuery.Create(nil);
    try
      Query.DataBase := Connection;
      Query.SQL.Text := 'INSERT INTO enfermedadesFisicas (matriculaPaciente, enfermedad) ' +
                        'VALUES (:matriculaPaciente, :enfermedad)';
      Query.Params.ParamByName('matriculaPaciente').AsInteger := matricula;
      Query.Params.ParamByName('enfermedad').AsString := enfermedad;
      Query.ExecSQL;
      Connection.Transaction.Commit;
      Result := True;
    finally
      Query.Free;
    end;
  except
    on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

function insertarPerfil(Connection: TMySQL80Connection; matricula: Integer;
  antecedentesAdicciones, enojadoCuando, felizCuando, tristeCuando,
  miedoCuando, desagradoCuando, observacionCuestionario: string): Boolean;
var
  Query: TSQLQuery;
begin
  try
    Query := TSQLQuery.Create(nil);
    try
      Query.DataBase := Connection;
      Query.SQL.Text := 'INSERT INTO perfil (matriculaAlumno, antecedentesAdicciones, enojadoCuando, felizCuando, ' +
                        'tristeCuando, miedoCuando, desagradoCuando, observacionCuestionario) ' +
                        'VALUES (:matriculaAlumno, :antecedentesAdicciones, :enojadoCuando, :felizCuando, :tristeCuando, ' +
                        ':miedoCuando, :desagradoCuando, :observacionCuestionario)';
      Query.Params.ParamByName('matriculaAlumno').AsInteger := matricula;
      Query.Params.ParamByName('antecedentesAdicciones').AsString := antecedentesAdicciones;
      Query.Params.ParamByName('enojadoCuando').AsString := enojadoCuando;
      Query.Params.ParamByName('felizCuando').AsString := felizCuando;
      Query.Params.ParamByName('tristeCuando').AsString := tristeCuando;
      Query.Params.ParamByName('miedoCuando').AsString := miedoCuando;
      Query.Params.ParamByName('desagradoCuando').AsString := desagradoCuando;
      Query.Params.ParamByName('observacionCuestionario').AsString := observacionCuestionario;
      Query.ExecSQL;
      Connection.Transaction.Commit;
      Result := True;
    finally
      Query.Free;
    end;
  except
    on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

function insertarRedApoyo(Connection: TMySQL80Connection; matricula, edad: Integer;
  nombre, telefono, tipoApoyo, ocupacion: string): Boolean;
var
  Query: TSQLQuery;
begin
  try
    Query := TSQLQuery.Create(nil);
    try
      Query.DataBase := Connection;
      Query.SQL.Text := 'INSERT INTO redApoyo (nombre, telefono, matriculaPaciente, edad, ' +
                        'ocupacion, tipoApoyo) VALUES (:nombre, :telefono, :matriculaPaciente, :edad, :ocupacion, ' +
                        ':tipoApoyo)';
      Query.Params.ParamByName('nombre').AsString := nombre;
      Query.Params.ParamByName('telefono').AsString := telefono;
      Query.Params.ParamByName('matriculaPaciente').AsInteger := matricula;
      Query.Params.ParamByName('edad').AsInteger := edad;
      Query.Params.ParamByName('ocupacion').AsString := ocupacion;
      Query.Params.ParamByName('tipoApoyo').AsString := tipoApoyo;
      Query.ExecSQL;
      Connection.Transaction.Commit;
      Result := True;
    finally
      Query.Free;
    end;
  except
    on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

function ValidarCamposNumericos(EditList: array of TEdit): Boolean;
var
  i, j: Integer;
  Edit: TEdit;
  charValid: Boolean;
begin
  Result := True;
  for i:= 0 to High(EditList) do
  begin
    Edit := EditList[i];
    for j:= 1 to Length(Edit.Text) do
    begin
      charValid:= Edit.Text[j] in ['0'..'9'];
      if not charValid then
      begin
        Result:= False;
        Exit;
      end;
    end;
  end;
end;

function CamposVacios(const campos: array of TEdit; const memo: TMemo = nil): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(campos) do
  begin
    if campos[i].Text = '' then
    begin
      Result := True;
      Exit;
    end;
  end;

  if Assigned(memo) and (memo.Lines.Text = '') then
    Result := True;
end;

function BuscarPorMatricula(const matricula: string; Connection: TMySQL80Connection): TDataSet;
var
  Query: TSQLQuery;
begin
  Result := nil;
  Query := TSQLQuery.Create(nil);
  try
    Query.DataBase := Connection;
    Query.SQL.Text := 'SELECT p.*, pe.*, ef.enfermedad ' +
                      'FROM paciente p ' +
                      'LEFT JOIN perfil pe ON p.matricula = pe.matriculaAlumno ' +
                      'LEFT JOIN enfermedadesFisicas ef ON p.matricula = ef.matriculaPaciente ' +
                      'WHERE p.matricula = :matricula';
    Query.Params.ParamByName('matricula').AsString := matricula;
    Query.Open;

    if not Query.IsEmpty then
      begin
        Result := Query;
      end
    else
      begin
        Query.Free; // Libera el objeto Query si no se encontró ningún registro
      end;
  except
    on E: Exception do
    begin
      Query.Free;
      raise;
    end;
  end;
end;

function insertarSesion(Connection: TMySQL80Connection;
  motivo, observacion: string; matricula: Integer): Boolean;
var
  Query: TSQLQuery;
  fecha : string;
begin
  Result:= False;
  Query:= TSQLQuery.Create(nil);

  try
    Query.DataBase:= Connection;

    if MatriculaExistente(Connection, matricula) then
    begin
      fecha := FormatDateTime('yyyy-mm-dd', now);
      Query.DataBase := Connection;
      Query.SQL.Text := 'INSERT INTO sesiones (matricula, fecha, motivo, observacionSesion) ' +
                        'VALUES (:matricula, :fecha, :motivo, :observacion)';
      Query.Params.ParamByName('matricula').AsInteger := matricula;
      Query.Params.ParamByName('fecha').AsString := fecha;
      Query.Params.ParamByName('motivo').AsString := motivo;
      Query.Params.ParamByName('observacion').AsString := observacion;
      Query.ExecSQL;
      Connection.Transaction.Commit;
      Result := True;
    end
  else
    begin
      frmMensaje.lblTexto.Caption := 'La matrícula no existe';
      frmMensaje.ShowModal;
    end;
  finally
    Query.Free;
  end;
end;

function MatriculaExistente(Connection: TMySQL80Connection;
                             matricula: Integer): Boolean;
var
  Query: TSQLQuery;
  existe : Boolean;
begin
  Query:= TSQLQuery.Create(nil);

  try
    Query.DataBase:= Connection;

    Query.SQL.Text:= 'SELECT COUNT(*) As count FROM paciente Where matricula = :matricula';
    Query.Params.ParamByName('matricula').AsInteger:= matricula;
    Query.Open;
    Result := (Query.Fields[0].AsInteger > 0);
  finally
    Query.Free;
  end;
end;

procedure MostrarError(const mensaje: string);
begin
  frmMensaje.lblTexto.Caption := mensaje;
  frmMensaje.ShowModal;
end;


end.

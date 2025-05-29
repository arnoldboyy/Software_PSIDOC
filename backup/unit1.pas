unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, DB, mysql80conn, Forms, Controls, Graphics, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Grids, DBCtrls, DBGrids, ActnList, ButtonPanel,
  ComboEx, Menus, DateTimePicker, uVarios, uRedApoyo, Types, uMensaje,
  DateUtils, uAcercade, uVerRedApoyo;

type
  TSesionData = array[0..2] of String; // Aquí se agrega la declaración de TSesionData


  { TfrmPsiDoc }

  TfrmPsiDoc = class(TForm)
    bAgregarRegistro: TPanel;
    bEditarView: TPanel;
    bVisualizarRedApoyo: TPanel;
    bVisitasPorLic: TPanel;
    bPrimeraVisita: TPanel;
    bBuscarSesionFechaView: TPanel;
    bVisitasPorSexo: TPanel;
    bVisitaSubsecuente: TPanel;
    bSesionesView: TPanel;
    bSesionAnterior: TPanel;
    bBuscarSesionView: TPanel;
    bBuscarView: TPanel;
    bAgregarSesion: TPanel;
    bBuscarSesion: TPanel;
    bRedApoyoView: TPanel;
    bRegistro: TPanel;
    bReporte: TPanel;
    bSalir: TPanel;
    bSesionSiguiente: TPanel;
    bSesiones: TPanel;
    bVisualizacion: TPanel;
    cbLicenciatura: TComboBox;
    cbLicenciaturaView: TComboBox;
    cbSexo: TComboBox;
    cbSexoView: TComboBox;
    Connection: TMySQL80Connection;
    DataSource1: TDataSource;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    DateTimePickerView: TDateTimePicker;
    DBConsultas: TDBGrid;
    eBuscarView: TEdit;
    eMatriculaSesionView: TEdit;
    eMotivoSesion: TEdit;
    eMotivoSesionView: TEdit;
    eFechaSesionView: TEdit;
    eNombreView: TEdit;
    eGrupoView: TEdit;
    eEdadView: TEdit;
    eTelefonoView: TEdit;
    eCorreoView: TEdit;
    eLugarOrigenView: TEdit;
    eEstadoCivilView: TEdit;
    eEnfermedadFisicaView: TEdit;
    eAntClinicosView: TEdit;
    eCosaEnojaView: TEdit;
    eCosaFelizView: TEdit;
    eCosaTristeView: TEdit;
    eCosaMiedoView: TEdit;
    eCosaDesagradoView: TEdit;
    eMatriculaSesion: TEdit;
    eNombre: TEdit;
    eEstadoCivil: TEdit;
    eEnfermedadFisica: TEdit;
    eAntClinicos: TEdit;
    eCosaEnoja: TEdit;
    eCosaFeliz: TEdit;
    eCosaTriste: TEdit;
    eCosaMiedo: TEdit;
    eCosaDesagrado: TEdit;
    eGrupo: TEdit;
    eMatriculaRegistro: TEdit;
    eEdad: TEdit;
    eTelefono: TEdit;
    eCorreo: TEdit;
    eLugarOrigen: TEdit;
    Image1: TImage;
    imgAcercaDe: TImage;
    Label1: TLabel;
    lblBuscarAlumnoSsesionView: TLabel;
    lblHasta: TLabel;
    lblAcercaDe: TLabel;
    lblAnotacionesSexionView: TLabel;
    lblMotivoView: TLabel;
    lblAnotaciones: TLabel;
    lblAntecedentes: TLabel;
    lblAntecedentes1: TLabel;
    lblCorreo: TLabel;
    lblCorreo1: TLabel;
    lblCosasDesagrado: TLabel;
    lblCosasDesagrado1: TLabel;
    lblCosasEnojar: TLabel;
    lblCosasEnojar1: TLabel;
    lblCosasFeliz: TLabel;
    lblCosasFeliz1: TLabel;
    lblCosasMiedo: TLabel;
    lblCosasMiedo1: TLabel;
    lblCosasTriste: TLabel;
    lblCosasTriste1: TLabel;
    lblEdad: TLabel;
    lblEdad1: TLabel;
    lblEnfermedadesFisicas: TLabel;
    lblEnfermedadesFisicas1: TLabel;
    lblEstadoCivil: TLabel;
    lblEstadoCivilView: TLabel;
    lblFechanac: TLabel;
    lblFechanac1: TLabel;
    lblGrupo: TLabel;
    lblGrupo1: TLabel;
    lblLicenciatura: TLabel;
    lblLicenciatura1: TLabel;
    lblMatricula: TLabel;
    lblMatricula1: TLabel;
    lblMotivoSesionView: TLabel;
    lblFechaSesionView: TLabel;
    lblNombre1: TLabel;
    lblNombre2: TLabel;
    lblObservacionCuestionario: TLabel;
    lblObservacionCuestionario1: TLabel;
    lblOrigen: TLabel;
    lblOrigen1: TLabel;
    lblPsidoc: TLabel;
    lblSexo: TLabel;
    lblSexoView: TLabel;
    lblTelefono: TLabel;
    lblTelefono1: TLabel;
    lblTitulo1: TLabel;
    lblTitulo2: TLabel;
    lblTitulo3: TLabel;
    lblTitulo4: TLabel;
    lblTitulo5: TLabel;
    memAnotacionesSesionView: TMemo;
    memObservacionesView: TMemo;
    memAnotacionesSesion: TMemo;
    memObservaciones: TMemo;
    ControladorVentanas: TPageControl;
    pnlBotones: TPanel;
    Query: TSQLQuery;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Transacion: TSQLTransaction;
    procedure bAgregarRegistroClick(Sender: TObject);
    procedure bAgregarRegistroMouseEnter(Sender: TObject);
    procedure bAgregarRegistroMouseLeave(Sender: TObject);
    procedure bAgregarSesionClick(Sender: TObject);
    procedure bAgregarSesionMouseEnter(Sender: TObject);
    procedure bAgregarSesionMouseLeave(Sender: TObject);
    procedure bBuscarSesionClick(Sender: TObject);
    procedure bBuscarSesionFechaViewClick(Sender: TObject);
    procedure bBuscarSesionFechaViewMouseEnter(Sender: TObject);
    procedure bBuscarSesionFechaViewMouseLeave(Sender: TObject);
    procedure bBuscarSesionMouseEnter(Sender: TObject);
    procedure bBuscarSesionMouseLeave(Sender: TObject);
    procedure bBuscarSesionViewClick(Sender: TObject);
    procedure bBuscarSesionViewMouseEnter(Sender: TObject);
    procedure bBuscarSesionViewMouseLeave(Sender: TObject);
    procedure bBuscarViewClick(Sender: TObject);
    procedure bBuscarViewMouseEnter(Sender: TObject);
    procedure bBuscarViewMouseLeave(Sender: TObject);
    procedure bEditarViewClick(Sender: TObject);
    procedure bEditarViewMouseEnter(Sender: TObject);
    procedure bEditarViewMouseLeave(Sender: TObject);
    procedure bPrimeraVisitaClick(Sender: TObject);
    procedure bPrimeraVisitaMouseEnter(Sender: TObject);
    procedure bPrimeraVisitaMouseLeave(Sender: TObject);
    procedure bRedApoyoClick(Sender: TObject);
    procedure bRedApoyoViewClick(Sender: TObject);
    procedure bRegistroClick(Sender: TObject);
    procedure bRegistroMouseEnter(Sender: TObject);
    procedure bRegistroMouseLeave(Sender: TObject);
    procedure bReporteClick(Sender: TObject);
    procedure bReporteMouseEnter(Sender: TObject);
    procedure bReporteMouseLeave(Sender: TObject);
    procedure bSalirClick(Sender: TObject);
    procedure bSalirMouseEnter(Sender: TObject);
    procedure bSalirMouseLeave(Sender: TObject);
    procedure bSesionAnteriorClick(Sender: TObject);
    procedure bSesionAnteriorMouseEnter(Sender: TObject);
    procedure bSesionAnteriorMouseLeave(Sender: TObject);
    procedure bSesionesClick(Sender: TObject);
    procedure bSesionesMouseEnter(Sender: TObject);
    procedure bSesionesMouseLeave(Sender: TObject);
    procedure bSesionesViewClick(Sender: TObject);
    procedure bSesionesViewMouseEnter(Sender: TObject);
    procedure bSesionesViewMouseLeave(Sender: TObject);
    procedure bSesionSiguienteClick(Sender: TObject);
    procedure bSesionSiguienteMouseEnter(Sender: TObject);
    procedure bSesionSiguienteMouseLeave(Sender: TObject);
    procedure bTabSheet11Click(Sender: TObject);
    procedure bTabSheet12Click(Sender: TObject);
    procedure bTabSheet13Click(Sender: TObject);
    procedure bTabSheet21Click(Sender: TObject);
    procedure bTabSheet22Click(Sender: TObject);
    procedure bTabSheet23Click(Sender: TObject);
    procedure bTabSheet31Click(Sender: TObject);
    procedure bTabSheet32Click(Sender: TObject);
    procedure bTabSheet33Click(Sender: TObject);
    procedure bVisitasPorLicClick(Sender: TObject);
    procedure bVisitasPorLicMouseEnter(Sender: TObject);
    procedure bVisitasPorLicMouseLeave(Sender: TObject);
    procedure bVisitasPorSexoClick(Sender: TObject);
    procedure bVisitasPorSexoMouseEnter(Sender: TObject);
    procedure bVisitasPorSexoMouseLeave(Sender: TObject);
    procedure bVisitaSubsecuenteClick(Sender: TObject);
    procedure bVisitaSubsecuenteMouseEnter(Sender: TObject);
    procedure bVisitaSubsecuenteMouseLeave(Sender: TObject);
    procedure bVisualizacionClick(Sender: TObject);
    procedure bVisualizacionMouseEnter(Sender: TObject);
    procedure bVisualizacionMouseLeave(Sender: TObject);
    procedure bVisualizarRedApoyoClick(Sender: TObject);
    procedure bVisualizarRedApoyoMouseEnter(Sender: TObject);
    procedure bVisualizarRedApoyoMouseLeave(Sender: TObject);
    procedure eBuscarViewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure imgAcercaDeClick(Sender: TObject);
    procedure BuscarSesionPorFecha(matricula: Integer; fecha: String);
    procedure LlenarCampos(matricula: Integer);


  private
    procedure LimpiarCampos;
    procedure LimpiarCamposView;
    procedure LlenarSesion;
    procedure OcultarSesion;
    procedure MostrarSesion;
    procedure LlamarPacientesConUnaSesion;
    procedure LlamarPacientesPorSexo;
    procedure LlamarPacientesPorLic;
    procedure LlamarPacientesSubsecuentes;
    procedure ConfigureFields;

  public

  end;

var
  frmPsiDoc: TfrmPsiDoc;
  Sesiones: array of TSesionData;
  CurrentSesionIndex: Integer;

implementation

{$R *.lfm}

{ TfrmPsiDoc }

procedure TfrmPsiDoc.bTabSheet11Click(Sender: TObject);
begin
  ControladorVentanas.ActivePage := TabSheet1;
end;

procedure TfrmPsiDoc.bRegistroClick(Sender: TObject);
begin
   ControladorVentanas.ActivePage := TabSheet1;
end;



procedure TfrmPsiDoc.bAgregarRegistroClick(Sender: TObject);
var
  guardadoPaciente, guardadoEnfermedades, guardadoPerfil: Boolean;
  fechaNac: String;
begin
    if MatriculaExistente(Connection, StrToInt(eMatriculaRegistro.Text)) then
    begin
      uVarios.MostrarError('La matrícula ya existe');
      Exit;
    end;
    // Validar campos numéricos y campos vacíos
    if CamposVacios([eNombre, eMatriculaRegistro, eEdad, eTelefono, eCorreo, eLugarOrigen, eEstadoCivil,
                   eAntClinicos, eCosaEnoja, eCosaFeliz, eCosaTriste,
                   eCosaMiedo, eCosaDesagrado], memObservaciones) then
    begin
      uVarios.MostrarError('Error: Hay campos vaciós.');
      Exit;
    end;

   // Validación de campos numéricos
   if not uVarios.ValidarCamposNumericos([eMatriculaRegistro, eEdad, eTelefono]) then
   begin
      uVarios.MostrarError('Error: Se han ingresado caracteres no válidos en campos numéricos.');
      Exit;
   end;

    fechaNac := FormatDateTime('yyyy-mm-dd', DateTimePicker1.Date);

    // Insertar datos en la tabla paciente
    guardadoPaciente := uVarios.insertarPaciente(Connection,
                        eNombre.Text, cbLicenciatura.Text, eGrupo.Text, StrToInt(eMatriculaRegistro.Text),
                        StrToInt(eEdad.Text), fechaNac, eTelefono.Text, eCorreo.Text, eLugarOrigen.Text, eEstadoCivil.Text, cbSexo.Text);

    // Verificar si se guardó correctamente el paciente
    if guardadoPaciente then
    begin
      // Insertar datos en la tabla enfermedadesFisicas
      guardadoEnfermedades := uVarios.insertarEnfermedadesFisicas(Connection, StrToInt(eMatriculaRegistro.Text), eEnfermedadFisica.Text);

      // Insertar datos en la tabla perfil
      guardadoPerfil := uVarios.insertarPerfil(Connection, StrToInt(eMatriculaRegistro.Text),
                        eAntClinicos.Text, eCosaEnoja.Text, eCosaFeliz.Text, eCosaTriste.Text,
                        eCosaMiedo.Text, eCosaDesagrado.Text, memObservaciones.Text);

      // Verificar si se guardaron correctamente las enfermedades y el perfil
      if not guardadoEnfermedades and guardadoPerfil then
      begin
        uVarios.MostrarError('Error: No se guardaron los datos');
        Exit;
      end
      else
      begin
         LimpiarCampos;
      end;
    end;
end;

procedure TfrmPsiDoc.bAgregarSesionClick(Sender: TObject);
begin
  if CamposVacios([eMotivoSesion], memAnotacionesSesion) then
  begin
    uVarios.MostrarError('Error: Hay campos vaciós.');
    Exit;
  end
  else
    begin
      uVarios.insertarSesion(Connection, eMotivoSesion.Text,
                             memAnotacionesSesion.Text,
                             StrToInt(eMatriculaSesion.Text));
      LimpiarCampos;
    end;
end;

procedure TfrmPsiDoc.bAgregarSesionMouseEnter(Sender: TObject);
begin
  bAgregarSesion.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bAgregarSesionMouseLeave(Sender: TObject);
begin
  bAgregarSesion.Color := TColor($005E4934);
end;

procedure TfrmPsiDoc.bAgregarRegistroMouseEnter(Sender: TObject);
begin
   bAgregarRegistro.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bAgregarRegistroMouseLeave(Sender: TObject);
begin
  bAgregarRegistro.Color:= TColor($005E4934);
end;

procedure TfrmPsiDoc.bBuscarSesionClick(Sender: TObject);
begin
  if uVarios.CamposVacios([eMatriculaSesion]) then
    begin
      uVarios.MostrarError('Error: El campo esta vacío, ingrese una matrícula');
    end
  else
    if not uVarios.ValidarCamposNumericos([eMatriculaSesion]) then
      begin
        uVarios.MostrarError('Error: El campo debe contener solo números');
      end
    else
      if MatriculaExistente(Connection, StrToInt(eMatriculaSesion.Text)) then
        MostrarSesion
      else
        uVarios.MostrarError('Error: Matricula no encontrada');
end;

procedure TfrmPsiDoc.bBuscarSesionFechaViewClick(Sender: TObject);
begin
  BuscarSesionPorFecha(StrToInt(eMatriculaSesionView.Text), FormatDateTime('yyyy-mm-dd', DateTimePicker2.Date));
end;

procedure TfrmPsiDoc.bBuscarSesionFechaViewMouseEnter(Sender: TObject);
begin
  bBuscarSesionFechaView.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bBuscarSesionFechaViewMouseLeave(Sender: TObject);
begin
  bBuscarSesionFechaView.Color := TColor($005E4934);
end;

procedure TfrmPsiDoc.bBuscarSesionMouseEnter(Sender: TObject);
begin
  bBuscarSesion.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bBuscarSesionMouseLeave(Sender: TObject);
begin
  bBuscarSesion.Color := TColor($005E4934);
end;

procedure TfrmPsiDoc.bBuscarSesionViewClick(Sender: TObject);
begin
  LlenarSesion;
  bSesionAnterior.Enabled := True;
  bSesionSiguiente.Enabled := True;
end;

procedure TfrmPsiDoc.bBuscarSesionViewMouseEnter(Sender: TObject);
begin
  bBuscarSesionView.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bBuscarSesionViewMouseLeave(Sender: TObject);
begin
  bBuscarSesionView.Color := TColor($005E4934);
end;

procedure TfrmPsiDoc.bBuscarViewClick(Sender: TObject);
var
  matricula: Integer;
begin
  // Validar la matrícula ingresada
  if not TryStrToInt(eBuscarView.Text, matricula) then
  begin
    uVarios.MostrarError('Error: La matrícula ingresada no es válida.');
    Exit;
  end;

  LlenarCampos(matricula);
end;

procedure TfrmPsiDoc.LlenarCampos(matricula: Integer);
var
  DataSet: TDataSet;
  fechaNacStr: String;
  fechaNac: TDateTime;
begin
  DataSet := BuscarPorMatricula(IntToStr(matricula), Connection);
  if Assigned(DataSet) then
  begin
    try
      // Abre el conjunto de datos
      DataSet.Open;

      if not DataSet.IsEmpty then
      begin
        eNombreView.Text := DataSet.FieldByName('nombre').AsString;
        cbLicenciaturaView.Text := DataSet.FieldByName('licenciatura').AsString;
        eGrupoView.Text := DataSet.FieldByName('grupo').AsString;
        eEdadView.Text := DataSet.FieldByName('edad').AsString;
        fechaNacStr:= DataSet.FieldByName('fechaNac').AsString;
        fechaNac:= StrToDate(fechaNacStr);
        DateTimePickerView.Date:= fechaNac;
        eTelefonoView.Text := DataSet.FieldByName('telefono').AsString;
        eCorreoView.Text := DataSet.FieldByName('correo').AsString;
        eLugarOrigenView.Text := DataSet.FieldByName('lugarorigen').AsString;
        eEstadoCivilView.Text := DataSet.FieldByName('estadoCivil').AsString;
        cbSexoView.Text := DataSet.FieldByName('sexo').AsString;
        eEnfermedadFisicaView.Text := DataSet.FieldByName('enfermedad').AsString;
        eAntClinicosView.Text := DataSet.FieldByName('antecedentesAdicciones').AsString;
        eCosaEnojaView.Text := DataSet.FieldByName('enojadoCuando').AsString;
        eCosaFelizView.Text := DataSet.FieldByName('felizCuando').AsString;
        eCosaTristeView.Text := DataSet.FieldByName('tristeCuando').AsString;
        eCosaMiedoView.Text := DataSet.FieldByName('miedoCuando').AsString;
        eCosaDesagradoView.Text := DataSet.FieldByName('desagradoCuando').AsString;
        memObservacionesView.Text := DataSet.FieldByName('observacionCuestionario').AsString;
        bVisualizarRedApoyo.Enabled := True;
        bSesionesView.Enabled := True;
        bRedApoyoView.Enabled := True;
        // Otros campos...
      end
      else
      begin
        uVarios.MostrarError('Error: No se encontraron resultados para la matrícula ingresada.');
        bVisualizarRedApoyo.Enabled := False;
        bSesionesView.Enabled := False;
        bRedApoyoView.Enabled := False;
      end;
    finally
      DataSet.Close;
    end;
  end
  else
  begin
    uVarios.MostrarError('Error: No se encontraron resultados para la matrícula ingresada.');
    bVisualizarRedApoyo.Enabled := False;
    bSesionesView.Enabled := False;
    bRedApoyoView.Enabled := False;
  end;
end;

procedure TfrmPsiDoc.bBuscarViewMouseEnter(Sender: TObject);
begin
  bBuscarView.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bBuscarViewMouseLeave(Sender: TObject);
begin
  bBuscarView.Color := TColor($005E4934);
end;

procedure TfrmPsiDoc.bEditarViewClick(Sender: TObject);
var
  guardadoPaciente, guardadoEnfermedades, guardadoPerfil: Boolean;
  fechaNac: String;
begin
    // Validar campos numéricos y campos vacíos
    if CamposVacios([eNombreView, eBuscarView, eEdadView, eTelefonoView, eCorreoView, eLugarOrigenView, eEstadoCivilView,
                   eAntClinicosView, eCosaEnojaView, eCosaFelizView, eCosaTristeView,
                   eCosaMiedoView, eCosaDesagradoView], memObservacionesView) then
    begin
      uVarios.MostrarError('Error: Hay campos vaciós.');
      Exit;
    end;

   // Validación de campos numéricos
   if not uVarios.ValidarCamposNumericos([eBuscarView, eEdadView, eTelefonoView]) then
   begin
      uVarios.MostrarError('Error: Se han ingresado caracteres no válidos en campos numéricos.');
      Exit;
   end;

    fechaNac := FormatDateTime('yyyy-mm-dd', DateTimePickerView.Date);

    // Editar datos en la tabla paciente
    guardadoPaciente := uVarios.editarPaciente(Connection,
      eNombreView.Text, cbLicenciaturaView.Text, eGrupoView.Text, StrToInt(eBuscarView.Text),
      StrToInt(eEdadView.Text), fechaNac, eTelefonoView.Text, eCorreoView.Text, eLugarOrigenView.Text, eEstadoCivilView.Text, cbSexoView.Text);

    // Verificar si se editó correctamente el paciente
    if guardadoPaciente then
    begin
      // Editar datos en la tabla enfermedadesFisicas
      guardadoEnfermedades := uVarios.editarEnfermedadesFisicas(Connection, StrToInt(eBuscarView.Text), eEnfermedadFisicaView.Text);

      // Editar datos en la tabla perfil
      guardadoPerfil := uVarios.editarPerfil(Connection, StrToInt(eBuscarView.Text),
        eAntClinicosView.Text, eCosaEnojaView.Text, eCosaFelizView.Text, eCosaTristeView.Text,
        eCosaMiedoView.Text, eCosaDesagradoView.Text, memObservacionesView.Text);

      // Verificar si se guardaron correctamente las enfermedades y el perfil
      if guardadoEnfermedades and guardadoPerfil then
      begin
        LimpiarCampos;
        LlenarCampos(StrToInt(eBuscarView.Text));
      end
    end;
end;

procedure TfrmPsiDoc.bEditarViewMouseEnter(Sender: TObject);
begin
  bEditarView.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bEditarViewMouseLeave(Sender: TObject);
begin
  bEditarView.Color := TColor($005E4934);
end;

procedure TfrmPsiDoc.bPrimeraVisitaClick(Sender: TObject);
begin
  LlamarPacientesConUnaSesion;
end;

procedure TfrmPsiDoc.bPrimeraVisitaMouseEnter(Sender: TObject);
begin
  bPrimeraVisita.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bPrimeraVisitaMouseLeave(Sender: TObject);
begin
  bPrimeraVisita.Color := TColor($005E4934);
end;

procedure TfrmPsiDoc.bRedApoyoClick(Sender: TObject);
begin
  frmRedApoyo.SetMatricula(eMatriculaRegistro.Text);
  frmRedApoyo.ShowModal;
end;

procedure TfrmPsiDoc.bRedApoyoViewClick(Sender: TObject);
begin
  frmRedApoyo.SetMatricula(eBuscarView.Text);
  frmRedApoyo.ShowModal;
end;

procedure TfrmPsiDoc.bRegistroMouseEnter(Sender: TObject);
begin
   bRegistro.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bRegistroMouseLeave(Sender: TObject);
begin
  bRegistro.Color:= TColor($005E4934);
end;

procedure TfrmPsiDoc.bReporteClick(Sender: TObject);
begin
  ControladorVentanas.ActivePage := TabSheet4;
end;

procedure TfrmPsiDoc.bReporteMouseEnter(Sender: TObject);
begin
  bReporte.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bReporteMouseLeave(Sender: TObject);
begin
  bReporte.Color:= TColor($005E4934);
end;

procedure TfrmPsiDoc.bSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPsiDoc.bSalirMouseEnter(Sender: TObject);
begin
  bSalir.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bSalirMouseLeave(Sender: TObject);
begin
   bSalir.Color:= TColor($005E4934);
end;

procedure TfrmPsiDoc.bSesionAnteriorClick(Sender: TObject);
begin
  if CurrentSesionIndex > 0 then
    begin
      bSesionAnterior.Enabled := True;
      bSesionSiguiente.Enabled := True;
      Dec(CurrentSesionIndex);
      eMotivoSesionView.Text := Sesiones[CurrentSesionIndex][0];
      eFechaSesionView.Text := Sesiones[CurrentSesionIndex][1];
      memAnotacionesSesionView.Text := Sesiones[CurrentSesionIndex][2];
    end
  else
    begin
      uVarios.MostrarError('Estas en la primera sesión.');
      bSesionAnterior.Enabled := False;
    end;
end;

procedure TfrmPsiDoc.bSesionAnteriorMouseEnter(Sender: TObject);
begin
  bSesionAnterior.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bSesionAnteriorMouseLeave(Sender: TObject);
begin
  bSesionAnterior.Color := TColor($005E4934);
end;

procedure TfrmPsiDoc.bSesionesClick(Sender: TObject);
begin
  ControladorVentanas.ActivePage := TabSheet3;
end;

procedure TfrmPsiDoc.bSesionesMouseEnter(Sender: TObject);
begin
  bSesiones.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bSesionesMouseLeave(Sender: TObject);
begin
  bSesiones.Color:= TColor($005E4934);
end;

procedure TfrmPsiDoc.bSesionesViewClick(Sender: TObject);
begin
  eMatriculaSesionView.Text := eBuscarView.Text;
  ControladorVentanas.ActivePage := TabSheet6;
end;

procedure TfrmPsiDoc.bSesionesViewMouseEnter(Sender: TObject);
begin
  bSesionesView.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bSesionesViewMouseLeave(Sender: TObject);
begin
  bSesionesView.Color := TColor($005E4934);
end;

procedure TfrmPsiDoc.bSesionSiguienteClick(Sender: TObject);
begin
  if (CurrentSesionIndex < Length(Sesiones) - 1) then
    begin
      bSesionSiguiente.Enabled := True;
      bSesionAnterior.Enabled := True;
      Inc(CurrentSesionIndex);
      eMotivoSesionView.Text := Sesiones[CurrentSesionIndex][0];
      eFechaSesionView.Text := Sesiones[CurrentSesionIndex][1];
      memAnotacionesSesionView.Text := Sesiones[CurrentSesionIndex][2];
    end
  else
    begin
      uVarios.MostrarError('Estas en la última sesión.');
      bSesionSiguiente.Enabled := False;
    end;
end;

procedure TfrmPsiDoc.bSesionSiguienteMouseEnter(Sender: TObject);
begin
  bSesionSiguiente.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bSesionSiguienteMouseLeave(Sender: TObject);
begin
  bSesionSiguiente.Color := TColor($005E4934);
end;

procedure TfrmPsiDoc.bTabSheet12Click(Sender: TObject);
begin
  ControladorVentanas.ActivePage := TabSheet2;
end;

procedure TfrmPsiDoc.bTabSheet13Click(Sender: TObject);
begin
  ControladorVentanas.ActivePage := TabSheet3;
end;

procedure TfrmPsiDoc.bTabSheet21Click(Sender: TObject);
begin
  ControladorVentanas.ActivePage := TabSheet1;
end;

procedure TfrmPsiDoc.bTabSheet22Click(Sender: TObject);
begin
  ControladorVentanas.ActivePage := TabSheet2;
end;

procedure TfrmPsiDoc.bTabSheet23Click(Sender: TObject);
begin
  ControladorVentanas.ActivePage := TabSheet3;
end;

procedure TfrmPsiDoc.bTabSheet31Click(Sender: TObject);
begin
  ControladorVentanas.ActivePage := TabSheet1;
end;

procedure TfrmPsiDoc.bTabSheet32Click(Sender: TObject);
begin
  ControladorVentanas.ActivePage := TabSheet2;
end;

procedure TfrmPsiDoc.bTabSheet33Click(Sender: TObject);
begin
  ControladorVentanas.ActivePage := TabSheet3;
end;

procedure TfrmPsiDoc.bVisitasPorLicClick(Sender: TObject);
begin
  LlamarPacientesPorLic;
end;

procedure TfrmPsiDoc.bVisitasPorLicMouseEnter(Sender: TObject);
begin
  bVisitasPorLic.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bVisitasPorLicMouseLeave(Sender: TObject);
begin
  bVisitasPorLic.Color := TColor($005E4934);
end;

procedure TfrmPsiDoc.bVisitasPorSexoClick(Sender: TObject);
begin
  LlamarPacientesPorSexo;
end;

procedure TfrmPsiDoc.bVisitasPorSexoMouseEnter(Sender: TObject);
begin
  bVisitasPorSexo.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bVisitasPorSexoMouseLeave(Sender: TObject);
begin
  bVisitasPorSexo.Color := TColor($005E4934);
end;

procedure TfrmPsiDoc.bVisitaSubsecuenteClick(Sender: TObject);
begin
  LlamarPacientesSubsecuentes;
end;

procedure TfrmPsiDoc.bVisitaSubsecuenteMouseEnter(Sender: TObject);
begin
  bVisitaSubsecuente.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bVisitaSubsecuenteMouseLeave(Sender: TObject);
begin
  bVisitaSubsecuente.Color := TColor($005E4934);
end;

procedure TfrmPsiDoc.bVisualizacionClick(Sender: TObject);
begin
  ControladorVentanas.ActivePage := TabSheet2;
end;

procedure TfrmPsiDoc.bVisualizacionMouseEnter(Sender: TObject);
begin
  bVisualizacion.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bVisualizacionMouseLeave(Sender: TObject);
begin
  bVisualizacion.Color:= TColor($005E4934);
end;

procedure TfrmPsiDoc.bVisualizarRedApoyoClick(Sender: TObject);
begin
  // Configurar matrícula y mostrar el formulario
  frmVerRedApoyo.eMatricula.Text := eBuscarView.Text;
  frmVerRedApoyo.eMatricula.Enabled := False;

  // Mostrar el formulario solo si hay datos de red de apoyo
  if Length(frmVerRedApoyo.RedApoyo) > 0 then
    frmVerRedApoyo.ShowModal
  else
    uVarios.MostrarError('No se encontraron datos de red de apoyo para esta matrícula.');
end;

procedure TfrmPsiDoc.bVisualizarRedApoyoMouseEnter(Sender: TObject);
begin
  bVisualizarRedApoyo.Color := TColor($00826C49);
end;

procedure TfrmPsiDoc.bVisualizarRedApoyoMouseLeave(Sender: TObject);
begin
  bVisualizarRedApoyo.Color := TColor($005E4934);
end;

procedure TfrmPsiDoc.eBuscarViewClick(Sender: TObject);
begin
  LimpiarCamposView;
end;

procedure TfrmPsiDoc.FormCreate(Sender: TObject);
begin
  uVarios.conectarBD(Connection, Transacion);
  OcultarSesion;
  ControladorVentanas.ActivePage := TabSheet5;
end;

procedure TfrmPsiDoc.Image1Click(Sender: TObject);
begin

end;

procedure TfrmPsiDoc.imgAcercaDeClick(Sender: TObject);
begin
  frmAcercaDe.ShowModal;
end;

procedure TfrmPsiDoc.LimpiarCampos;
begin
  eNombre.Clear;
  cbLicenciatura.ClearSelection;
  eGrupo.Clear;
  eMatriculaRegistro.Clear;
  eEdad.Clear;
  eTelefono.Clear;
  eCorreo.Clear;
  eLugarOrigen.Clear;
  eLugarOrigen.Clear;
  eEstadoCivil.Clear;
  eEnfermedadFisica.Clear;
  eAntClinicos.Clear;
  eCosaEnoja.Clear;
  eCosaFeliz.Clear;
  eCosaTriste.Clear;
  eCosaMiedo.Clear;
  eCosaDesagrado.Clear;
  memObservaciones.Clear;
  eMatriculaSesion.Clear;
  eMotivoSesion.Clear;
  memAnotacionesSesion.Clear;
  cbSexo.ClearSelection;
  DateTimePicker1.Date := EncodeDate(2000, 1, 1);
end;


procedure TfrmPsiDoc.LimpiarCamposView;
begin
  eNombreView.Clear;
  cbLicenciaturaView.ClearSelection;
  eGrupoView.Clear;
  eEdadView.Clear;
  eTelefonoView.Clear;
  eCorreoView.Clear;
  eLugarOrigenView.Clear;
  eEstadoCivilView.Clear;
  eEnfermedadFisicaView.Clear;
  eAntClinicosView.Clear;
  eCosaEnojaView.Clear;
  eCosaFelizView.Clear;
  eCosaTristeView.Clear;
  eCosaMiedoView.Clear;
  eCosaDesagradoView.Clear;
  memObservacionesView.Clear;
  cbSexoView.ClearSelection;
  DateTimePickerView.Date := EncodeDate(2000, 1, 1);
end;

procedure TfrmPsiDoc.OcultarSesion;
begin
  eMotivoSesion.Enabled := False;
  memAnotacionesSesion.Enabled := False;
  bAgregarSesion.Enabled := False;
end;

procedure TfrmPsiDoc.MostrarSesion;
begin
  eMotivoSesion.Enabled := True;
  memAnotacionesSesion.Enabled := True;
  memAnotacionesSesion.Caption:= '';
  bAgregarSesion.Enabled := True;
end;

procedure TfrmPsiDoc.LlenarSesion;
begin
  Query.DataBase := Connection;
  // Lógica para cargar los datos de la primera sesión en el arreglo
  SetLength(Sesiones, 0);
  Query.SQL.Text := 'CALL BuscarSesionesPorMatricula(:matricula)';
  Query.Params.ParamByName('matricula').AsInteger := StrToInt(eMatriculaSesionView.Text);
  Query.Open;

  while not Query.EOF do
    begin
      SetLength(Sesiones, Length(Sesiones) + 1);
      Sesiones[High(Sesiones)][0] := Query.FieldByName('motivo').AsString;
      Sesiones[High(Sesiones)][1] := DateToStr(Query.FieldByName('fecha').AsDateTime);
      Sesiones[High(Sesiones)][2] := Query.FieldByName('observacionSesion').AsString;
      Query.Next;
    end;

  Query.Close;

  if Length(Sesiones) > 0 then
    begin
      // Mostrar datos de la primera sesión en los componentes correspondientes
      eMotivoSesionView.Text := Sesiones[0][0];
      eFechaSesionView.Text := Sesiones[0][1];
      memAnotacionesSesionView.Text := Sesiones[0][2];
      CurrentSesionIndex := 0;
    end
  else
    begin
      uVarios.MostrarError('No se encontraron sesiones para la matrícula especificada.');
      eMotivoSesionView.Clear;
      memAnotacionesSesionView.Clear;
    end;
end;

procedure TfrmPsiDoc.BuscarSesionPorFecha(matricula: Integer; fecha: String);
begin
  Query.DataBase := Connection;
  Query.Close;
  Query.SQL.Text := 'SELECT motivo, fecha, observacionSesion ' +
                    'FROM sesiones ' +
                    'WHERE matricula = :matricula AND fecha = :fecha';
  Query.Params.ParamByName('matricula').AsInteger := matricula;
  Query.Params.ParamByName('fecha').AsString := fecha;
  try
    Query.Open;
    if not Query.IsEmpty then
      begin
        eMotivoSesionView.Text := Query.FieldByName('motivo').AsString;
        eFechaSesionView.Text := Query.FieldByName('fecha').AsString;
        memAnotacionesSesionView.Text := Query.FieldByName('observacionSesion').AsString;
      end
    else
      begin
        uVarios.MostrarError('No se encontraron sesiones para la fecha y matrícula especificadas.');
      end;
  finally
    Query.Close;
  end;
end;

procedure TfrmPsiDoc.LlamarPacientesConUnaSesion;
var
  fechaInit, fechaEnd: String;
begin
  try
    // Asegurarse de que la conexión esté abierta
    if not Connection.Connected then
      Connection.Open;

    // Asignar la conexión y la transacción a la consulta
    Query.Database := Connection;
    Query.Transaction := Transacion;

    // Abrir la transacción si no está abierta
    if not Transacion.Active then
      Transacion.StartTransaction;

    // Preparar la consulta con los parámetros de fecha
    fechaInit := FormatDateTime('yyyy-mm-dd', DateTimePicker3.Date);
    fechaEnd := FormatDateTime('yyyy-mm-dd', DateTimePicker4.Date);
    Query.Close;
    Query.SQL.Text := 'CALL PacientesConUnaSesion(:fecha_min, :fecha_max)';
    Query.Params.ParamByName('fecha_min').AsString := fechaInit;
    Query.Params.ParamByName('fecha_max').AsString := fechaEnd;
    // Ejecutar la consulta
    Query.Open;

    //Configurar los campos del datase
    ConfigureFields;

    // Asignar el dataset al DataSource
    DataSource1.DataSet := Query;
    DBConsultas.DataSource := DataSource1;

  except
    on E: Exception do
      MostrarError('Error: ' + E.Message);
  end;
end;

procedure TfrmPsiDoc.LlamarPacientesPorSexo;
var
  fechaInit, fechaEnd: String;
begin
  try
    // Asegurarse de que la conexión esté abierta
    if not Connection.Connected then
      Connection.Open;

    // Asignar la conexión y la transacción a la consulta
    Query.Database := Connection;
    Query.Transaction := Transacion;

    // Abrir la transacción si no está abierta
    if not Transacion.Active then
      Transacion.StartTransaction;

    // Preparar la consulta con los parámetros de fecha
    fechaInit := FormatDateTime('yyyy-mm-dd', DateTimePicker3.Date);
    fechaEnd := FormatDateTime('yyyy-mm-dd', DateTimePicker4.Date);
    Query.Close;
    Query.SQL.Text := 'CALL ConsultaPorSexo(:fecha_min, :fecha_max)';
    Query.Params.ParamByName('fecha_min').AsString := fechaInit;
    Query.Params.ParamByName('fecha_max').AsString := fechaEnd;
    // Ejecutar la consulta
    Query.Open;

    //Configurar los campos del datase
    ConfigureFields;

    // Asignar el dataset al DataSource
    DataSource1.DataSet := Query;
    DBConsultas.DataSource := DataSource1;

  except
    on E: Exception do
      MostrarError('Error: ' + E.Message);
  end;
end;

procedure TfrmPsiDoc.LlamarPacientesPorLic;
var
  fechaInit, fechaEnd: String;
begin
  try
    // Asegurarse de que la conexión esté abierta
    if not Connection.Connected then
      Connection.Open;

    // Asignar la conexión y la transacción a la consulta
    Query.Database := Connection;
    Query.Transaction := Transacion;

    // Abrir la transacción si no está abierta
    if not Transacion.Active then
      Transacion.StartTransaction;

    // Preparar la consulta con los parámetros de fecha
    fechaInit := FormatDateTime('yyyy-mm-dd', DateTimePicker3.Date);
    fechaEnd := FormatDateTime('yyyy-mm-dd', DateTimePicker4.Date);
    Query.Close;
    Query.SQL.Text := 'CALL ConsultaPorLicenciatura(:fecha_min, :fecha_max)';
    Query.Params.ParamByName('fecha_min').AsString := fechaInit;
    Query.Params.ParamByName('fecha_max').AsString := fechaEnd;
    // Ejecutar la consulta
    Query.Open;

    //Configurar los campos del datase
    ConfigureFields;

    // Asignar el dataset al DataSource
    DataSource1.DataSet := Query;
    DBConsultas.DataSource := DataSource1;

  except
    on E: Exception do
      MostrarError('Error: ' + E.Message);
  end;
end;

procedure TfrmPsiDoc.LlamarPacientesSubsecuentes;
var
  fechaInit, fechaEnd: String;
begin
  try
    // Asegurarse de que la conexión esté abierta
    if not Connection.Connected then
      Connection.Open;

    // Asignar la conexión y la transacción a la consulta
    Query.Database := Connection;
    Query.Transaction := Transacion;

    // Abrir la transacción si no está abierta
    if not Transacion.Active then
      Transacion.StartTransaction;

    // Preparar la consulta con los parámetros de fecha
    fechaInit := FormatDateTime('yyyy-mm-dd', DateTimePicker3.Date);
    fechaEnd := FormatDateTime('yyyy-mm-dd', DateTimePicker4.Date);
    Query.Close;
    Query.SQL.Text := 'CALL AlumnosFrecuentes(:fecha_min, :fecha_max)';
    Query.Params.ParamByName('fecha_min').AsString := fechaInit;
    Query.Params.ParamByName('fecha_max').AsString := fechaEnd;
    // Ejecutar la consulta
    Query.Open;

    //Configurar los campos del datase
    ConfigureFields;

    // Asignar el dataset al DataSource
    DataSource1.DataSet := Query;
    DBConsultas.DataSource := DataSource1;

  except
    on E: Exception do
      MostrarError('Error: ' + E.Message);
  end;
end;


procedure TfrmPsiDoc.ConfigureFields;
begin
  // Configurar los campos del dataset
  Query.FieldDefs.Clear;
  Query.FieldDefs.Add('nombre', ftString, 100);
  Query.FieldDefs.Add('matricula', ftString, 50);
  Query.FieldDefs.Add('sexo', ftString, 20);
  Query.FieldDefs.Add('licenciatura', ftString, 100);
  Query.FieldDefs.Add('numero_sesiones', ftInteger);

  Query.Open;
  // Asegurar que los campos están mapeados correctamente
  DBConsultas.Columns[0].FieldName := 'nombre';
  DBConsultas.Columns[1].FieldName := 'matricula';
  DBConsultas.Columns[2].FieldName := 'sexo';
  DBConsultas.Columns[3].FieldName := 'licenciatura';
  DBConsultas.Columns[4].FieldName := 'numero_sesiones';
end;


end.






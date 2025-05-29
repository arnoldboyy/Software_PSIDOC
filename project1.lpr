program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, anchordockingdsgn, datetimectrls, unit1, uVarios, uRedApoyo, uMensaje,
  uAcercade, uVerRedApoyo
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfrmPsiDoc, frmPsiDoc);
  Application.CreateForm(TfrmRedApoyo, frmRedApoyo);
  Application.CreateForm(TfrmMensaje, frmMensaje);
  Application.CreateForm(TfrmAcercaDe, frmAcercaDe);
  Application.CreateForm(TfrmVerRedApoyo, frmVerRedApoyo);
  Application.Run;
end.


program ExtratoBancario;

uses
  Vcl.Forms,
  uMenuPrincipal in 'Fontes\uMenuPrincipal.pas' {frmMenuPrincipal},
  uModeloMenu in 'Fontes\uModeloMenu.pas' {frmModeloMenu},
  uUnitConfig in 'Fontes\uUnitConfig.pas',
  uDataPrincipal in 'Fontes\uDataPrincipal.pas' {dtmDataPrincipal: TDataModule},
  uUnitAjuda in 'Fontes\uUnitAjuda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Extrato Bancário';
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;
end.

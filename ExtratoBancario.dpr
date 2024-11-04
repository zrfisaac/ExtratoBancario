program ExtratoBancario;

uses
  Vcl.Forms,
  uMenuPrincipal in 'Fontes\uMenuPrincipal.pas' {frmMenuPrincipal},
  uModeloMenu in 'Fontes\uModeloMenu.pas' {frmModeloMenu},
  uUnitConfig in 'Fontes\uUnitConfig.pas',
  uDataPrincipal in 'Fontes\uDataPrincipal.pas' {dtmDataPrincipal: TDataModule},
  uUnitAjuda in 'Fontes\uUnitAjuda.pas',
  uMenuConfiguracao in 'Fontes\uMenuConfiguracao.pas' {frmMenuConfiguracao},
  uMenuSobre in 'Fontes\uMenuSobre.pas' {frmMenuSobre},
  uMenuTransacao in 'Fontes\uMenuTransacao.pas' {frmMenuTransacao},
  uUnitTransacao in 'Fontes\uUnitTransacao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Extrato Bancário';
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  Application.Run;
end.

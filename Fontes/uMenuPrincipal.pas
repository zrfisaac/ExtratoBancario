unit uMenuPrincipal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.ComCtrls,
  System.Actions,
  Vcl.ActnList;

type
  TfrmMenuPrincipal = class(TForm)
    pnFundo: TPanel;
    miMenu: TMainMenu;
    sbStatus: TStatusBar;
    miSobre: TMenuItem;
    miConfiguracao: TMenuItem;
    acAcao: TActionList;
    acSobre: TAction;
    acConfiguracao: TAction;
    acKey: TAction;
    miTransacao: TMenuItem;
    acTransacao: TAction;
    miModelo: TMenuItem;
    acModelo: TAction;
    procedure FormCreate(Sender: TObject);
    procedure acConfiguracaoExecute(Sender: TObject);
    procedure acSobreExecute(Sender: TObject);
    procedure acKeyExecute(Sender: TObject);
    procedure acTransacaoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acModeloExecute(Sender: TObject);
  private
    FMenu: TForm;
  public
    procedure Limpar;
    procedure Menu(AClass: TComponentClass; var AReference); overload;
    procedure Menu(var AReference; AClass: TComponentClass); overload;
    procedure Modal(AClass: TComponentClass);
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

uses
  uUnitAjuda,
  uDataPrincipal,
  uModeloMenu,
  uMenuConfiguracao,
  uMenuSobre,
  uMenuTransacao;

  resourcestring
  RSConfirmarInsercaoTitulo = 'Confirmar Inserção';
  RSConfirmarInsercaoMensagem = 'Você realmente deseja inserir um modelo de dados para teste? Isso pode sobrescrever dados existentes.';

{$R *.dfm}

procedure TfrmMenuPrincipal.acConfiguracaoExecute(Sender: TObject);
begin
  Self.Menu(TfrmMenuConfiguracao, frmMenuConfiguracao);
end;

procedure TfrmMenuPrincipal.Menu(var AReference; AClass: TComponentClass);
begin
  Self.Menu(AClass, AReference);
end;

procedure TfrmMenuPrincipal.Menu(AClass: TComponentClass; var AReference);
var
  AInstance: TfrmModeloMenu;
begin
  if (AClass.InheritsFrom(TfrmModeloMenu)) then
  begin
    if not(Assigned(TfrmModeloMenu(AReference))) then
    begin
      AInstance := TfrmModeloMenu(AClass.NewInstance);
      TfrmModeloMenu(AReference) := AInstance;
      AInstance.Create(Application);
      AInstance.Iniciar;
    end;
    AInstance := TfrmModeloMenu(AReference);
    FMenu := TForm(AInstance);
    if (AInstance.Verificar) then
    begin
      Self.Limpar;
      AInstance.pnFundo.Parent := Self.pnFundo;
    end;
  end;
end;

procedure TfrmMenuPrincipal.Modal(AClass: TComponentClass);
var
  AInstance: TForm;
begin
  if (AClass.InheritsFrom(TForm)) then
  begin
    AInstance := TForm(AClass.NewInstance);
    AInstance.Create(Application);
    AInstance.ShowModal;
    AInstance.Free;
  end;
end;

procedure TfrmMenuPrincipal.acKeyExecute(Sender: TObject);
begin
  Self.Modal(TfrmMenuSobre);
end;

procedure TfrmMenuPrincipal.acModeloExecute(Sender: TObject);
begin
  if (dtmDataPrincipal.Conectado) then
    if (
      Application.MessageBox(
         PChar(RSConfirmarInsercaoMensagem)
        ,PChar(RSConfirmarInsercaoTitulo)
        ,MB_YESNO + MB_ICONQUESTION
      ) = IDYES
    ) then
    begin
      dtmDataPrincipal.Modelo;
      dtmDataPrincipal.Update;
    end;
end;

procedure TfrmMenuPrincipal.acSobreExecute(Sender: TObject);
begin
  Self.Modal(TfrmMenuSobre);
end;

procedure TfrmMenuPrincipal.acTransacaoExecute(Sender: TObject);
begin
  Self.Menu(TfrmMenuTransacao, frmMenuTransacao);
end;

procedure TfrmMenuPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Self.Limpar;
  dtmDataPrincipal.Desconectar;
end;

procedure TfrmMenuPrincipal.FormCreate(Sender: TObject);
begin
  // Titulo
  Self.Caption := Application.Title;

  // Versao
  if (Self.sbStatus.Panels.Count > 0) then
    Self.sbStatus.Panels[0].Text := fnVersion;

  // DataModule
  if not(Assigned(dtmDataPrincipal)) then
    dtmDataPrincipal := TdtmDataPrincipal.Create(Application)
end;

procedure TfrmMenuPrincipal.FormShow(Sender: TObject);
begin
  // Principal
  Self.Menu(TfrmMenuConfiguracao, frmMenuConfiguracao);
  if (dtmDataPrincipal.Conectado) then
    Self.Menu(TfrmMenuTransacao, frmMenuTransacao)
  else
    Self.Menu(TfrmMenuConfiguracao, frmMenuConfiguracao);
end;

procedure TfrmMenuPrincipal.Limpar;
begin
  if (Assigned(FMenu)) then
    TfrmModeloMenu(FMenu).pnFundo.Parent := TWinControl(TfrmModeloMenu(FMenu).pnFundo.Owner);
  Self.FMenu := nil;
end;

end.


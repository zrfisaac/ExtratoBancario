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
  Vcl.ComCtrls, System.Actions, Vcl.ActnList;

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
    procedure FormCreate(Sender: TObject);
    procedure acConfiguracaoExecute(Sender: TObject);
    procedure acSobreExecute(Sender: TObject);
    procedure acKeyExecute(Sender: TObject);
    procedure acTransacaoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  uDataPrincipal,
  uModeloMenu,
  uMenuConfiguracao,
  uMenuSobre,
  uMenuTransacao;

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
    Self.Limpar;
    if not(Assigned(TfrmModeloMenu(AReference))) then
    begin
      AInstance := TfrmModeloMenu(AClass.NewInstance);
      AInstance.Create(Application);
      TfrmModeloMenu(AReference) := AInstance;
      AInstance.Iniciar;
    end;
    AInstance := TfrmModeloMenu(AReference);
    FMenu := TForm(AInstance);
    AInstance.pnFundo.Parent := Self.pnFundo;
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
end;

procedure TfrmMenuPrincipal.FormCreate(Sender: TObject);
begin
  // Titulo
  Self.Caption := Application.Title;

  // DataModule
  if not(Assigned(dtmDataPrincipal)) then
    dtmDataPrincipal := TdtmDataPrincipal.Create(Application)
end;

procedure TfrmMenuPrincipal.FormShow(Sender: TObject);
begin
  // Principal
  Self.Menu(TfrmMenuConfiguracao, frmMenuConfiguracao);
  Self.Menu(TfrmMenuTransacao, frmMenuTransacao);
end;

procedure TfrmMenuPrincipal.Limpar;
begin
  if (Assigned(FMenu)) then
    TfrmModeloMenu(FMenu).pnFundo.Parent := TWinControl(TfrmModeloMenu(FMenu).pnFundo.Owner);
  Self.FMenu := nil;
end;

end.


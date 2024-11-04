unit uMenuConfiguracao;

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
  uModeloMenu,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Mask,
  Vcl.DBCtrls;

type
  TfrmMenuConfiguracao = class(TfrmModeloMenu)
    tsConexao: TTabSheet;
    pnConexao: TPanel;
    pnConexaoRodape: TPanel;
    pnConexaoRodape02: TPanel;
    pnConexaoRodape01: TPanel;
    pnConexaoRodape03: TPanel;
    sbCadastro: TScrollBox;
    pnConexaoServidor: TPanel;
    lbConexaoServidor: TLabel;
    lbConexaoPorta: TLabel;
    Panel5: TPanel;
    lbConexaoBanco: TLabel;
    pnConexaoUsuario: TPanel;
    lbConexaoUsuario: TLabel;
    pnConexaoSenha: TPanel;
    lbConexaoSenha: TLabel;
    edConexaoSenha: TEdit;
    edConexaoUsuario: TEdit;
    edConexaoBanco: TEdit;
    edConexaoServidor: TEdit;
    edConexaoPorta: TEdit;
    btConexao: TBitBtn;
    procedure btConexaoClick(Sender: TObject);
  public
    procedure Conectar;
    procedure Desconectar;
    procedure Gravar;
    procedure Habilitar;
    procedure Iniciar; override;
    procedure Ler;
    function Verificar: Boolean; override;
  end;

var
  frmMenuConfiguracao: TfrmMenuConfiguracao;

implementation

uses
  uUnitConfig,
  uDataPrincipal;

resourcestring
  RSErroConectarTitulo = 'Erro de Conexão';
  RSErroConectarMensagem = 'Falha na conexão com o banco de dados.'#13#10'Verifique sua conexão e tente novamente.'#13#10#13#10'%s';

{$R *.dfm}

{ TfrmMenuConfiguracao }

procedure TfrmMenuConfiguracao.btConexaoClick(Sender: TObject);
begin
  inherited;
  if (dtmDataPrincipal.Conectado) then
    Self.Desconectar
  else
    Self.Conectar;
end;

procedure TfrmMenuConfiguracao.Conectar;
begin
  if not(dtmDataPrincipal.Conectado) then
  begin
    try
      dtmDataPrincipal.Servidor := Self.edConexaoServidor.Text;
      dtmDataPrincipal.Porta := Self.edConexaoPorta.Text;
      dtmDataPrincipal.Banco := Self.edConexaoBanco.Text;
      dtmDataPrincipal.Usuario := Self.edConexaoUsuario.Text;
      dtmDataPrincipal.Senha := Self.edConexaoSenha.Text;
      dtmDataPrincipal.Conectar;
      Self.Gravar;
      Self.btConexao.Caption := 'Desconectar';
      Self.Habilitar;
    except
      on E: Exception do
      begin
        Application.MessageBox(
          PChar(Format(RSErroConectarMensagem,[E.Message])),
          PChar(RSErroConectarTitulo),
          MB_OK + MB_ICONERROR,
        );
        Self.Desconectar;
      end;
    end;
  end;
end;

procedure TfrmMenuConfiguracao.Desconectar;
begin
  Self.btConexao.Caption := 'Conectar';
  dtmDataPrincipal.Desconectar;
  Self.Habilitar;
end;

procedure TfrmMenuConfiguracao.Gravar;
begin
  Config.Grupo := 'Banco';
  Config.Gravar('Servidor', Self.edConexaoServidor.Text);
  Config.Gravar('Porta', Self.edConexaoPorta.Text);
  Config.Gravar('Banco', Self.edConexaoBanco.Text);
  Config.Gravar('Usuario', Self.edConexaoUsuario.Text);
  Config.Gravar('Senha', Self.edConexaoSenha.Text);
end;

procedure TfrmMenuConfiguracao.Habilitar;
var
  AConectado: Boolean;
begin
  AConectado := dtmDataPrincipal.Conectado;
  Self.edConexaoServidor.ReadOnly := AConectado;
  Self.edConexaoPorta.ReadOnly := AConectado;
  Self.edConexaoBanco.ReadOnly := AConectado;
  Self.edConexaoUsuario.ReadOnly := AConectado;
  Self.edConexaoSenha.ReadOnly := AConectado;
end;

procedure TfrmMenuConfiguracao.Iniciar;
begin
  inherited;
  Self.Ler;
  Self.Conectar;
end;

procedure TfrmMenuConfiguracao.Ler;
begin
  Config.Grupo := 'Banco';
  Self.edConexaoServidor.Text := Config.Ler('Servidor', dtmDataPrincipal.Servidor);
  Self.edConexaoPorta.Text := Config.Ler('Porta', dtmDataPrincipal.Porta);
  Self.edConexaoBanco.Text := Config.Ler('Banco', dtmDataPrincipal.Banco);
  Self.edConexaoUsuario.Text := Config.Ler('Usuario', dtmDataPrincipal.Usuario);
  Self.edConexaoSenha.Text := Config.Ler('Senha', dtmDataPrincipal.Senha);
end;

function TfrmMenuConfiguracao.Verificar: Boolean;
begin
  Result := True;
end;

end.

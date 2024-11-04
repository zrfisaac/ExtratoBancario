unit uDataPrincipal;

interface

uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef;

type
  TdtmDataPrincipal = class(TDataModule)
    conPrincipal: TFDConnection;
    traPrincipal: TFDTransaction;
    qryTransacaoSequence: TFDQuery;
    qryTransacaoTabela: TFDQuery;
    qryTransacaoTrigger: TFDQuery;
    qryTransacaoIndice: TFDQuery;
    qryPrincipal: TFDQuery;
    dtsPrincipal: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    FBanco: string;
    FNovo: Boolean;
    FPorta: string;
    FSenha: string;
    FServidor: string;
    FUsuario: string;
    function GetConectado: Boolean;
  public
    property Banco: string read FBanco write FBanco;
    property Conectado: Boolean read GetConectado;
    property Novo: Boolean read FNovo;
    property Porta: string read FPorta write FPorta;
    property Senha: string read FSenha write FSenha;
    property Servidor: string read FServidor write FServidor;
    property Usuario: string read FUsuario write FUsuario;
    procedure Conectar;
    procedure Desconectar;
    procedure Inicializar;
    procedure Modelo;
    procedure Update;
  end;

var
  dtmDataPrincipal: TdtmDataPrincipal;

implementation

uses
  uUnitTransacao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdtmDataPrincipal }

procedure TdtmDataPrincipal.Conectar;
begin
  with (Self.conPrincipal) do
  begin
    FNovo := not(FileExists(Self.Banco));
    Connected := False;
    Params.Values['DriverID'] := 'FB';
    Params.Values['Server'] := Self.Servidor;
    Params.Values['Port'] := Self.Porta;
    Params.Values['Database'] := Self.Banco;
    Params.Values['OSAuthent'] := 'No';
    Params.Values['User_Name'] := Self.Usuario;
    Params.Values['Password'] := Self.Senha;
    Params.Values['OpenMode'] := 'OpenOrCreate';
    //Params.Values['CharacterSet'] := 'UTF8';
      Connected := True;
  end;
  Self.Inicializar;
end;

procedure TdtmDataPrincipal.DataModuleCreate(Sender: TObject);
begin
  FBanco := GetCurrentDir + '\' + 'BANCO.fdb';
  FNovo := False;
  FPorta := '3050';
  FSenha := 'masterkey';
  FServidor := '127.0.0.1';
  FUsuario := 'SYSDBA';
  TTransacaoFireDAC(Transacao).Conexao := Self.conPrincipal;
end;

procedure TdtmDataPrincipal.Desconectar;
begin
  Self.qryPrincipal.Close;
  Self.conPrincipal.Connected := False;
end;

function TdtmDataPrincipal.GetConectado: Boolean;
begin
  Result := Self.conPrincipal.Connected;
end;

procedure TdtmDataPrincipal.Inicializar;
begin
  if (Self.Conectado) then
  begin
    if (Self.Novo) then
    begin
      Self.qryTransacaoSequence.ExecSQL;
      Self.qryTransacaoTabela.ExecSQL;
      Self.qryTransacaoTrigger.ExecSQL;
      Self.qryTransacaoIndice.ExecSQL;
    end;
    Self.qryPrincipal.Open;
  end;
end;

procedure TdtmDataPrincipal.Modelo;
begin
  if (Self.Conectado) then
  begin
    with (Self.conPrincipal) do
    begin
      ExecSQL('INSERT INTO TB_TRANSACAO (CL_DATA, CL_NOME, CL_VALOR, CL_TIPO) VALUES (''2024-01-01'', ''Depósito Inicial'', 1000.00, ''Crédito'');');
      ExecSQL('INSERT INTO TB_TRANSACAO (CL_DATA, CL_NOME, CL_VALOR, CL_TIPO) VALUES (''2024-01-05'', ''Compra Supermercado'', -150.75, ''Débito'');');
      ExecSQL('INSERT INTO TB_TRANSACAO (CL_DATA, CL_NOME, CL_VALOR, CL_TIPO) VALUES (''2024-01-10'', ''Pagamento Aluguel'', -800.00, ''Débito'');');
      ExecSQL('INSERT INTO TB_TRANSACAO (CL_DATA, CL_NOME, CL_VALOR, CL_TIPO) VALUES (''2024-01-15'', ''Salário'', 3000.00, ''Crédito'');');
      ExecSQL('INSERT INTO TB_TRANSACAO (CL_DATA, CL_NOME, CL_VALOR, CL_TIPO) VALUES (''2024-01-20'', ''Transferência Enviada'', -500.00, ''Débito'');');
      ExecSQL('INSERT INTO TB_TRANSACAO (CL_DATA, CL_NOME, CL_VALOR, CL_TIPO) VALUES (''2024-01-25'', ''Transferência Recebida'', 200.00, ''Crédito'');');
      ExecSQL('INSERT INTO TB_TRANSACAO (CL_DATA, CL_NOME, CL_VALOR, CL_TIPO) VALUES (''2024-01-30'', ''Pagamento Cartão'', -350.50, ''Débito'');');
      ExecSQL('INSERT INTO TB_TRANSACAO (CL_DATA, CL_NOME, CL_VALOR, CL_TIPO) VALUES (''2024-02-01'', ''Venda Produto'', 450.00, ''Crédito'');');
      ExecSQL('INSERT INTO TB_TRANSACAO (CL_DATA, CL_NOME, CL_VALOR, CL_TIPO) VALUES (''2024-02-05'', ''Compra Online'', -120.99, ''Débito'');');
      ExecSQL('INSERT INTO TB_TRANSACAO (CL_DATA, CL_NOME, CL_VALOR, CL_TIPO) VALUES (''2024-02-10'', ''Rendimento Investimento'', 75.25, ''Crédito'');');
    end;
  end;
end;

procedure TdtmDataPrincipal.Update;
begin
  if (Self.Conectado) then
  begin
    dtmDataPrincipal.qryPrincipal.Close;
    dtmDataPrincipal.qryPrincipal.Open;
  end;
end;

end.


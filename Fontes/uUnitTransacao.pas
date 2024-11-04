unit uUnitTransacao;

interface

uses
  System.SysUtils,
  System.Classes,
  Winapi.Windows,
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
  // Tipo da Transacao
  TTransacaoTipo = (ttCredito, ttDebito);

  // Interface de Transacao
  ITransacao = interface
    ['{1A59D122-55D3-4ACE-8754-4CD70BF68B49}']
    procedure Adicionar(AData: TDateTime; ANome: string; AValor: Double; ATipo: TTransacaoTipo);
    function Carregar(AId: Integer): TStrings;
    procedure Editar(AId: Integer; AData: TDateTime; ANome: string; AValor: Double; ATipo: TTransacaoTipo);
    procedure Remover(AId: Integer);
    function Verificar: Boolean;
  end;

  // Classe Base de Transacao
  TTransacaoBase = class(TInterfacedObject, ITransacao)
  private
  public
    procedure Adicionar(AData: TDateTime; ANome: string; AValor: Double; ATipo: TTransacaoTipo); virtual;
    function Carregar(AId: Integer): TStrings; virtual;
    function Dado(ADado: Double): string; overload;
    function Dado(ADado: Integer): string; overload;
    function Dado(ADado: TDateTime): string; overload;
    function Dado(ADado: TTransacaoTipo): string; overload;
    function Dado(ADado: String): TTransacaoTipo; overload;
    procedure Editar(AId: Integer; AData: TDateTime; ANome: string; AValor: Double; ATipo: TTransacaoTipo); virtual;
    procedure Remover(AId: Integer); virtual;
    function Verificar: Boolean; virtual;
  end;

  // Classe de Transacao FireDAC
  TTransacaoFireDAC = class(TTransacaoBase)
  public
    Conexao: TFDConnection;
    procedure Adicionar(AData: TDateTime; ANome: string; AValor: Double; ATipo: TTransacaoTipo); overload; override;
    function Carregar(AId: Integer): TStrings; overload; override;
    procedure Editar(AId: Integer; AData: TDateTime; ANome: string; AValor: Double; ATipo: TTransacaoTipo); overload; override;
    procedure Remover(AId: Integer); overload; override;
    function Verificar: Boolean; overload; override;
  end;

// Obter transacao padrao
function Transacao(AClass: TComponentClass = nil): TTransacaoBase;

implementation

uses
  uUnitAjuda;

resourcestring
    RSSQLAdicionar = 'INSERT INTO TB_TRANSACAO (CL_DATA, CL_NOME, CL_VALOR, CL_TIPO) VALUES (''%s'', ''%s'', %s, ''%s'');';
    RSSQLCarregar = 'SELECT CL_ID, CAST(EXTRACT(year FROM CL_DATA) AS VARCHAR(4)) || ''-'' || LPAD(CAST(EXTRACT(month FROM CL_DATA) AS VARCHAR(4)), 2, ''0'') || ''-'' || LPAD(CAST(EXTRACT(day FROM CL_DATA) AS VARCHAR(4)), 2, ''0'') AS CL_DATA, CL_NOME, CL_VALOR, CL_TIPO FROM TB_TRANSACAO WHERE CL_ID = %d;';
    RSSQLEditar = 'UPDATE TB_TRANSACAO SET CL_DATA = ''%s'', CL_NOME = ''%s'', CL_VALOR = %s, CL_TIPO = ''%s'' WHERE CL_ID = %d;';
    RSSQLRemover = 'DELETE FROM TB_TRANSACAO WHERE CL_ID = %d;';

var
  VTransacao: TTransacaoBase;

function Transacao(AClass: TComponentClass = nil): TTransacaoBase;
var
  AResult: TTransacaoBase;
begin
  if (Assigned(AClass)) then
  begin
    AResult := TTransacaoBase(AClass.NewInstance);
    AResult.Create;
    VTransacao := AResult;
  end
  else
  begin
    if not(Assigned(VTransacao)) then
      VTransacao := TTransacaoFireDAC.Create;
    AResult := VTransacao
  end;
  Result := AResult;
end;

{ TTransacaoBase }

procedure TTransacaoBase.Adicionar(AData: TDateTime; ANome: string;
  AValor: Double; ATipo: TTransacaoTipo);
begin
  // Metodo Virtual
end;

function TTransacaoBase.Carregar(AId: Integer): TStrings;
begin
  // Metodo Virtual
end;

function TTransacaoBase.Dado(ADado: Double): string;
begin
  Result := FloatToStr(ADado);
end;

function TTransacaoBase.Dado(ADado: Integer): string;
begin
  Result := IntToStr(ADado);
end;

function TTransacaoBase.Dado(ADado: TDateTime): string;
begin
  Result := FormatDateTime('yyyy-MM-dd', ADado);
end;

function TTransacaoBase.Dado(ADado: TTransacaoTipo): string;
begin
  if (ADado = ttCredito) then
    Result := 'Credito'
  else if (ADado = ttDebito) then
    Result := 'Debito';
end;

procedure TTransacaoBase.Editar(AId: Integer; AData: TDateTime; ANome: string; AValor: Double; ATipo: TTransacaoTipo);
begin
  // Metodo Virtual
end;

procedure TTransacaoBase.Remover(AId: Integer);
begin
  // Metodo Virtual
end;

function TTransacaoBase.Verificar: Boolean;
begin
  // Metodo Virtual
end;

function TTransacaoBase.Dado(ADado: String): TTransacaoTipo;
begin
  if (ADado = 'Crédito') then
    Result := ttCredito
  else
    Result := ttDebito;
end;

{ TTransacaoFireDAC }

procedure TTransacaoFireDAC.Adicionar(AData: TDateTime; ANome: string; AValor: Double; ATipo: TTransacaoTipo);
var
  AScript: string;
begin
  AScript := '';
  inherited;
  if (Self.Verificar) then
  begin
    AScript := RSSQLAdicionar;
    AScript := Format(AScript, [Dado(AData),ANome,fnFloatToStr(AValor),Dado(ATipo)]);
    Self.Conexao.ExecSQL(AScript);
  end;
end;

function TTransacaoFireDAC.Carregar(AId: Integer): TStrings;
var
  AResult: TStrings;
  ADataSet: TDataSet;
  AScript: string;
begin
  AScript := '';
  AResult := TStringList.Create;
  if (Self.Verificar) then
  begin
    AScript := RSSQLCarregar;
    AScript := Format(AScript, [AId]);
    Self.Conexao.ExecSQL(AScript,ADataSet);
    AResult.Add('CL_ID' + '=' + ADataSet.FieldByName('CL_ID').AsString);
    AResult.Add('CL_DATA' + '=' + ADataSet.FieldByName('CL_DATA').AsString);
    AResult.Add('CL_NOME' + '=' + ADataSet.FieldByName('CL_NOME').AsString);
    AResult.Add('CL_VALOR' + '=' + ADataSet.FieldByName('CL_VALOR').AsString);
    AResult.Add('CL_TIPO' + '=' + ADataSet.FieldByName('CL_TIPO').AsString);
  end;
  Result := AResult;
end;

procedure TTransacaoFireDAC.Editar(AId: Integer; AData: TDateTime; ANome: string; AValor: Double; ATipo: TTransacaoTipo);
var
  AScript: string;
begin
  AScript := '';
  if (Self.Verificar) then
  begin
    AScript := RSSQLEditar;
    AScript := Format(AScript, [Dado(AData),ANome,fnFloatToStr(AValor),Dado(ATipo),AId]);
    Self.Conexao.ExecSQL(AScript);
  end;
end;

procedure TTransacaoFireDAC.Remover(AId: Integer);
var
  AScript: string;
begin
  AScript := '';
  if (Self.Verificar) then
  begin
    AScript := RSSQLRemover;
    AScript := Format(AScript, [AId]);
    Self.Conexao.ExecSQL(AScript);
  end;
end;

function TTransacaoFireDAC.Verificar: Boolean;
var
  AResult: Boolean;
begin
  AResult := False;
  if (Assigned(Self.Conexao)) then
  begin
    if (Self.Conexao.Connected) then
    begin
      AResult := True;
    end;
  end;
  Result := AResult;
end;

end.


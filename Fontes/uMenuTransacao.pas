unit uMenuTransacao;

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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Mask,
  Vcl.DBCtrls;

type
  TTipoMenuTransacao = (tmBusca,tmNovo,tmEditar);

  TfrmMenuTransacao = class(TfrmModeloMenu)
    tsConsulta: TTabSheet;
    tsCadastro: TTabSheet;
    pnCadastro: TPanel;
    pnConsulta: TPanel;
    sbCadastro: TScrollBox;
    pnConsulta00: TPanel;
    dbgConsulta: TDBGrid;
    pnConsulta03: TPanel;
    btConsulta: TBitBtn;
    pnConsulta02: TPanel;
    pnConsulta01: TPanel;
    cbNome: TComboBox;
    lbNome: TLabel;
    pnCadastroId: TPanel;
    lbCadastroId: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    btNovo: TBitBtn;
    btEditar: TBitBtn;
    btCancelar: TBitBtn;
    btSalvar: TBitBtn;
    btApagar: TBitBtn;
    edCadastroId: TEdit;
    edCadastroNome: TEdit;
    Label1: TLabel;
    dtCadastroData: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    cbCadastroTipo: TComboBox;
    edCadastroValor: TEdit;
    procedure btNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure edCadastroValorKeyPress(Sender: TObject; var Key: Char);
    procedure dbgConsultaDblClick(Sender: TObject);
  private
    FTipo: TTipoMenuTransacao;
    function GetId: Integer;
  public
    property Id: Integer read GetId;
    property Tipo: TTipoMenuTransacao read FTipo write FTipo;
    procedure Apagar;
    procedure Cancelar;
    procedure Editar;
    procedure Iniciar; override;
    procedure Novo;
    procedure Salvar;
    procedure Update;
    procedure Visual;
  end;

var
  frmMenuTransacao: TfrmMenuTransacao;

implementation

uses
  uDataPrincipal,
  uUnitAjuda,
  uUnitConfig,
  uUnitTransacao;

{$R *.dfm}

procedure TfrmMenuTransacao.Apagar;
begin
  Transacao.Remover(Self.Id);
  Self.Update;
  Self.Visual;
end;

procedure TfrmMenuTransacao.btApagarClick(Sender: TObject);
begin
  inherited;
  Self.Apagar;
end;

procedure TfrmMenuTransacao.btCancelarClick(Sender: TObject);
begin
  inherited;
  Self.Cancelar;
end;

procedure TfrmMenuTransacao.btEditarClick(Sender: TObject);
begin
  inherited;
  Self.Editar;
end;

procedure TfrmMenuTransacao.btNovoClick(Sender: TObject);
begin
  inherited;
  Self.Novo;
end;

procedure TfrmMenuTransacao.btSalvarClick(Sender: TObject);
begin
  inherited;
  Self.Salvar;
end;

procedure TfrmMenuTransacao.Cancelar;
begin
  Self.Tipo := tmBusca;
  Pagina(Self.pnConsulta);
  Self.Visual;
end;

procedure TfrmMenuTransacao.dbgConsultaDblClick(Sender: TObject);
begin
  inherited;
  if (dtmDataPrincipal.qryPrincipal.IsEmpty) then
    Self.Novo
  else
    Self.Editar;
end;

procedure TfrmMenuTransacao.edCadastroValorKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not(Key in ['0'..'9',',','-',Char(8)]) then
    Key := #0;
end;

procedure TfrmMenuTransacao.Editar;
var
  ADado: TStrings;
begin
  Self.Tipo := tmEditar;
  Self.Pagina(Self.pnCadastro);
  ADado := Transacao.Carregar(Self.Id);
  Self.edCadastroId.Text := ADado.Values['CL_ID'];
  Self.dtCadastroData.DateTime := fnStrToDateTime(ADado.Values['CL_DATA']);
  Self.edCadastroNome.Text := ADado.Values['CL_NOME'];
  Self.edCadastroValor.Text := ADado.Values['CL_VALOR'];
  if (ADado.Values['CL_TIPO'] = 'Crédito')
  or (ADado.Values['CL_TIPO'] = 'Credito') then
    Self.cbCadastroTipo.ItemIndex := 0
  else
    Self.cbCadastroTipo.ItemIndex := 1;
  Self.Visual;
end;

procedure TfrmMenuTransacao.FormCreate(Sender: TObject);
begin
  inherited;
  Self.Tipo := tmBusca;
end;

function TfrmMenuTransacao.GetId: Integer;
begin
  Result := dtmDataPrincipal.qryPrincipal.FieldByName('CL_ID').AsInteger;
end;

procedure TfrmMenuTransacao.Iniciar;
begin
  inherited;
  Pagina(Self.pnConsulta);
  Self.Visual;
end;

procedure TfrmMenuTransacao.Novo;
begin
  Self.Tipo := tmNovo;
  Self.Pagina(Self.pnCadastro);
  Self.Visual;
end;

procedure TfrmMenuTransacao.Salvar;
begin
  Self.Tipo := tmBusca;
  Pagina(Self.pnConsulta);
  Self.Update;
  Self.Visual;
end;

procedure TfrmMenuTransacao.Update;
begin
  dtmDataPrincipal.qryPrincipal.Close;
  dtmDataPrincipal.qryPrincipal.Open;
end;

procedure TfrmMenuTransacao.Visual;
begin
  Self.btNovo.Enabled := False;
  Self.btEditar.Enabled := False;
  Self.btCancelar.Enabled := False;
  Self.btSalvar.Enabled := False;
  Self.btApagar.Enabled := False;
  if (Self.Tipo = tmBusca) then
  begin
    Self.btNovo.Enabled := True;
    if ((dtmDataPrincipal.Conectado) and not(dtmDataPrincipal.qryPrincipal.IsEmpty)) then
    begin
      Self.btEditar.Enabled := True;
      Self.btApagar.Enabled := True;
    end;
  end
  else if (Self.Tipo = tmNovo) then
  begin
    Self.btCancelar.Enabled := True;
    Self.btSalvar.Enabled := True;
  end
  else if (Self.Tipo = tmEditar) then
  begin
    Self.btCancelar.Enabled := True;
    Self.btSalvar.Enabled := True;
  end;
end;

end.

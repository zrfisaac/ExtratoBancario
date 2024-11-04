unit uMenuSobre;

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
  Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.Actions, Vcl.ActnList;

type
  TfrmMenuSobre = class(TForm)
    pnFundo: TPanel;
    pnFundo01: TPanel;
    pnFundo02: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    acAcao: TActionList;
    acEsc: TAction;
    acEnter: TAction;
    procedure acEscExecute(Sender: TObject);
    procedure acEnterExecute(Sender: TObject);
  public
    procedure Sair;
  end;

var
  frmMenuSobre: TfrmMenuSobre;

implementation

{$R *.dfm}

procedure TfrmMenuSobre.acEnterExecute(Sender: TObject);
begin
  Self.Sair;
end;

procedure TfrmMenuSobre.acEscExecute(Sender: TObject);
begin
  Self.Sair;
end;

procedure TfrmMenuSobre.Sair;
begin
  Self.Close;
end;

end.

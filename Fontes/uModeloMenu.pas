unit uModeloMenu;

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
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ComCtrls;

type
  TfrmModeloMenu = class(TForm)
    pnFundo: TPanel;
    pnRodape: TPanel;
    pnRodape02: TPanel;
    pnRodape01: TPanel;
    pnRodape03: TPanel;
    pnCorpo: TPanel;
    pcCorpo: TPageControl;
    procedure FormCreate(Sender: TObject);
  private
    FPagina: TPanel;
  public
    procedure Pagina(APagina: TPanel);
    procedure Iniciar; virtual;
  end;

var
  frmModeloMenu: TfrmModeloMenu;

implementation

{$R *.dfm}

procedure TfrmModeloMenu.FormCreate(Sender: TObject);
begin
  if (Self.pcCorpo.PageCount > 0) then
    Self.pcCorpo.TabIndex := 0;
end;

procedure TfrmModeloMenu.Iniciar;
begin
  // Metodo Virtual
end;

procedure TfrmModeloMenu.Pagina(APagina: TPanel);
begin
  Self.pcCorpo.Visible := False;
  if (Assigned(FPagina)) then
    FPagina.Parent := TWinControl(FPagina.Owner);
  FPagina := APagina;
  FPagina.Parent := Self.pnCorpo;
end;

end.


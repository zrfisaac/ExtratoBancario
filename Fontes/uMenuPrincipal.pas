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
  Vcl.ComCtrls;

type
  TfrmMenuPrincipal = class(TForm)
    pnFundo: TPanel;
    miMenu: TMainMenu;
    sbStatus: TStatusBar;
    miSobre: TMenuItem;
    miConfig: TMenuItem;
    procedure FormCreate(Sender: TObject);
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

{$R *.dfm}

procedure TfrmMenuPrincipal.FormCreate(Sender: TObject);
begin
  // Titulo
  Self.Caption := Application.Title;
end;

end.

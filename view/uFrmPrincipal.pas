unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uFrmCadastroItem,
  Vcl.Menus, uFrmPedido;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Item1: TMenuItem;
    Venda1: TMenuItem;
    Pedido1: TMenuItem;
    procedure btnItemClick(Sender: TObject);
    procedure Item1Click(Sender: TObject);
    procedure Pedido1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnItemClick(Sender: TObject);
begin
  if (frmCadastroItem = nil) then begin
    frmCadastroItem := TfrmCadastroItem.Create(Application);
    frmCadastroItem.WindowState := wsNormal;
    frmCadastroItem.Show;
  end;
end;

procedure TfrmPrincipal.Item1Click(Sender: TObject);
begin
  if (frmCadastroItem = nil) then begin
    frmCadastroItem := TfrmCadastroItem.Create(Application);
    frmCadastroItem.WindowState := wsNormal;
    frmCadastroItem.Show;
  end;
end;

procedure TfrmPrincipal.Pedido1Click(Sender: TObject);
begin
  if (frmPedido = nil) then begin
    frmPedido := TfrmPedido.Create(Application);
    frmPedido.WindowState := wsNormal;
    frmPedido.Show;
  end;
end;

end.

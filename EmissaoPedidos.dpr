program EmissaoPedidos;

uses
  Vcl.Forms,
  uFrmPrincipal in 'view\uFrmPrincipal.pas' {frmPrincipal},
  uFrmCadastroItem in 'view\uFrmCadastroItem.pas' {frmCadastroItem},
  uItemModel in 'model\uItemModel.pas',
  uItemController in 'control\uItemController.pas',
  uDmConexao in 'dao\uDmConexao.pas' {DmConexao: TDataModule},
  uDmItem in 'dao\uDmItem.pas' {DmItem: TDataModule},
  uFrmPedido in 'view\uFrmPedido.pas' {frmPedido},
  uPedidoCabModel in 'model\uPedidoCabModel.pas',
  uPedidoItemModel in 'model\uPedidoItemModel.pas',
  uFuncoes in 'control\uFuncoes.pas',
  uDmPedidoCab in 'dao\uDmPedidoCab.pas' {DmPedidoCab: TDataModule},
  uPedidoCabController in 'control\uPedidoCabController.pas',
  uDmPedidoItem in 'dao\uDmPedidoItem.pas' {DmPedidoItem: TDataModule},
  uPedidoItemController in 'control\uPedidoItemController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.Run;
end.

program EmissaoPedidos;

uses
  Vcl.Forms,
  uFrmPrincipal in 'view\uFrmPrincipal.pas' {frmPrincipal},
  uFrmCadastroItem in 'view\uFrmCadastroItem.pas' {frmCadastroItem},
  uItemModel in 'model\uItemModel.pas',
  uItemController in 'control\uItemController.pas',
  uDmConexao in 'dao\uDmConexao.pas' {DmConexao: TDataModule},
  uDmItem in 'dao\uDmItem.pas' {DmItem: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.Run;
end.

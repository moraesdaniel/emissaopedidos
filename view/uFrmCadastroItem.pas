unit uFrmCadastroItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ComCtrls, uItemController, uDmItem, Data.DB, Vcl.DBGrids, uItemModel,
  System.UITypes, uPedidoItemController, frxClass, frxDBSet;

type
  TAcao = (actInserir, actAtualizar);
  TfrmCadastroItem = class(TForm)
    pgCadastroProduto: TPageControl;
    tbPesquisa: TTabSheet;
    tbManutencao: TTabSheet;
    pnlPesquisa: TPanel;
    edtPesquisa: TLabeledEdit;
    pnlBotoesPesquisa: TPanel;
    pnlBotoesManutencao: TPanel;
    edtCodigo: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    btnAlterar: TButton;
    btnNovo: TButton;
    dbgPesquisa: TDBGrid;
    dsPesquisa: TDataSource;
    btnVoltar: TButton;
    btnPesquisar: TButton;
    btnGravar: TButton;
    btnExcluir: TButton;
    relItens: TfrxDBDataset;
    frxReportItens: TfrxReport;
    btnImprimir: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    FAcao: TAcao;
    procedure PesquisarPelaDescricao;
    procedure InicializarTela;
    procedure CarregarItem;
    procedure AtualizarItem;
    procedure ExcluirItem;
    procedure InserirItem;
    procedure ImprimirItens;
  public
  end;

var
  frmCadastroItem: TfrmCadastroItem;

implementation

{$R *.dfm}

{ TfrmCadastroProduto }

procedure TfrmCadastroItem.AtualizarItem;
var
  oItem: TItemModel;
  oItemController: TItemController;
  sMsg: String;
begin
  oItem := TItemModel.Create;
  oItemController := TItemController.Create;

  oItem.ID := StrToInt(edtCodigo.Text);
  oItem.Descricao := edtDescricao.Text;

  if Not oItemController.ValidarDadosObrigatorios(oItem, sMsg) then begin
    MessageDlg(sMsg, mtInformation, [mbOk], 0);
    Exit;
  end;

  try
    if oItemController.Atualizar(oItem, sMsg) then begin
      MessageDlg('Item alterado com sucesso!', mtInformation, [mbOk], 0);
    end else begin
      MessageDlg(sMsg, mtError, [mbOk], 0);
    end;
  finally
    FreeAndNil(oItem);
    FreeAndNil(oItemController);
  end;
end;

procedure TfrmCadastroItem.btnAlterarClick(Sender: TObject);
begin
  FAcao := actAtualizar;
  CarregarItem();
end;

procedure TfrmCadastroItem.btnExcluirClick(Sender: TObject);
var
  oPedidoItemController: TPedidoItemController;
begin
  if MessageDlg('Deseja mesmo excluir o item '+
    dsPesquisa.DataSet.FieldByName('desc_item').AsString+'?',
    mtConfirmation, [mbyes, mbno], 0) = mrYes then begin
    oPedidoItemController := TPedidoItemController.Create;
    try
      if oPedidoItemController.ExisteVendaDoItem(
        dsPesquisa.DataSet.FieldByName('id_item').AsInteger) then begin
        MessageDlg('O item n�o pode ser exclu�do pois existem vendas do mesmo!',
          mtInformation, [mbok], 0);
        Exit;
      end;
    finally
      FreeAndNil(oPedidoItemController);
    end;
    ExcluirItem();
  end;
end;

procedure TfrmCadastroItem.btnGravarClick(Sender: TObject);
begin
  if FAcao = actInserir then begin
    InserirItem();
  end else if FAcao = actAtualizar then begin
    AtualizarItem();
  end;
end;

procedure TfrmCadastroItem.btnImprimirClick(Sender: TObject);
begin
  ImprimirItens();
end;

procedure TfrmCadastroItem.btnNovoClick(Sender: TObject);
begin
  FAcao := actInserir;
  pgCadastroProduto.ActivePage := tbManutencao;
  edtCodigo.Clear;
  edtDescricao.Clear;
  edtDescricao.SetFocus;
end;

procedure TfrmCadastroItem.btnPesquisarClick(Sender: TObject);
begin
  PesquisarPelaDescricao();
end;

procedure TfrmCadastroItem.btnVoltarClick(Sender: TObject);
begin
  pgCadastroProduto.ActivePage := tbPesquisa;
  PesquisarPelaDescricao();
end;

procedure TfrmCadastroItem.CarregarItem;
var
  oItem: TItemModel;
  oItemController: TItemController;
begin
  oItem := TItemModel.Create;
  oItemController := TItemController.Create;
  try
    oItemController.Carregar(oItem, dsPesquisa.DataSet.FieldByName('id_item').AsInteger);
    edtCodigo.Text := IntToStr(oItem.ID);
    edtDescricao.Text := oItem.Descricao;
    pgCadastroProduto.ActivePage := tbManutencao;
  finally
    FreeAndNil(oItem);
    FreeAndNil(oItemController);
  end;
end;

procedure TfrmCadastroItem.ImprimirItens;
begin
  frxReportItens.PrepareReport;
  frxReportItens.ShowPreparedReport;
end;

procedure TfrmCadastroItem.InicializarTela;
begin
  tbPesquisa.TabVisible := False;
  tbManutencao.TabVisible := False;
  pgCadastroProduto.ActivePage := tbPesquisa;
  PesquisarPelaDescricao();
end;

procedure TfrmCadastroItem.ExcluirItem;
var
  oItemController: TItemController;
  sMsg: String;
begin
  oItemController := TItemController.Create;
  try
    if oItemController.Excluir(dsPesquisa.DataSet.FieldByName('id_item').AsInteger, sMsg) then begin
      MessageDlg('Item exclu�do com sucesso!', mtInformation, [mbok], 0);
      edtPesquisa.Clear;
      PesquisarPelaDescricao();
    end else begin
      MessageDlg(sMsg, mtError, [mbok], 0);
    end;
  finally
    FreeAndNil(oItemController);
  end;
end;

procedure TfrmCadastroItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmCadastroItem := nil;
end;

procedure TfrmCadastroItem.FormCreate(Sender: TObject);
begin
  DmItem := TDmItem.Create(nil);
end;

procedure TfrmCadastroItem.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DmItem);
end;

procedure TfrmCadastroItem.FormShow(Sender: TObject);
begin
  InicializarTela();
end;

procedure TfrmCadastroItem.InserirItem;
var
  oItem: TItemModel;
  oItemController: TItemController;
  sMsg: String;
begin
  oItem := TItemModel.Create;
  oItemController := TItemController.Create;

  oItem.Descricao := edtDescricao.Text;

  if Not oItemController.ValidarDadosObrigatorios(oItem, sMsg) then begin
    MessageDlg(sMsg, mtInformation, [mbOk], 0);
    Exit;
  end;

  try
    if oItemController.Inserir(oItem, sMsg) then begin
      MessageDlg('Item gravado com sucesso!', mtInformation, [mbOk], 0);
      pgCadastroProduto.ActivePage := tbPesquisa;
      PesquisarPelaDescricao;
    end else begin
      MessageDlg(sMsg, mtError, [mbOk], 0);
    end;
  finally
    FreeAndNil(oItem);
    FreeAndNil(oItemController);
  end;
end;

procedure TfrmCadastroItem.PesquisarPelaDescricao;
var
  oItemController: TItemController;
begin
  oItemController := TItemController.Create;
  try
    oItemController.PesquisarPelaDescricao(edtPesquisa.Text);
  finally
    FreeAndNil(oItemController);
  end;
end;

end.

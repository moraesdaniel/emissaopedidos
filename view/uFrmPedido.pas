unit uFrmPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, System.Math,
  uDmItem, uItemController, System.Generics.Collections, uItemModel, uFuncoes;

type
  TfrmPedido = class(TForm)
    PageControl1: TPageControl;
    tbPesquisa: TTabSheet;
    tbPedido: TTabSheet;
    Panel2: TPanel;
    Panel1: TPanel;
    btnPesquisar: TButton;
    edtPesquisa: TLabeledEdit;
    DBGrid1: TDBGrid;
    btnNovo: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    pnlDigitacaoItem: TPanel;
    btnIncluir: TButton;
    edtQuantidade: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    edtValorUnitario: TEdit;
    pnlCabecalho: TPanel;
    Label2: TLabel;
    edtNumero: TLabeledEdit;
    dtpData: TDateTimePicker;
    btnIniciar: TButton;
    edtCliente: TLabeledEdit;
    pnlRodape: TPanel;
    cbxItem: TComboBox;
    btnCancelar: TButton;
    btnGravar: TButton;
    Edit1: TEdit;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure edtValorUnitarioChange(Sender: TObject);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    FFormatando: Boolean;
    oFuncoes: TFuncoes;
    procedure CarregarItens;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

procedure TfrmPedido.edtQuantidadeChange(Sender: TObject);
begin
  if Not FFormatando then begin
    FFormatando := True;
    edtQuantidade.Text := oFuncoes.FormatarMoeda(edtQuantidade.Text);
    edtQuantidade.SelStart := Length(edtQuantidade.Text);
    FFormatando := False;
  end;
end;

procedure TfrmPedido.edtValorUnitarioChange(Sender: TObject);
begin
  if Not FFormatando then begin
    FFormatando := True;
    edtValorUnitario.Text := oFuncoes.FormatarMoeda(edtValorUnitario.Text);
    edtValorUnitario.SelStart := Length(edtValorUnitario.Text);
    FFormatando := False;
  end;
end;

procedure TfrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(oFuncoes);
  Action := caFree;
  frmPedido := nil;
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  oFuncoes := TFuncoes.Create;
  CarregarItens;
end;

procedure TfrmPedido.CarregarItens;
var
  oItemController: TItemController;
  listaItens: TObjectList<TItemModel>;
  oItemModel: TItemModel;
begin
  DmItem := TDmItem.Create(nil);
  listaItens := TObjectList<TItemModel>.Create;
  oItemController := TItemController.Create;
  try
    oItemController.BuscarItensCadastrados(listaItens);
    cbxItem.Items.Clear;
    cbxItem.Items.Add('<Nenhum>');
    for oItemModel in listaItens do
      cbxItem.Items.Add(oItemModel.Descricao);
    cbxItem.ItemIndex := 0;
  finally
    FreeAndNil(oItemController);
    FreeAndNil(listaItens);
    FreeAndNil(DmItem);
  end;
end;

procedure TfrmPedido.edtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

end.

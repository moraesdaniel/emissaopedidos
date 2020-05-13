unit uFrmPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, System.Math, System.StrUtils,
  uDmItem, uItemController, System.Generics.Collections, uItemModel, uFuncoes,
  System.ImageList, Vcl.ImgList, uDmPedidoCab, uPedidoCabModel, uPedidoItemModel;

type
  TAcao = (actNovo, actAlterar);

  TfrmPedido = class(TForm)
    pgPedido: TPageControl;
    tbPesquisa: TTabSheet;
    tbPedido: TTabSheet;
    Panel2: TPanel;
    Panel1: TPanel;
    btnPesquisar: TButton;
    edtPesquisa: TLabeledEdit;
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
    edtCliente: TLabeledEdit;
    pnlRodape: TPanel;
    cbxItem: TComboBox;
    btnCancelar: TButton;
    btnGravar: TButton;
    edtValorTotalPedido: TEdit;
    Label4: TLabel;
    edtValorTotalItem: TEdit;
    Label5: TLabel;
    strgridItens: TStringGrid;
    imgList: TImageList;
    strgridPedidos: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure edtValorUnitarioChange(Sender: TObject);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure AtualizarValorTotalItem;
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtValorUnitarioExit(Sender: TObject);
    procedure strgridItensDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure strgridItensSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnGravarClick(Sender: TObject);
  private
    FFormatando: Boolean;
    oFuncoes: TFuncoes;
    oPedidoCabModel: TPedidoCabModel;
    iContProd: Integer;
    procedure CarregarItens;
    procedure ConfigurarGridItens;
    procedure ConfigurarGridPedidos;
    procedure IniciarNovoPedido;
    procedure InicializarTela;
    procedure IncluirItemNoPedido;
    procedure AtualizarItensPedidoTela;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;
  listaItens: TObjectList<TItemModel>;
  oAcao: TAcao;

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

procedure TfrmPedido.edtQuantidadeExit(Sender: TObject);
begin
  AtualizarValorTotalItem();
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

procedure TfrmPedido.edtValorUnitarioExit(Sender: TObject);
begin
  AtualizarValorTotalItem();
end;

procedure TfrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(oFuncoes);
  Action := caFree;
  frmPedido := nil;
end;

procedure TfrmPedido.FormCreate(Sender: TObject);
begin
  ConfigurarGridItens;
  ConfigurarGridPedidos;
  DmPedidoCab := TDmPedidoCab.Create(nil);
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  oFuncoes := TFuncoes.Create;
  InicializarTela();
end;

procedure TfrmPedido.IncluirItemNoPedido;
var
  oPedidoItem: TPedidoItemModel;
begin
  oPedidoItem := TPedidoItemModel.Create;
  oPedidoItem.IDItem := listaItens[cbxItem.ItemIndex - 1].ID;
  oPedidoItem.Descricao := listaItens[cbxItem.ItemIndex - 1].Descricao;
  oPedidoItem.Quantidade := StrToFloat(ReplaceStr(edtQuantidade.Text, '.', ''));
  oPedidoItem.ValorUnitario := StrToFloat(ReplaceStr(edtValorUnitario.Text, '.', ''));
  try
    if oPedidoCabModel.AdicionarItem(oPedidoItem) >= 0 then begin
      cbxItem.ItemIndex := 0;
      edtQuantidade.Text := '0,00';
      edtValorUnitario.Text := '0,00';
      edtValorTotalItem.Text := '0,00';
      cbxItem.SetFocus;
    end else begin
      MessageDlg('Não foi possível adicionar este item!', mtWarning, [mbok], 0);
    end;
  finally
    FreeAndNil(oPedidoItem);
  end;
end;

procedure TfrmPedido.InicializarTela;
begin
  tbPesquisa.TabVisible := False;
  tbPedido.TabVisible := False;
  pgPedido.ActivePage := tbPesquisa;
end;

procedure TfrmPedido.IniciarNovoPedido;
begin
  edtNumero.Text := '';
  dtpData.Date := Date;
  edtCliente.Text := '';
  CarregarItens();
  edtQuantidade.Text := '0,00';
  edtValorUnitario.Text := '0,00';
  edtValorTotalItem.Text := '0,00';
  edtValorTotalPedido.Text := '0,00';
  strgridItens.RowCount := 1;
  edtNumero.SetFocus;
  if Assigned(oPedidoCabModel) then
    FreeAndNil(oPedidoCabModel);
  oPedidoCabModel := TPedidoCabModel.Create;
end;

procedure TfrmPedido.strgridItensDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  oBMP: TBitmap;
  iEixoX, iEixoY: Integer;
begin
  if (ARow <> 0) And (ACol in [5,6]) then begin
    oBMP := TBitmap.Create;
    try
      if ACol = 5 then
        imgList.GetBitmap(0, oBMP)
      else
        imgList.GetBitmap(1, oBMP);
      iEixoX := Rect.Left + ((Rect.Right - Rect.Left) - oBMP.Width) div 2;
      iEixoY := Rect.Top + ((Rect.Bottom - Rect.Top) - oBMP.Height) div 2;
      strgridItens.Canvas.Draw(iEixoX,iEixoY, oBMP);
    finally
      FreeAndNil(oBMP);
    end;
  end;
end;

procedure TfrmPedido.strgridItensSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if (ARow <> 0) And (ACol = 6) then begin
    if MessageDlg('Deseja excluir o item'+sLineBreak+strgridItens.Cells[1, aRow]+'?',
      mtConfirmation, [mbyes,mbno], 0) = mrYes then begin

    end;
  end;
end;

procedure TfrmPedido.AtualizarItensPedidoTela;
var
  iNovaLinha, iCont: Integer;
  dValorTotalItem: Double;
begin
  strgridItens.RowCount := 1;
  for iCont := 0 to oPedidoCabModel.ListaItensPedido.Count - 1 do begin
    iNovaLinha := strgridItens.RowCount;
    strgridItens.RowCount := strgridItens.RowCount + 1;
    strgridItens.Cells[0, iNovaLinha] := IntToStr(oPedidoCabModel.ListaItensPedido[iCont].IDItem);
    strgridItens.Cells[1, iNovaLinha] := oPedidoCabModel.ListaItensPedido[iCont].Descricao;
    strgridItens.Cells[2, iNovaLinha] := FloatToStrF(oPedidoCabModel.ListaItensPedido[iCont].Quantidade, ffNumber, 11, 2);
    strgridItens.Cells[3, iNovaLinha] := FloatToStrF(oPedidoCabModel.ListaItensPedido[iCont].ValorUnitario, ffNumber, 11, 2);
    dValorTotalItem := oPedidoCabModel.ListaItensPedido[iCont].Quantidade * oPedidoCabModel.ListaItensPedido[iCont].ValorUnitario;
    dValorTotalItem := SimpleRoundTo(dValorTotalItem, -2);
    strgridItens.Cells[4, iNovaLinha] := FloatToStrF(dValorTotalItem, ffNumber, 11, 2);
  end;
end;

procedure TfrmPedido.AtualizarValorTotalItem;
var
  dQuantidade, dValorUnitario, dValorTotal: Double;
begin
  dQuantidade := StrToFloat(ReplaceStr(edtQuantidade.Text, '.', ''));
  dValorUnitario := StrToFloat(ReplaceStr(edtValorUnitario.Text, '.', ''));
  dValorTotal := SimpleRoundTo(dQuantidade * dValorUnitario, -2);
  edtValorTotalItem.Text := FloatToStrF(dValorTotal, ffNumber, 11, 2);
end;

procedure TfrmPedido.btnAlterarClick(Sender: TObject);
begin
  oAcao := actAlterar;
end;

procedure TfrmPedido.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a digitação do pedido e perder os dados que'+
    ' não foram salvos?', mtConfirmation, [mbyes,mbno], 0) = mryes then
  pgPedido.ActivePage := tbPesquisa;
end;

procedure TfrmPedido.btnGravarClick(Sender: TObject);
var
  iContador: Integer;
  sMsg: String;
begin
  sMsg := '';
  for iContador := 0 to oPedidoCabModel.ListaItensPedido.Count - 1  do begin
    sMsg := sMsg + IntToStr(oPedidoCabModel.ListaItensPedido[iContador].IDItem)+'/';
  end;
  ShowMessage(sMsg);
end;

procedure TfrmPedido.btnIncluirClick(Sender: TObject);
begin
  IncluirItemNoPedido();
  AtualizarItensPedidoTela();
end;

procedure TfrmPedido.btnNovoClick(Sender: TObject);
begin
  oAcao := actNovo;
  pgPedido.ActivePage := tbPedido;
  IniciarNovoPedido();
end;

procedure TfrmPedido.CarregarItens;
var
  oItemController: TItemController;
  oItemModel: TItemModel;
begin
  DmItem := TDmItem.Create(nil);

  if not Assigned(listaItens) then begin
    listaItens := TObjectList<TItemModel>.Create;
  end;
  listaItens.Clear;

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
    FreeAndNil(DmItem);
  end;
end;

procedure TfrmPedido.ConfigurarGridItens;
begin
  strgridItens.Cells[0, 0] := 'Código';
  strgridItens.ColWidths[0] := 50;
  strgridItens.Cells[1, 0] := 'Descrição';
  strgridItens.ColWidths[1] := 300;
  strgridItens.Cells[2, 0] := 'Quantidade';
  strgridItens.Cells[3, 0] := 'Vlr. Unitário';
  strgridItens.Cells[4, 0] := 'Vlr. Total';
  strgridItens.ColWidths[5] := 25;
  strgridItens.ColWidths[6] := 25;
end;

procedure TfrmPedido.ConfigurarGridPedidos;
begin
  strgridPedidos.Cells[0, 0] := 'Código';
  strgridPedidos.Cells[1, 0] := 'Número';
  strgridPedidos.Cells[2, 0] := 'Cliente';
  strgridPedidos.ColWidths[2] := 500;
end;

procedure TfrmPedido.edtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

end.

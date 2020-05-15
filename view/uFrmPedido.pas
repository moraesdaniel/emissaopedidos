unit uFrmPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, System.Math, System.StrUtils,
  uDmItem, uItemController, System.Generics.Collections, uItemModel, uFuncoes,
  System.ImageList, Vcl.ImgList, uDmPedidoCab, uPedidoCabModel, uPedidoItemModel,
  uPedidoCabController, uDmPedidoItem, uPedidoItemController;

type
  TAcao = (actNovoPedido, actAlterarPedido, actAlterarItem, actInserirItem);

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
    btnIncluirAlterar: TButton;
    edtQuantidade: TEdit;
    lblQuantidade: TLabel;
    lblValorUnitario: TLabel;
    edtValorUnitario: TEdit;
    pnlCabecalho: TPanel;
    lblData: TLabel;
    edtNumero: TLabeledEdit;
    dtpData: TDateTimePicker;
    edtCliente: TLabeledEdit;
    pnlRodape: TPanel;
    cbxItem: TComboBox;
    btnCancelar: TButton;
    btnGravar: TButton;
    edtValorTotalPedido: TEdit;
    lblItem: TLabel;
    edtValorTotalItem: TEdit;
    lblValorTotalItem: TLabel;
    strgridItens: TStringGrid;
    imgList: TImageList;
    strgridPedidos: TStringGrid;
    btnCancelarItem: TButton;
    lblValorTotalPedido: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure edtValorUnitarioChange(Sender: TObject);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtValorUnitarioExit(Sender: TObject);
    procedure strgridItensDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnIncluirAlterarClick(Sender: TObject);
    procedure strgridItensSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    FFormatando: Boolean;
    oFuncoes: TFuncoes;
    oPedidoCabModel: TPedidoCabModel;
    iContProd: Integer;
    procedure CarregarItensCadastrados;
    procedure ConfigurarGridItens;
    procedure ConfigurarGridPedidos;
    procedure IniciarNovoPedido;
    procedure InicializarTela;
    procedure IncluirItemNoPedido;
    procedure AtualizarItensPedidoTela;
    procedure LimparPainelDigitacaoItem;
    procedure LimparPainelCabecalho;
    procedure AlterarItemNoPedido;
    function BuscarCadastroItem(iIdItem: Integer) : Integer;
    function CalcularValorTotalItem() : Double;
    procedure InserirPedido;
    procedure AtualizarPedido;
    function ValidarDadosPedido: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;
  listaItens: TObjectList<TItemModel>;
  oAcao, oAcaoItem: TAcao;

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
  edtValorTotalItem.Text := FloatToStrF(CalcularValorTotalItem, ffNumber, 11, 2);
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
  edtValorTotalItem.Text := FloatToStrF(CalcularValorTotalItem, ffNumber, 11, 2);
end;

procedure TfrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPedido := nil;
end;

procedure TfrmPedido.FormCreate(Sender: TObject);
begin
  oFuncoes := TFuncoes.Create;
  DmPedidoCab := TDmPedidoCab.Create(nil);
  DmPedidoItem := TDmPedidoItem.Create(nil);
end;

procedure TfrmPedido.FormDestroy(Sender: TObject);
begin
  FreeAndNil(oFuncoes);
  FreeAndNil(DmPedidoCab);
  FreeAndNil(DmPedidoItem);
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  ConfigurarGridItens;
  ConfigurarGridPedidos;
  InicializarTela();
end;

procedure TfrmPedido.InicializarTela;
begin
  tbPesquisa.TabVisible := False;
  tbPedido.TabVisible := False;
  pgPedido.ActivePage := tbPesquisa;
end;

procedure TfrmPedido.IncluirItemNoPedido;
var
  oPedidoItem: TPedidoItemModel;
  sMsg: String;
begin
  oPedidoItem := TPedidoItemModel.Create;
  oPedidoItem.IDItem := listaItens[cbxItem.ItemIndex - 1].ID;
  oPedidoItem.Descricao := listaItens[cbxItem.ItemIndex - 1].Descricao;
  oPedidoItem.Quantidade := StrToFloat(ReplaceStr(edtQuantidade.Text, '.', ''));
  oPedidoItem.ValorUnitario := StrToFloat(ReplaceStr(edtValorUnitario.Text, '.', ''));

  try
    if oPedidoItem.ValidarDadosObrigatorios(sMsg) < 0 then begin
      MessageDlg(sMsg, mtWarning, [mbok], 0);
      Exit;
    end;

    if oPedidoCabModel.AdicionarItem(oPedidoItem) >= 0 then begin
      LimparPainelDigitacaoItem();
      cbxItem.SetFocus;
      edtValorTotalPedido.Text := FloatToStrF(oPedidoCabModel.ValorTotalPedido, ffNumber, 11, 2);
    end else begin
      MessageDlg('Não foi possível adicionar este item!', mtWarning, [mbok], 0);
    end;
  finally
    FreeAndNil(oPedidoItem);
  end;
end;

procedure TfrmPedido.LimparPainelCabecalho;
begin
  edtNumero.Text := '';
  dtpData.Date := Date;
  edtCliente.Text := '';
end;

procedure TfrmPedido.LimparPainelDigitacaoItem;
begin
  cbxItem.Enabled := True;
  cbxItem.ItemIndex := 0;
  edtQuantidade.Text := '0,00';
  edtValorUnitario.Text := '0,00';
  edtValorTotalItem.Text := '0,00';
  btnIncluirAlterar.Caption := '&Incluir';
  strgridItens.Enabled := True;
end;

procedure TfrmPedido.IniciarNovoPedido;
var
  oPedidoCabController: TPedidoCabController;
begin
  LimparPainelCabecalho();
  LimparPainelDigitacaoItem();
  CarregarItensCadastrados();
  edtValorTotalPedido.Text := '0,00';
  strgridItens.RowCount := 1;
  edtNumero.SetFocus;
  if Assigned(oPedidoCabModel) then
    FreeAndNil(oPedidoCabModel);
  oPedidoCabModel := TPedidoCabModel.Create;

  oPedidoCabController := TPedidoCabController.Create;
  try
    oPedidoCabModel.IDPed := oPedidoCabController.GetCodigoNovoPedido();
  finally
    FreeAndNil(oPedidoCabController);
  end;
end;

procedure TfrmPedido.InserirPedido;
var
  sMsg: String;
  oPedidoCabController: TPedidoCabController;
begin
  if ValidarDadosPedido() = -1 then begin
    Exit;
  end;

  oPedidoCabController := TPedidoCabController.Create;

  try
    if oPedidoCabController.Inserir(oPedidoCabModel, sMsg) then begin
      pgPedido.ActivePage := tbPesquisa;
      MessageDlg('Pedido salvo com sucesso!', mtInformation, [mbok], 0);
    end else begin
      MessageDlg(sMsg, mtError, [mbok], 0);
    end;
  finally
    FreeAndNil(oPedidoCabController);
  end;
end;

procedure TfrmPedido.strgridItensDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  oBMP: TBitmap;
  iEixoX, iEixoY: Integer;
begin
  //Incluindo imagens nas colunas que servirão como botões
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
var
  iIndiceItem: Integer;
begin
  if (ARow <> 0) then begin
    //Botão alteração
    if (ACol = 5) then begin
      iIndiceItem := BuscarCadastroItem(StrToInt(strgridItens.Cells[0, ARow]));
      if (iIndiceItem >= 0) then begin
        cbxItem.ItemIndex := iIndiceItem + 1;
        cbxItem.Enabled := False;
        edtQuantidade.Text := strgridItens.Cells[2, ARow];
        edtValorUnitario.Text := strgridItens.Cells[3, ARow];
        edtValorTotalItem.Text := FloatToStrF(CalcularValorTotalItem, ffNumber, 11, 2);
        strgridItens.Enabled := False;
        btnIncluirAlterar.Caption := 'A&lterar';
        edtQuantidade.SetFocus;
        oAcaoItem := actAlterarItem;
      end;
    end;

    //Botão exclusão
    if (ACol = 6) then begin
      if MessageDlg('Deseja excluir o item'+sLineBreak+strgridItens.Cells[1, aRow]+'?',
        mtConfirmation, [mbyes,mbno], 0) = mrYes then begin
        oPedidoCabModel.RemoverItem(StrToInt(strgridItens.Cells[0, ARow]));
        AtualizarItensPedidoTela();
        edtValorTotalPedido.Text := FloatToStrF(oPedidoCabModel.ValorTotalPedido, ffNumber, 11, 2);
      end;
    end;
  end;
end;

function TfrmPedido.ValidarDadosPedido: Integer;
var
  sMsg: String;
begin
  if Trim(edtNumero.Text) = '' then begin
    MessageDlg('Por favor, informe o número do pedido!', mtWarning, [mbok], 0);
    Result := -1;
    Exit;
  end;

  oPedidoCabModel.Numero := StrToInt(edtNumero.Text);
  oPedidoCabModel.DtEmissao := dtpData.Date;
  oPedidoCabModel.Cliente := edtCliente.Text;

  if oPedidoCabModel.ValidarDados(sMsg) = -1 then begin
    MessageDlg(sMsg, mtWarning, [mbok], 0);
    Result := -1;
    Exit;
  end;
end;

procedure TfrmPedido.AlterarItemNoPedido;
var
  oPedidoItem: TPedidoItemModel;
  sMsg: String;
begin
  oPedidoItem := TPedidoItemModel.Create;
  oPedidoItem.IDItem := listaItens[cbxItem.ItemIndex - 1].ID;
  oPedidoItem.Quantidade := StrToFloat(ReplaceStr(edtQuantidade.Text, '.', ''));
  oPedidoItem.ValorUnitario := StrToFloat(ReplaceStr(edtValorUnitario.Text, '.', ''));

  try
    if oPedidoItem.ValidarDadosObrigatorios(sMsg) < 0 then begin
      MessageDlg(sMsg, mtWarning, [mbok], 0);
      Exit;
    end;

    if oPedidoCabModel.AlterarItem(oPedidoItem) >= 0 then begin
      LimparPainelDigitacaoItem();
      cbxItem.SetFocus;
      edtValorTotalPedido.Text := FloatToStrF(oPedidoCabModel.ValorTotalPedido, ffNumber, 11, 2);
    end else begin
      MessageDlg('Não foi possível alterar este item!', mtWarning, [mbok], 0);
    end;
  finally
    FreeAndNil(oPedidoItem);
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

procedure TfrmPedido.AtualizarPedido;
var
  sMsg: String;
  oPedidoCabController: TPedidoCabController;
begin
  if ValidarDadosPedido() = -1 then begin
    Exit;
  end;

  oPedidoCabController := TPedidoCabController.Create;

  try
    if oPedidoCabController.Atualizar(oPedidoCabModel, sMsg) then begin
      pgPedido.ActivePage := tbPesquisa;
      MessageDlg('Pedido salvo com sucesso!', mtInformation, [mbok], 0);
    end else begin
      MessageDlg(sMsg, mtError, [mbok], 0);
    end;
  finally
    FreeAndNil(oPedidoCabController);
  end;
end;

procedure TfrmPedido.btnAlterarClick(Sender: TObject);
begin
  oAcao := actAlterarPedido;
end;

procedure TfrmPedido.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a digitação do pedido e perder os dados que'+
    ' não foram salvos?', mtConfirmation, [mbyes,mbno], 0) = mryes then
  FreeAndNil(oPedidoCabModel);
  pgPedido.ActivePage := tbPesquisa;
end;

procedure TfrmPedido.btnCancelarItemClick(Sender: TObject);
begin
  LimparPainelDigitacaoItem();
  cbxItem.SetFocus;
  oAcaoItem := actInserirItem;
end;

procedure TfrmPedido.btnGravarClick(Sender: TObject);
begin
  if oAcao = actNovoPedido then begin
    InserirPedido();
  end else begin
    AtualizarPedido();
  end;
end;

procedure TfrmPedido.btnIncluirAlterarClick(Sender: TObject);
begin
  if oAcaoItem = actAlterarItem then begin
    AlterarItemNoPedido();
  end else begin
    if cbxItem.ItemIndex < 1 then begin
      MessageDlg('Selecione um item para continuar!', mtWarning, [mbok], 0);
      Exit;
    end;

    if oPedidoCabModel.BuscarItemNoPedido(listaItens[cbxItem.ItemIndex - 1].ID) >= 0 then begin
      if MessageDlg('Este item já está no pedido, deseja alterá-lo?', mtConfirmation, [mbyes,mbno], 0) = mrYes then begin
        AlterarItemNoPedido();
      end;
    end else begin
      IncluirItemNoPedido();
    end;
  end;

  AtualizarItensPedidoTela();

  oAcaoItem := actInserirItem;
end;

procedure TfrmPedido.btnNovoClick(Sender: TObject);
begin
  oAcao := actNovoPedido;
  pgPedido.ActivePage := tbPedido;
  IniciarNovoPedido();
end;

function TfrmPedido.BuscarCadastroItem(iIdItem: Integer): Integer;
var
  iIndice: Integer;
begin
  Result := -1;
  for iIndice := 0 to listaItens.Count - 1 do begin
    if (listaItens[iIndice].ID = iIdItem) then begin
      Result := iIndice;
      Exit;
    end;
  end;
end;

function TfrmPedido.CalcularValorTotalItem: Double;
var
  dQuantidade, dValorUnitario: Double;
begin
  dQuantidade := StrToFloat(ReplaceStr(edtQuantidade.Text, '.', ''));
  dValorUnitario := StrToFloat(ReplaceStr(edtValorUnitario.Text, '.', ''));
  Result := dQuantidade * dValorUnitario;
end;

procedure TfrmPedido.CarregarItensCadastrados;
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

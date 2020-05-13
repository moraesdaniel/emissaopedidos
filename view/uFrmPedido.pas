unit uFrmPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, System.Math, System.StrUtils,
  uDmItem, uItemController, System.Generics.Collections, uItemModel, uFuncoes,
  System.ImageList, Vcl.ImgList;

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
    edtValorTotalItem: TEdit;
    Label5: TLabel;
    strgridItens: TStringGrid;
    imgList: TImageList;
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
  private
    FFormatando: Boolean;
    oFuncoes: TFuncoes;
    procedure CarregarItens;
    procedure ConfigurarGridItens;
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

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  oFuncoes := TFuncoes.Create;
  CarregarItens;
  ConfigurarGridItens;
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

procedure TfrmPedido.AtualizarValorTotalItem;
var
  dQuantidade, dValorUnitario, dValorTotal: Double;
begin
  dQuantidade := StrToFloat(ReplaceStr(edtQuantidade.Text, '.', ''));
  dValorUnitario := StrToFloat(ReplaceStr(edtValorUnitario.Text, '.', ''));
  dValorTotal := SimpleRoundTo(dQuantidade * dValorUnitario, -2);
  edtValorTotalItem.Text := FloatToStrF(dValorTotal, ffNumber, 11, 2);
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

procedure TfrmPedido.edtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

end.

unit uFrmPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, System.StrUtils, System.Math;

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
    edtItem: TLabeledEdit;
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
    ComboBox1: TComboBox;
    btnCancelar: TButton;
    btnGravar: TButton;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure edtValorUnitarioChange(Sender: TObject);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
  private
    FFormatando: Boolean;
    { Private declarations }
  public
    { Public declarations }
    function FormatarMoeda(sValor: String) : String;
  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

procedure TfrmPedido.edtQuantidadeChange(Sender: TObject);
begin
  if Not FFormatando then begin
    FFormatando := True;
    edtQuantidade.Text := FormatarMoeda(edtQuantidade.Text);
    edtQuantidade.SelStart := Length(edtQuantidade.Text);
    FFormatando := False;
  end;
end;

procedure TfrmPedido.edtValorUnitarioChange(Sender: TObject);
begin
  if Not FFormatando then begin
    FFormatando := True;
    edtValorUnitario.Text := FormatarMoeda(edtValorUnitario.Text);
    edtValorUnitario.SelStart := Length(edtValorUnitario.Text);
    FFormatando := False;
  end;
end;

function TfrmPedido.FormatarMoeda(sValor: String) : String;
var
  iPosicao: Integer;
  sDecimal, sCentena, sMilhar, sMilhao: String;
begin
  //Removendo caracteres especiais
  for iPosicao := 1 to Length(sValor) do
    if not (sValor[iPosicao] in ['0'..'9']) then
      Delete(sValor, iPosicao, 1);

  //Removendo zeros a esquerda
  while (Copy(sValor, 1, 1) = '0') and (Length(sValor) > 0) do begin
    sValor := RightStr(sValor, Length(sValor) - 1);
  end;

  if Length(sValor) = 0 then begin
    sValor := '0,00';
  end else if Length(sValor) = 1 then begin
    sValor := '0,0'+sValor;
  end else if Length(sValor) = 2 then begin
    sValor := '0,'+sValor;
  end else begin
    sValor := DupeString(' ', 11 - Length(sValor))+sValor;
    sMilhao := IfThen(Copy(sValor, 1, 3) <> '   ', Trim(Copy(sValor, 1, 3))+'.');
    sMilhar := IfThen(Copy(sValor, 4, 3) <> '   ', Trim(Copy(sValor, 4, 3))+'.');
    sCentena := IfThen(Copy(sValor, 7, 3) <> '   ', Trim(Copy(sValor, 7, 3))+',');
    sDecimal := Copy(sValor, 10, 2);
    sValor := sMilhao+sMilhar+sCentena+sDecimal
  end;

  Result := sValor;
end;

procedure TfrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPedido := nil;
end;

procedure TfrmPedido.edtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

end.

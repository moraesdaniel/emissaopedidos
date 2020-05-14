unit uPedidoCabModel;

interface

uses
  System.Generics.Collections, uPedidoItemModel, System.SysUtils, System.Math;

type
  TPedidoCabModel = class
  private
    FIDPed: Integer;
    FDtEmissao: TDate;
    FNumero: Integer;
    FCliente: String;
    FListaItensPedido: TObjectList<TPedidoItemModel>;
    FValorTotalPedido: Double;
    procedure ReordenarSequenciaItens;
    procedure AtualizarValorTotalPedido;
  public
    constructor Create;
    destructor Destroy; override;
    function AdicionarItem(oPedidoItem: TPedidoItemModel) : Integer;
    function RemoverItem(iIdItem: Integer) : Integer;
    function BuscarItemNoPedido(iIdItem: Integer) : Integer;
    function AlterarItem(oPedidoItem: TPedidoItemModel) : Integer;
  published
    property IDPed: Integer read FIDPed write FIDPed;
    property DtEmissao: TDate read FDtEmissao write FDtEmissao;
    property Numero: Integer read FNumero write FNumero;
    property Cliente: String read FCliente write FCliente;
    property ListaItensPedido: TObjectList<TPedidoItemModel>
      read FListaItensPedido write FListaItensPedido;
    property ValorTotalPedido: double read FValorTotalPedido
      write FValorTotalPedido;
  end;

implementation

uses
  Winapi.Windows, Vcl.Dialogs;

{ TPedidoCabModel }

function TPedidoCabModel.AdicionarItem(oPedidoItem: TPedidoItemModel): Integer;
var
  iIndice: Integer;
begin
  FListaItensPedido.Add(TPedidoItemModel.Create);
  iIndice := FListaItensPedido.Count - 1;
  FListaItensPedido[iIndice].IDPed := FIDPed;
  FListaItensPedido[iIndice].IDItemSeq := iIndice + 1;
  FListaItensPedido[iIndice].IDItem := oPedidoItem.IDItem;
  FListaItensPedido[iIndice].Descricao := oPedidoItem.Descricao;
  FListaItensPedido[iIndice].Quantidade := oPedidoItem.Quantidade;
  FListaItensPedido[iIndice].ValorUnitario := oPedidoItem.ValorUnitario;
  AtualizarValorTotalPedido();
  Result := FListaItensPedido.Count;
end;

procedure TPedidoCabModel.ReordenarSequenciaItens;
var
  iCont: Integer;
begin
  for iCont := 0 to FListaItensPedido.Count - 1 do
    FListaItensPedido[iCont].IDItemSeq := iCont + 1;
end;

function TPedidoCabModel.AlterarItem(oPedidoItem: TPedidoItemModel): Integer;
var
  iIndice: Integer;
begin
  iIndice := BuscarItemNoPedido(oPedidoItem.IDItem);
  FListaItensPedido[iIndice].Quantidade := oPedidoItem.Quantidade;
  FListaItensPedido[iIndice].ValorUnitario := oPedidoItem.ValorUnitario;
  AtualizarValorTotalPedido();
  Result := iIndice;
end;

procedure TPedidoCabModel.AtualizarValorTotalPedido;
var
  iCont: Integer;
  dAuxiliar: Double;
begin
  FValorTotalPedido := 0;
  for iCont := 0 to FListaItensPedido.Count - 1 do begin
    dAuxiliar := FListaItensPedido[iCont].Quantidade *
      FListaItensPedido[iCont].ValorUnitario;
    dAuxiliar := SimpleRoundTo(dAuxiliar, -2);
    FValorTotalPedido := FValorTotalPedido + dAuxiliar;
  end;
end;

function TPedidoCabModel.BuscarItemNoPedido(iIdItem: Integer): Integer;
var
  iIndice: Integer;
begin
  Result := -1;
  for iIndice := 0 to FListaItensPedido.Count -1 do begin
    if FListaItensPedido[iIndice].IDItem = iIdItem then begin
      Result := iIndice;
      Exit;
    end;
  end;
end;

constructor TPedidoCabModel.Create;
begin
  FListaItensPedido := TObjectList<TPedidoItemModel>.Create;
end;

destructor TPedidoCabModel.Destroy;
begin
  if Assigned(FListaItensPedido) then begin
    FreeAndNil(FListaItensPedido);
  end;
  inherited;
end;

function TPedidoCabModel.RemoverItem(iIdItem: Integer): Integer;
begin
  Result := BuscarItemNoPedido(iIdItem);
  if Result >= 0 then begin
    ListaItensPedido.Delete(Result);
    ReordenarSequenciaItens;
    AtualizarValorTotalPedido();
  end;
end;

end.

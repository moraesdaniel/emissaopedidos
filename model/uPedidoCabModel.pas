unit uPedidoCabModel;

interface

uses
  System.Generics.Collections, uPedidoItemModel, System.SysUtils;

type
  TPedidoCabModel = class
  private
    FIDPed: Integer;
    FDtEmissao: TDate;
    FNumero: Integer;
    FCliente: String;
    FListaItensPedido: TObjectList<TPedidoItemModel>;
  public
    constructor Create;
    destructor Destroy; override;
    function AdicionarItem(oPedidoItem: TPedidoItemModel) : Integer;
    function RemoverItem(iIdItem: Integer) : Integer;
  published
    property IDPed: Integer read FIDPed write FIDPed;
    property DtEmissao: TDate read FDtEmissao write FDtEmissao;
    property Numero: Integer read FNumero write FNumero;
    property Cliente: String read FCliente write FCliente;
    property ListaItensPedido: TObjectList<TPedidoItemModel>
      read FListaItensPedido write FListaItensPedido;
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
  FListaItensPedido[iIndice].IDItemSeq := iIndice;
  FListaItensPedido[iIndice].IDItem := oPedidoItem.IDItem;
  FListaItensPedido[iIndice].Descricao := oPedidoItem.Descricao;
  FListaItensPedido[iIndice].Quantidade := oPedidoItem.Quantidade;
  FListaItensPedido[iIndice].ValorUnitario := oPedidoItem.ValorUnitario;
  Result := FListaItensPedido.Count;
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
var
  iContador: Integer;
begin
  Result := -1;
  for iContador := 0 to ListaItensPedido.Count - 1 do begin
    if (ListaItensPedido[iContador].IDItem = iIdItem) then begin
      Result := iContador;
      Break;
    end;

    ListaItensPedido.Delete(Result);
  end;
end;

end.

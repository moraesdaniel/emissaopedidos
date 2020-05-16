unit uPedidoItemController;

interface

uses
  uPedidoItemModel, uDmPedidoItem, System.Generics.Collections;

type
  TPedidoItemController = class
  private
    {Private declarations}
  public
    function Inserir(oPedidoItemModel: TPedidoItemModel;
      out sErro: String): Boolean;
    function ExcluirTodos(iIDPed: Integer; out sErro: String): Boolean;
    function CarregarItensDoPedido(iIDPed: Integer;
      out oListaItens: TObjectList<TPedidoItemModel>): Integer;
    function ExisteVendaDoItem(iIDItem: Integer): Boolean;
  end;

implementation

{ TPedidoItemController }

function TPedidoItemController.CarregarItensDoPedido(iIDPed: Integer;
  out oListaItens: TObjectList<TPedidoItemModel>): Integer;
begin
  Result := DmPedidoItem.CarregarItensDoPedido(iIDPed, oListaItens);
end;

function TPedidoItemController.ExcluirTodos(iIdPed: Integer;
  out sErro: String): Boolean;
begin
  Result := DmPedidoItem.ExcluirTodos(iIDPed, sErro);
end;

function TPedidoItemController.ExisteVendaDoItem(iIDItem: Integer): Boolean;
begin
  Result := DmPedidoItem.ExisteVendaDoItem(iIDItem);
end;

function TPedidoItemController.Inserir(oPedidoItemModel: TPedidoItemModel;
  out sErro: String): Boolean;
begin
  Result := DmPedidoItem.Inserir(oPedidoItemModel, sErro);
end;

end.

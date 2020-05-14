unit uPedidoItemController;

interface

uses
  uPedidoItemModel, uDmPedidoItem;

type
  TPedidoItemController = class
  private
    {Private declarations}
  public
    function Inserir(oPedidoItemModel: TPedidoItemModel;
      out sErro: String): Boolean;
    function ExcluirTodos(iIDPed: Integer; out sErro: String): Boolean;
  end;

implementation

{ TPedidoItemController }

function TPedidoItemController.ExcluirTodos(iIdPed: Integer;
  out sErro: String): Boolean;
begin
  Result := DmPedidoItem.ExcluirTodos(iIDPed, sErro);
end;

function TPedidoItemController.Inserir(oPedidoItemModel: TPedidoItemModel;
  out sErro: String): Boolean;
begin
  Result := DmPedidoItem.Inserir(oPedidoItemModel, sErro);
end;

end.

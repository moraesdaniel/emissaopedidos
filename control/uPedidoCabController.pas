unit uPedidoCabController;

interface

uses uDmPedidoCab;

type
  TPedidoCabController = class
    public
      function GetCodigoNovoPedido(): Integer;
  end;

implementation

{ TPedidoCabController }

function TPedidoCabController.GetCodigoNovoPedido: Integer;
begin
  Result := DmPedidoCab.GetCodigoNovoPedido();
end;

end.

unit uPedidoCabController;

interface

uses
  uDmPedidoCab, uPedidoCabModel;

type
  TPedidoCabController = class
    public
      function GetCodigoNovoPedido(): Integer;
      function Inserir(oPedidoCabModel: TPedidoCabModel; out sErro: String): Boolean;
      function Excluir(iIDPed: Integer; out sErro: String): Boolean;
      function Atualizar(oPedidoCabModel: TPedidoCabModel; out sErro: String): Boolean;
  end;

implementation

{ TPedidoCabController }

function TPedidoCabController.Atualizar(oPedidoCabModel: TPedidoCabModel;
  out sErro: String): Boolean;
begin
  Result := DmPedidoCab.Atualizar(oPedidoCabModel, sErro);
end;

function TPedidoCabController.Excluir(iIDPed: Integer;
  out sErro: String): Boolean;
begin
  Result := DmPedidoCab.Excluir(iIDPed, sErro);
end;

function TPedidoCabController.GetCodigoNovoPedido: Integer;
begin
  Result := DmPedidoCab.GetCodigoNovoPedido();
end;

function TPedidoCabController.Inserir(oPedidoCabModel: TPedidoCabModel;
  out sErro: String): Boolean;
begin
  Result := DmPedidoCab.Inserir(oPedidoCabModel, sErro);
end;

end.

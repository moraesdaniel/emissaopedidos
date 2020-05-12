unit uPedidoCabModel;

interface

uses
  System.Generics.Collections, uPedidoItemModel;

type
  TPedidoCabModel = class
  private
    FID_Ped: Integer;
    FDtEmissao: TDate;
    FNumero: Integer;
    FCliente: String;
    FListaItensPedido: TObjectList<TPedidoItemModel>;
  public
    property ID_Ped: Integer read FID_Ped write FID_Ped;
    property DtEmissao: TDate read FDtEmissao write FDtEmissao;
    property Numero: Integer read FNumero write FNumero;
    property Cliente: String read FCliente write FCliente;
    property ListaItensPedido: TObjectList<TPedidoItemModel>
      read FListaItensPedido write FListaItensPedido;
  end;

implementation

end.

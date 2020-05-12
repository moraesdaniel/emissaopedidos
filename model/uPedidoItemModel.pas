unit uPedidoItemModel;

interface

type
  TPedidoItemModel = class
  private
    FIDItemSeq: Integer;
    FIDItem: Integer;
    FIDPed: Integer;
    FValorUnitario: Double;
    FQuantidade: Double;
  public
    property IDPed: Integer read FIDPed write FIDPed;
    property IDItem: Integer read FIDItem write FIDItem;
    property IDItemSeq: Integer read FIDItemSeq write FIDItemSeq;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property ValorUnitario: Double read FValorUnitario write FValorUnitario;
  end;

implementation

end.

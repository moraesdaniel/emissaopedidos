unit uPedidoItemModel;

interface

type
  TPedidoItemModel = class
    private
      FIDPed: Integer;
      FIDItem: Integer;
      FIDItemSeq: Integer;
      FQuantidade: Double;
      FValorUnitario: Double;
      FDescricao: String;
    published
      property IDPed: Integer read FIDPed write FIDPed;
      property IDItem: Integer read FIDItem write FIDItem;
      property IDItemSeq: Integer read FIDItemSeq write FIDItemSeq;
      property Quantidade: Double read FQuantidade write FQuantidade;
      property ValorUnitario: Double read FValorUnitario write FValorUnitario;
      property Descricao: String read FDescricao write FDescricao;
  end;

implementation

end.

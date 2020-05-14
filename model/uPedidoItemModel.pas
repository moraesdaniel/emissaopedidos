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
    public
      function ValidarDadosObrigatorios(out sMsg: String) : Integer;
    published
      property IDPed: Integer read FIDPed write FIDPed;
      property IDItem: Integer read FIDItem write FIDItem;
      property IDItemSeq: Integer read FIDItemSeq write FIDItemSeq;
      property Quantidade: Double read FQuantidade write FQuantidade;
      property ValorUnitario: Double read FValorUnitario write FValorUnitario;
      property Descricao: String read FDescricao write FDescricao;
  end;

implementation

{ TPedidoItemModel }

function TPedidoItemModel.ValidarDadosObrigatorios(out sMsg: String): Integer;
begin
  if (FQuantidade <= 0) then begin
    sMsg := 'A quantidade deve ser maior que zero!';
    Result := -1;
    Exit;
  end;

  if (FValorUnitario <= 0) then begin
    sMsg := 'O valor unitário deve ser maior que zero!';
    Result := -1;
    Exit;
  end;
end;

end.

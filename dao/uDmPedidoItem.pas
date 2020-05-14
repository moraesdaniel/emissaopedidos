unit uDmPedidoItem;

interface

uses
  System.SysUtils, System.Classes, uDmConexao, Data.FMTBcd, Data.DB,
  Data.SqlExpr, uPedidoItemModel;

type
  TDmPedidoItem = class(TDataModule)
    SQLInserir: TSQLDataSet;
    SQLExcluirTodos: TSQLDataSet;
  private
    { Private declarations }
  public
    function Inserir(oPedidoItemModel: TPedidoItemModel; out sErro: String): Boolean;
    function ExcluirTodos(iIdPed: Integer; out sErro: String): Boolean;
  end;

var
  DmPedidoItem: TDmPedidoItem;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmPedidoItem }

function TDmPedidoItem.ExcluirTodos(iIdPed: Integer;
  out sErro: String): Boolean;
begin
  with SQLExcluirTodos do begin
    ParamByName('ID_PED').AsInteger := iIdPed;
    try
      ExecSQL();
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Problemas ao tentar excluir os itens do pedido!' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

function TDmPedidoItem.Inserir(oPedidoItemModel: TPedidoItemModel;
  out sErro: String): Boolean;
begin
  with SQLInserir do begin
    ParamByName('ID_PED').AsInteger := oPedidoItemModel.IDPed;
    ParamByName('ID_ITEM').AsInteger := oPedidoItemModel.IDItem;
    ParamByName('ID_ITEMSEQ').AsInteger := oPedidoItemModel.IDItemSeq;
    ParamByName('QUANTIDADE').AsFloat := oPedidoItemModel.Quantidade;
    ParamByName('ID_ITEM').AsFloat := oPedidoItemModel.ValorUnitario;
    try
      ExecSQL();
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Erro ao tentar inserir o item!' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

end.

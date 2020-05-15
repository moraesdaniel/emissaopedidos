unit uDmPedidoItem;

interface

uses
  System.SysUtils, System.Classes, uDmConexao, Data.FMTBcd, Data.DB,
  Data.SqlExpr, uPedidoItemModel, System.Generics.Collections;

type
  TDmPedidoItem = class(TDataModule)
    SQLInserir: TSQLDataSet;
    SQLExcluirTodos: TSQLDataSet;
  private
    { Private declarations }
  public
    function Inserir(oPedidoItemModel: TPedidoItemModel; out sErro: String): Boolean;
    function ExcluirTodos(iIdPed: Integer; out sErro: String): Boolean;
    function CarregarItensDoPedido(iIDPed: Integer;
      out oListaItens: TObjectList<TPedidoItemModel>): Integer;
  end;

var
  DmPedidoItem: TDmPedidoItem;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmPedidoItem }

function TDmPedidoItem.CarregarItensDoPedido(iIDPed: Integer;
  out oListaItens: TObjectList<TPedidoItemModel>): Integer;
var
  sqlItens: TSQLDataSet;
  iContador: Integer;
begin
  sqlItens := TSQLDataSet.Create(nil);
  iContador := 0;
  try
    with sqlItens do begin
      SQLConnection := DmConexao.SQLConexao;
      CommandText := 'select id_item, id_itemseq, quantidade, valorunit '+
        'from pedidoitem where id_ped = '+IntToStr(iIDPed);
      Open;
      while not eof do begin
        oListaItens.Add(TPedidoItemModel.Create);
        oListaItens[iContador].IDPed := iIDPed;
        oListaItens[iContador].IDItem := FieldByName('id_item').AsInteger;
        oListaItens[iContador].IDItemSeq := FieldByName('id_itemseq').AsInteger;
        oListaItens[iContador].Quantidade := FieldByName('quantidade').AsFloat;
        oListaItens[iContador].ValorUnitario := FieldByName('valorunit').AsFloat;
        next;
      end;
    end;
  finally
    FreeAndNil(sqlItens);
    Result := iContador;
  end;
end;

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
    ParamByName('VALORUNIT').AsFloat := oPedidoItemModel.ValorUnitario;
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

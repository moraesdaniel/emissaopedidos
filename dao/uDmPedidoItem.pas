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
    function ExisteVendaDoItem(iIDItem: Integer): Boolean;
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
  sScript: String;
begin
  sqlItens := TSQLDataSet.Create(nil);
  iContador := 0;
  try
    with sqlItens do begin
      SQLConnection := DmConexao.SQLConexao;
      sScript :=  'SELECT '+
                  ' PI.ID_ITEM, PI.ID_ITEMSEQ, PI.QUANTIDADE, '+
                  ' PI.VALORUNIT, IT.DESC_ITEM '+
                  'FROM '+
                  ' PEDIDOITEM PI '+
                  ' LEFT OUTER JOIN ITEM IT ON '+
                  '   IT.ID_ITEM = PI.ID_ITEM '+
                  'WHERE '+
                  ' PI.ID_PED = '+IntToStr(iIDPed)+' '+
                  'ORDER BY '+
                  ' PI.ID_ITEMSEQ';
      CommandText := sScript;
      Open;
      while not eof do begin
        oListaItens.Add(TPedidoItemModel.Create);
        oListaItens[iContador].IDPed := iIDPed;
        oListaItens[iContador].IDItem := FieldByName('id_item').AsInteger;
        oListaItens[iContador].Descricao := FieldByName('desc_item').AsString;
        oListaItens[iContador].IDItemSeq := FieldByName('id_itemseq').AsInteger;
        oListaItens[iContador].Quantidade := FieldByName('quantidade').AsFloat;
        oListaItens[iContador].ValorUnitario := FieldByName('valorunit').AsFloat;
        Inc(iContador);
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

function TDmPedidoItem.ExisteVendaDoItem(iIDItem: Integer): Boolean;
var
  sqlBuscarItem: TSQLDataSet;
begin
  sqlBuscarItem := TSQLDataSet.Create(nil);
  try
    with sqlBuscarItem do begin
      SQLConnection := DmConexao.SQLConexao;
      CommandText := 'select count(*) as qtdvendas from pedidoitem where id_item = '+IntToStr(iIDItem);
      Open;
      Result := FieldByName('qtdvendas').AsInteger > 0;
    end;
  finally
    FreeAndNil(sqlBuscarItem);
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

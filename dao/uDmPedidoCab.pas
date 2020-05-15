unit uDmPedidoCab;

interface

uses
  System.SysUtils, System.Classes, uDmConexao, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uPedidoCabModel,
  uPedidoItemController, System.Generics.Collections;

type
  TDmPedidoCab = class(TDataModule)
    SQLInserir: TSQLDataSet;
    SQLAtualizar: TSQLDataSet;
    SQLExcluir: TSQLDataSet;
    SQLBuscar: TSQLDataSet;
  private
    { Private declarations }
  public
    function GetCodigoNovoPedido() : Integer;
    function Inserir(oPedidoCabModel: TPedidoCabModel; out sErro: String): Boolean;
    function Excluir(iIdPed: Integer; out sErro: String): Boolean;
    function Atualizar(oPedidoCabModel: TPedidoCabModel; out sErro: String): Boolean;
    function BuscarCabecalhoPedidosPeloCliente(sCliente: String;
      oListaPedidos: TObjectList<TPedidoCabModel>): Integer;
  end;

var
  DmPedidoCab: TDmPedidoCab;

implementation

uses
  Data.DBXCommon;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmPedidoCab }
function TDmPedidoCab.Inserir(oPedidoCabModel: TPedidoCabModel; out sErro: String): Boolean;
var
  oTransacao: TDBXTransaction;
  oPedidoItemController: TPedidoItemController;
  iIndice: Integer;
begin
  with SQLInserir do begin
    ParamByName('ID_PED').AsInteger := oPedidoCabModel.IDPed;
    ParamByName('NUMERO').AsInteger := oPedidoCabModel.Numero;
    ParamByName('DTEMISSAO').AsDate := oPedidoCabModel.DtEmissao;
    ParamByName('CLIENTE').AsString := oPedidoCabModel.Cliente;

    oTransacao := DmConexao.SQLConexao.BeginTransaction;
    oPedidoItemController := TPedidoItemController.Create;
    try
      try
        //Insere o cabe�alho
        ExecSQL();

        //Insere os itens
        for iIndice := 0 to oPedidoCabModel.ListaItensPedido.Count - 1 do begin
          if Not oPedidoItemController.Inserir(oPedidoCabModel.ListaItensPedido[iIndice], sErro) then begin
            raise Exception.Create(sErro);
          end;
        end;

        DmConexao.SQLConexao.CommitFreeAndNil(oTransacao);
        Result := True;
      except on E: Exception do
        begin
          sErro := 'Falha ao tentar salvar o pedido!' + sLineBreak + E.Message;
          DmConexao.SQLConexao.RollbackFreeAndNil(oTransacao);
          Result := False;
        end;
      end;
    finally
      FreeAndNil(oPedidoItemController);
    end;
  end; //With SQLInserir
end;

function TDmPedidoCab.Atualizar(oPedidoCabModel: TPedidoCabModel;
  out sErro: String): Boolean;
var
  oTransacao: TDBXTransaction;
  oPedidoItemController: TPedidoItemController;
  iIndice: Integer;
begin
  with SQLAtualizar do begin
    ParamByName('ID_PED').AsInteger := oPedidoCabModel.IDPed;
    ParamByName('NUMERO').AsInteger := oPedidoCabModel.Numero;
    ParamByName('DTEMISSAO').AsDate := oPedidoCabModel.DtEmissao;
    ParamByName('CLIENTE').AsString := oPedidoCabModel.Cliente;

    oTransacao := DmConexao.SQLConexao.BeginTransaction;
    oPedidoItemController := TPedidoItemController.Create;
    try
      try
        //Atualiza o cabe�alho
        ExecSQL();

        //Exclui todos os itens
        if not oPedidoItemController.ExcluirTodos(oPedidoCabModel.IDPed, sErro) then begin
          raise Exception.Create(sErro);
        end;

        //Reinsere os itens
        for iIndice := 0 to oPedidoCabModel.ListaItensPedido.Count - 1 do begin
          if Not oPedidoItemController.Inserir(oPedidoCabModel.ListaItensPedido[iIndice], sErro) then begin
            raise Exception.Create(sErro);
          end;
        end;

        DmConexao.SQLConexao.CommitFreeAndNil(oTransacao);
        Result := True;
      except on E: Exception do
        begin
          sErro := 'Falha ao tentar atualizar o pedido!' + sLineBreak + E.Message;
          DmConexao.SQLConexao.RollbackFreeAndNil(oTransacao);
          Result := False;
        end;
      end;
    finally
      FreeAndNil(oPedidoItemController);
    end;
  end;
end;

function TDmPedidoCab.BuscarCabecalhoPedidosPeloCliente(sCliente: String;
  oListaPedidos: TObjectList<TPedidoCabModel>): Integer;
var
  sqlCabPedidos: TSQLDataSet;
  iContador: Integer;
  sScript: String;
begin
  sqlCabPedidos := TSQLDataSet.Create(nil);
  iContador := 0;
  sScript := 'SELECT ID_PED, NUMERO, DTEMISSAO, CLIENTE FROM PEDIDOCAB ';
  if Trim(sCliente) <> '' then begin
    sScript := sScript + 'WHERE CLIENTE LIKE (''%'+sCliente+'%'') ';
  end;
  sScript := sScript + 'ORDER BY CLIENTE, ID_PED';

  try
    with sqlCabPedidos do begin
      SQLConnection := DmConexao.SQLConexao;
      CommandText := sScript;
      Open;
      while not eof do begin
        oListaPedidos.Add(TPedidoCabModel.Create);
        oListaPedidos[iContador].IDPed := FieldByName('ID_PED').AsInteger;
        oListaPedidos[iContador].Numero := FieldByName('NUMERO').AsInteger;
        oListaPedidos[iContador].Cliente := FieldByName('CLIENTE').AsString;
        oListaPedidos[iContador].DtEmissao := FieldByName('DTEMISSAO').AsDateTime;
        Inc(iContador);
        Next;
      end;
    end;
  finally
    Result := iContador;
    FreeAndNil(sqlCabPedidos);
  end;
end;

function TDmPedidoCab.Excluir(iIdPed: Integer; out sErro: String): Boolean;
var
  oPedidoItemController: TPedidoItemController;
  oTransacao: TDBXTransaction;
begin
  oPedidoItemController := TPedidoItemController.Create;
  try
    try
      oTransacao := DmConexao.SQLConexao.BeginTransaction;

      //Excluindo itens
      if not oPedidoItemController.ExcluirTodos(iIDPed, sErro) then begin
        raise Exception.Create(sErro);
      end;

      //Excluindo cabe�alho
      SQLExcluir.ParamByName('ID_PED').AsInteger := iIDPed;
      SQLExcluir.ExecSQL();

      DmConexao.SQLConexao.CommitFreeAndNil(oTransacao);
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Erro ao excluir o pedido!' + sLineBreak + E.Message;
        DmConexao.SQLConexao.RollbackFreeAndNil(oTransacao);
        Result := False;
      end;
    end;
  finally
    FreeAndNil(oPedidoItemController);
  end;
end;

function TDmPedidoCab.GetCodigoNovoPedido: Integer;
var
  sqlContador: TSQLDataSet;
begin
  sqlContador := TSQLDataSet.Create(nil);
  try
    sqlContador.SQLConnection := DmConexao.SQLConexao;
    sqlContador.CommandText := 'SELECT GEN_ID(GEN_ID_PED, 1) AS ID_PED FROM RDB$DATABASE';
    sqlContador.Open;
    if sqlContador.RecordCount > 0 Then
      Result := sqlContador.FieldByName('ID_PED').AsInteger
    else
      Result := -1;
  finally
    FreeAndNil(sqlContador);
  end;
end;

end.

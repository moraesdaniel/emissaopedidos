unit uDmPedidoCab;

interface

uses
  System.SysUtils, System.Classes, uDmConexao, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uPedidoCabModel;

type
  TDmPedidoCab = class(TDataModule)
    SQLInserir: TSQLDataSet;
    SQLAtualizar: TSQLDataSet;
    SQLExcluir: TSQLDataSet;
  private
    { Private declarations }
  public
    function GetCodigoNovoPedido() : Integer;
    function Inserir(oPedidoCabModel: TPedidoCabModel; out sErro: String): Boolean;
    function Excluir(iIdPed: Integer; out sErro: String): Boolean;
    function Atualizar(oPedidoCabModel: TPedidoCabModel; out sErro: String): Boolean;
  end;

var
  DmPedidoCab: TDmPedidoCab;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmPedidoCab }
function TDmPedidoCab.Inserir(oPedidoCabModel: TPedidoCabModel; out sErro: String): Boolean;
begin
  with SQLInserir do begin
    ParamByName('ID_PED').AsInteger := oPedidoCabModel.IDPed;
    ParamByName('NUMERO').AsInteger := oPedidoCabModel.Numero;
    ParamByName('DTEMISSAO').AsDate := oPedidoCabModel.DtEmissao;
    ParamByName('CLIENTE').AsString := oPedidoCabModel.Cliente;
    try
      ExecSQL();
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Falha ao tentar salvar o pedido!' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

function TDmPedidoCab.Atualizar(oPedidoCabModel: TPedidoCabModel;
  out sErro: String): Boolean;
begin
  with SQLAtualizar do begin
    ParamByName('ID_PED').AsInteger := oPedidoCabModel.IDPed;
    ParamByName('NUMERO').AsInteger := oPedidoCabModel.Numero;
    ParamByName('DTEMISSAO').AsDate := oPedidoCabModel.DtEmissao;
    ParamByName('CLIENTE').AsString := oPedidoCabModel.Cliente;
    try
      ExecSQL();
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Falha ao tentar atualizar o pedido!' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

function TDmPedidoCab.Excluir(iIdPed: Integer; out sErro: String): Boolean;
begin
  with SQLExcluir do begin
    ParamByName('ID_PED').AsInteger := iIdPed;
    try
      ExecSQL();
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Erro ao excluir o pedido!' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
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

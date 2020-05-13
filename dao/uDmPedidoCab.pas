unit uDmPedidoCab;

interface

uses
  System.SysUtils, System.Classes, uDmConexao, Data.FMTBcd, Data.SqlExpr,
  Datasnap.Provider, Data.DB, Datasnap.DBClient;

type
  TDmPedidoCab = class(TDataModule)
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    SQLDataSet1: TSQLDataSet;
  private
    { Private declarations }
  public
    function GetCodigoNovoPedido() : Integer;
  end;

var
  DmPedidoCab: TDmPedidoCab;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmPedidoCab }

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

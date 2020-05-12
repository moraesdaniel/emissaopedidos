unit uDmItem;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider, Data.DB,
  Data.SqlExpr, Datasnap.DBClient, uDmConexao, uItemModel, Data.DBXFirebird,
  System.Generics.Collections;

type
  TDmItem = class(TDataModule)
    SQLPesquisar: TSQLDataSet;
    SQLInserir: TSQLDataSet;
    SQLAtualizar: TSQLDataSet;
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    cdsPesquisarID_ITEM: TIntegerField;
    cdsPesquisarDESC_ITEM: TStringField;
    SQLExcluir: TSQLDataSet;
  private
    { Private declarations }
  public
    procedure PesquisarPelaDescricao(sDescricao: String);
    function Inserir(oItem: TItemModel; out sErro: String) : Boolean;
    function Atualizar(oItem: TItemModel; out sErro: String) : Boolean;
    function Excluir(iCodigo: Integer; out sErro: String) : Boolean;
    procedure Carregar(oItem: TItemModel; iCodigo: Integer);
    function BuscarItensCadastrados(out listaItens: TObjectList<TItemModel>) : Integer;
  end;

var
  DmItem: TDmItem;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmItem }

function TDmItem.BuscarItensCadastrados(out listaItens: TObjectList<TItemModel>) : Integer;
var
  sqlItens: TSQLDataSet;
  iContador: Integer;
begin
  sqlItens := TSQLDataSet.Create(nil);
  iContador := 0;
  try
    sqlItens.SQLConnection := DmConexao.SQLConexao;
    sqlItens.CommandText := 'select id_item, desc_item from item order by desc_item';
    sqlItens.Open;
    while not sqlItens.Eof do begin
      listaItens.Add(TItemModel.Create);
      listaItens[iContador].ID := sqlItens.FieldByName('id_item').AsInteger;
      listaItens[iContador].Descricao := sqlItens.FieldByName('desc_item').AsString;
      Inc(iContador);
      sqlItens.Next;
    end;
  finally
    FreeAndNil(sqlItens);
    Result := iContador;
  end;
end;

procedure TDmItem.Carregar(oItem: TItemModel; iCodigo: Integer);
var
  sqlItem: TSQLDataSet;
begin
  sqlItem := TSQLDataSet.Create(nil);
  try
    sqlItem.SQLConnection := DmConexao.SQLConexao;
    sqlItem.CommandText := 'select id_item, desc_item from item where id_item = '+
      IntToStr(iCodigo);
    sqlItem.Open;
    oItem.ID := sqlItem.FieldByName('id_item').AsInteger;
    oItem.Descricao := sqlItem.FieldByName('desc_item').AsString;
  finally
    FreeAndNil(sqlItem);
  end;
end;

function TDmItem.Excluir(iCodigo: Integer; out sErro: String): Boolean;
begin
  with SQLExcluir do begin
    ParamByName('ID_ITEM').AsInteger := iCodigo;
    try
      ExecSQL();
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Erro ao tentar excluir o item!' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

function TDmItem.Atualizar(oItem: TItemModel; out sErro: String): Boolean;
begin
  with SQLAtualizar do begin
    ParamByName('ID_ITEM').AsInteger := oItem.ID;
    ParamByName('DESC_ITEM').AsString := oItem.Descricao;
    try
      ExecSQL();
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Erro ao tentar atualizar o item!' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

function TDmItem.Inserir(oItem: TItemModel; out sErro: String): Boolean;
begin
  with SQLInserir do begin
    ParamByName('DESC_ITEM').AsString := oItem.Descricao;
    try
      ExecSQL();
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Erro ao tentar inserir item!' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

procedure TDmItem.PesquisarPelaDescricao(sDescricao: String);
begin
  if cdsPesquisar.Active then
    cdsPesquisar.Close;
  cdsPesquisar.ParamByName('NOME').AsString := '%'+sDescricao+'%';
  cdsPesquisar.Open;
  cdsPesquisar.First;
end;

end.

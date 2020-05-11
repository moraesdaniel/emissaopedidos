unit uItemController;

interface

uses
  uItemModel, uDmItem, System.SysUtils;

type
  TItemController = class
    public
      function Inserir(oItem: TItemModel; var sErro: String) : Boolean;
      function Atualizar(oItem: TItemModel; var sErro: String) : Boolean;
      function Excluir(iCodigo: Integer; var sErro: String) : Boolean;
      procedure PesquisarPelaDescricao(sDescricao: String);
      procedure Carregar(oItem: TItemModel; iCodigo: Integer);
      function ValidarDadosObrigatorios(oItem: TItemModel; var sMsg: String) : Boolean;
  end;

implementation

{ TItemControler }

function TItemController.Atualizar(oItem: TItemModel;
  var sErro: String): Boolean;
begin
  Result := DmItem.Atualizar(oItem, sErro);
end;

procedure TItemController.Carregar(oItem: TItemModel; iCodigo: Integer);
begin
  DmItem.Carregar(oItem, iCodigo);
end;

function TItemController.Excluir(iCodigo: Integer;
  var sErro: String): Boolean;
begin
  Result := DmItem.Excluir(iCodigo, sErro);
end;

function TItemController.Inserir(oItem: TItemModel;
  var sErro: String): Boolean;
begin
  Result := DmItem.Inserir(oItem, sErro);
end;

procedure TItemController.PesquisarPelaDescricao(sDescricao: String);
begin
  DmItem.PesquisarPelaDescricao(sDescricao);
end;

function TItemController.ValidarDadosObrigatorios(oItem: TItemModel; var sMsg: String): Boolean;
begin
  sMsg := '';

  if Trim(oItem.Descricao).Length < 5 then begin
    sMsg := 'A descrição do item deve conter mais de 5 caracteres!';
    Result := False;
    Exit;
  end;

  Result := True;
end;

end.

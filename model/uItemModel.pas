unit uItemModel;

interface

uses
  System.SysUtils;

type
  TItemModel = class
  private
    FDescricao: String;
    FID: Integer;
    procedure SetDescricao(const Value: String);
  public
    property ID: Integer read FID write FID;
    property Descricao: String read FDescricao write SetDescricao;
  end;

implementation

{ TItem }

procedure TItemModel.SetDescricao(const Value: String);
begin
  if Value = EmptyStr then begin
    raise EArgumentException.Create('"Descrição" é um campo obrigatório.');
  end;

  FDescricao := Value;
end;

end.

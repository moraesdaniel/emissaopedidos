unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DBXFirebird;

type
  TDmConexao = class(TDataModule)
    SQLConexao: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmConexao: TDmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

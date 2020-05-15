unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DBXFirebird,
  IniFiles;

type
  TDmConexao = class(TDataModule)
    SQLConexao: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmConexao: TDmConexao;
  oConfig: TIniFile;

implementation

uses
  Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmConexao }

procedure TDmConexao.DataModuleCreate(Sender: TObject);
var
  sDataBase, sUserName, sPassword: String;
begin
  oConfig := TIniFile.Create(getCurrentDir+'\CfgDataBase.INI');
  try
    sDataBase := oConfig.ReadString('Main', 'Database', '');
    sUserName := oConfig.ReadString('Main', 'User_Name', '');
    sPassword := oConfig.ReadString('Main', 'Password', '');
    ShowMessage(sDataBase+sLineBreak+sUserName+sLineBreak+sPassword);
  finally
    FreeAndNil(oConfig);
  end;
  {
  https://www.devmedia.com.br/forum/criacao-de-sqlconnection-em-runtime-delphi-xe/439498
  https://www.devmedia.com.br/conexao-com-o-banco-atraves-de-um-arquivo-ini/16210
  }
end;

end.

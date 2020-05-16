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
  Vcl.Dialogs, Vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDmConexao }

procedure TDmConexao.DataModuleCreate(Sender: TObject);
var
  sDataBase, sUserName, sPassword: String;
begin
  if not FileExists(getCurrentDir+'\CfgDataBase.INI') then begin
    MessageDlg('Arquivo de configuração não encontrado!', mtError, [mbok] , 0);
    Application.Terminate;
  end;

  oConfig := TIniFile.Create(getCurrentDir+'\CfgDataBase.INI');
  try
    sDataBase := oConfig.ReadString('Main', 'Database', '');
    sUserName := oConfig.ReadString('Main', 'User_Name', '');
    sPassword := oConfig.ReadString('Main', 'Password', '');
  finally
    FreeAndNil(oConfig);
  end;

  with SQLConexao do begin
    try
      LoginPrompt := False;
      KeepConnection := True;
      LoadParamsOnConnect := False;
      DriverName := 'Firebird';
      LibraryName := 'dbxfb.dll';
      VendorLib := 'fbclient.dll';
      Params.Add('Database='+sDataBase);
      Params.Add('User_Name='+sUserName);
      Params.Add('Password='+sPassword);
      Params.Add('VendorLibWin64=fbclient.dll');
      Open;
    except on E: Exception do
      begin
        MessageDlg('Problemas ao conectar na base de dados ' + sDataBase +
          sLineBreak + sLineBreak + E.Message, mtError, [mbok], 0);
        Application.Terminate;
      end;
    end; //try
  end; //with
end;

end.

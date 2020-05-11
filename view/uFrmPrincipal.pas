unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uFrmCadastroItem;

type
  TfrmPrincipal = class(TForm)
    btnItem: TButton;
    procedure btnItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnItemClick(Sender: TObject);
begin
  if (frmCadastroItem = nil) then begin
    frmCadastroItem := TfrmCadastroItem.Create(Application);
    frmCadastroItem.WindowState := wsNormal;
    frmCadastroItem.Show;
  end;
end;

end.

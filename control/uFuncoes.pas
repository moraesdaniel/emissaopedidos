unit uFuncoes;

interface

uses
  System.SysUtils, System.StrUtils;

type
  TFuncoes = class
    public
      function FormatarMoeda(sValor: String) : String;
  end;

implementation

{ TFuncoes }

function TFuncoes.FormatarMoeda(sValor: String): String;
var
  iPosicao: Integer;
  sDecimal, sCentena, sMilhar, sMilhao: String;
begin
  //Removendo caracteres especiais
  for iPosicao := 1 to Length(sValor) do
    if not (sValor[iPosicao] in ['0'..'9']) then
      Delete(sValor, iPosicao, 1);

  //Removendo zeros a esquerda
  while (Copy(sValor, 1, 1) = '0') and (Length(sValor) > 0) do begin
    sValor := RightStr(sValor, Length(sValor) - 1);
  end;

  if Length(sValor) = 0 then begin
    sValor := '0,00';
  end else if Length(sValor) = 1 then begin
    sValor := '0,0'+sValor;
  end else if Length(sValor) = 2 then begin
    sValor := '0,'+sValor;
  end else begin
    sValor := DupeString(' ', 11 - Length(sValor))+sValor;
    sMilhao := IfThen(Copy(sValor, 1, 3) <> '   ', Trim(Copy(sValor, 1, 3))+'.');
    sMilhar := IfThen(Copy(sValor, 4, 3) <> '   ', Trim(Copy(sValor, 4, 3))+'.');
    sCentena := IfThen(Copy(sValor, 7, 3) <> '   ', Trim(Copy(sValor, 7, 3))+',');
    sDecimal := Copy(sValor, 10, 2);
    sValor := sMilhao+sMilhar+sCentena+sDecimal
  end;

  Result := sValor;
end;

end.

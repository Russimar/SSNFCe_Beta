unit uUtilElgin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, StrUtils,
  UECF_DLLG32, IniFiles;

const
    MSG_EXECUCAO_SUCESSO: String = 'Opera��o executada com Sucesso!';
const
    MSG_EXECUCAO_FALHA: String = 'Falha na execu��o da opera��o!';
const
  SECAO: String = 'Sistema';

type
    TElginIni = Class(TiniFile)
    private
        function getPorta(): String;
        function getPath(): String;
        function getPathRFD(): String;
    public
        constructor Create();
        property Porta: String read getPorta;
        property Path: String read getPath;
        property PathRFD: String read getPathRFD;
    end;

// Fun��es Globais
  function ObtemRetornoECF(var strMensagemErro: String): Boolean;
  function TrataErro(lCodErro: Longint): Boolean;
  function RetiraValor(strEntrada: string): string;

implementation

constructor TElginIni.Create();
var
    dir: String;
begin
    GetDir( 0, dir );
    self := inherited Create( dir + '\Elgin.ini');
end;

function TElginIni.getPorta(): String;
begin
    Result := ReadString(SECAO,'Porta','Com1');
end;

function TElginIni.getPath(): String;
var
    dir: String;
begin
    GetDir( 0, dir );
    Result := ReadString(SECAO,'Path', dir);
end;

function TElginIni.getPathRFD(): String;
var
    dir: String;
begin
    GetDir( 0, dir );
    Result := ReadString(SECAO,'PathRFD',dir);
end;
///////////////////////////////

function itoa(I: integer): string;
var
  S: string;
begin
  Str(I, S);
  Result:= S;
end;

Function TrataErro( lCodErro: Longint): Boolean;
var
  strMensagem, strCirc: string;
  iACK, iST1, iST2: integer;
  iErro: integer;
begin
  if(lCodErro = 1) then
    TrataErro := True
  else begin
    strMensagem := 'Erro n�o identificado';
    case lCodErro of
      0: //strMensagem := 'Erro de comunica��o';
        If (ObtemRetornoECF(strCirc)) Then
          strMensagem := strCirc
        Else
          strMensagem  := 'Erro na comunica��o.';
      -2: strMensagem  := 'Erro N� -2 - Par�metro inv�lido';
      -4: strMensagem  := 'Erro N� -4 - Arquivo ini n�o encontrado ou par�metro inv�lido para o nome da porta';
      -5: strMensagem  := 'Erro N� -5 - Erro ao abrir a porta de comunica��o';
      -27: strMensagem := 'Erro N� -27 - Status da impressora diferente de 6,0,0,0 (Ack, St1, St2 e St3)';
    end;
    TrataErro := False;
    Application.MessageBox(Pchar(strMensagem),'Erro',MB_IconError + MB_OK);
  end;
  iErro := VerificaEstadoImpressora(iACK, iST1, iST2);
//  if (iErro = 1) then
//    frmDemoFit.StatusBar1.Panels[1].Text := 'ACK: ' + itoa(iACK) + ' ST1: ' + itoa(iST1) + ' ST2: ' + itoa(iST2);
end;

function ObtemRetornoECF(var strMensagemErro: String): Boolean;
var
  iRetorno, iCodErro: Integer;
  strErroMsg: String;
  bSucesso: Boolean;

begin
  strErroMsg := StringofChar(' ', 1024);
  iRetorno := RetornoImpressora(iCodErro, strErroMsg);
  strMensagemErro := 'Erro n�: ' + intToStr(iCodErro) + ' - ' + strErroMsg;

  If (iRetorno = 1) Then
    bSucesso := True
  Else
    bSucesso := False;

  ObtemRetornoECF := bSucesso;
End;

Function RetiraValor(strEntrada: string): string;
var nPos : integer;
begin
  nPos := Pos('=',strEntrada);
  if(nPos>0) then
    result := MidStr(strEntrada, nPos+1, Length(strEntrada)-nPos)
  else
    result := '';
end;

end.

unit uUtilBematech;

interface

uses Dialogs, SysUtils;

  function Retorno_Impressora(bRetorno: Integer): Boolean;
  function fnc_Bematech_NumeroCupom: String;
  procedure prc_Bematech_TotalizarCupom;
  procedure prc_Bematech_PagarCupom(vForma, vValor, vParcelas, vCondicao: String);
  procedure prc_Bematech_EncerrarCupom;
  procedure prc_Bematech_InciarCupom(vCpf, vNome, vEndereco: String);
  procedure prc_Bematech_VenderItem(vCodProduto, vDescrProduto, vAliquota, vTipoQtde,
   vQtde, vValorItem, vTipoDesconto, vValorDesconto: string);
  procedure prc_Bematech_CancelarItem(vItem: String);
  function fnc_Bematech_Ultimo_Cupom: Integer;

implementation

uses
  uImpFiscal_Bematech;

function Retorno_Impressora(bRetorno: Integer): Boolean;  //Bematech
var
  iACK, iST1, iST2, iST3: Integer;
  cMSGErro: string;
begin

  iACK := 0; iST1 := 0; iST2 := 0;
  cMSGErro := '';
  result   := False;
  case bRetorno of
     0: cMSGErro  := 'Erro de Comunica��o!';
    -1: cMSGErro  := 'Erro de execu��o na Fun��o!';
    -2: cMSGErro  := 'Par�metro inv�lido na Fun��o!';
    -3: cMSGErro  := 'Al�quota n�o Programada!';
    -4: cMSGErro  := 'Arquivo BEMAFI32.INI n�o Encontrado!';
    -5: cMSGErro  := 'Erro ao abrir a Porta de Comunica��o!';
    -6: cMSGErro  := 'Impressora Desligada ou Cabo de Comunica��o Desconectado!';
    -7: cMSGErro  := 'C�digo do Banco n�o encontrado no arquivo BEMAFI32.INI!';
    -8: cMSGErro  := 'Erro ao criar ou gravar arquivo STATUS.TXT ou RETORNO.TXT!';
    -27: cMSGErro := 'Status diferente de 6, 0, 0!';
    -30: cMSGErro := 'Fun��o incompat�vel com a impressora fiscal YANCO!';
  end;

  if (cMSGErro <> '') then
  begin
    Bematech_FI_FinalizaModoTEF();
    ShowMessage(cMSGErro);
    result := False;
    Exit;
  end;

  if (bRetorno = 1) then
  begin
    Bematech_FI_RetornoImpressoraMFD(iACK, iST1, iST2, iST3);
    if (iACK = 21) then
    begin
      Bematech_FI_FinalizaModoTEF();
      ShowMessage('A Impressora retornou NAK!' + #13 +
                  'Erro de Protocolo de Comunica��o!');
      result := False;
    end
    else
    if ( iST1 <> 0 ) or ( iST2 <> 0 ) then
    begin
    // Analisa ST1
      if ( iST1 >= 128 ) then
      begin
        iST1 := iST1 - 128;
        cMSGErro := cMSGErro + 'Fim de Papel' + #13;
      end;
      if ( iST1 >= 64 ) then
      begin
        iST1 := iST1 - 64;
        cMSGErro := cMSGErro + 'Pouco Papel' + #13;
      end;
      if ( iST1 >= 32 ) then
      begin
        iST1 := iST1 - 32;
        cMSGErro := cMSGErro + 'Erro no Rel�gio' + #13;
      end;
      if ( iST1 >= 16 ) then
      begin
        iST1 := iST1 - 16;
        cMSGErro := cMSGErro + 'Impressora em Erro' + #13;
      end;
      if ( iST1 >= 8 ) then
      begin
        iST1 := iST1 - 8;
        cMSGErro := cMSGErro + 'Primeiro Dado do Comando n�o foi ESC' + #13;
      end;
      if iST1 >= 4 then
      begin
        iST1 := iST1 - 4;
        cMSGErro := cMSGErro + 'Comando Inexistente' + #13;
      end;
      if iST1 >= 2 then
      begin
        iST1 := iST1 - 2;
        cMSGErro := cMSGErro + 'Cupom Fiscal Aberto' + #13;
      end;
      if iST1 >= 1 then
      begin
        iST1 := iST1 - 1;
        cMSGErro := cMSGErro + 'N�mero de Par�metros Inv�lidos' + #13;
      end;

      // Analisa ST2
      if iST2 >= 128 then
      begin
        iST2 := iST2 - 128;
        cMSGErro := cMSGErro + 'Tipo de Par�metro de Comando Inv�lido' + #13;
      end;
      if iST2 >= 64 then
      begin
        iST2 := iST2 - 64;
        cMSGErro := cMSGErro + 'Mem�ria Fiscal Lotada' + #13;
      end;
      if iST2 >= 32 then
      begin
        iST2 := iST2 - 32;
        cMSGErro := cMSGErro + 'Erro na CMOS' + #13;
      end;
      if iST2 >= 16 then
      begin
        iST2 := iST2 - 16;
        cMSGErro := cMSGErro + 'Al�quota n�o Programada' + #13;
      end;
      if iST2 >= 8 then
      begin
        iST2 := iST2 - 8;
        cMSGErro := cMSGErro + 'Capacidade de Al�quota Program�veis Lotada' + #13;
      end;
      if iST2 >= 4 then
      begin
        iST2 := iST2 - 4;
        cMSGErro := cMSGErro + 'Cancelamento n�o permitido' + #13;
      end;
      if iST2 >= 2 then
      begin
        iST2 := iST2 - 2;
        cMSGErro := cMSGErro + 'CGC/IE do Propriet�rio n�o Programados' + #13;
      end;
      if iST2 >= 1 then
      begin
        iST2 := iST2 - 1;
        cMSGErro := cMSGErro + 'Comando n�o executado' + #13;
      end;
      if ( cMSGErro <> '' ) then
      begin
        Bematech_FI_FinalizaModoTEF();
        ShowMessage(cMSGErro);
        result := False;
      end;
    end
    else
      result := True;
  end;
end;

function fnc_Bematech_NumeroCupom: String;
var
  vNumCupomAux: String;
  bRetorno: Integer;
begin
  vNumCupomAux := '000000';
  SetLength(vNumCupomAux,6);
  bRetorno := Bematech_FI_NumeroCupom(vNumCupomAux);
  Retorno_Impressora(bRetorno);
  result := vNumCupomAux;
end;

procedure prc_Bematech_TotalizarCupom;
var
  bRetorno: Integer;
  sAcreDesc, sTipoAcreDesc, sValorAcreDesc: String;
begin
  sAcreDesc      := 'D';
  sTipoAcreDesc  := '%';
  sValorAcreDesc := '0,00';
  //  Fun��o que realiza o in�cio do fechamento do cupom fiscal.
  bRetorno := Bematech_FI_IniciaFechamentoCupom(sAcreDesc,sTipoAcreDesc,sValorAcreDesc);
  Retorno_Impressora(bRetorno);
end;

procedure prc_Bematech_PagarCupom(vForma, vValor, vParcelas, vCondicao: String);
var
  bRetorno: Integer;
begin
  bRetorno := Bematech_FI_EfetuaFormaPagamentoMFD(pchar(vForma),pchar(vValor),pchar(vParcelas),pchar(vCondicao));
  Retorno_Impressora(bRetorno);
end;

procedure prc_Bematech_EncerrarCupom;
var
  bRetorno: Integer;
begin
  bRetorno := Bematech_FI_TerminaFechamentoCupom(pchar('Obrigado, volte sempre!'));
  Retorno_Impressora(bRetorno);
end;

procedure prc_Bematech_InciarCupom(vCpf, vNome, vEndereco: String);
var
  bRetorno: Integer;
begin
  bRetorno := Bematech_FI_AbreCupomMFD(pchar(vCpf),pchar(vNome),pchar(vEndereco));
  Retorno_Impressora(bRetorno);
end;

procedure prc_Bematech_VenderItem(vCodProduto, vDescrProduto, vAliquota, vTipoQtde,
   vQtde, vValorItem, vTipoDesconto, vValorDesconto: string);
var
  bRetorno: Integer;
begin
  bRetorno := Bematech_FI_VendeItem(pchar(vCodProduto), pchar(Copy(vDescrProduto,1,25)), pchar(vAliquota), pchar(vTipoQtde),
                                    pchar(vQtde),2, pchar(vValorItem), pchar(vTipoDesconto), pchar(vValorDesconto));
  Retorno_Impressora(bRetorno);
end;

procedure prc_Bematech_CancelarItem(vItem: String);
var
  bRetorno: Integer;
begin
  bRetorno := Bematech_FI_CancelaItemGenerico(vItem);
  Retorno_Impressora(bRetorno);
end;

function fnc_Bematech_Ultimo_Cupom: Integer;
var
  bRetorno: Integer;
  vNumCupomAux: String;
begin
  vNumCupomAux := '000000';
  SetLength(vNumCupomAux,6);
  bRetorno := Bematech_FI_NumeroCupom(vNumCupomAux);
  Result   := StrToInt(vNumCupomAux);
end;

end.

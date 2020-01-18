unit uCalculo_CupomFiscal;

interface

uses
  Classes, SysUtils, DB, Dialogs, Variants, SqlExpr, DmdDatabase, UDMCupomFiscal;

  procedure prc_Calculo_GeralItem(fDMCupomFiscal: TDMCupomFiscal; Qtd, VlrUnitario, DescontoItem, PercDescontoItem,
            VlrTotal, VlrAcrescimo: Real; GeraDupl: String; Desc_Rateio: Real = 0);
  procedure prc_Calcular_ICMS(fDMCupomFiscal: TDMCupomFiscal; VlrTotal, VlrDesconto, VlrIPI, PercIcms: Real; CodSitTrib: Integer; CodCST_ICMS: String = '');
  procedure prc_Calcular_PisCofins(fDMCupomFiscal: TDMCupomFiscal; VlrTotal: Real);
  procedure prc_Calcular_Tributos_Transparencia(fDMCupomFiscal: TDMCupomFiscal);
  procedure prc_Calcular_Geral(fDMCupomFiscal: TDMCupomFiscal);
  function fnc_Calcular_IPI(fDMCupomFiscal: TDMCupomFiscal; VlrTotal, VlrDesconto, PercIPI: Real): Real;
  procedure prc_Move_Itens_Ajuste(fDMCupomFiscal: TDMCupomFiscal);

  procedure prc_Calcular_ST_Ret(fDMCupomFiscal: TDMCupomFiscal);
  procedure prc_Calcular_ICMS_Efet(fDMCupomFiscal: TDMCupomFiscal);
  procedure prc_Abrir_qProduto_UF(fDMCupomFiscal: TDMCupomFiscal;ID_NCM: Integer; UF: String);
  procedure prc_Abrir_qNCM_UF(fDMCupomFiscal: TDMCupomFiscal;ID_NCM: Integer; UF, Importado_Nacional: String);


implementation

uses Math;

//var
  //vCalcTotalNota, vCalcSeguro, vCalcOutrasDesp, vCalcImportacao, vCalcAduaneira: Real;

procedure prc_Calculo_GeralItem(fDMCupomFiscal: TDMCupomFiscal; Qtd, VlrUnitario,
  DescontoItem, PercDescontoItem, VlrTotal, VlrAcrescimo: Real; GeraDupl: String; Desc_Rateio: Real = 0);
var
  vVlrTotalItem: Real;
  vVlrDescontoItem: Real;
  vVlrAux: Real;
  vVlrFreteAnt, vVlrSeguroAnt, vVlrOutrasDespAnt, vVlrPisAnt, vVlrCofinsAnt, vVlrIPIAnt: Real;
  vCodCST: String;
begin
  if (StrToCurr(FormatCurr('0.0000',Qtd)) > 0) and (StrToCurr(FormatCurr('0.0000000000',VlrUnitario)) > 0) then
    vVlrTotalItem := StrToCurr(FormatCurr('0.00',Qtd * VlrUnitario))
  else
    vVlrTotalItem := StrToCurr(FormatCurr('0.00',VlrTotal));

  if (StrToFloat(FormatFloat('0.0000',PercDescontoItem)) > 0) and (StrToFloat(FormatFloat('0.0000',DescontoItem)) <= 0) then
    DescontoItem := StrToCurr(FormatCurr('0.00',vVlrTotalItem * PercDescontoItem / 100));
  vVlrDescontoItem  := 0;
  vVlrFreteAnt      := 0;
  vVlrSeguroAnt     := 0;
  vVlrOutrasDespAnt := 0;
  vVlrPisAnt        := 0;
  vVlrCofinsAnt     := 0;
  vVlrIPIAnt        := 0;
  //vPesoBruto        := 0;
  //vPesoLiquido      := 0;
  //vVlrIcms_Operacao := 0;
  //***************

  if fDMCupomFiscal.cdsCFOPID.AsInteger <> fDMCupomFiscal.cdsCupom_ItensID_CFOP.AsInteger then
    fDMCupomFiscal.cdsCFOP.Locate('ID',fDMCupomFiscal.cdsCupom_ItensID_CFOP.AsInteger,([Locaseinsensitive]));
  if fDMCupomFiscal.cdsFilialID.AsInteger <> fDMCupomFiscal.cdsCupomFiscalFILIAL.AsInteger then
    fDMCupomFiscal.cdsFilial.Locate('ID',fDMCupomFiscal.cdsCupomFiscalFILIAL.AsInteger,([Locaseinsensitive]));
  if fDMCupomFiscal.cdsPessoaCODIGO.AsInteger <> fDMCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger then
    fDMCupomFiscal.prc_Localizar_Pessoa(fDMCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger,'');
  if fDMCupomFiscal.cdsCupomFiscalID_CLIENTE.AsInteger > 0 then
  begin
    fDMCupomFiscal.qUF.Close;
    fDMCupomFiscal.qUF.ParamByName('UF').AsString := fDMCupomFiscal.cdsPessoaUF.AsString;
    fDMCupomFiscal.qUF.Open;
  end;

  if (fDMCupomFiscal.cdsCupomFiscalTIPO_DESCONTO.AsString = 'N') and (GeraDupl = 'S') then
   vVlrDescontoItem := StrToCurr(FormatCurr('0.00',fDMCupomFiscal.cdsCupom_ItensVLR_DESCONTO.AsFloat))
  else
  if (fDMCupomFiscal.cdsCupomFiscalTIPO_DESCONTO.AsString <> 'N') and (StrToCurr(FormatFloat('0.000',PercDescontoItem)) > 0) then
    vVlrDescontoItem := StrToCurr(FormatCurr('0.00',vVlrTotalItem * PercDescontoItem / 100))
  else
  if (fDMCupomFiscal.cdsCupomFiscalTIPO_DESCONTO.AsString <> 'N') and (StrToFloat(FormatFloat('0.000',DescontoItem)) > 0) then
    vVlrDescontoItem := StrToCurr(FormatCurr('0.00',DescontoItem));

  if (fDMCupomFiscal.cdsCupomFiscalTIPO_DESCONTO.AsString = 'I') and (StrToFloat(FormatFloat('0.0000',fDMCupomFiscal.cdsCupom_ItensPERC_DESCONTO.AsFloat)) > 0) then
    fDMCupomFiscal.cdsCupom_ItensVLR_DESCONTO.AsFloat := StrToCurr(FormatCurr('0.00',vVlrDescontoItem));

  fDMCupomFiscal.cdsCupom_ItensVLR_DESCONTORATEIO.AsFloat := StrToFloat(FormatFloat('0.00',Desc_Rateio));
  fDMCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat          := StrToFloat(FormatFloat('0.00',vVlrTotalItem - vVlrDescontoItem -
                                                                        fDMCupomFiscal.cdsCupom_ItensVLR_DESCONTORATEIO.AsFloat));
  fDMCupomFiscal.cdsCupom_ItensVLR_IPI.AsFloat            := fnc_Calcular_IPI(fDMCupomFiscal,fDMCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat,vVlrDescontoItem +
                                                             Desc_Rateio, fDMCupomFiscal.cdsCupom_ItensPERC_IPI.AsFloat);
  fDMCupomFiscal.cdsCupom_ItensVLR_PIS.AsFloat    := 0;
  fDMCupomFiscal.cdsCupom_ItensVLR_COFINS.AsFloat := 0;
  prc_Calcular_PisCofins(fDMCupomFiscal, fDMCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat);

  prc_Calcular_ICMS(fDMCupomFiscal, vVlrTotalItem - vVlrDescontoItem - Desc_Rateio,vVlrDescontoItem + Desc_Rateio,
                    fDMCupomFiscal.cdsCupom_ItensVLR_IPI.AsFloat,fDMCupomFiscal.cdsCupom_ItensPERC_ICMS.AsFloat,
                    fDMCupomFiscal.cdsCupom_ItensID_CSTICMS.AsInteger,'');
  //C�lculo tributos federais, estaduais, e municipais cfe. disposto na lei 12.741/12
  prc_Calcular_Tributos_Transparencia(fDMCupomFiscal);

  fDMCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsCurrency  := StrToFloat(FormatFloat('0.00',fDMCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsCurrency +
                                                                   fDMCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat +
                                                                   fDMCupomFiscal.cdsCupom_ItensVLR_JUROS.AsCurrency));

  if (StrToCurr(FormatCurr('0.0000',Qtd)) > 0) and (StrToCurr(FormatCurr('0.0000000000',fDMCupomFiscal.cdsCupom_ItensVLR_UNIT_ORIGINAL.AsCurrency)) > 0) then
    vVlrTotalItem := StrToCurr(FormatCurr('0.00',Qtd * fDMCupomFiscal.cdsCupom_ItensVLR_UNIT_ORIGINAL.AsCurrency));

  fDMCupomFiscal.cdsCupomFiscalVLR_PRODUTOS.AsString := FormatFloat('0.00',fDMCupomFiscal.cdsCupomFiscalVLR_PRODUTOS.AsCurrency +
                                                                    vVlrTotalItem - fDMCupomFiscal.cdsCupom_ItensVLR_DESCONTO.AsFloat);
  fDMCupomFiscal.cdsCupomFiscalVLR_DESCONTO.AsString := FormatFloat('0.00',fDMCupomFiscal.cdsCupomFiscalVLR_DESCONTO.AsCurrency + vVlrDescontoItem);

  //26/02/2019
  prc_Calcular_ST_Ret(fDMCupomFiscal);
  prc_Calcular_ICMS_Efet(fDMCupomFiscal);

  fDMCupomFiscal.cdsCupomFiscalBASE_ICMSSUBST_RET.AsFloat := fDMCupomFiscal.cdsCupomFiscalBASE_ICMSSUBST_RET.AsFloat + fDMCupomFiscal.cdsCupom_ItensBASE_ICMSSUBST_RET.AsFloat;
  fDMCupomFiscal.cdsCupomFiscalVLR_ICMSSUBST_RET.AsFloat  := fDMCupomFiscal.cdsCupomFiscalVLR_ICMSSUBST_RET.AsFloat + fDMCupomFiscal.cdsCupom_ItensVLR_ICMSSUBST_RET.AsFloat;
  fDMCupomFiscal.cdsCupomFiscalVLR_BASE_EFET.AsFloat      := fDMCupomFiscal.cdsCupomFiscalVLR_BASE_EFET.AsFloat + fDMCupomFiscal.cdsCupom_ItensVLR_BASE_EFET.AsFloat;
  fDMCupomFiscal.cdsCupomFiscalVLR_ICMS_EFET.AsFloat      := fDMCupomFiscal.cdsCupomFiscalVLR_ICMS_EFET.AsFloat + fDMCupomFiscal.cdsCupom_ItensVLR_ICMS_EFE.AsFloat;
  //**************

  fDMCupomFiscal.cdsCupomFiscalBASE_ICMS.AsCurrency := StrToFloat(FormatFloat('0.00',fDMCupomFiscal.cdsCupomFiscalBASE_ICMS.AsCurrency + fDMCupomFiscal.cdsCupom_ItensBASE_ICMS.AsCurrency));
  fDMCupomFiscal.cdsCupomFiscalVLR_ICMS.AsCurrency  := StrToFloat(FormatFloat('0.00',fDMCupomFiscal.cdsCupomFiscalVLR_ICMS.AsCurrency + fDMCupomFiscal.cdsCupom_ItensVLR_ICMS.AsCurrency));
  fDMCupomFiscal.cdsCupomFiscalVLR_IPI.AsCurrency   := StrToFloat(FormatFloat('0.00',fDMCupomFiscal.cdsCupomFiscalVLR_IPI.AsCurrency + fDMCupomFiscal.cdsCupom_ItensVLR_IPI.AsCurrency));
  fDMCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat    := fDMCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat + fDMCupomFiscal.cdsCupom_ItensVLR_IPI.AsFloat - vVlrIPIAnt;
  fDMCupomFiscal.cdsCupomFiscalVLR_PIS.AsFloat      := fDMCupomFiscal.cdsCupomFiscalVLR_PIS.AsFloat + fDMCupomFiscal.cdsCupom_ItensVLR_PIS.AsFloat - vVlrPisAnt;
  fDMCupomFiscal.cdsCupomFiscalVLR_COFINS.AsFloat   := fDMCupomFiscal.cdsCupomFiscalVLR_COFINS.AsFloat + fDMCupomFiscal.cdsCupom_ItensVLR_COFINS.AsFloat - vVlrCofinsAnt;
  fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO.AsFloat  := fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO.AsFloat + fDMCupomFiscal.cdsCupom_ItensVLR_TRIBUTO.AsFloat;
  fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_FEDERAL.AsFloat   := fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_FEDERAL.AsFloat + fDMCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_FEDERAL.AsFloat;
  fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_ESTADUAL.AsFloat  := fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_ESTADUAL.AsFloat + fDMCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_ESTADUAL.AsFloat;
  fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_MUNICIPAL.AsFloat := fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_MUNICIPAL.AsFloat + fDMCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_MUNICIPAL.AsFloat;
end;

procedure prc_Calcular_ICMS(fDMCupomFiscal: TDMCupomFiscal; VlrTotal, VlrDesconto,
  VlrIPI, PercIcms: Real; CodSitTrib: Integer; CodCST_ICMS: String); //3.10 foi incluido a vari�vel CodCST_ICMS
var
  vBaseAux, vVlrIcmsAux: Real;
begin
  fDMCupomFiscal.cdsCupom_ItensBASE_ICMS.AsFloat := 0;
  fDMCupomFiscal.cdsCupom_ItensVLR_ICMS.AsFloat  := 0;
  if (fDMCupomFiscal.cdsProdutoTIPO_REG.AsString = 'N') then
    exit;

  if fDMCupomFiscal.cdsParametrosAPLICARDESCONTONOICMS.AsString = 'S' then
    vBaseAux := VlrTotal
  else
    vBaseAux := StrToCurr(FormatCurr('0.00',VlrTotal + VlrDesconto));
  if (StrToFloat(FormatFloat('0.0000',fDMCupomFiscal.cdsCupom_ItensPERC_TRIBICMS.AsFloat)) > 0) and
     (StrToFloat(FormatFloat('0.0000',fDMCupomFiscal.cdsCupom_ItensPERC_TRIBICMS.AsFloat)) <> StrToFloat(FormatFloat('0.0000',100))) then
    vBaseAux := StrToCurr(FormatCurr('0.00',vBaseAux * fDMCupomFiscal.cdsCupom_ItensPERC_TRIBICMS.AsFloat / 100));
  if vBaseAux > 0 then
    vVlrIcmsAux := StrToCurr(FormatCurr('0.00',vBaseAux * PercIcms / 100))
  else
    vVlrIcmsAux := 0;
  if StrToFloat(FormatFloat('0.00',vVlrIcmsAux)) > 0 then
  begin
    fDMCupomFiscal.cdsCupom_ItensBASE_ICMS.AsFloat := vBaseAux;
    fDMCupomFiscal.cdsCupom_ItensVLR_ICMS.AsFloat  := vVlrIcmsAux;
  end;
end;

procedure prc_Calcular_PisCofins(fDMCupomFiscal: TDMCupomFiscal; VlrTotal: Real);
begin
  if fDMCupomFiscal.cdsCupom_ItensPERC_PIS.AsFloat > 0 then
    fDMCupomFiscal.cdsCupom_ItensVLR_PIS.AsFloat := StrToCurr(FormatFloat('0.00',(fDMCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat *
                                                    fDMCupomFiscal.cdsCupom_ItensPERC_PIS.AsFloat) / 100));

  if fDMCupomFiscal.cdsCupom_ItensPERC_COFINS.AsFloat > 0 then
   fDMCupomFiscal.cdsCupom_ItensVLR_COFINS.AsFloat := StrToCurr(FormatCurr('0.00',(fDMCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat *
                                                      fDMCupomFiscal.cdsCupom_ItensPERC_COFINS.AsFloat) / 100))
end;

function fnc_Calcular_IPI(fDMCupomFiscal: TDMCupomFiscal; VlrTotal, VlrDesconto,
  PercIPI: Real): Real;
var
  vAux: Real;
begin
  Result := 0;
  if fDMCupomFiscal.cdsParametrosAPLICARDESCONTONOIPI.AsString = 'S' then
    vAux := StrToCurr(FormatCurr('0.00',VlrTotal))
  else
    vAux := StrToCurr(FormatCurr('0.00',VlrTotal + VlrDesconto));
  if (PercIPI > 0) then
    Result := StrToCurr(FormatCurr('0.00',vAux * PercIPI / 100))
end;

procedure prc_Calcular_Tributos_Transparencia(fDMCupomFiscal: TDMCupomFiscal);
var
  vAux: Real;
begin
  fDMCupomFiscal.cdsCupom_ItensVLR_TRIBUTO.AsFloat           := 0;
  fDMCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_FEDERAL.AsFloat   := 0;
  fDMCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_ESTADUAL.AsFloat  := 0;
  fDMCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_MUNICIPAL.AsFloat := 0;
  if (fDMCupomFiscal.cdsCFOPGERAR_TRIBUTO.AsString = 'S') then
  begin
    if (StrToFloat(FormatFloat('0.00',fDMCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_FEDERAL.AsFloat)) > 0) then
    begin
      vAux := StrToCurr(FormatCurr('0.00',((fDMCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat + fDMCupomFiscal.cdsCupom_ItensVLR_JUROS.AsFloat) *
                                           fDMCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_FEDERAL.AsFloat) / 100));
      fDMCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_FEDERAL.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
    end;
    if (StrToFloat(FormatFloat('0.00',fDMCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_ESTADUAL.AsFloat)) > 0) then
    begin
      vAux := StrToCurr(FormatCurr('0.00',((fDMCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat  + fDMCupomFiscal.cdsCupom_ItensVLR_JUROS.AsFloat) *
                                           fDMCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_ESTADUAL.AsFloat) / 100));
      fDMCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_ESTADUAL.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
    end;
    if (StrToFloat(FormatFloat('0.00',fDMCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat)) > 0) then
    begin
      vAux := StrToCurr(FormatCurr('0.00',((fDMCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat  + fDMCupomFiscal.cdsCupom_ItensVLR_JUROS.AsFloat) *
                                           fDMCupomFiscal.cdsCupom_ItensPERC_TRIBUTO_MUNICIPAL.AsFloat) / 100));
      fDMCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_MUNICIPAL.AsFloat := StrToFloat(FormatFloat('0.00',vAux));
    end;
    fDMCupomFiscal.cdsCupom_ItensVLR_TRIBUTO.AsFloat := fDMCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_ESTADUAL.AsFloat
                                                      + fDMCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_FEDERAL.AsFloat
                                                      + fDMCupomFiscal.cdsCupom_ItensVLR_TRIBUTO_MUNICIPAL.AsFloat;
  end;
end;

procedure prc_Calcular_Geral(fDMCupomFiscal: TDMCupomFiscal);
var
  vVlrDesconto, vAux: Real;
  vVlrDesconto_Ori: Real;
  vVlrTotal: Real;
  vContador: Integer;
  vVlrJuros: Real;
begin
  if not(fDMCupomFiscal.cdsCupomFiscal.State in [dsEdit,dsInsert]) then
    fDMCupomFiscal.cdsCupomFiscal.Edit;
  vVlrDesconto     := fDMCupomFiscal.cdsCupomFiscalVLR_DESCONTO.AsFloat;
  vVlrDesconto_Ori := fDMCupomFiscal.cdsCupomFiscalVLR_DESCONTO.AsFloat;
  vVlrTotal        := fDMCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat;
  vVlrJuros        := fDMCupomFiscal.cdsCupomFiscalVLR_OUTROS.AsFloat;


  fDMCupomFiscal.cdsCupomFiscalVLR_COFINS.AsFloat   := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_DESCONTO.AsFloat := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_ICMS.AsFloat     := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_IPI.AsFloat      := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_PIS.AsFloat      := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_PRODUTOS.AsFloat := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat    := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO.AsFloat  := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_ESTADUAL.AsFloat  := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_FEDERAL.AsFloat   := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_TRIBUTO_MUNICIPAL.AsFloat := 0;

  //26/02/2019
  fDMCupomFiscal.cdsCupomFiscalBASE_ICMSSUBST_RET.AsFloat := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_ICMSSUBST_RET.AsFloat  := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_BASE_EFET.AsFloat      := 0;
  fDMCupomFiscal.cdsCupomFiscalVLR_ICMS_EFET.AsFloat      := 0;
  //**************

  vContador := 0;
  fDMCupomFiscal.cdsCupom_Itens.First;
  while not fDMCupomFiscal.cdsCupom_Itens.Eof do
  begin
    vContador := vContador + 1;
    vAux := StrToFloat(FormatFloat('0.00',0));
    if StrToFloat(FormatFloat('0.00',vVlrDesconto)) > 0 then
    begin
      vAux := StrToFloat(FormatFloat('0.00',(vVlrDesconto_Ori * ((fDMCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat / vVlrTotal) * 100)) / 100));
      if StrToFloat(FormatFloat('0.00',vAux)) > StrToFloat(FormatFloat('0.00',vVlrDesconto)) then
        vAux := StrToFloat(FormatFloat('0.00',vVlrDesconto));
      vVlrDesconto := StrToFloat(FormatFloat('0.00',vVlrDesconto - vAux));
      if (vContador = fDMCupomFiscal.cdsCupom_Itens.RecordCount) then
      begin
        if StrToFloat(FormatFloat('0.00',vVlrDesconto)) <> StrToFloat(FormatFloat('0.00',0)) then
          vAux := StrToFloat(FormatFloat('0.00',vAux + vVlrDesconto));
        vVlrDesconto := StrToFloat(FormatFloat('0.00',0));
      end;
    end;

    fDMCupomFiscal.cdsCupom_Itens.Edit;
//    fDmCupomFiscal.cdsCupom_ItensVLR_DESCONTO.AsFloat := vAux;

    fDmCupomFiscal.vID_CFOP     := fDmCupomFiscal.cdsCupom_ItensID_CFOP.AsInteger;
    fDmCupomFiscal.vID_Variacao := fDmCupomFiscal.cdsCupom_ItensID_VARIACAO.AsInteger;
    prc_Move_Itens_Ajuste(fDmCupomFiscal);

    if fDmCupomFiscal.vID_CFOP > 0 then
    begin
      fDmCupomFiscal.cdsCupom_ItensID_CFOP.AsInteger := fDmCupomFiscal.vID_CFOP;
      if fDmCupomFiscal.vID_Variacao > 0 then
        fDmCupomFiscal.cdsCupom_ItensID_VARIACAO.AsInteger := fDmCupomFiscal.vID_Variacao;
    end;

    if fDmCupomFiscal.vID_Pis > 0 then
      fDmCupomFiscal.cdsCupom_ItensID_PIS.AsInteger := fDmCupomFiscal.vID_Pis;
    if fDmCupomFiscal.vID_Cofins > 0 then
      fDmCupomFiscal.cdsCupom_ItensID_COFINS.AsInteger := fDmCupomFiscal.vID_Cofins;
    if fDmCupomFiscal.vID_CSTICMS > 0 then
      fDmCupomFiscal.cdsCupom_ItensID_CSTICMS.AsInteger := fDmCupomFiscal.vID_CSTICMS;

    fDmCupomFiscal.cdsCupom_ItensTIPO_PIS.AsString     := fDmCupomFiscal.vTipo_Pis;
    fDmCupomFiscal.cdsCupom_ItensTIPO_COFINS.AsString  := fDmCupomFiscal.vTipo_Cofins;
    fDmCupomFiscal.cdsCupom_ItensPERC_PIS.AsFloat      := fDmCupomFiscal.vPerc_Pis;
    fDmCupomFiscal.cdsCupom_ItensPERC_COFINS.AsFloat   := fDmCupomFiscal.vPerc_Cofins;
    fDmCupomFiscal.cdsCupom_ItensPERC_TRIBICMS.AsFloat := fDmCupomFiscal.vPerc_TribICMS;
    fDmCupomFiscal.cdsCupom_ItensPERC_ICMS.AsFloat     := fDmCupomFiscal.vPerc_ICMS;
    fDmCupomFiscal.cdsCupom_ItensPERC_IPI.AsFloat      := fDmCupomFiscal.vPerc_IPI;

    prc_Calculo_GeralItem(fDmCupomFiscal,fDmCupomFiscal.cdsCupom_ItensQTD.AsFloat,fDmCupomFiscal.cdsCupom_ItensVLR_UNIT_ORIGINAL.AsFloat,
                                         fDmCupomFiscal.cdsCupom_ItensVLR_DESCONTO.AsFloat,fDmCupomFiscal.cdsCupom_ItensPERC_DESCONTO.AsFloat,
                                         fDmCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat,fDmCupomFiscal.cdsCupom_ItensVLR_JUROS.AsFloat,
                                         'S',StrToFloat(FormatFloat('0.00',vAux)));
    fDMCupomFiscal.cdsCupom_Itens.Post;
    fDMCupomFiscal.cdsCupom_Itens.Next;
  end;

  fDMCupomFiscal.cdsCupomFiscalVLR_DESCONTO.AsFloat := StrToFloat(FormatFloat('0.00',vVlrDesconto_Ori));
//  fDMCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat    := fDMCupomFiscal.cdsCupomFiscalVLR_TOTAL.AsFloat -
//                                                       fDMCupomFiscal.cdsCupomFiscalVLR_DESCONTO.AsFloat;
end;

procedure prc_Move_Itens_Ajuste(fDMCupomFiscal: TDMCupomFiscal);
var
  vGeraIcms: Boolean;
begin
  if (fDmCupomFiscal.cdsParametrosUSA_NFCE.AsString <> 'S') then
    exit;

  fDmCupomFiscal.prc_Abrir_Produto('ID',fDmCupomFiscal.cdsCupom_ItensID_PRODUTO.AsString);

  if fDmCupomFiscal.cdsProdutoID.AsInteger <> fDmCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger  then
    fDmCupomFiscal.cdsProduto.Locate('ID',fDmCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]);

  fDmCupomFiscal.vID_NCM := fDmCupomFiscal.cdsProdutoID_NCM.AsInteger;
  if fDmCupomFiscal.vID_NCM > 0 then
    fDmCupomFiscal.cdsTab_NCM.Locate('ID',fDmCupomFiscal.vID_NCM,[loCaseInsensitive]);

  if fDmCupomFiscal.cdsProdutoID_CFOP_NFCE.AsInteger > 0 then
    fDmCupomFiscal.vID_CFOP := fDmCupomFiscal.cdsProdutoID_CFOP_NFCE.AsInteger
  else
  if (fDmCupomFiscal.cdsTab_NCMID_CFOP.AsInteger > 0) and (fDmCupomFiscal.cdsTab_NCMID.AsInteger = fDmCupomFiscal.cdsCupom_ItensID_NCM.AsInteger) then
    fDmCupomFiscal.vID_CFOP := fDmCupomFiscal.cdsTab_NCMID_CFOP.AsInteger
  else
  if fDmCupomFiscal.cdsFilialID_CFOP_NFCE_PADRAO.AsInteger > 0 then
    fDmCupomFiscal.vID_CFOP := fDmCupomFiscal.cdsFilialID_CFOP_NFCE_PADRAO.AsInteger;
  if fDmCupomFiscal.vID_CFOP > 0 then
  begin
    fDmCupomFiscal.cdsCFOP.Locate('ID',fDmCupomFiscal.vID_CFOP,[loCaseInsensitive]);
    vGeraIcms := fDmCupomFiscal.cdsCFOPGERAR_ICMS.AsString = 'S';
  end;
  fDmCupomFiscal.vID_Variacao := 0;
  if fDmCupomFiscal.vID_CFOP > 0 then
    fDmCupomFiscal.vID_Variacao := fDmCupomFiscal.fnc_Buscar_Regra_CFOP(fDmCupomFiscal.vID_CFOP);
  if fDmCupomFiscal.vID_Variacao = 0 then
    ShowMessage('Varia��o da CFOP n�o localizada para a opera��o!' + #13 +
                'Cupom fiscal n�o ser� validado!')
  else
    fDmCupomFiscal.prc_Mover_CST;
end;

procedure prc_Calcular_ST_Ret(fDMCupomFiscal: TDMCupomFiscal);
var
  vBaseSTRet : Real;
  vVlrSTRet : Real;
begin
  fDMCupomFiscal.cdsCupom_ItensBASE_ICMSSUBST_RET.AsFloat := 0;
  fDMCupomFiscal.cdsCupom_ItensVLR_ICMSSUBST_RET.AsFloat  := 0;
  fDMCupomFiscal.cdsCupom_ItensVLR_BASE_EFET.AsFloat      := 0;
  fDMCupomFiscal.cdsCupom_ItensVLR_ICMS_EFE.AsFloat      := 0;
  if (fDMCupomFiscal.cdsCFOPENVIAR_BASE_ST.AsString <> 'S') then
    exit;
  if (fDMCupomFiscal.cdsCFOPSUBSTITUICAO_TRIB.AsString = 'S') then
    exit;
  if fDMCupomFiscal.cdsFilialUSA_ENVIO_ST_RET.AsString <> 'S' then
    exit;

  //ver como pegar o % ST
  fDMCupomFiscal.qProdST.Close;
  fDMCupomFiscal.qProdST.ParamByName('ID_Produto').AsInteger := fDMCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger;
  fDMCupomFiscal.qProdST.Open;
  if fDMCupomFiscal.qProdST.IsEmpty then
    Exit;

  if StrToFloat(FormatFloat('0.0000',fDMCupomFiscal.qProdSTBASE_ST_RET.AsFloat)) > 0 then
  begin
    vBaseSTRet := StrToFloat(FormatFloat('0.0000',fDMCupomFiscal.qProdSTBASE_ST_RET.AsFloat));
    vVlrSTRet  := StrToFloat(FormatFloat('0.0000',fDMCupomFiscal.qProdSTVLR_ST_RET.AsFloat));
  end
  else
  begin
    vBaseSTRet := StrToFloat(FormatFloat('0.0000',fDMCupomFiscal.qProdSTBASE_ST.AsFloat));
    vVlrSTRet  := StrToFloat(FormatFloat('0.0000',fDMCupomFiscal.qProdSTVLR_ST.AsFloat));
  end;
  if StrToFloat(FormatFloat('0.0000',vBaseSTRet)) <= 0 then
    exit;
  fDMCupomFiscal.cdsCupom_ItensBASE_ICMSSUBST_RET.AsFloat := StrToFloat(FormatFloat('0.00',vBaseSTRet * fDMCupomFiscal.cdsCupom_ItensQTD.AsFloat));
  fDMCupomFiscal.cdsCupom_ItensVLR_ICMSSUBST_RET.AsFloat  := StrToFloat(FormatFloat('0.00',vVlrSTRet * fDMCupomFiscal.cdsCupom_ItensQTD.AsFloat));
  fDMCupomFiscal.cdsCupom_ItensPERC_ST.AsFloat            := StrToFloat(FormatFloat('0.00',fDMCupomFiscal.qProdSTPERC_ST.AsFloat));
end;

procedure prc_Abrir_qProduto_UF(fDMCupomFiscal: TDMCupomFiscal;ID_NCM: Integer; UF: String);
begin
  fDMCupomFiscal.qProduto_UF.Close;
  fDMCupomFiscal.qProduto_UF.ParamByName('ID').AsInteger := ID_NCM;
  fDMCupomFiscal.qProduto_UF.ParamByName('UF').AsString  := UF;
  fDMCupomFiscal.qProduto_UF.Open;
end;

procedure prc_Abrir_qNCM_UF(fDMCupomFiscal: TDMCupomFiscal;ID_NCM: Integer; UF, Importado_Nacional: String);
begin
  fDMCupomFiscal.qNCM_UF.Close;
  fDMCupomFiscal.qNCM_UF.ParamByName('ID').AsInteger          := ID_NCM;
  fDMCupomFiscal.qNCM_UF.ParamByName('UF').AsString           := UF;
  fDMCupomFiscal.qNCM_UF.ParamByName('TIPO_PRODUTO').AsString := Importado_Nacional;
  fDMCupomFiscal.qNCM_UF.Open;
end;

procedure prc_Calcular_ICMS_Efet(fDMCupomFiscal: TDMCupomFiscal);
var
  vPerc_Interno : Real;
  vVlrAux : Real;
  vPerc_Red : Real;
begin
  fDMCupomFiscal.cdsCupom_ItensVLR_BASE_EFET.AsFloat := 0;
  fDMCupomFiscal.cdsCupom_ItensVLR_ICMS_EFE.AsFloat  := 0;
  if (fDMCupomFiscal.cdsCFOPENVIAR_BASE_ST.AsString <> 'S') then
    exit;
  if (fDMCupomFiscal.cdsCFOPSUBSTITUICAO_TRIB.AsString = 'S') then
    exit;
  //if fDMCupomFiscal.cdsFilialUSA_ENVIO_ST_RET.AsString <> 'S' then
  //  exit;

  if (fDMCupomFiscal.cdsFilialCALCULAR_ICMS_EFET.AsString = 'N') or (Trim(fDMCupomFiscal.cdsFilialCALCULAR_ICMS_EFET.AsString) = '')  then
    exit;

  //Busca o %
  vPerc_Interno := 0;
  vPerc_Red     := 0;
  if fDMCupomFiscal.cdsProdutoID.AsInteger <> fDMCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger then
    fDMCupomFiscal.cdsProduto.Locate('ID',fDMCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger,[loCaseInsensitive]);
  if StrToFloat(FormatFloat('0.0000',fDMCupomFiscal.cdsProdutoPERC_REDUCAOICMS.AsFloat)) > 0 then
    vPerc_Red := StrToFloat(FormatFloat('0.0000',100 - fDMCupomFiscal.cdsProdutoPERC_REDUCAOICMS.AsFloat));
  prc_Abrir_qProduto_UF(fDMCupomFiscal,fDMCupomFiscal.cdsCupom_ItensID_PRODUTO.AsInteger,fDMCupomFiscal.cdsFilialUF.AsString);
  if not(fDMCupomFiscal.qProduto_UF.IsEmpty) and (StrToFloat(FormatFloat('0.00',fDMCupomFiscal.qProduto_UFPERC_ICMS_INTERNO.AsFloat)) > 0) then
  begin
    vPerc_Interno := StrToFloat(FormatFloat('0.00',fDMCupomFiscal.qProduto_UFPERC_ICMS_INTERNO.AsFloat));
    if (StrToFloat(FormatFloat('0.00',fDMCupomFiscal.qProduto_UFPERC_REDUCAO_ICMS.AsFloat)) > 0)
      and (StrToFloat(FormatFloat('0.00',fDMCupomFiscal.qProduto_UFPERC_REDUCAO_ICMS.AsFloat)) < 100) then
      vPerc_Red := StrToFloat(FormatFloat('0.0000',100 - fDMCupomFiscal.qProduto_UFPERC_REDUCAO_ICMS.AsFloat));
  end;
  if (StrToFloat(FormatFloat('0.0000',vPerc_Red)) <= 0) then
  begin
    if fDMCupomFiscal.cdsTab_NCMID.AsInteger <> fDMCupomFiscal.cdsCupom_ItensID_NCM.AsInteger then
      fDMCupomFiscal.cdsTab_NCM.Locate('ID',fDMCupomFiscal.cdsCupom_ItensID_NCM.AsString,[loCaseInsensitive]);
    if ((StrToFloat(FormatFloat('0.0000',fDMCupomFiscal.cdsTab_NCMPERC_BASE_ICMS.AsFloat)) > 0)
       and (StrToFloat(FormatFloat('0.0000',fDMCupomFiscal.cdsTab_NCMPERC_BASE_ICMS.AsFloat)) < 100)) then
      vPerc_Red := StrToFloat(FormatFloat('0.0000',100 - fDMCupomFiscal.cdsTab_NCMPERC_BASE_ICMS.AsFloat));
  end;

  if StrToFloat(FormatFloat('0.00',vPerc_Interno)) <= 0  then
  begin
    prc_Abrir_qNCM_UF(fDMCupomFiscal,fDMCupomFiscal.cdsCupom_ItensID_NCM.AsInteger,fDMCupomFiscal.cdsFilialUF.AsString,'A');
    if StrToFloat(FormatFloat('0.000',fDMCupomFiscal.qNCM_UFPERC_ICMS_INTERNO.AsFloat)) > 0 then
      vPerc_Interno := fDMCupomFiscal.qNCM_UFPERC_ICMS_INTERNO.AsFloat;
  end;
  if StrToFloat(FormatFloat('0.00',vPerc_Interno)) <= 0 then
  begin
    if fDMCupomFiscal.cdsTab_NCMID.AsInteger <> fDMCupomFiscal.cdsCupom_ItensID_NCM.AsInteger then
      fDMCupomFiscal.cdsTab_NCM.Locate('ID',fDMCupomFiscal.cdsCupom_ItensID_NCM.AsString,[loCaseInsensitive]);
    if StrToFloat(FormatFloat('0.000',fDMCupomFiscal.cdsTab_NCMPERC_ICMS.AsFloat)) > 0 then
      vPerc_Interno := StrToFloat(FormatFloat('0.00',fDMCupomFiscal.cdsTab_NCMPERC_ICMS.AsFloat))
    else
    begin
      fDMCupomFiscal.qUF.Close;
      fDMCupomFiscal.qUF.ParamByName('UF').AsString := fDMCupomFiscal.cdsFilialUF.AsString;
      fDMCupomFiscal.qUF.Open;
      vPerc_Interno := StrToFloat(FormatFloat('0.00',fDMCupomFiscal.qUFPERC_ICMS_INTERNO.AsFloat));
    end;
  end;
  fDMCupomFiscal.cdsCupom_ItensPERC_BASE_RED_EFET.AsFloat := 0;
  if StrToFloat(FormatFloat('0.0000',vPerc_Red)) > 0 then
    fDMCupomFiscal.cdsCupom_ItensPERC_BASE_RED_EFET.AsFloat := StrToFloat(FormatFloat('0.0000',vPerc_Red));

  fDMCupomFiscal.cdsCupom_ItensPERC_ICMS_EFET.AsFloat := vPerc_Interno;

  if StrToFloat(FormatFloat('0.00',fDMCupomFiscal.cdsCupom_ItensPERC_ICMS_EFET.AsFloat)) > 0 then
  begin
    vVlrAux := StrToFloat(FormatFloat('0.00',fDMCupomFiscal.cdsCupom_ItensVLR_TOTAL.AsFloat));
    if StrToFloat(FormatFloat('0.0000',fDMCupomFiscal.cdsCupom_ItensPERC_BASE_RED_EFET.AsFloat)) > 0 then
      vVlrAux := vVlrAux - (StrToFloat(FormatFloat('0.0000',(vVlrAux * fDMCupomFiscal.cdsCupom_ItensPERC_BASE_RED_EFET.AsFloat) / 100)));
    fDMCupomFiscal.cdsCupom_ItensVLR_BASE_EFET.AsFloat := StrToFloat(FormatFloat('0.00',vVlrAux));
    vVlrAux := StrToFloat(FormatFloat('0.00',(vVlrAux * fDMCupomFiscal.cdsCupom_ItensPERC_ICMS_EFET.AsFloat) / 100));
    fDMCupomFiscal.cdsCupom_ItensVLR_ICMS_EFE.AsFloat := StrToFloat(FormatFloat('0.00',vVlrAux));
  end;

end;

end.

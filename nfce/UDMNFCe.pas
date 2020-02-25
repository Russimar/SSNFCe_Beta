unit UDMNFCe;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr,
  ACBrDFeReport, ACBrDFeDANFeReport, ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS,
  ACBrPosPrinter, ACBrBase, ACBrDFe, ACBrNFe, ACBrNFeDANFeRLClass,
  ACBrValidador;

type
  TDMNFCe = class(TDataModule)
    sdsNFe_Email: TSQLDataSet;
    cdsNFe_Email: TClientDataSet;
    dspNFe_Email: TDataSetProvider;
    sdsNFe_EmailID: TIntegerField;
    sdsNFe_EmailNOME: TStringField;
    sdsNFe_EmailEMAIL: TStringField;
    cdsNFe_EmailID: TIntegerField;
    cdsNFe_EmailNOME: TStringField;
    cdsNFe_EmailEMAIL: TStringField;
    qCidade: TSQLQuery;
    qCidadeID: TIntegerField;
    qCidadeNOME: TStringField;
    qCidadeUF: TStringField;
    qCidadeCODMUNICIPIO: TStringField;
    qFilial: TSQLQuery;
    qFilialID: TIntegerField;
    qFilialNOME: TStringField;
    qFilialNOME_INTERNO: TStringField;
    qFilialENDERECO: TStringField;
    qFilialCOMPLEMENTO_END: TStringField;
    qFilialNUM_END: TStringField;
    qFilialBAIRRO: TStringField;
    qFilialCEP: TStringField;
    qFilialID_CIDADE: TIntegerField;
    qFilialCIDADE: TStringField;
    qFilialUF: TStringField;
    qFilialDDD1: TIntegerField;
    qFilialFONE1: TStringField;
    qFilialDDD2: TIntegerField;
    qFilialFONE: TStringField;
    qFilialDDDFAX: TIntegerField;
    qFilialFAX: TStringField;
    qFilialPESSOA: TStringField;
    qFilialCNPJ_CPF: TStringField;
    qFilialINSCR_EST: TStringField;
    qFilialSIMPLES: TStringField;
    qFilialENDLOGO: TStringField;
    qFilialCALCULAR_IPI: TStringField;
    qFilialINATIVO: TStringField;
    qFilialINSCMUNICIPAL: TStringField;
    qFilialCNAE: TStringField;
    qFilialHOMEPAGE: TStringField;
    qFilialUSARICMSSIMPLES: TStringField;
    qFilialID_REGIME_TRIB: TIntegerField;
    qFilialID_PIS: TIntegerField;
    qFilialID_COFINS: TIntegerField;
    qFilialTIPO_PIS: TStringField;
    qFilialTIPO_COFINS: TStringField;
    qFilialPERC_PIS: TFloatField;
    qFilialPERC_COFINS: TFloatField;
    qFilialID_CSTICMS: TIntegerField;
    qFilialID_CSTIPI: TIntegerField;
    qFilialEMAIL_NFE: TStringField;
    qFilialDTESTOQUE: TDateField;
    qUF: TSQLQuery;
    qUFUF: TStringField;
    qUFPERC_ICMS: TFloatField;
    qUFIDPAIS: TIntegerField;
    qUFCODUF: TStringField;
    qUFPERC_ICMS_INTERNO: TFloatField;
    qPais: TSQLQuery;
    qPaisID: TIntegerField;
    qPaisNOME: TStringField;
    qPaisCODPAIS: TStringField;
    qParametros: TSQLQuery;
    qParametrosID: TIntegerField;
    qParametrosENDXMLNFE: TStringField;
    qParametrosENDPDFNFE: TStringField;
    qParametrosSERIENORMAL: TStringField;
    qParametrosSERIECONTINGENCIA: TStringField;
    qParametrosLOCALSERVIDORNFE: TStringField;
    qParametrosEMAILRESPONSAVELSISTEMA: TStringField;
    qParametrosANEXARDANFE: TStringField;
    qParametrosVERSAONFE: TStringField;
    qParametrosVERSAOEMISSAONFE: TStringField;
    qParametrosTIPOLOGONFE: TStringField;
    qParametrosAPLICARDESCONTONOICMS: TStringField;
    qParametrosAPLICARDESCONTONOIPI: TStringField;
    qParametrosSOMARNOPROD_FRETE: TStringField;
    qParametrosSOMARNOPROD_OUTRASDESP: TStringField;
    qParametrosSOMARNOPROD_SEGURO: TStringField;
    qParametrosAJUSTELOGONFEAUTOMATICO: TStringField;
    qParametrosINFNUMNOTAMANUAL: TStringField;
    qParametrosOPCAO_DTENTREGAPEDIDO: TStringField;
    qTab_CSTICMS: TSQLQuery;
    qTab_CSTICMSID: TIntegerField;
    qTab_CSTICMSPERCENTUAL: TFloatField;
    qTab_CSTICMSHISTORICO: TMemoField;
    qTab_CSTICMSCOD_CST: TStringField;
    qTab_CSTICMSTIPO: TStringField;
    qTab_CSTICMSNOME: TStringField;
    qTab_CFOP: TSQLQuery;
    qTab_CFOPID: TIntegerField;
    qTab_CFOPCODCFOP: TStringField;
    qTab_CFOPNOME: TStringField;
    qTab_CFOPENTRADASAIDA: TStringField;
    qTab_CFOPGERAR_IPI: TStringField;
    qTab_CFOPGERAR_ICMS: TStringField;
    qTab_CFOPGERAR_DUPLICATA: TStringField;
    qTab_CFOPSOMAR_VLRTOTALPRODUTO: TStringField;
    qTab_CFOPNOME_INTERNO: TStringField;
    qTab_CFOPID_CSTICMS: TIntegerField;
    qTab_CFOPID_CSTIPI: TIntegerField;
    qTab_CFOPCOPIARNOTATRIANGULAR: TStringField;
    qTab_CFOPID_PIS: TIntegerField;
    qTab_CFOPID_COFINS: TIntegerField;
    qTab_CFOPTIPO_PIS: TStringField;
    qTab_CFOPTIPO_COFINS: TStringField;
    qTab_CFOPGERAR_ICMS_SIMPLES: TStringField;
    qTab_CFOPTIPO_EMPRESA: TStringField;
    qTab_CFOPSUBSTITUICAO_TRIB: TStringField;
    qTab_CFOPMVA: TStringField;
    qTab_CFOPPERC_COFINS: TFloatField;
    qTab_CFOPPERC_PIS: TFloatField;
    qTab_CFOPLEI: TMemoField;
    qParametrosOBS_SIMPLES: TStringField;
    qParametrosIMP_OBSSIMPLES: TStringField;
    qCliente: TSQLQuery;
    qClienteCODIGO: TIntegerField;
    qClienteNOME: TStringField;
    qClienteFANTASIA: TStringField;
    qClienteENDERECO: TStringField;
    qClienteCOMPLEMENTO_END: TStringField;
    qClienteNUM_END: TStringField;
    qClienteBAIRRO: TStringField;
    qClienteID_CIDADE: TIntegerField;
    qClienteCIDADE: TStringField;
    qClienteUF: TStringField;
    qClienteCEP: TStringField;
    qClienteDDDFONE1: TIntegerField;
    qClienteTELEFONE1: TStringField;
    qClienteDDDFONE2: TIntegerField;
    qClienteTELEFONE2: TStringField;
    qClienteDDDFAX: TIntegerField;
    qClienteFAX: TStringField;
    qClientePESSOA: TStringField;
    qClienteCNPJ_CPF: TStringField;
    qClienteINSCR_EST: TStringField;
    qClienteENDERECO_ENT: TStringField;
    qClienteCOMPLEMENTO_END_ENT: TStringField;
    qClienteNUM_END_ENT: TStringField;
    qClienteBAIRRO_ENT: TStringField;
    qClienteID_CIDADE_ENT: TIntegerField;
    qClienteCIDADE_ENT: TStringField;
    qClienteCEP_ENT: TStringField;
    qClienteUF_ENT: TStringField;
    qClientePESSOA_ENT: TStringField;
    qClienteCNPJ_CPF_ENT: TStringField;
    qClienteINSC_EST_ENT: TStringField;
    qClienteENDERECO_PGTO: TStringField;
    qClienteCOMPLEMENTO_END_PGTO: TStringField;
    qClienteNUM_END_PGTO: TStringField;
    qClienteBAIRRO_PGTO: TStringField;
    qClienteID_CIDADE_PGTO: TIntegerField;
    qClienteCIDADE_PGTO: TStringField;
    qClienteCEP_PGTO: TStringField;
    qClienteUF_PGTO: TStringField;
    qClienteUSUARIO: TStringField;
    qClienteDTCADASTRO: TDateField;
    qClienteHRCADASTRO: TTimeField;
    qClienteOBS: TMemoField;
    qClienteCAIXAPOSTAL: TStringField;
    qClienteRG: TStringField;
    qClienteID_VENDEDOR: TIntegerField;
    qClienteID_CONDPGTO: TIntegerField;
    qClienteID_CONTABOLETO: TIntegerField;
    qClienteID_TRANSPORTADORA: TIntegerField;
    qClienteID_TIPOCOBRANCA: TIntegerField;
    qClienteID_REDESPACHO: TIntegerField;
    qClienteID_PAIS: TIntegerField;
    qClientePERC_COMISSAO: TFloatField;
    qClienteDDD_ENT: TIntegerField;
    qClienteFONE_ENT: TStringField;
    qClienteDDD_PGTO: TIntegerField;
    qClienteFONE_PGTO: TStringField;
    qClienteINATIVO: TStringField;
    qClienteHOMEPAGE: TStringField;
    qClienteTIPO_FRETE: TStringField;
    qClienteNOME_ENTREGA: TStringField;
    qClienteEMAIL_NFE: TStringField;
    qClienteEMAIL_PGTO: TStringField;
    qClienteEMAIL_NFE2: TStringField;
    qClientePESSOA_PGTO: TStringField;
    qClienteCNPJ_CPG_PGTO: TStringField;
    qClienteINSC_EST_PGTO: TStringField;
    qClienteUF_PLACA: TStringField;
    qClientePLACA: TStringField;
    qClienteTP_CLIENTE: TStringField;
    qClienteTP_FORNECEDOR: TStringField;
    qClienteTP_TRANSPORTADORA: TStringField;
    qClienteTP_VENDEDOR: TStringField;
    qTipoCobranca: TSQLQuery;
    qTipoCobrancaID: TIntegerField;
    qTipoCobrancaNOME: TStringField;
    qTipoCobrancaDESCONTADO: TStringField;
    qTipoCobrancaDEPOSITO: TStringField;
    qTipoCobrancaGERARBOLETO: TStringField;
    qTipoCobrancaQTDDIAS: TIntegerField;
    qTipoCobrancaCARTAOCREDITO: TStringField;
    qTipoCobrancaCHEQUE: TStringField;
    qTipoCobrancaDINHEIRO: TStringField;
    qTipoCobrancaMOSTRARNOCUPOM: TStringField;
    qContas: TSQLQuery;
    qParametrosIMP_REFERENCIANANOTA: TStringField;
    qParametrosENVIARNOTABENEF_NANFE: TStringField;
    qNotaFiscal: TSQLQuery;
    qNotaFiscalID: TIntegerField;
    qNotaFiscalNUMNOTA: TIntegerField;
    qNotaFiscalSERIE: TStringField;
    qNotaFiscalNFECHAVEACESSO: TStringField;
    qNotaFiscalDTEMISSAO: TDateField;
    mParcelaNFe: TClientDataSet;
    mParcelaNFeNumNota: TIntegerField;
    mParcelaNFeParcela: TIntegerField;
    mParcelaNFeValor: TFloatField;
    mParcelaNFeDtVencimento: TStringField;
    dsmiItensNFe: TDataSource;
    mItensNFe: TClientDataSet;
    mItensNFeFilial: TIntegerField;
    mItensNFeNumNota: TIntegerField;
    mItensNFeItemNota: TIntegerField;
    mItensNFeCodProduto: TStringField;
    mItensNFeCodNatOper: TStringField;
    mItensNFeNomeProduto: TStringField;
    mItensNFeQtd: TFloatField;
    mItensNFeUnidade: TStringField;
    mItensNFeVlrUnitario: TFloatField;
    mItensNFeVlrTotal: TFloatField;
    mItensNFeAliqIcms: TFloatField;
    mItensNFeAliqIpi: TFloatField;
    mItensNFeVlrIcms: TFloatField;
    mItensNFeVlrIpi: TFloatField;
    mItensNFeAliqSitTrib: TFloatField;
    mItensNFeClasFiscalRed: TStringField;
    mItensNFeClasFiscal: TStringField;
    mItensNFeInfAdicionais: TMemoField;
    mItensNFeVlrDesconto: TFloatField;
    mItensNFePercRedICMS: TFloatField;
    mItensNFeVlrBaseICMS: TFloatField;
    mItensNFeBaseICMS: TFloatField;
    mItensNFeCodCSTIPI: TStringField;
    mItensNFeTipoReg: TStringField;
    mItensNFeAliqPis: TFloatField;
    mItensNFeAliqCofins: TFloatField;
    mItensNFeVlrPis: TFloatField;
    mItensNFeVlrCofins: TFloatField;
    mItensNFeIcmsBaseSubst: TFloatField;
    mItensNFeIcmsVlrSubst: TFloatField;
    mItensNFeCodPis: TStringField;
    mItensNFeCodCofins: TStringField;
    mItensNFeTipoPis: TStringField;
    mItensNFeTipoCofins: TStringField;
    mItensNFeCodSitTrib: TStringField;
    mItensNFePedidoCliente: TStringField;
    mItensNFeItemPedido: TIntegerField;
    mItensNFeVlrIcmsSimples: TFloatField;
    mItensNFeBaseIcmsSimples: TFloatField;
    mItensNFeMVA: TFloatField;
    mItensNFeSomaVlrTotalProd: TBooleanField;
    mItensNFeVlrFrete: TFloatField;
    mItensNFeVlrSeguro: TFloatField;
    mItensNFeVlrOutrasDespesas: TFloatField;
    mItensNFeCodBarra: TStringField;
    mItensNFeVlrBaseImportacao: TFloatField;
    mItensNFeVlrImportacao: TFloatField;
    mItensNFeVlrIOF: TFloatField;
    mItensNFeVlrDespAduaneira: TFloatField;
    mAuxDadosNFe: TClientDataSet;
    mAuxDadosNFeTipo: TStringField;
    mAuxDadosNFeCodigo: TStringField;
    mDadosAdicionaisNFe: TClientDataSet;
    mDadosAdicionaisNFeID: TIntegerField;
    mDadosAdicionaisNFeObs: TMemoField;
    mDadosAdicionaisNFeObsAux: TMemoField;
    sdsCupomFiscal: TSQLDataSet;
    dspCupomFiscal: TDataSetProvider;
    cdsCupomFiscal: TClientDataSet;
    dsCupomFiscal: TDataSource;
    mItensNFeItemOriginal: TIntegerField;
    qParametrosIMP_CODPRODCLI_DANFE: TStringField;
    mAuxDadosNFeID_Variacao: TIntegerField;
    qTab_CFOP_Variacao: TSQLQuery;
    qTab_CFOP_VariacaoID: TIntegerField;
    qTab_CFOP_VariacaoITEM: TIntegerField;
    qTab_CFOP_VariacaoLEI: TMemoField;
    mAuxDadosNFeOBS: TWideStringField;
    qContasID: TIntegerField;
    qContasNOME: TStringField;
    qContasAGENCIA: TStringField;
    qContasFILIAL: TIntegerField;
    qContasNUMCONTA: TStringField;
    qContasCNAB: TStringField;
    qContasDTENCERRAMENTO: TDateField;
    qContasID_TIPOCOBRANCA: TIntegerField;
    qContasDESCRICAO_NOTA: TStringField;
    qContasTIPO_CONTA: TStringField;
    qContasID_BANCO: TIntegerField;
    qContasDIG_CONTA: TStringField;
    qContasCOD_CEDENTE: TStringField;
    qContasACEITE: TStringField;
    qContasID_OCORRENCIA: TIntegerField;
    qContasDIAS_PROTESTO: TIntegerField;
    qContasID_ESPECIE: TIntegerField;
    qContasID_CARTEIRA: TIntegerField;
    qContasID_INSTRUCAO1: TIntegerField;
    qContasID_INSTRUCAO2: TIntegerField;
    qContasID_TIPO_COBRANCA: TIntegerField;
    qContasMOEDA: TStringField;
    qContasVARIACAO_CARTEIRA: TStringField;
    qContasTIPO_DOCUMENTO: TStringField;
    qContasCOD_TRANSMISSAO: TStringField;
    qContasMENSAGEM_FIXA: TStringField;
    qContasPERC_DESCONTO: TFloatField;
    qContasPERC_JUROS: TFloatField;
    qContasVLR_IOF: TFloatField;
    qContasVLR_TAXA: TFloatField;
    qContasLOCAL_PAGAMENTO: TStringField;
    qContasEND_ARQUIVO_REM: TStringField;
    qContasNOME_ARQ_REM: TStringField;
    qContasEXTENSAO_ARQ_REM: TStringField;
    qContasDT_LIMITE_DESCONTO: TDateField;
    qContasCOMISSAO_PERMANENCIA: TStringField;
    qContasNUM_CONVENIO_LIDER: TStringField;
    qContasDIG_AGENCIA: TStringField;
    qContasDIAS_DEVOLUCAO: TIntegerField;
    qParametrosDESTACAR_IMPOSTO_NOTA: TStringField;
    mItensNFePercPis: TFloatField;
    mItensNFePercCofins: TFloatField;
    mItensNFePercRedICMSSubst: TFloatField;
    mItensNFeVlrTributos: TFloatField;
    qParametrosUSA_TAMANHO_AGRUPADO_NFE: TStringField;
    mItensNFeNumOS: TStringField;
    mItensNFeCodAuxiliar: TStringField;
    mItensNFeObs_Tamanho: TStringField;
    dsmParcelaNFe: TDataSource;
    qParametrosUSA_FCI: TStringField;
    mItensNFeNFCI: TStringField;
    mItensNFeID_Produto: TIntegerField;
    qParametrosTIPO_LEI_TRANSPARENCIA: TStringField;
    qParametrosLEI_TRANSPARENCIA_IMP_ITEM: TStringField;
    qParametrosLEI_TRANSPARENCIA_TEXTO_ITEM: TStringField;
    qParametrosLEI_TRANSPARENCIA_PERC_ADIC: TStringField;
    qContasNOME_BANCO: TStringField;
    qParametrosUSA_ENVIO_EMAIL_CATEGORIA: TStringField;
    qOperacao_Nota: TSQLQuery;
    qOperacao_NotaID: TIntegerField;
    qOperacao_NotaNOME: TStringField;
    qOperacao_NotaPEDIR_FINALIDADE: TStringField;
    qOperacao_NotaNATUREZA_NOTA: TStringField;
    qFilial_Download: TSQLQuery;
    qFilial_DownloadID: TIntegerField;
    qFilial_DownloadITEM: TIntegerField;
    qFilial_DownloadPESSOA: TStringField;
    qFilial_DownloadCNPJ_CPF: TStringField;
    mItensNFeNCM_EX: TStringField;
    mItensNFePercIcmsSubstInterno: TFloatField;
    mItensNFeVlrIcmsDesonerado: TFloatField;
    mItensNFeCodMotivoDesonerado: TIntegerField;
    mItensNFeVlrIcmsOperacao: TFloatField;
    mItensNFePercTribIcms: TFloatField;
    qParametrosUSA_DESONERACAO: TStringField;
    qParametrosUSA_ICMSOPERACAO_CST51: TStringField;
    qParametrosUSA_DANFE_FLEXDOCS: TStringField;
    mItensNFeVlrTributos_Federal: TFloatField;
    mItensNFeVlrTributos_Estadual: TFloatField;
    mItensNFeVlrTributos_Municipal: TFloatField;
    mItensNFePercTributos_Federal: TFloatField;
    mItensNFePercTributos_Estadual: TFloatField;
    mItensNFePercTributos_Municipal: TFloatField;
    mItensNFeFonte: TStringField;
    qParametrosIMP_PERC_TRIB_DADOS_ADIC: TStringField;
    cdsCupomFiscalID: TIntegerField;
    cdsCupomFiscalNUMCUPOM: TIntegerField;
    cdsCupomFiscalDTEMISSAO: TDateField;
    cdsCupomFiscalHREMISSAO: TTimeField;
    cdsCupomFiscalID_CLIENTE: TIntegerField;
    cdsCupomFiscalTIPO_PGTO: TStringField;
    cdsCupomFiscalID_CONDPGTO: TIntegerField;
    cdsCupomFiscalID_VENDEDOR: TIntegerField;
    cdsCupomFiscalPERC_VENDEDOR: TFloatField;
    cdsCupomFiscalBASE_ICMS: TFloatField;
    cdsCupomFiscalVLR_ICMS: TFloatField;
    cdsCupomFiscalVLR_PRODUTOS: TFloatField;
    cdsCupomFiscalVLR_DESCONTO: TFloatField;
    cdsCupomFiscalVLR_TOTAL: TFloatField;
    cdsCupomFiscalCANCELADO: TStringField;
    cdsCupomFiscalVLR_RECEBIDO: TFloatField;
    cdsCupomFiscalVLR_TROCO: TFloatField;
    cdsCupomFiscalID_CONTA: TIntegerField;
    cdsCupomFiscalFILIAL: TIntegerField;
    cdsCupomFiscalID_TIPOCOBRANCA: TIntegerField;
    cdsCupomFiscalCPF: TStringField;
    cdsCupomFiscalTIPO: TStringField;
    cdsCupomFiscalTERMINAL_ID: TSmallintField;
    cdsCupomFiscalVLR_TRIBUTO: TFloatField;
    cdsCupomFiscalVLR_TRIBUTO_FEDERAL: TFloatField;
    cdsCupomFiscalVLR_TRIBUTO_ESTADUAL: TFloatField;
    cdsCupomFiscalVLR_TRIBUTO_MUNICIPAL: TFloatField;
    cdsCupomFiscalNUM_CARTAO: TSmallintField;
    cdsCupomFiscalNOME_CLI: TStringField;
    cdsCupomFiscalEMAIL_NFE_CLI: TStringField;
    cdsCupomFiscalENDERECO_CLI: TStringField;
    cdsCupomFiscalENDERECO_CLI2: TStringField;
    cdsCupomFiscalNUM_END_CLI: TStringField;
    cdsCupomFiscalCOMPLEMENTO_END_CLI: TStringField;
    cdsCupomFiscalBAIRRO_CLI: TStringField;
    cdsCupomFiscalID_CIDADE_CLI: TIntegerField;
    cdsCupomFiscalUF_CLI: TStringField;
    cdsCupomFiscalCNPJ_CPF_CLI: TStringField;
    cdsCupomFiscalINSCR_EST_CLI: TStringField;
    cdsCupomFiscalCIDADE_CLI: TStringField;
    cdsCupomFiscalCEP_CLI: TStringField;
    cdsCupomFiscalDDDFONE1_CLI: TIntegerField;
    cdsCupomFiscalTELEFONE1_CLI: TStringField;
    cdsCupomFiscalDDDFONE2_CLI: TIntegerField;
    cdsCupomFiscalTELEFONE2_CLI: TStringField;
    cdsCupomFiscalDDDFAX_CLI: TIntegerField;
    cdsCupomFiscalFAX_CLI: TStringField;
    qTipoCobrancaCARTAODEBITO: TStringField;
    qTipoCobrancaCOD_IMP_FISCAL: TStringField;
    qParametrosENDXMLNFCE: TStringField;
    qParametrosENDPDFNFCE: TStringField;
    cdsCupomFiscalNFEAMBIENTE: TStringField;
    cdsCupomFiscalNFECHAVEACESSO: TStringField;
    cdsCupomFiscalNFEPROTOCOLO: TStringField;
    cdsCupomFiscalNFERECIBO: TStringField;
    cdsCupomFiscalNFEVERSAO: TStringField;
    cdsCupomFiscalTIPO_ATENDIMENTO: TSmallintField;
    cdsCupomFiscalTIPO_IMPRESSAO_NFCE: TSmallintField;
    cdsCupomFiscalTIPO_ENVIONFE: TStringField;
    cdsCupomFiscalNFEPROTOCOLO_CANCELADA: TStringField;
    cdsCupomFiscalID_CFOP: TIntegerField;
    cdsCupomFiscalTIPO_DESCONTO: TStringField;
    cdsCupomFiscalVLR_IPI: TFloatField;
    cdsCupomFiscalVLR_PIS: TFloatField;
    cdsCupomFiscalVLR_COFINS: TFloatField;
    cdsCupomFiscalMOTIVO_CANCELADA: TStringField;
    cdsCupomFiscalDADOS_ADICIONAIS: TMemoField;
    cdsCupomFiscalFONTE_TRIBUTOS: TStringField;
    cdsCupomFiscalNFEDENEGADA: TStringField;
    cdsCupomFiscalTIPO_DESTINO_OPERACAO: TSmallintField;
    cdsCupomFiscalNFEFINALIDADE: TStringField;
    cdsCupomFiscalENDERECO_FIL2: TStringField;
    cdsCupomFiscalCIDADE_FIL: TStringField;
    cdsCupomFiscalUF_FIL: TStringField;
    cdsCupomFiscalBAIRRO_FIL: TStringField;
    cdsCupomFiscalCEP_FIL: TStringField;
    cdsCupomFiscalPESSOA_FIL: TStringField;
    cdsCupomFiscalCNPJ_CPF_FIL: TStringField;
    cdsCupomFiscalINSCR_EST_FIL: TStringField;
    cdsCupomFiscalNOME_FILIAL: TStringField;
    cdsCupomFiscalNOME_INTERNO_FIL: TStringField;
    cdsCupomFiscalPESSOA_CLI: TStringField;
    qParametrosID_CLIENTE_CONSUMIDOR: TIntegerField;
    cdsCupomFiscalNOME_FORMAPAGAMENTO: TStringField;
    qFilialNFCEPRODUCAO: TStringField;
    cdsCupomFiscalSERIE: TStringField;
    cdsCupomFiscalNOME_VENDEDOR: TStringField;
    cdsCupomFiscalMOTIVO_DENEGADO: TStringField;
    qParametrosFUSOHORARIO: TStringField;
    qParametrosFUSOHORARIO_VERAO: TStringField;
    mItensNFeCod_Cest: TStringField;
    mItensNFeCod_EnqIPI: TStringField;
    qFilial_NFCe: TSQLQuery;
    qFilial_NFCeID: TIntegerField;
    qFilial_NFCeCSC: TStringField;
    qFilial_NFCeCLDTOKEN: TStringField;
    cdsCupomFiscalDDD_FILIAL: TIntegerField;
    cdsCupomFiscalFONE_FILIAL: TStringField;
    cdsCupomFiscalTELEFONE_FIL: TStringField;
    cdsCupomFiscalCLIENTE_NOME: TStringField;
    cdsCupomFiscalCLIENTE_OBS: TStringField;
    cdsCupomFiscalCLIENTE_FONE: TStringField;
    cdsCupomFiscalCLIENTE_ENDERECO: TStringField;
    qTransp: TSQLQuery;
    qTranspCODIGO: TIntegerField;
    qTranspNOME: TStringField;
    cdsCupomFiscalID_TRANSPORTADORA: TIntegerField;
    qCupomFiscal_Cli: TSQLQuery;
    qCupomFiscal_CliID: TIntegerField;
    qCupomFiscal_CliENDERECO: TStringField;
    qCupomFiscal_CliNUM_END: TStringField;
    qCupomFiscal_CliCOMPLEMENTO: TStringField;
    qCupomFiscal_CliBAIRRO: TStringField;
    qCupomFiscal_CliID_CIDADE: TIntegerField;
    qCupomFiscal_CliDDD: TStringField;
    qCupomFiscal_CliFONE: TStringField;
    qCupomFiscal_CliID_TRANSPORTADORA: TIntegerField;
    qCupomFiscal_CliCEP: TStringField;
    qCupomFiscal_CliEMAIL: TStringField;
    qCupomFiscal_CliTIPO_CONTRIBUINTE: TSmallintField;
    qCupomFiscal_CliNOME_CIDADE: TStringField;
    qTranspENDERECO: TStringField;
    qTranspNUM_END: TStringField;
    qTranspID_CIDADE: TIntegerField;
    qTranspCEP: TStringField;
    qTranspBAIRRO: TStringField;
    qTranspCOMPLEMENTO_END: TStringField;
    qTranspUF: TStringField;
    qTranspID_PAIS: TIntegerField;
    qTranspCIDADE: TStringField;
    qTranspPESSOA: TStringField;
    qTranspCNPJ_CPF: TStringField;
    qTranspINSCR_EST: TStringField;
    qCupomFiscal_CliPLACA: TStringField;
    qCupomFiscal_CliUF_TRANSP: TStringField;
    qCupomFiscal_CliTIPO_FRETE: TStringField;
    mPedAux: TClientDataSet;
    mPedAuxID_Pedido: TIntegerField;
    mPedAuxObs_Nova: TStringField;
    qParametrosUSA_OBS_PEDIDO_NOTA: TStringField;
    qPedido: TSQLQuery;
    qPedidoID: TIntegerField;
    qPedidoNUM_PEDIDO: TIntegerField;
    qPedidoPEDIDO_CLIENTE: TStringField;
    qPedidoOBS_NOTA: TStringField;
    qObs_Lei: TSQLQuery;
    qObs_LeiID: TIntegerField;
    qObs_LeiNOME: TStringField;
    qObs_LeiOBS: TStringField;
    sdsNota_Eletronica: TSQLDataSet;
    sdsNota_EletronicaID: TIntegerField;
    sdsNota_EletronicaCHAVE_ACESSO: TStringField;
    sdsNota_EletronicaUF: TIntegerField;
    sdsNota_EletronicaNATUREZA_OPERACAO: TStringField;
    sdsNota_EletronicaFORMA_PAGAMENTO: TIntegerField;
    sdsNota_EletronicaSERIE: TIntegerField;
    sdsNota_EletronicaNRO_NOTA_FISCAL: TIntegerField;
    sdsNota_EletronicaDATA_EMISSAO: TDateField;
    sdsNota_EletronicaTIPO_NFE: TIntegerField;
    sdsNota_EletronicaCODIGO_MUNICIO: TIntegerField;
    sdsNota_EletronicaTIPO_EMISSAO: TIntegerField;
    sdsNota_EletronicaTIPO_AMBIENTE: TIntegerField;
    sdsNota_EletronicaFINALIDADE: TIntegerField;
    sdsNota_EletronicaEMITENTE_DOCUMENTO: TStringField;
    sdsNota_EletronicaEMITENTE_NOME: TStringField;
    sdsNota_EletronicaDESTINATARIO_DOCUMENTO: TStringField;
    sdsNota_EletronicaDESTINATARIO_NOME: TStringField;
    sdsNota_EletronicaVALOR_TOTAL: TFloatField;
    sdsNota_EletronicaXML_ASSINADO: TMemoField;
    sdsNota_EletronicaXML_ASSINADO_PROC: TMemoField;
    sdsNota_EletronicaNRO_RECIBO: TStringField;
    sdsNota_EletronicaDATA_RECEBIMENTO: TSQLTimeStampField;
    sdsNota_EletronicaPROTOCOLO: TStringField;
    sdsNota_EletronicaSTATUS: TIntegerField;
    sdsNota_EletronicaMOTIVO: TStringField;
    sdsNota_EletronicaXML_STATUS: TMemoField;
    dspNota_Eletronica: TDataSetProvider;
    cdsNota_Eletronica: TClientDataSet;
    cdsNota_EletronicaID: TIntegerField;
    cdsNota_EletronicaCHAVE_ACESSO: TStringField;
    cdsNota_EletronicaUF: TIntegerField;
    cdsNota_EletronicaNATUREZA_OPERACAO: TStringField;
    cdsNota_EletronicaFORMA_PAGAMENTO: TIntegerField;
    cdsNota_EletronicaSERIE: TIntegerField;
    cdsNota_EletronicaNRO_NOTA_FISCAL: TIntegerField;
    cdsNota_EletronicaDATA_EMISSAO: TDateField;
    cdsNota_EletronicaTIPO_NFE: TIntegerField;
    cdsNota_EletronicaCODIGO_MUNICIO: TIntegerField;
    cdsNota_EletronicaTIPO_EMISSAO: TIntegerField;
    cdsNota_EletronicaTIPO_AMBIENTE: TIntegerField;
    cdsNota_EletronicaFINALIDADE: TIntegerField;
    cdsNota_EletronicaEMITENTE_DOCUMENTO: TStringField;
    cdsNota_EletronicaEMITENTE_NOME: TStringField;
    cdsNota_EletronicaDESTINATARIO_DOCUMENTO: TStringField;
    cdsNota_EletronicaDESTINATARIO_NOME: TStringField;
    cdsNota_EletronicaVALOR_TOTAL: TFloatField;
    cdsNota_EletronicaXML_ASSINADO: TMemoField;
    cdsNota_EletronicaXML_ASSINADO_PROC: TMemoField;
    cdsNota_EletronicaNRO_RECIBO: TStringField;
    cdsNota_EletronicaDATA_RECEBIMENTO: TSQLTimeStampField;
    cdsNota_EletronicaPROTOCOLO: TStringField;
    cdsNota_EletronicaSTATUS: TIntegerField;
    cdsNota_EletronicaMOTIVO: TStringField;
    cdsNota_EletronicaXML_STATUS: TMemoField;
    sdsNFe_Log: TSQLDataSet;
    dspNFe_Log: TDataSetProvider;
    cdsNFe_Log: TClientDataSet;
    cdsNFe_LogID: TIntegerField;
    cdsNFe_LogID_NFE: TIntegerField;
    cdsNFe_LogDATA_RECEBIMENTO: TSQLTimeStampField;
    cdsNFe_LogPROTOCOLO: TStringField;
    cdsNFe_LogSTATUS: TIntegerField;
    cdsNFe_LogMOTIVO: TStringField;
    cdsNFe_LogMSGDADOS: TMemoField;
    cdsNFe_LogMSGRETWS: TMemoField;
    cdsNFe_LogMSGRESULTADO: TMemoField;
    cdsNFe_LogCMSG: TMemoField;
    cdsNFe_LogXMSG: TMemoField;
    dsNFe_Log: TDataSource;
    dsNota_Eletronica: TDataSource;
    mNFe_Log: TClientDataSet;
    mNFe_LogID: TIntegerField;
    mNFe_LogID_NFE: TIntegerField;
    mNFe_LogDataRecebimento: TSQLTimeStampField;
    mNFe_LogProtocolo: TStringField;
    mNFe_LogStatus: TIntegerField;
    mNFe_LogMotivo: TStringField;
    mNFe_LogMSGDados: TMemoField;
    mNFe_LogMSGRETWS: TMemoField;
    mNFe_LogMSGRESULTADO: TMemoField;
    mNFe_LogNRecibo: TStringField;
    mNFe_LogNRecibo_Orig: TStringField;
    dsmNFe_Log: TDataSource;
    qParametros_NFe: TSQLQuery;
    qParametros_NFeVERSAONFCE: TStringField;
    qNFeNota: TSQLQuery;
    qNFeNotaID: TIntegerField;
    qNFeNotaCHAVE_ACESSO: TStringField;
    qNFeNotaNRO_NOTA_FISCAL: TIntegerField;
    sdsTPag: TSQLDataSet;
    dspTPag: TDataSetProvider;
    cdsTPag: TClientDataSet;
    cdsTPagVLR_VENCIMENTO: TFloatField;
    cdsTPagCOD_IMP_FISCAL: TStringField;
    mItensNFeCodBarra2: TStringField;
    qParametros_NFeENVAR_CODBARRA: TStringField;
    qCBarra: TSQLQuery;
    qCBarraID: TIntegerField;
    qCBarraCOD_BARRA: TStringField;
    qCBarraID_PRODUTO: TIntegerField;
    qCBarraID_COR: TIntegerField;
    qCBarraTAMANHO: TStringField;
    qCBarraCOD_PRINCIPAL: TStringField;
    qCBarraCOD_SEQUENCIAL: TIntegerField;
    qCBarraFILIAL: TIntegerField;
    qProduto_Forn: TSQLQuery;
    qProduto_FornCOD_MATERIAL_FORN: TStringField;
    qProduto_FornCOD_BARRA: TStringField;
    mItensNFeVlr_Unitario_Trib: TFloatField;
    mItensNFeQtd_Trib: TFloatField;
    mItensNFeUnidade_Trib: TStringField;
    cdsCupomFiscalQTD_ITENS: TIntegerField;
    mItensNFeBase_ST_Ret: TFloatField;
    mItensNFeVlr_ST_Ret: TFloatField;
    mItensNFePerc_ST_Ret: TFloatField;
    mItensNFeBase_ICMS_Efet: TFloatField;
    mItensNFeVlr_Icms_Efet: TFloatField;
    mItensNFePerc_Icms_Efet: TFloatField;
    mItensNFePERC_BASE_RED_EFET: TFloatField;
    cdsCupomFiscalVLR_OUTROS: TFloatField;
    ACBrNFe: TACBrNFe;
    ACBrPosPrinter: TACBrPosPrinter;
    ACBrNFeDANFeESCPOS: TACBrNFeDANFeESCPOS;
    ACBrNFeDANFeRL2: TACBrNFeDANFeRL;
    qProduto: TSQLQuery;
    qProdutoID: TIntegerField;
    qProdutoREFERENCIA: TStringField;
    qProdutoNOME: TStringField;
    qProdutoCOD_BARRA: TStringField;
    qProdutoPRECO_VENDA: TFloatField;
    qProdutoPESOLIQUIDO: TFloatField;
    qProdutoINATIVO: TStringField;
    qProdutoPRECO_CUSTO: TFloatField;
    qProdutoCOMPLEMENTO: TStringField;
    qProdutoID_NCM: TIntegerField;
    qProdutoORIGEM_PROD: TStringField;
    qProdutoCODSITCF: TStringField;
    qProdutoPERC_REDUCAOICMS: TFloatField;
    qProdutoUNIDADE: TStringField;
    qProdutoID_GRUPO: TIntegerField;
    qProdutoID_SUBGRUPO: TIntegerField;
    qProdutoID_MARCA: TIntegerField;
    qProdutoID_FORNECEDOR: TIntegerField;
    qProdutoPERC_REDUCAOICMSSUBST: TFloatField;
    qProdutoUSA_PERC_IMP_INTERESTADUAL: TStringField;
    qProdutoPERC_PIS: TFloatField;
    qProdutoPERC_COFINS: TFloatField;
    qProdutoPERC_ICMS_IMP: TFloatField;
    qProdutoPERC_IPI_IMP: TFloatField;
    qProdutoREFERENCIA_PADRAO: TStringField;
    qProdutoID_SITTRIB_CF: TIntegerField;
    qProdutoID_CLIENTE: TIntegerField;
    qProdutoPRECO_REVENDA: TFMTBCDField;
    qProdutoUNIDADE2: TStringField;
    qProdutoID_CSTICMS: TIntegerField;
    qProdutoPERC_ICMS_NFCE: TFloatField;
    qProdutoCALCULAR_ST: TStringField;
    qProdutoCOD_BARRA2: TStringField;
    qProdutoQTD_EMBALAGEM: TFloatField;
    qProdutoCOD_CEST: TStringField;
    qFilial_Certificado: TSQLQuery;
    qFilial_CertificadoID: TIntegerField;
    qFilial_CertificadoCHAVE_ACESSO: TMemoField;
    qFilial_CertificadoCNPJ_TITULAR: TStringField;
    qFilial_CertificadoEMISSOR: TStringField;
    qFilial_CertificadoNOME_TITULAR: TStringField;
    qFilial_CertificadoNUMERO_SERIE: TStringField;
    qFilial_CertificadoUTILIZA_NFE: TIntegerField;
    qFilial_CertificadoUTILIZA_NFSE: TIntegerField;
    qFilial_CertificadoVALIDADE_INICIO: TSQLTimeStampField;
    qFilial_CertificadoVALIDADE_FIM: TSQLTimeStampField;
    qFilial_CertificadoUTILIZA_MDFE: TIntegerField;
    qFilial_CertificadoUSUARIO_WEB: TStringField;
    qFilial_CertificadoSENHA_WEB: TStringField;
    qFilial_CertificadoAGUARDARCONSULTARETORNO: TIntegerField;
    qFilial_CertificadoCONSULTARLOTEAPOSENVIO: TStringField;
    qFilial_CertificadoINTERVALOTENTATIVAS: TIntegerField;
    qFilial_CertificadoSENHA: TStringField;
    ACBrNFeDANFeRL: TACBrNFeDANFeRL;
    sdsNFe_Inutilizacao: TSQLDataSet;
    sdsNFe_InutilizacaoID: TIntegerField;
    sdsNFe_InutilizacaoFILIAL: TIntegerField;
    sdsNFe_InutilizacaoNUMPROTOCOLO: TStringField;
    sdsNFe_InutilizacaoDATA: TDateField;
    sdsNFe_InutilizacaoHORA: TTimeField;
    sdsNFe_InutilizacaoMOTIVO: TStringField;
    sdsNFe_InutilizacaoNUMNOTA_INI: TIntegerField;
    sdsNFe_InutilizacaoNUMNOTA_FIN: TIntegerField;
    sdsNFe_InutilizacaoUSUARIO: TStringField;
    sdsNFe_InutilizacaoDTUSUARIO: TDateField;
    sdsNFe_InutilizacaoHRUSUARIO: TTimeField;
    sdsNFe_InutilizacaoMODELO: TStringField;
    sdsNFe_InutilizacaoSERIE: TStringField;
    sdsNFe_InutilizacaoANO: TIntegerField;
    dspNFe_Inutilizacao: TDataSetProvider;
    cdsNFe_Inutilizacao: TClientDataSet;
    cdsNFe_InutilizacaoID: TIntegerField;
    cdsNFe_InutilizacaoFILIAL: TIntegerField;
    cdsNFe_InutilizacaoNUMPROTOCOLO: TStringField;
    cdsNFe_InutilizacaoSERIE: TStringField;
    cdsNFe_InutilizacaoNUMNOTA_INI: TIntegerField;
    cdsNFe_InutilizacaoNUMNOTA_FIN: TIntegerField;
    cdsNFe_InutilizacaoDATA: TDateField;
    cdsNFe_InutilizacaoHORA: TTimeField;
    cdsNFe_InutilizacaoMOTIVO: TStringField;
    cdsNFe_InutilizacaoUSUARIO: TStringField;
    cdsNFe_InutilizacaoDTUSUARIO: TDateField;
    cdsNFe_InutilizacaoHRUSUARIO: TTimeField;
    cdsNFe_InutilizacaoMODELO: TStringField;
    cdsNFe_InutilizacaoANO: TIntegerField;
    dsNFe_Inutilizacao: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure mItensNFeBeforePost(DataSet: TDataSet);
    procedure mDadosAdicionaisNFeBeforePost(DataSet: TDataSet);
    procedure mItensNFeNewRecord(DataSet: TDataSet);
    procedure mAuxDadosNFeNewRecord(DataSet: TDataSet);
  private
    { Private declarations }

  public
    { Public declarations }
    vMsgErro: String;
    ctCommand: String;
    ctInutilizacao : String;
    ctqProduto_Forn : String;
    vDialogoImpressora: Boolean;
    ctNFe_Log: String;
    vNRec_Log, vNRec_Orig : String;

    //17/12/2013 Novo processo de envio
    vNovoProcesso: Boolean;

    procedure prc_Localizar(ID: Integer);
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;

    procedure prc_Inserir_Inutilizacao;
    procedure prc_Gravar_Inutilizacao;
    procedure prc_Localizar_Inutilizacao(ID : Integer);

    procedure Posiciona_CidadeUF(CodCidade, IDPais: Integer);
    procedure Posiciona_Operacao_Nota(ID: Integer);

    procedure prc_Abrir_NFe_Log(Rec : Boolean = False);
    procedure prc_Procurar_Recibo;
    procedure prc_Abrir_Filial(ID : Integer);
    procedure prc_Abrir_Produto(ID : Integer);

  end;

var
  DMNFCe: TDMNFCe;

implementation

uses DmdDatabase, SendMailOptions, DmdDatabase_NFeBD, StrUtils;

{$R *.dfm}


procedure TDMNFCe.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsNFe_Email.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('NFE_EMAIL',0);

  cdsNFe_Email.Insert;
  cdsNFe_EmailID.AsInteger := vAux + 1;
end;

procedure TDMNFCe.prc_Excluir;
begin
  if not(cdsNFe_Email.Active) or (cdsNFe_Email.IsEmpty) then
    exit;
  cdsNFe_Email.Delete;
  cdsNFe_Email.ApplyUpdates(0);
end;

procedure TDMNFCe.prc_Gravar;
begin
  vMsgErro := '';
  if trim(cdsNFe_EmailNOME.AsString) = '' then
    vMsgErro := vMsgErro + #13 + '*** Nome n�o informado!';
  if trim(cdsNFe_EmailEMAIL.AsString) = '' then
    vMsgErro := vMsgErro + #13 + '*** Email n�o informado!';
  if trim(vMsgErro) <> '' then
    exit;
  cdsNFe_Email.Post;
  cdsNFe_Email.ApplyUpdates(0);
end;

procedure TDMNFCe.prc_Localizar(ID: Integer); //-1 � para inclus�o
begin
  cdsNFe_Email.Close;
  sdsNFe_Email.CommandText := ctCommand;
  if ID <> 0 then
    sdsNFe_Email.CommandText := sdsNFe_Email.CommandText
                         + ' WHERE ID = ' + IntToStr(ID);
  cdsNFe_Email.Open;
end;

procedure TDMNFCe.DataModuleCreate(Sender: TObject);
begin
  ctCommand := sdsNFe_Email.CommandText;
  ctNFe_Log := sdsNFe_Log.CommandText;
  ctInutilizacao := sdsNFe_Inutilizacao.CommandText;
  ctqProduto_Forn := qProduto_Forn.SQL.Text;

  dmDatabase_NFeBD := TdmDatabase_NFeBD.Create(Self);

  qParametros.Close;
  qParametros.Open;
  qParametros_NFe.Close;
  qParametros_NFe.Open;
  vDialogoImpressora := False;
end;

procedure TDMNFCe.mItensNFeBeforePost(DataSet: TDataSet);
begin
  if mItensNFeInfAdicionais.Value <> '' then
  begin
    mItensNFeInfAdicionais.Value := StringReplace( mItensNFeInfAdicionais.Value, #13, #32, [rfReplaceAll] );
    mItensNFeInfAdicionais.Value := StringReplace( mItensNFeInfAdicionais.Value, #10, '', [rfReplaceAll] );
  end;
end;

procedure TDMNFCe.mDadosAdicionaisNFeBeforePost(DataSet: TDataSet);
begin
  if mDadosAdicionaisNFeObs.Value <> '' then
  begin
    mDadosAdicionaisNFeObs.Value := StringReplace( mDadosAdicionaisNFeObs.Value, #13, #32, [rfReplaceAll] );
    mDadosAdicionaisNFeObs.Value := StringReplace( mDadosAdicionaisNFeObs.Value, #10, '', [rfReplaceAll] );
  end;
end;

procedure TDMNFCe.mItensNFeNewRecord(DataSet: TDataSet);
begin
  mItensNFeTipoReg.AsString           := 'R';
  mItensNFeMVA.AsFloat                := 0;
  mItensNFeSomaVlrTotalProd.AsBoolean := True;
  mItensNFePercPis.AsFloat            := 0;
  mItensNFePercCofins.AsFloat         := 0;
  mItensNFeVlrBaseImportacao.AsFloat  := 0;
  mItensNFeVlrImportacao.AsFloat      := 0;
  mItensNFeVlrDespAduaneira.AsFloat   := 0;
  mItensNFeQtd.AsFloat                := 0;
  mItensNFeVlrUnitario.AsFloat        := 0;
  mItensNFeVlrTotal.AsFloat           := 0;
  mItensNFeVlrIcms.AsFloat            := 0;
  mItensNFeVlrIpi.AsFloat             := 0;
  mItensNFeBaseIcmsSimples.AsFloat    := 0;
  mItensNFeVlrIcmsSimples.AsFloat     := 0;
  mItensNFeVlrPis.AsFloat             := 0;
  mItensNFeVlrCofins.AsFloat          := 0;
  mItensNFeVlrFrete.AsFloat           := 0;
  mItensNFeVlrSeguro.AsFloat          := 0;
  mItensNFeVlrOutrasDespesas.AsFloat  := 0;
  mItensNFeVlrDesconto.AsFloat        := 0;
  mItensNFeBaseICMS.AsFloat           := 0;
  mItensNFeIcmsBaseSubst.AsFloat      := 0;
  mItensNFeIcmsVlrSubst.AsFloat       := 0;
  mItensNFeVlrTributos.AsFloat        := 0;
  mItensNFeObs_Tamanho.AsString       := '';
  mItensNFeVlrIcmsOperacao.AsFloat    := 0;
  mItensNFePercTribIcms.AsFloat       := 0;
end;

procedure TDMNFCe.Posiciona_CidadeUF(CodCidade, IDPais: Integer);
begin
  qCidade.Close;
  qCidade.ParamByName('ID').AsInteger := CodCidade;
  qCidade.Open;

  qUF.Close;
  if qCidadeUF.AsString = EmptyStr then
    qUF.ParamByName('UF').AsString := qFilialUF.AsString
  else
    qUF.ParamByName('UF').AsString := qCidadeUF.AsString;
  qUF.Open;

  qPais.Close;
  qPais.ParamByName('ID').AsInteger := IDPais;
  qPais.Open;
end;

procedure TDMNFCe.mAuxDadosNFeNewRecord(DataSet: TDataSet);
begin
  mAuxDadosNFeID_Variacao.AsInteger := 0;
end;

procedure TDMNFCe.Posiciona_Operacao_Nota(ID: Integer);
begin
  qOperacao_Nota.Close;
  qOperacao_Nota.ParamByName('ID').AsInteger := ID;
  qOperacao_Nota.Open;
end;

procedure TDMNFCe.prc_Abrir_NFe_Log(Rec: Boolean);
begin
  cdsNFe_Log.Close;
  sdsNFe_Log.CommandText := ctNFe_Log;
  if Rec then
    sdsNFe_Log.CommandText := sdsNFe_Log.CommandText + ' AND L.MSGRETWS LIKE ' + QuotedStr('%[nRec:%');
  sdsNFe_Log.ParamByName('ID_NFE').AsInteger := cdsNota_EletronicaID.AsInteger;
  cdsNFe_Log.Open;
end;

procedure TDMNFCe.prc_Procurar_Recibo;
var
  i : Integer;
  vTexto : String;
begin
  vTexto := '';
  i := posex('<nRec>',cdsNFe_LogMSGRETWS.Value);
  if i > 0 then
    vTexto := copy(cdsNFe_LogMSGRETWS.Value,i+6,15);
  vNRec_Log := vTexto;

  vTexto := '';
  i := posex('[nRec:',cdsNFe_LogMSGRETWS.Value);
  if i > 0 then
    vTexto := copy(cdsNFe_LogMSGRETWS.Value,i+6,15);
  vNRec_Orig := vTexto;
end;

procedure TDMNFCe.prc_Abrir_Produto(ID: Integer);
begin
  qProduto.Close;
  qProduto.ParamByName('ID').AsInteger := ID;
  qProduto.Open;
end;

procedure TDMNFCe.prc_Abrir_Filial(ID: Integer);
begin
  qFilial.Close;
  qFilial.ParamByName('ID').AsInteger := ID;
  qFilial.Open;

  qFilial_Certificado.Close;
  qFilial_Certificado.ParamByName('ID').AsInteger := ID;
  qFilial_Certificado.Open;

  qFilial_NFCe.Close;
  qFilial_NFCe.ParamByName('ID').AsInteger := ID;
  qFilial_NFCe.Open;

end;

procedure TDMNFCe.prc_Gravar_Inutilizacao;
begin
//
end;

procedure TDMNFCe.prc_Inserir_Inutilizacao;
var
  vAux : Integer;
begin
  if not cdsNFe_Inutilizacao.Active then
    prc_Localizar_Inutilizacao(-1);
  vAux := dmDatabase.ProximaSequencia('NFE_INUTILIZACAO',0);

  cdsNFe_Inutilizacao.Insert;
  cdsNFe_InutilizacaoID.AsInteger := vAux + 1;

end;

procedure TDMNFCe.prc_Localizar_Inutilizacao(ID: Integer);
begin
  cdsNFe_Inutilizacao.Close;
  sdsNFe_Inutilizacao.CommandText := ctInutilizacao;
  if ID <> 0 then
    sdsNFe_Inutilizacao.CommandText := sdsNFe_Inutilizacao.CommandText
                         + ' WHERE ID = ' + IntToStr(ID);
  cdsNFe_Inutilizacao.Open;
end;

end.

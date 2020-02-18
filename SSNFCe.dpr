program SSNFCe;



uses
  Forms,
  Windows,
  uCupomFiscalC in 'uCupomFiscalC.pas' {fCupomFiscalC},
  uDmCupomFiscal in 'uDmCupomFiscal.pas' {dmCupomFiscal: TDataModule},
  UCupomFiscal in 'UCupomFiscal.pas' {fCupomFiscal},
  UCupomFiscalCanc in 'uCupomFiscalCanc.pas' {fCupomFiscalCanc},
  UCupomFiscalCli in 'uCupomFiscalCli.pas' {fCupomFiscalCli},
  UCupomFiscalPgto in 'uCupomFiscalPgto.pas' {fCupomFiscalPgto},
  uImpFiscal_Bematech in 'uImpFiscal_Bematech.pas',
  uImpFiscal_Daruma in 'uImpFiscal_Daruma.pas',
  uUtilBematech in 'uUtilBematech.pas',
  uUtilDaruma in 'uUtilDaruma.pas',
  UDMEstoque in '..\ssfacil\UDMEstoque.pas' {DMEstoque: TDataModule},
  UDMMovimento in '..\ssfacil\UDMMovimento.pas' {DMMovimento: TDataModule},
  uUtilPadrao in '..\ssfacil\uUtilPadrao.pas',
  UEscolhe_Filial in '..\ssfacil\UEscolhe_Filial.pas' {frmEscolhe_Filial},
  USel_Produto in '..\ssfacil\USel_Produto.pas' {frmSel_Produto},
  uImpFiscal_Elgin in 'uImpFiscal_Elgin.pas',
  uCupomParametros in 'uCupomParametros.pas' {fCupomParametros},
  uUtilElgin in 'uUtilElgin.pas',
  UDMCadExtComissao in '..\ssfacil\UDMCadExtComissao.pas' {DMCadExtComissao: TDataModule},
  UDMGravarFinanceiro in '..\ssfacil\UDMGravarFinanceiro.pas' {DMGravarFinanceiro: TDataModule},
  UDMRel in '..\ssfacil\UDMRel.pas' {DMRel: TDataModule},
  SendMailOptions in '..\ssfacil\sendmail\SendMailOptions.pas' {FormSendMailOptions},
  SelfPrintDefs in '..\ssfacil\sendmail\SelfPrintDefs.pas',
  SendMail in '..\ssfacil\sendmail\SendMail.pas',
  uDmCupomTerminal in 'uDmCupomTerminal.pas' {dmCupomTerminal: TDataModule},
  uCupomTerminal in 'uCupomTerminal.pas' {fCupomTerminal},
  uDmParametros in 'uDmParametros.pas' {dmParametros: TDataModule},
  UCadFechamento in 'UCadFechamento.pas' {frmCadFechamento},
  UCadFechamento_Itens in 'UCadFechamento_Itens.pas' {frmCadFechamento_Itens},
  UCadFechamento_Sangria in 'UCadFechamento_Sangria.pas' {frmCadFechamento_Sangria},
  UDMCadFechamento in 'UDMCadFechamento.pas' {DMCadFechamento: TDataModule},
  URelFechamento in 'URelFechamento.pas' {fRelFechamento},
  uNFeComandos in '..\ssfacil\uNFeComandos.pas',
  uCupomFiscalParcela in 'uCupomFiscalParcela.pas' {fCupomFiscalParcela},
  uComandaR in 'uComandaR.pas' {fComandaR},
  uCartao in 'uCartao.pas' {fCartao},
  uCupomFiscalPgtoMulti in 'uCupomFiscalPgtoMulti.pas' {fCupomFiscalPgtoMulti},
  uCupomFiscalImposto in 'uCupomFiscalImposto.pas' {fCupomFiscalImposto},
  uCalculo_CupomFiscal in 'uCalculo_CupomFiscal.pas',
  nfe_v110 in '..\ssfacil\nfe_v110.pas',
  DmdDatabase_NFeBD in '..\ssfacil\DmdDatabase_NFeBD.pas' {dmDatabase_NFeBD: TDataModule},
  UDMConsNotaEletronica in '..\ssfacil\UDMConsNotaEletronica.pas' {DMConsNotaEletronica: TDataModule},
  USenha in '..\ssfacil\USenha.pas' {frmSenha},
  uUtilCliente in '..\ssfacil\uUtilCliente.pas',
  uUtilCupom in 'uUtilCupom.pas',
  UCadFechamento_Contagem in 'UCadFechamento_Contagem.pas' {frmCadFechamento_Contagem},
  UConsPreco in 'UConsPreco.pas' {frmConsPreco},
  USel_Sacola_CF in 'USel_Sacola_CF.pas' {frmSel_Sacola_CF},
  USel_Pedido_CF in 'USel_Pedido_CF.pas' {frmSel_Pedido_CF},
  USel_Pessoa in '..\ssfacil\USel_Pessoa.pas' {frmSel_Pessoa},
  UDMCadCupomFiscal_MP in 'UDMCadCupomFiscal_MP.pas' {DMCadCupomFiscal_MP: TDataModule},
  UConsPessoa_Fin in '..\ssfacil\UConsPessoa_Fin.pas' {frmConsPessoa_Fin},
  UDMConsPessoa in '..\ssfacil\UDMConsPessoa.pas' {DMConsPessoa: TDataModule},
  uCarnePgto in 'uCarnePgto.pas' {fCarnePgto},
  uDmPagamento in 'uDmPagamento.pas' {dmPagamento: TDataModule},
  uCupomCliente in 'uCupomCliente.pas' {fCupomCliente},
  UDMSel_Produto in '..\ssfacil\UDMSel_Produto.pas' {DMSel_Produto: TDataModule},
  USel_Produto_Preco in '..\ssfacil\USel_Produto_Preco.pas' {frmSel_Produto_Preco},
  uCupomDadosCli in 'uCupomDadosCli.pas' {frmCupomDadosCli},
  UDMCadDuplicata in '..\ssfacil\UDMCadDuplicata.pas' {DMCadDuplicata: TDataModule},
  UCadFechamento_Det in '..\ssfacil\UCadFechamento_Det.pas' {frmCadFechamento_Det},
  USel_Comanda_CF in 'USel_Comanda_CF.pas' {frmSel_Comanda_CF},
  uPrevVendas in 'uPrevVendas.pas' {fPrevVendas},
  USel_Produto_Lote in '..\ssfacil\PedidoLoja\USel_Produto_Lote.pas' {frmSel_Produto_Lote},
  uCupomDevolucao in 'uCupomDevolucao.pas' {fCupomDevolucao},
  uDmDevolucao in 'uDmDevolucao.pas' {dmDevolucao: TDataModule},
  uCupomDevolucao_Itens in 'uCupomDevolucao_Itens.pas' {fCupomDevolucao_Itens},
  uCarnePgtoC in 'uCarnePgtoC.pas' {fCarnePgtoC},
  uSel_CorTamanho in 'uSel_CorTamanho.pas' {fSel_CorTamanho},
  uMenu1 in 'uMenu1.pas' {fMenu1},
  uAlteraDt_NFCe in 'uAlteraDt_NFCe.pas' {frmAlteraDt_NFCe},
  enviNFe_v400 in '..\ssfacil\nfe\4.00\enviNFe_v400.pas',
  uGrava_Erro in '..\ssfacil\uGrava_Erro.pas',
  uBalanca in 'uBalanca.pas',
  uNFeConsts in '..\ssfacil\uNFeConsts.pas',
  UConsProdutoNCM in '..\ssfacil\UConsProdutoNCM.pas' {frmConsProdutoNCM},
  UDMConsProduto in '..\ssfacil\UDMConsProduto.pas' {DMConsProduto: TDataModule},
  UAltCFOPProd in '..\ssfacil\UAltCFOPProd.pas' {frmAltCFOPProd},
  DmdDatabase in '..\ssfacil\DmdDatabase.pas' {dmDatabase: TDataModule},
  rsDBUtils in '..\rslib\nova\rsDBUtils.pas',
  LogProvider in '..\logs\src\LogProvider.pas',
  LogTypes in '..\logs\src\LogTypes.pas',
  UCupomFiscal_Canc in 'nfce\UCupomFiscal_Canc.pas' {fCupomFiscal_Canc},
  UDMNFCe in 'nfce\UDMNFCe.pas' {DMNFCe: TDataModule},
  uNFCe in 'nfce\uNFCe.pas' {fNFCe},
  UNFCe_Log in 'nfce\UNFCe_Log.pas' {frmNFCe_Log},
  uRelDanfe_NFCe in 'nfce\URelDanfe_NFCe.pas' {fRelDanfe_NFCe},
  uXMLNFCe4_00 in 'nfce\uXMLNFCe4_00.pas',
  uNFCE_ACBr in 'nfce\uNFCE_ACBr.pas' {fNFCE_ACBR},
  uConsCupom in 'uConsCupom.pas' {frmConsCupom},
  uConsCupomItens in 'uConsCupomItens.pas' {frmConsCupomItens},
  TelaPrecoAlterado in 'TelaPrecoAlterado.pas' {FormTelaPrecoAlterado},
  uConsultaRapidaProduto in 'uConsultaRapidaProduto.pas' {frmConsultaRapidaProduto},
  uTipoDescontoItem in 'uTipoDescontoItem.pas' {frmTelaTipoDescontoItem},
  UDMCadFilial_Certificado in 'UDMCadFilial_Certificado.pas' {DMFilial_Certificado: TDataModule},
  UCadFilial_Certificado in 'UCadFilial_Certificado.pas' {frmCadFilial_Certificado},
  uCupomFiscalPgtoDet in 'uCupomFiscalPgtoDet.pas' {frmCupomFiscalPgtoDet},
  uClasseCalculaPagto in 'Classes\uClasseCalculaPagto.pas',
  uTipoFormaPagto in 'uTipoFormaPagto.pas' {frmTelaTipoFormaPagto},
  UCadFechamento_Contagem2 in 'UCadFechamento_Contagem2.pas' {frmCadFechamento_Contagem2},
  UCadFechamento2 in 'UCadFechamento2.pas' {frmCadFechamento2},
  uMenu in 'uMenu.pas' {fMenu},
  uConsRapidaPedido in 'uConsRapidaPedido.pas' {frmConsRapidaPedido},
  USel_Troca in 'USel_Troca.pas' {frmSel_Troca},
  UCupom_Troca in 'UCupom_Troca.pas' {frmCupomTroca};

//  UCupom_Troca in 'UCupom_Troca.pas' {Form1};

{$R *.res}

begin
  Enter := VK_Return;
  Esc := VK_Escape;
  F2 := Vk_F2;
  F3 := Vk_F3;
  F4 := Vk_F4;
  F5 := Vk_F5;
  F6 := Vk_F6;
  F7 := Vk_F7;
  F8 := Vk_F8;
  F9 := Vk_F9;
  F10 := Vk_F10;
  F11 := Vk_F11;
  F12 := Vk_F12;
  Application.Initialize;
  Application.Title := 'SSNFCe';
  Application.CreateForm(TdmDatabase, dmDatabase);
  Application.CreateForm(TfMenu, fMenu);
  Application.CreateForm(TfMenu1, fMenu1);
  fMenu1.FormStyle := fsMDIChild;
  fMenu1.Show;
  
  Application.Run;
end.

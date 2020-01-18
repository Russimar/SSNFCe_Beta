unit uConsCupom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RxLookup, NxCollection, StdCtrls, Mask, ToolEdit, Grids,
  DBGrids, SMDBGrid, uDmCupomFiscal, uUtilPadrao, uNFCE_ACBr, uConsCupomItens,
  cxStyles, dxSkinsCore, dxSkinBlue, dxSkinMoneyTwins, rsDBUtils,
  dxSkinOffice2007Blue, dxSkinSeven, dxSkinscxPCPainter, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxLookAndFeels, cxGrid, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  AdvPanel;

type
  TfrmConsCupom = class(TForm)
    pnlPrincipal: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1NUMCUPOM: TcxGridDBColumn;
    cxGrid1DBTableView1DTEMISSAO: TcxGridDBColumn;
    cxGrid1DBTableView1VLR_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1CANCELADO: TcxGridDBColumn;
    cxGrid1DBTableView1CPF: TcxGridDBColumn;
    cxGrid1DBTableView1NFECHAVEACESSO: TcxGridDBColumn;
    cxGrid1DBTableView1NFEPROTOCOLO: TcxGridDBColumn;
    cxGrid1DBTableView1NFERECIBO: TcxGridDBColumn;
    cxGrid1DBTableView1SERIE: TcxGridDBColumn;
    cxGrid1DBTableView1CLIENTE_NOME: TcxGridDBColumn;
    cxGrid1DBTableView1HREMISSAO: TcxGridDBColumn;
    cxGridViewRepository1: TcxGridViewRepository;
    cxLookAndFeelController1: TcxLookAndFeelController;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    AdvPanel1: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    dtInicial: TDateEdit;
    dtFinal: TDateEdit;
    btnConsultar: TNxButton;
    ComboTerminal: TRxDBLookupCombo;
    cbNEnviados: TCheckBox;
    btnEnviar: TNxButton;
    btnReimprimir: TNxButton;
    edtSerie: TEdit;
    AdvPanelStyler1: TAdvPanelStyler;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnReimprimirClick(Sender: TObject);
    procedure GridCupomDblClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    fNFCE_ACBr : TfNFCE_ACBR;
    procedure prc_Consultar;
  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
    ffrmConsCupomItens : TfrmConsCupomItens;
    vCancelar : Boolean;
    vExcluir : Boolean;
  end;

var
  frmConsCupom: TfrmConsCupom;

implementation


{$R *.dfm}

procedure TfrmConsCupom.FormShow(Sender: TObject);
begin
  fNFCE_ACBr := TfNFCE_ACBR.Create(nil);
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);

  fDmCupomFiscal.cdsTerminal.Open;
  dtInicial.Date := Date;
  dtFinal.Date := Date;
  ComboTerminal.KeyValue := vTerminal;
  if vCancelar then
    btnEnviar.Caption := 'Cancelar NFCe';
  if vExcluir then
  begin
    btnEnviar.Caption := 'Excluir';
    btnEnviar.Glyph := nil;
  end;
  btnConsultarClick(Sender);
end;

procedure TfrmConsCupom.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmConsCupom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
  FreeAndNil(fNFCE_ACBr);  
end;

procedure TfrmConsCupom.btnEnviarClick(Sender: TObject);
var
  NumCupom : String;
  i, Selecionado : integer;
begin
  if vCancelar then
  begin
    if trim(fDMCupomFiscal.cdsCupom_ConsNFEPROTOCOLO_CANCELADA.AsString) <> EmptyStr then
    begin
      MessageDlg('*** Cupom j� cancelado!', mtInformation, [mbOk], 0);
      exit;
    end;
    NumCupom := IntToStr(fDmCupomFiscal.cdsCupom_ConsNUMCUPOM.AsInteger);
    if MessageDlg('Tem certeza que deseja cancelar o Cupom N�: ' + NumCupom,mtConfirmation,[mbYes,mbNo],0) = mrNo then
      Exit;
    fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
    fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
    fNFCE_ACBr.ComboAmbiente.ItemIndex := StrToIntDef(fdmCupomFiscal.cdsFilialNFCEPRODUCAO.AsString,1) - 1;
    fDmCupomFiscal.cdsCupomFiscal.Close;
    try
      fNFCE_ACBr.btCancelarClick(Sender);
    except
      on E : Exception do
      begin
        ShowMessage('Erro: ' + e.Message);
      end;
    end;
    btnConsultarClick(Sender);
  end
  else
  if vExcluir then
  begin
    if trim(fDMCupomFiscal.cdsCupom_ConsNFEPROTOCOLO_CANCELADA.AsString) <> EmptyStr then
    begin
      MessageDlg('*** Cupom j� cancelado!', mtInformation, [mbOk], 0);
      exit;
    end;
    if trim(fDMCupomFiscal.cdsCupom_ConsNFEPROTOCOLO.AsString) <> EmptyStr then
    begin
      MessageDlg('*** Cupom j� enviado!', mtInformation, [mbOk], 0);
      exit;
    end;

    NumCupom := IntToStr(fDmCupomFiscal.cdsCupom_ConsNUMCUPOM.AsInteger);
    if MessageDlg('Tem certeza que deseja cancelar o Cupom N�: ' + NumCupom,mtConfirmation,[mbYes,mbNo],0) = mrNo then
      Exit;
    fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
    fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
    fNFCE_ACBr.ComboAmbiente.ItemIndex := StrToIntDef(fdmCupomFiscal.cdsFilialNFCEPRODUCAO.AsString,1) - 1;
    fDmCupomFiscal.cdsCupomFiscal.Close;
    try
      fNFCE_ACBr.btCancelarClick(Sender);
    except
      on E : Exception do
      begin
        ShowMessage('Erro: ' + e.Message);
      end;
    end;
    btnConsultarClick(Sender);
  end
  else

  begin
    try
      if trim(fDMCupomFiscal.cdsCupom_ConsNFEPROTOCOLO.AsString) <> EmptyStr then
      begin
        MessageDlg('*** Cupom j� enviado!', mtInformation, [mbOk], 0);
        exit;
      end;
      NumCupom := IntToStr(fDmCupomFiscal.cdsCupom_ConsNUMCUPOM.AsInteger);
      if MessageDlg('Tem certeza que deseja reenviar o Cupom Selecionado? ' ,mtConfirmation,[mbYes,mbNo],0) = mrNo then
        Exit;
      fDmCupomFiscal.cdsCupom_Cons.DisableControls;
      fDmCupomFiscal.cdsCupom_Cons.First;
      //n�o trocar o indice 0 na grid

      for i:=0 to cxGrid1DBTableView1.Controller.SelectedRowCount - 1 do
      begin
          fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
          fNFCE_ACBr.vID_Cupom_Novo := cxGrid1DBTableView1.Controller.SelectedRows[i].Values[0];
          fNFCE_ACBr.ComboAmbiente.ItemIndex := StrToIntDef(fdmCupomFiscal.cdsFilialNFCEPRODUCAO.AsString,1) - 1;
          fNFCE_ACBr.chkGravarXml.Checked := True;
          fNFCE_ACBr.Reenviar := True;
          fDmCupomFiscal.cdsCupomFiscal.Close;
          try
            fNFCE_ACBr.btEnviarNovoClick(Sender);
          except
            on E : Exception do
            begin
              ShowMessage('Erro: ' + e.Message);
            end;
          end;
          fNFCE_ACBr.Reenviar := False;
      end;

//      while not fDmCupomFiscal.cdsCupom_Cons.Eof do
//      begin
//        if cxGrid1DBTableView1.Columns[0].Selected then
//        begin
//          fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
//          fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
//          fNFCE_ACBr.ComboAmbiente.ItemIndex := StrToIntDef(fdmCupomFiscal.cdsFilialNFCEPRODUCAO.AsString,1) - 1;
//          fNFCE_ACBr.chkGravarXml.Checked := True;
//          fNFCE_ACBr.Reenviar := True;
//          fDmCupomFiscal.cdsCupomFiscal.Close;
//          try
//            fNFCE_ACBr.btEnviarNovoClick(Sender);
//          except
//            on E : Exception do
//            begin
//              ShowMessage('Erro: ' + e.Message);
//            end;
//          end;
//          fNFCE_ACBr.Reenviar := False;
//        end;
//        fDmCupomFiscal.cdsCupom_Cons.Next;
//      end;
      btnConsultarClick(Sender);
    finally
      fDmCupomFiscal.cdsCupom_Cons.EnableControls;
    end;
  end;
end;

procedure TfrmConsCupom.prc_Consultar;
var
  vComando: string;
begin
  fDmCupomFiscal.cdsCupom_Cons.Close;
  vComando := fDmCupomFiscal.ctConsCupom;
  vComando := vComando + 'WHERE 0=0';
  vComando := vComando + ' AND CF.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtInicial.date));
  vComando := vComando + ' AND CF.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY', dtFinal.date));
  if ComboTerminal.KeyValue > 0 then
    vComando := vComando + ' AND TERMINAL_ID = ' + ComboTerminal.Value;
  if vCancelar then
  begin
    cbNEnviados.Checked := False;
    cbNEnviados.Enabled := False;
    vComando := vComando + ' AND CF.NFEPROTOCOLO IS NOT NULL AND CF.NFEPROTOCOLO_CANCELADA IS NULL';
  end;
  if cbNEnviados.Checked then
    vComando := vComando + ' AND CF.NFECHAVEACESSO IS NULL';
  if edtSerie.Text <> EmptyStr then
    vComando := vComando + ' AND CF.SERIE = ' + edtSerie.Text;
  vComando := vComando + ' ORDER BY CF.HREMISSAO DESC';
  fDmCupomFiscal.sdsCupom_Cons.CommandText := vComando;
  fDmCupomFiscal.cdsCupom_Cons.Open;
end;

procedure TfrmConsCupom.btnReimprimirClick(Sender: TObject);
begin
  fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
  fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
  fDmCupomFiscal.cdsCupomFiscal.Close;
  try
    fNFCE_ACBr.btImprimirClick(Sender);
  except
    on E : Exception do
    begin
      ShowMessage('Erro: ' + e.Message);
    end;
  end;
  fDmCupomFiscal.cdsCupomFiscal.Close;
end;

procedure TfrmConsCupom.GridCupomDblClick(Sender: TObject);
begin
  if fDmCupomFiscal.cdsCupom_Cons.IsEmpty then
    Exit;
  fDmCupomFiscal.prcLocalizar(fDmCupomFiscal.cdsCupom_ConsID.AsInteger);
  ffrmConsCupomItens := TfrmConsCupomItens.Create(nil);
  ffrmConsCupomItens.fDMCupomFiscal := fDmCupomFiscal;
  ffrmConsCupomItens.ShowModal;
  FreeAndNil(ffrmConsCupomItens);
end;

procedure TfrmConsCupom.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if fDmCupomFiscal.cdsCupom_Cons.IsEmpty then
    Exit;
  fDmCupomFiscal.prcLocalizar(fDmCupomFiscal.cdsCupom_ConsID.AsInteger);
  ffrmConsCupomItens := TfrmConsCupomItens.Create(nil);
  ffrmConsCupomItens.fDMCupomFiscal := fDmCupomFiscal;
  ffrmConsCupomItens.ShowModal;
  FreeAndNil(ffrmConsCupomItens);

end;

end.


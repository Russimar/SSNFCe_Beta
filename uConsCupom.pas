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
  AdvPanel, dxSkinBlack, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinOffice2007Black,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  Menus, RzPanel;

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
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    chkNFCE: TCheckBox;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    btnExcluir: TNxButton;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    ImprimirCupom1: TMenuItem;
    ImprimirCarne1: TMenuItem;
    ImprimiraConsulta1: TMenuItem;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    Label4: TLabel;
    ComboVendedor: TRxDBLookupCombo;
    gbxVendedor: TRzGroupBox;
    SMDBGrid2: TSMDBGrid;
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEnviarClick(Sender: TObject);
    procedure GridCupomDblClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
    procedure btnExcluirClick(Sender: TObject);
    procedure ImprimirCupom1Click(Sender: TObject);
    procedure ImprimirCarne1Click(Sender: TObject);
    procedure ImprimiraConsulta1Click(Sender: TObject);
  private
    { Private declarations }
    fNFCE_ACBr: TfNFCE_ACBR;
    procedure prc_Consultar;
    procedure prc_Consultar_Total_FormaPagto;
  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
    ffrmConsCupomItens: TfrmConsCupomItens;
    vCancelar: Boolean;
    vExcluir: Boolean;
  end;

var
  frmConsCupom: TfrmConsCupom;

implementation


{$R *.dfm}

procedure TfrmConsCupom.FormShow(Sender: TObject);
begin
  fNFCE_ACBr := TfNFCE_ACBR.Create(nil);
  if not Assigned(fDmCupomFiscal) then
    fDmCupomFiscal := TDmCupomFiscal.Create(Self);

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
  prc_Consultar_Total_FormaPagto;
end;

procedure TfrmConsCupom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if fDmCupomFiscal.Owner.ClassName  = Self.ClassName then
    FreeAndNil(fDmCupomFiscal);
  Action := Cafree;
  FreeAndNil(fNFCE_ACBr);
end;

procedure TfrmConsCupom.btnEnviarClick(Sender: TObject);
var
  NumCupom: string;
  i, Selecionado: integer;
  IDCupomAux : integer;
begin
  if vCancelar then
  begin
    if trim(fDMCupomFiscal.cdsCupom_ConsNFEPROTOCOLO_CANCELADA.AsString) <> EmptyStr then
    begin
      MessageDlg('*** Cupom já cancelado!', mtInformation, [mbOk], 0);
      exit;
    end;
    IDCupomAux := fDmCupomFiscal.cdsCupom_ConsID.AsInteger; 
    NumCupom := IntToStr(fDmCupomFiscal.cdsCupom_ConsNUMCUPOM.AsInteger);
    if MessageDlg('Tem certeza que deseja cancelar o Cupom Nº: ' + NumCupom, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;
    fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
    fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
    fNFCE_ACBr.ComboAmbiente.ItemIndex := StrToIntDef(fdmCupomFiscal.cdsFilialNFCEPRODUCAO.AsString, 1) - 1;
    fDmCupomFiscal.cdsCupomFiscal.Close;
    try
      fNFCE_ACBr.btCancelarClick(Sender);
      fDmCupomFiscal.prc_Voltar_Comanda(IDCupomAux);
    except
      on E: Exception do
      begin
        ShowMessage('Erro: ' + e.Message);
      end;
    end;
    btnConsultarClick(Sender);
  end
  else if vExcluir then
  begin
    if trim(fDMCupomFiscal.cdsCupom_ConsNFEPROTOCOLO_CANCELADA.AsString) <> EmptyStr then
    begin
      MessageDlg('*** Cupom já cancelado!', mtInformation, [mbOk], 0);
      exit;
    end;
    if trim(fDMCupomFiscal.cdsCupom_ConsNFEPROTOCOLO.AsString) <> EmptyStr then
    begin
      MessageDlg('*** Cupom já enviado!', mtInformation, [mbOk], 0);
      exit;
    end;

    NumCupom := IntToStr(fDmCupomFiscal.cdsCupom_ConsNUMCUPOM.AsInteger);
    if MessageDlg('Tem certeza que deseja cancelar o Cupom Nº: ' + NumCupom, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Exit;
    fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
    fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
    fNFCE_ACBr.ComboAmbiente.ItemIndex := StrToIntDef(fdmCupomFiscal.cdsFilialNFCEPRODUCAO.AsString, 1) - 1;
    fDmCupomFiscal.cdsCupomFiscal.Close;
    try
      fNFCE_ACBr.btCancelarClick(Sender);
    except
      on E: Exception do
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
        MessageDlg('*** Cupom já enviado!', mtInformation, [mbOk], 0);
        exit;
      end;
      NumCupom := IntToStr(fDmCupomFiscal.cdsCupom_ConsNUMCUPOM.AsInteger);
      if MessageDlg('Tem certeza que deseja reenviar o Cupom Selecionado? ', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        Exit;
      fDmCupomFiscal.cdsCupom_Cons.DisableControls;
      fDmCupomFiscal.cdsCupom_Cons.First;
      //não trocar o indice 0 na grid

      for i := 0 to cxGrid1DBTableView1.Controller.SelectedRowCount - 1 do
      begin
        fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
        fNFCE_ACBr.vID_Cupom_Novo := cxGrid1DBTableView1.Controller.SelectedRows[i].Values[0];
        fNFCE_ACBr.ComboAmbiente.ItemIndex := StrToIntDef(fdmCupomFiscal.cdsFilialNFCEPRODUCAO.AsString, 1) - 1;
        fNFCE_ACBr.chkGravarXml.Checked := True;
        fNFCE_ACBr.Reenviar := True;
        fDmCupomFiscal.cdsCupomFiscal.Close;
        try
          fNFCE_ACBr.btEnviarNovoClick(Sender);
        except
          on E: Exception do
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
  if chkNFCE.Checked then
    vComando := vComando + ' AND TIPO = ' + QuotedStr('NFC');
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
    vComando := vComando + ' AND CF.SERIE = ' + QuotedStr(edtSerie.Text);
  if ComboVendedor.Text <> '' then
    vComando := vComando + ' AND CF.ID_VENDEDOR = ' + IntToStr(ComboVendedor.KeyValue);
  vComando := vComando + ' ORDER BY CF.HREMISSAO DESC';
  fDmCupomFiscal.sdsCupom_Cons.CommandText := vComando;
  fDmCupomFiscal.cdsCupom_Cons.Open;
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

procedure TfrmConsCupom.cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if fDmCupomFiscal.cdsCupom_Cons.IsEmpty then
    Exit;
  fDmCupomFiscal.prcLocalizar(fDmCupomFiscal.cdsCupom_ConsID.AsInteger);
  ffrmConsCupomItens := TfrmConsCupomItens.Create(nil);
  ffrmConsCupomItens.fDMCupomFiscal := fDmCupomFiscal;
  ffrmConsCupomItens.ShowModal;
  FreeAndNil(ffrmConsCupomItens);

end;

procedure TfrmConsCupom.btnExcluirClick(Sender: TObject);
var
  NumCupom: String;
begin
  if (trim(fDMCupomFiscal.cdsCupom_ConsNFEPROTOCOLO.AsString) <> EmptyStr) or (trim(fDMCupomFiscal.cdsCupom_ConsNFECHAVEACESSO.AsString) <> EmptyStr) then
  begin
    MessageDlg('*** Cupom já enviado!', mtInformation, [mbOk], 0);
    exit;
  end;
  fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
  NumCupom := IntToStr(fDmCupomFiscal.cdsCupom_ConsNUMCUPOM.AsInteger);

  if MessageDlg('Tem certeza que deseja Excluir o Cupom Nº: ' + NumCupom, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  if (NumCupom <> EmptyStr) and (fDmCupomFiscal.cdsCupom_ConsTIPO.AsString = 'NFC') then
  begin
    if MessageDlg('Deseja inutilizar a No: ' + NumCupom, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        fNFCE_ACBr.prc_Inutilizar_Cupom(fDmCupomFiscal.cdsCupom_ConsID.AsInteger);
      except
        on E: Exception do
         ShowMessage('Não foi possível inutilizar a numeração do cupom ' + #10#13 + E.Message);
      end;
    end;
  end;
  fDmCupomFiscal.prc_Excluir_Cupom_Fiscal(fDmCupomFiscal.cdsCupom_ConsID.AsInteger,'S');
  btnConsultarClick(Sender);
end;

procedure TfrmConsCupom.ImprimirCupom1Click(Sender: TObject);
begin
  fNFCE_ACBr.fdmCupomFiscal := fDmCupomFiscal;
  fNFCE_ACBr.vID_Cupom_Novo := fDmCupomFiscal.cdsCupom_ConsID.AsInteger;
  fDmCupomFiscal.cdsCupomFiscal.Close;
  try
    fNFCE_ACBr.btImprimirClick(Sender);
  except
    on E: Exception do
    begin
      ShowMessage('Erro: ' + e.Message);
    end;
  end;
  fDmCupomFiscal.cdsCupomFiscal.Close;
end;

procedure TfrmConsCupom.ImprimirCarne1Click(Sender: TObject);
var
  vArq: string;
begin
  if not (fDmCupomFiscal.cdsCupom_Cons.Active) or (fDmCupomFiscal.cdsCupom_Cons.IsEmpty) then
    Exit;
  fDmCupomFiscal.prcLocalizar(fDmCupomFiscal.cdsCupom_ConsID.AsInteger);
  if fDmCupomFiscal.cdsCupomFiscalID_TIPOCOBRANCA.AsInteger <= 0 then
    exit;
  fDmCupomFiscal.cdsTipoCobranca.Locate('ID', fDmCupomFiscal.cdsCupomFiscalID_TIPOCOBRANCA.AsInteger, [loCaseInsensitive]);
  if fDmCupomFiscal.cdsTipoCobrancaIMPRIME_CARNE.AsString <> 'S' then
    exit;
  if fDmCupomFiscal.cdsCupomParametrosCARNE_RELATORIO.AsString <> '' then
    vArq := fDmCupomFiscal.cdsCupomParametrosCARNE_RELATORIO.AsString
  else
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\CarnePgto1.fr3';
  if FileExists(vArq) then
    fDmCupomFiscal.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatório não localizado! ' + vArq);
    Exit;
  end;
  fDmCupomFiscal.frxReport1.ShowReport;
end;

procedure TfrmConsCupom.ImprimiraConsulta1Click(Sender: TObject);
var
  vArq : String;
begin
  fDmCupomFiscal.cdsCupom_Cons.IndexFieldNames := 'TIPO;SERIE;NUMCUPOM';
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Cupom_Cons.fr3';
  if FileExists(vArq) then
  begin
    fDmCupomFiscal.frxReport1.Report.LoadFromFile(vArq);
    fDmCupomFiscal.frxReport1.Variables['ImpData'] := QuotedStr('Inicio: ' + dtInicial.Text + ' a ' + dtFinal.Text);
    fDmCupomFiscal.frxReport1.ShowReport;
  end
  else
    ShowMessage('Relatório não localizado! ' + vArq);
end;

procedure TfrmConsCupom.prc_Consultar_Total_FormaPagto;;
begin
  fDmCupomFiscal.cdscdsTotais.Close;
  fDmCupomFiscal.sdsTotais.CommandText := fDmCupomFiscal.ctTotais;
  if ComboTerminal.Text <> '' then
    fDmCupomFiscal.sdsTotais.CommandText := fDmCupomFiscal.sdsTotais.CommandText + ' AND TERMINAL = ' + ComboTerminal.Value;
  if ComboVendedor.Text <> '' then
    fDmCupomFiscal.sdsTotais.CommandText := fDmCupomFiscal.sdsTotais.CommandText + ' AND ID_VENDEDOR = ' + ComboTerminal.Value;

  if ComboBox1.ItemIndex > 0 then
  begin
    case ComboBox1.ItemIndex of
      1: vTipo := 'CNF';
      2: vTipo := 'NFC';
      3: vTipo := 'PED';
      4: vTipo := 'ORC';
      5: vTipo := 'COM';
    end;
    fDmCupomFiscal.sdsTotais.CommandText := fDmCupomFiscal.sdsTotais.CommandText + ' AND TIPO = ' + QuotedStr(vTipo);
  end;
  fDmCupomFiscal.sdsTotais.CommandText := fDmCupomFiscal.sdsTotais.CommandText + ' GROUP BY NOME';
  fDmCupomFiscal.sdsTotais.ParamByName('D1').AsDate := DateEdit1.Date;
  fDmCupomFiscal.sdsTotais.ParamByName('D2').AsDate := DateEdit2.Date;
  fDmCupomFiscal.cdsTotais.Open;


end;

end.


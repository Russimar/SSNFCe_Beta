unit UCupom_Troca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxCollection, StdCtrls, Mask, ToolEdit, CurrEdit, UDMCupomFiscal,
  Grids, DBGrids, SMDBGrid;

type
  TfrmCupom_Troca = class(TForm)
    NxPanel1: TNxPanel;
    btnConfirmar: TNxButton;
    Edit1: TEdit;
    Label1: TLabel;
    ceNumCupom: TCurrencyEdit;
    Label2: TLabel;
    edtSerie: TEdit;
    Label3: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label4: TLabel;
    Label5: TLabel;
    ceVlr_Unitario: TCurrencyEdit;
    SMDBGrid1: TSMDBGrid;
    Label6: TLabel;
    ceVlr_Total: TCurrencyEdit;
    Label7: TLabel;
    ceID_Produto: TCurrencyEdit;
    btnExcluir: TNxButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ceNumCupomKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    vID_Produto : Integer;
    vNum_Cupom_Ant : Integer;
    vSerie_Ant : String;
    function posicionaProduto: Boolean;
    procedure prc_Monta;

  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
    
  end;

var
  frmCupom_Troca: TfrmCupom_Troca;

implementation

uses rsDBUtils, uUtilPadrao, Types;

{$R *.dfm}

procedure TfrmCupom_Troca.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);
end;

procedure TfrmCupom_Troca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

function TfrmCupom_Troca.posicionaProduto: Boolean;
var
  vCampoPesquisa: string;
  vTamCod: Byte;
begin
  Result := False;
  ceVlr_Unitario.Value := 0;
  vID_Produto := 0;
  vTamCod     := 4;
  fDmCupomFiscal.vIdCombinacao := 0;
  fDmCupomFiscal.vTamanho      := '';
  fDmCupomFiscal.vCombinacao   := '';
  if not fDmCupomFiscal.cdsCupomParametrosTAMANHO_COD_ETIQUETA.IsNull then
    vTamCod := fDmCupomFiscal.cdsCupomParametrosTAMANHO_COD_ETIQUETA.AsInteger;

  if trim(Edit1.Text) = '' then
    exit;

   //Tirei no dia 18/11/2019 - nao sei pra que serve
  if fDmCupomFiscal.cdsCupomParametrosUSA_COD_REF.AsString = 'R' then
    vCampoPesquisa := 'REF'
  else
    vCampoPesquisa := 'ID';

  if ((Length(Edit1.Text) > 7) and (vCampoPesquisa = 'ID')) or (Length(Edit1.Text) = 13) then
//  if (Length(Edit1.Text) > 7) and (vCampoPesquisa = 'ID') then  //juca 01/10/2018
//  if Length(Edit1.Text) > 7 then //juca 18/05/2018
  begin
    if copy(Edit1.Text, 1, 1) = '2' then
    begin
      fDmCupomFiscal.prc_Abrir_Produto(vCampoPesquisa, Copy(Edit1.Text, 2, vTamCod)); //aqui criar um parametro, pode ser 4
      if fDmCupomFiscal.cdsProduto.IsEmpty then
      begin
        ShowMessage('Código do produto lido: ' + Copy(Edit1.Text, 2, vTamCod));
        Result := False;
      end
      else
      begin
        //11/01/2017   Cleomar
        if StrToFloat(FormatFloat('0.00000', vPreco_Pos)) > 0 then
          ceVlr_Unitario.Value := vPreco_Pos
        else
        begin
          //06/11/2019
          if (fDmCupomFiscal.cdsCupomParametrosUSA_PRECO_REVENDA.AsString = 'S') then
            ceVlr_Unitario.Value := fDmCupomFiscal.cdsProdutoPRECO_REVENDA.AsFloat
          else
          if (fDmCupomFiscal.cdsProdutoPRECO_VENDA.IsNull) or (fDmCupomFiscal.cdsProdutoPRECO_VENDA.AsFloat = 0) then
          begin
            MessageDlg('*** Preço de venda não cadastrado no produto!', mtInformation, [mbOk], 0);
            Edit1.Clear;
            Edit1.SetFocus;
            Exit;
          end
          else
            ceVlr_Unitario.Value := fDmCupomFiscal.cdsProdutoPRECO_VENDA.AsFloat;
        end;
        //**************
        //Cleomar 06/11/2019  alterado para a Gercla
        if Trim(fDmCupomFiscal.cdsCupomParametrosUSA_CBARRA_INT.AsString) = 'S' then
        begin
          fDmCupomFiscal.qCBarra_Int.Close;
          fDmCupomFiscal.qCBarra_Int.ParamByName('COD_BARRA').AsString := copy(Edit1.Text,1,12);
          fDmCupomFiscal.qCBarra_Int.Open;
          if fDmCupomFiscal.qCBarra_Int.IsEmpty then
          begin
            MessageDlg('*** Código de barras não cadastrado no produto!', mtInformation, [mbOk], 0);
            Edit1.Clear;
            Edit1.SetFocus;
            Exit;
          end
          else
          begin
            fDmCupomFiscal.vIdCombinacao := fDmCupomFiscal.qCBarra_IntID_COR.AsInteger;
            fDmCupomFiscal.vTamanho      := fDmCupomFiscal.qCBarra_IntTAMANHO.AsString;
            fDmCupomFiscal.vCombinacao   := fDmCupomFiscal.qCBarra_IntNOME_COMBINACAO.AsString;
          end;
          //*********** Até aqui é o da Gercla 06/11/2019
        end
        else
        begin
          case fDmCupomFiscal.cdsCupomParametrosETIQUETA_INFO.AsInteger of
            0:
              ;
            1:
              begin //peso
                CurrencyEdit1.Value := StrToFloat(Copy(Edit1.Text, 7, 6)) / 1000;
                ceVlr_Total.Value := StrToFloat(FormatFloat('0.00',ceVlr_Unitario.Value * CurrencyEdit1.Value));
              end;
            2:
              begin //preço
                CurrencyEdit1.Value := StrToFloat(Copy(Edit1.Text, 7, 6)) / 100 / fDmCupomFiscal.cdsProdutoPRECO_VENDA.AsFloat;
                ceVlr_Total.Value   := StrToFloat(FormatFloat('0.00', ceVlr_Unitario.Value * CurrencyEdit1.Value));
              end;
          end;
        end;
        vID_Produto := fDmCupomFiscal.cdsProdutoID.AsInteger;
        Result := True;
        Exit;
      end;
    end
    else
    begin

    end;

    fDmCupomFiscal.prc_Abrir_Produto('CB', Edit1.Text);
    if not fDmCupomFiscal.cdsProduto.IsEmpty then
    begin
      vID_Produto := fDmCupomFiscal.cdsProdutoID.AsInteger;
      Result := True;
    end
    else
    begin
      MessageDlg('*** Código de Barra ' + Edit1.Text + ' não encontrado!', mtInformation, [mbOk], 0);
      Edit1.SelectAll;
      Result := False;
      Exit;
    end;

  end
  else
  begin
    fDmCupomFiscal.prc_Abrir_Produto(vCampoPesquisa, Edit1.Text);

    if not fDmCupomFiscal.cdsProduto.IsEmpty then
    begin
      vID_Produto := fDmCupomFiscal.cdsProdutoID.AsInteger;
      Result := True;
    end
    else
    begin
      MessageDlg('*** Código / Referência ' + Edit1.Text + ' não encontrado!', mtInformation, [mbOk], 0);
      Edit1.Clear;
      Edit1.SetFocus;
      Result := False;
      Exit;
    end;
  end;

  if Result then
  begin
    //11/01/2017 Cleomar
    if StrToFloat(FormatFloat('0.0000', vPreco_Pos)) > 0 then
      ceVlr_Unitario.Value := vPreco_Pos
    else
    //06/11/2019
    begin
      if fDmCupomFiscal.cdsCupomParametrosUSA_PRECO_REVENDA.AsString = 'S' then
        ceVlr_Unitario.Value := fDmCupomFiscal.cdsProdutoPRECO_REVENDA.AsFloat
      else
        ceVlr_Unitario.Value := fDmCupomFiscal.cdsProdutoPRECO_VENDA.AsFloat;
    end;
    ceVlr_Total.Value := StrToFloat(FormatFloat('0.00', ceVlr_Unitario.Value * CurrencyEdit1.Value));
    vID_Produto := fDmCupomFiscal.cdsProdutoID.AsInteger;
  end
  else
  begin
    MessageDlg('*** Registro não encontrado!', mtInformation, [mbOk], 0);
    Edit1.Clear;
    Edit1.SetFocus;
  end;
end;

procedure TfrmCupom_Troca.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) then
  begin
    if (trim(Edit1.Text) <> '') and (posicionaProduto) then
      ceNumCupom.SetFocus
    else
    begin
      frmSel_Troca := TfrmSel_Troca.Create(Self);
      frmSel_Troca.fDmCupomFiscal := fDmCupomFiscal;
      frmSel_Troca.CurrencyEdit1.AsInteger := vID_Produto;
      frmSel_Troca.ShowModal;
      FreeAndNil(frmSel_Troca);
      if fDmCupomFiscal.vID_Troca > 0 then
      begin
        prc_Monta;
        CurrencyEdit1.SetFocus;
        ceID_Produto.AsInteger := vID_Produto;
      end;
    end;
  end;

end;

procedure TfrmCupom_Troca.ceNumCupomKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F3) then
  begin
    frmSel_Troca := TfrmSel_Troca.Create(Self);
    frmSel_Troca.fDmCupomFiscal := fDmCupomFiscal;
    frmSel_Troca.CurrencyEdit1.AsInteger := vID_Produto;
    frmSel_Troca.ShowModal;
    FreeAndNil(frmSel_Troca);
    if fDmCupomFiscal.vID_Troca > 0 then
    begin
      prc_Monta;
      CurrencyEdit1.SetFocus;
    end;
  end;

end;

procedure TfrmCupom_Troca.prc_Monta;
begin
  ceNumCupom.AsInteger := fDmCupomFiscal.cdsTrocaNUMCUPOM.AsInteger;
  edtSerie.Text        := fDmCupomFiscal.cdsTrocaSERIE.AsString;
  ceVlr_Total.Value    := fDmCupomFiscal.cdsTrocaVLR_TOTAL.AsFloat;
  CurrencyEdit1.Value  := fDmCupomFiscal.cdsTrocaQTD.AsFloat;
  if StrToFloat(FormatFloat('0.000',CurrencyEdit1.Value)) <> 1 then
    ceVlr_Unitario.Value := StrToFloat(FormatFloat('0.000#',fDmCupomFiscal.cdsTrocaVLR_TOTAL.AsFloat / CurrencyEdit1.Value))
  else
    ceVlr_Unitario.Value := StrToFloat(FormatFloat('0.000#',ceVlr_Total.Value));

end;

procedure TfrmCupom_Troca.btnConfirmarClick(Sender: TObject);
var
  vMSG : String;
begin
  vMSG := '';
  if ceID_Produto.AsInteger <= 0 then
    vMSG := vMSG + #13 + '*** ID Produto não informado!';
  if ceVlr_Unitario.Value <= 0 then
    vMSG := vMSG + #13 + '*** Valor não informado!';
  if trim(vMSG) <> '' then
  begin
    MessageDlg('*** Preço de venda não cadastrado no produto!', mtInformation, [mbOk], 0);
    exit;
  end;
  fDmCupomFiscal.prc_Inserir_Troca;
  fDmCupomFiscal.cdsCupom_TrocaID_CUPOM_TROCA.AsInteger := fDmCupomFiscal.vID_Troca;
  fDmCupomFiscal.cdsCupom_TrocaITEM_TROCA.AsInteger     := fDmCupomFiscal.vItem_Troca;
  fDmCupomFiscal.cdsCupom_TrocaID_PRODUTO.AsInteger     := ceID_Produto.AsInteger;
  fDmCupomFiscal.cdsCupom_TrocaQTD.AsFloat              := CurrencyEdit1.Value;
  fDmCupomFiscal.cdsCupom_TrocaVLR_UNITARIO.AsFloat     := ceVlr_Unitario.Value;
  fDmCupomFiscal.cdsCupom_TrocaVLR_TOTAL.AsFloat        :=´ceVlr_Total.Value;
  fDmCupomFiscal.cdsCupom_Troca.Post;

  fDmCupomFiscal.cdsCupomFiscalVLR_TROCA.AsFloat := fDmCupomFiscal.cdsCupomFiscalVLR_TROCA.AsFloat + ceVlr_Total.Value;
end;

procedure TfrmCupom_Troca.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir a troca?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;
  fDmCupomFiscal.cdsCupomFiscalVLR_TROCA.AsFloat := StrToFloat(FormatFloat('0.00',fDmCupomFiscal.cdsCupomFiscalVLR_TROCA.AsFloat - fDmCupomFiscal.cdsCupom_TrocaVLR_TOTAL.AsFloat));
  fDmCupomFiscal.cdsCupom_Troca.Delete;
end;

end.

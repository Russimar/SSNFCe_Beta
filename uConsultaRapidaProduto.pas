unit uConsultaRapidaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, ExtCtrls, AdvPanel, Grids, DBGrids, SMDBGrid, RxLookup,
  StdCtrls, DB, uDmCupomFiscal, rsDBUtils;

type
  TfrmConsultaRapidaProduto = class(TForm)
    scrollPrincipal: TScrollBox;
    scrollEsquerda: TScrollBox;
    scrollDiretia: TScrollBox;
    lblProduto: TRxLabel;
    pnlCabecalho: TAdvPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel4: TRxLabel;
    edtDescricao: TEdit;
    edtReferencia: TEdit;
    RxLabel3: TRxLabel;
    edtCodigoBarra: TEdit;
    comboGrupo: TRxDBLookupCombo;
    pnlPrincipal: TAdvPanel;
    pnlDivisao: TAdvPanel;
    gridProduto: TSMDBGrid;
    procedure FormShow(Sender: TObject);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridProdutoDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtReferenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure comboGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure MakeRounded(Control: TWinControl);
  public
    fdmCupomFiscal : TdmCupomFiscal;
    codigoProdutoRetorno : Integer;
    referenciaRetorno : String;
    procedure prc_Consultar;
    { Public declarations }
  end;

var
  frmConsultaRapidaProduto: TfrmConsultaRapidaProduto;

implementation

{$R *.dfm}

{ TfrmConsultaRapidaProduto }

procedure TfrmConsultaRapidaProduto.MakeRounded(Control: TWinControl);
var
  R: TRect;
  Rgn: HRGN;
begin
  with Control do
  begin
    R := ClientRect;
    Rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 20, 20);
    Perform(EM_GETRECT, 0, lParam(@R));
    InflateRect(R, -5, -5);
    Perform(EM_SETRECTNP, 0, lParam(@R));
    SetWindowRgn(Handle, Rgn, True);
    Invalidate;
  end;
end;

procedure TfrmConsultaRapidaProduto.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);
  fdmCupomFiscal.cdsGrupo.Open;
  pnlCabecalho.BorderStyle := bsNone;
  MakeRounded(pnlCabecalho);
  pnlPrincipal.BorderStyle := bsNone;
  MakeRounded(pnlPrincipal);
  if (edtDescricao.Text <> EmptyStr) or (edtCodigoBarra.Text <> EmptyStr) or (edtReferencia.Text <> EmptyStr) then
    prc_Consultar;
end;

procedure TfrmConsultaRapidaProduto.prc_Consultar;
var
  filtro : String;
begin
  filtro := fDmCupomFiscal.ctConsProduto;
  filtro := filtro + ' WHERE 0 = 0 AND P.INATIVO = ' + QuotedStr('N');
  filtro := filtro + ' AND P.TIPO_REG = ' + QuotedStr('P');
  fDmCupomFiscal.cdsConsProduto.Close;
  if edtDescricao.Text <> EmptyStr then
    filtro := filtro + ' AND P.NOME LIKE ' + '''' + edtDescricao.Text + '%''';
  if edtReferencia.Text <> EmptyStr then
    filtro := filtro + ' AND P.REFERENCIA LIKE' + '''' + edtReferencia.Text + '%''';
  if edtCodigoBarra.Text <> EmptyStr then
    filtro := filtro + ' AND P.COD_BARRA = ' + QuotedStr(edtCodigoBarra.Text);
  if comboGrupo.KeyValue > 0 then
    filtro := filtro + ' AND G.CODIGO LIKE' + '''' + fdmCupomFiscal.cdsConsProdutoCODIGO.AsString + '%''';
  fDmCupomFiscal.sdsConsProduto.CommandText := filtro;
  fDmCupomFiscal.cdsConsProduto.Open;
  gridProduto.SetFocus;
end;

procedure TfrmConsultaRapidaProduto.edtDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN : edtReferencia.SetFocus;
    VK_DOWN : prc_Consultar;
  end;
end;

procedure TfrmConsultaRapidaProduto.gridProdutoDblClick(Sender: TObject);
begin
  if fdmCupomFiscal.cdsConsProduto.IsEmpty then
  begin
    ModalResult := mrCancel;
    close;
  end
  else
  begin
    codigoProdutoRetorno := fdmCupomFiscal.cdsConsProdutoID.AsInteger;
    referenciaRetorno := fdmCupomFiscal.cdsConsProdutoREFERENCIA.AsString;
    ModalResult := mrOk;
  end;

end;

procedure TfrmConsultaRapidaProduto.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Close;
    ModalResult := mrCancel;
  end;

  if Key = VK_RETURN then
    gridProdutoDblClick(sender);
end;

procedure TfrmConsultaRapidaProduto.edtReferenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN : edtCodigoBarra.SetFocus;
    VK_DOWN : prc_Consultar;
  end;

end;

procedure TfrmConsultaRapidaProduto.edtCodigoBarraKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN : comboGrupo.SetFocus;
    VK_DOWN : prc_Consultar;
  end;
end;

procedure TfrmConsultaRapidaProduto.comboGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN : prc_Consultar;
    VK_DOWN : prc_Consultar;
  end;

end;

end.


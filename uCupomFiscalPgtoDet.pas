unit uCupomFiscalPgtoDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinBlue, dxSkinMoneyTwins,
  dxSkinOffice2007Blue, dxSkinSeven, dxSkinscxPCPainter, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  AdvPanel, ExtCtrls, Buttons, uDmCupomFiscal, Grids, DBGrids, SMDBGrid,
  StdCtrls, RXCtrls, RxLookup, rsDBUtils;

type
  TfrmCupomFiscalPgtoDet = class(TForm)
    scrollEsquerda: TScrollBox;
    scrollDiretia: TScrollBox;
    scrollPrincipal: TScrollBox;
    lblProduto: TRxLabel;
    pnlCabecalho: TAdvPanel;
    RxLabel1: TRxLabel;
    pnlPrincipal: TAdvPanel;
    gridParcelas: TSMDBGrid;
    pnlDivisao: TAdvPanel;
    comboCondicaoPagto: TRxDBLookupCombo;
    procedure comboCondicaoPagtoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    fdmCupomFiscal : TdmCupomFiscal;
    { Public declarations }
  end;

var
  frmCupomFiscalPgtoDet: TfrmCupomFiscalPgtoDet;

implementation

uses
  uCupomFiscalPgto;


{$R *.dfm}

procedure TfrmCupomFiscalPgtoDet.comboCondicaoPagtoChange(Sender: TObject);
begin
  if comboCondicaoPagto.Value = '' then
    Raise Exception.Create('Forma de pagamento obrigatória!');

  if ((fDmCupomFiscal.cdsCondPgtoTIPO.AsString = 'P') or
     (StrToFloat(FormatFloat('0.00',fDmCupomFiscal.cdsCupomFiscalVLR_RECEBIDO.AsFloat)) <= 0)) and
     (comboCondicaoPagto.Text = '')  then
    Raise Exception.Create('Condição de pagamento obrigatória!');

  fDmCupomFiscal.vCondicaoPgto := comboCondicaoPagto.KeyValue;
  fDmCupomFiscal.prc_Calcular_CondPagto(Sender);

//  fCupomFiscalPgto.prc_Calcular_CondPagto(fdm);
end;

procedure TfrmCupomFiscalPgtoDet.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);

end;

end.

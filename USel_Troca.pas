unit USel_Troca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit, NxCollection,
  Grids, DBGrids, SMDBGrid, FMTBcd, DB, SqlExpr, Provider, DBClient, UDMCupomFiscal;

type
  TfrmSel_Troca = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    btnConsulta: TNxButton;
    SMDBGrid1: TSMDBGrid;
    Label4: TLabel;
    DateEdit1: TDateEdit;
    Label5: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Panel2: TPanel;
    btnCopiar: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }

    procedure prc_Consultar;
        
  public
    { Public declarations }
    fDmCupomFiscal: TDmCupomFiscal;
    
  end;

var
  frmSel_Troca: TfrmSel_Troca;

implementation

uses DmdDatabase, rsDBUtils, uUtilPadrao;

{$R *.dfm}

procedure TfrmSel_Troca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmSel_Troca.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDmCupomFiscal);
  DateEdit1.Date := Date - 15;
end;

procedure TfrmSel_Troca.btnConsultaClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmSel_Troca.prc_Consultar;
begin
  fDMCupomFiscal.cdsTroca.Close;
  DMCupomFiscal.cdsTroca.Close;

  if CurrencyEdit2.AsInteger > 0 then
    DMCupomFiscal.sdsTroca.CommandText := DMCupomFiscal.sdsTroca.CommandText + ' AND C.NUM_CUPOM = ' + IntToStr(CurrencyEdit2.AsInteger)
  else
  begin
    if CurrencyEdit1.AsInteger > 0 then
      DMCupomFiscal.sdsTroca.CommandText := DMCupomFiscal.sdsTroca.CommandText + ' AND I.ID_PRODUTO = ' + IntToStr(CurrencyEdit1.AsInteger);
    if trim(Edit1.Text) <> '' then
      DMCupomFiscal.sdsTroca.CommandText := DMCupomFiscal.sdsTroca.CommandText + ' AND I.REFERENCIA LIKE ' + QuotedStr('%'+Edit1.Text+'%');
    if trim(Edit2.Text) <> '' then
      DMCupomFiscal.sdsTroca.CommandText := DMCupomFiscal.sdsTroca.CommandText + ' AND I.NOME_PRODUTO LIKE ' + QuotedStr('%'+Edit2.Text+'%');
  end;
  DMCupomFiscal.sdsTroca.ParamByName('DATA').AsDate := DateEdit1.Date;
  DMCupomFiscal.cdsTroca.Open;
  DMCupomFiscal.cdsTroca.IndexFieldNames := 'DTEMISSAO;NOME_PRODUTO';
end;

procedure TfrmSel_Troca.SMDBGrid1DblClick(Sender: TObject);
begin
  if not (fDmCupomFiscal.cdsTroca.Active) or (fDmCupomFiscal.cdsTroca.IsEmpty) then
    exit;
  fDmCupomFiscal.vID_Troca    := fDmCupomFiscal.cdsTrocaID.AsInteger;
  fDmCupomFiscal.vItem_Troca  := fDmCupomFiscal.cdsTrocaITEM.AsInteger;
  Close;
end;

end.

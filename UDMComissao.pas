unit UDMComissao;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr;

type
  TDMComissao = class(TDataModule)
    sdsConsTroca: TSQLDataSet;
    dspConsTroca: TDataSetProvider;
    cdsConsTroca: TClientDataSet;
    cdsConsTrocaID: TIntegerField;
    cdsConsTrocaITEM: TIntegerField;
    cdsConsTrocaID_CUPOM: TIntegerField;
    cdsConsTrocaID_CUPOM_TROCA: TIntegerField;
    cdsConsTrocaITEM_TROCA: TIntegerField;
    cdsConsTrocaNUM_CUPOM_TROCA: TIntegerField;
    cdsConsTrocaQTD: TFloatField;
    cdsConsTrocaVLR_UNITARIO: TFloatField;
    cdsConsTrocaVLR_TOTAL: TFloatField;
    cdsConsTrocaNUMCUPOM: TIntegerField;
    cdsConsTrocaDTEMISSAO: TDateField;
    cdsConsTrocaID_PRODUTO: TIntegerField;
    cdsConsTrocaNOME_PRODUTO: TStringField;
    cdsConsTrocaREFERENCIA: TStringField;
    cdsConsTrocaSERIE_TROCA: TStringField;
    cdsConsTrocaSERIE: TStringField;
    dsConsTroca: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMComissao: TDMComissao;

implementation

uses DmdDatabase;

{$R *.dfm}

end.

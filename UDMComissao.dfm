object DMComissao: TDMComissao
  OldCreateOrder = False
  Left = 461
  Top = 241
  Height = 311
  Width = 385
  object sdsComissao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select T.ID, T.ITEM, T.ID_CUPOM, T.ID_CUPOM_TROCA, T.ITEM_TROCA,' +
      ' T.NUM_CUPOM_TROCA, T.QTD, T.VLR_UNITARIO, T.VLR_TOTAL,'#13#10'       ' +
      'C.NUMCUPOM, C.DTEMISSAO, T.ID_PRODUTO, P.NOME NOME_PRODUTO, P.RE' +
      'FERENCIA, t.serie_troca, C.serie'#13#10'from CUPOMFISCAL_TROCA T'#13#10'inne' +
      'r join CUPOMFISCAL C on T.ID_CUPOM = C.ID'#13#10'inner join PRODUTO P ' +
      'on T.ID_PRODUTO = P.ID'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 64
    Top = 8
  end
  object dspConsTroca: TDataSetProvider
    DataSet = sdsComissao
    Left = 104
    Top = 8
  end
  object cdsConsTroca: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsTroca'
    Left = 144
    Top = 8
    object cdsConsTrocaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsTrocaITEM: TIntegerField
      DisplayLabel = 'Item'
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsTrocaID_CUPOM: TIntegerField
      DisplayLabel = 'ID Cupom'
      FieldName = 'ID_CUPOM'
    end
    object cdsConsTrocaID_CUPOM_TROCA: TIntegerField
      DisplayLabel = 'ID Cupom Troca'
      FieldName = 'ID_CUPOM_TROCA'
    end
    object cdsConsTrocaITEM_TROCA: TIntegerField
      DisplayLabel = 'Item Troca'
      FieldName = 'ITEM_TROCA'
    end
    object cdsConsTrocaNUM_CUPOM_TROCA: TIntegerField
      DisplayLabel = 'N'#186' Cupom Troca'
      FieldName = 'NUM_CUPOM_TROCA'
    end
    object cdsConsTrocaQTD: TFloatField
      DisplayLabel = 'Qtde.'
      FieldName = 'QTD'
    end
    object cdsConsTrocaVLR_UNITARIO: TFloatField
      DisplayLabel = 'Vlr. Unit'#225'rio'
      FieldName = 'VLR_UNITARIO'
    end
    object cdsConsTrocaVLR_TOTAL: TFloatField
      DisplayLabel = 'Vlr. Total'
      FieldName = 'VLR_TOTAL'
    end
    object cdsConsTrocaNUMCUPOM: TIntegerField
      DisplayLabel = 'N'#186' Cupom'
      FieldName = 'NUMCUPOM'
    end
    object cdsConsTrocaDTEMISSAO: TDateField
      DisplayLabel = 'Dt. Emiss'#227'o'
      FieldName = 'DTEMISSAO'
    end
    object cdsConsTrocaID_PRODUTO: TIntegerField
      DisplayLabel = 'ID Produto'
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsTrocaNOME_PRODUTO: TStringField
      DisplayLabel = 'Nome Produto'
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsTrocaREFERENCIA: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'REFERENCIA'
    end
    object cdsConsTrocaSERIE_TROCA: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE_TROCA'
      Size = 3
    end
    object cdsConsTrocaSERIE: TStringField
      DisplayLabel = 'S'#233'rie'
      FieldName = 'SERIE'
      Size = 3
    end
  end
  object dsConsTroca: TDataSource
    DataSet = cdsConsTroca
    Left = 184
    Top = 8
  end
end

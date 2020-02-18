object frmCupomTroca: TfrmCupomTroca
  Left = 309
  Top = 77
  Width = 979
  Height = 563
  Caption = 'frmCupomTroca'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 963
    Height = 129
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Produto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 176
      Top = 64
      Width = 64
      Height = 13
      Caption = 'N'#186' Cupom'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 328
      Top = 64
      Width = 34
      Height = 13
      Caption = 'S'#233'rie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 480
      Top = 63
      Width = 34
      Height = 13
      Caption = 'Qtde.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 592
      Top = 63
      Width = 78
      Height = 13
      Caption = 'Vlr. Unit'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 733
      Top = 63
      Width = 59
      Height = 13
      Caption = 'Vlr. Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 24
      Top = 63
      Width = 70
      Height = 13
      Caption = 'ID Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btnConfirmar: TNxButton
      Left = 848
      Top = 42
      Width = 75
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object Edit1: TEdit
      Left = 72
      Top = 6
      Width = 145
      Height = 32
      BevelEdges = []
      BorderStyle = bsNone
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585152
      Font.Height = -25
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnKeyDown = Edit1KeyDown
    end
    object ceNumCupom: TCurrencyEdit
      Left = 165
      Top = 86
      Width = 145
      Height = 31
      TabStop = False
      AutoSize = False
      BorderStyle = bsNone
      Color = 11579568
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585152
      Font.Height = -25
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtSerie: TEdit
      Left = 311
      Top = 85
      Width = 63
      Height = 32
      TabStop = False
      BevelEdges = []
      BorderStyle = bsNone
      Color = 11579568
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585152
      Font.Height = -25
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 376
      Top = 84
      Width = 145
      Height = 31
      AutoSize = False
      BorderStyle = bsNone
      Ctl3D = False
      DecimalPlaces = 3
      DisplayFormat = '0.000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585152
      Font.Height = -25
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      Value = 1.000000000000000000
    end
    object ceVlr_Unitario: TCurrencyEdit
      Left = 522
      Top = 84
      Width = 145
      Height = 31
      AutoSize = False
      BorderStyle = bsNone
      Ctl3D = False
      DecimalPlaces = 4
      DisplayFormat = '0.000#'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585152
      Font.Height = -25
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
    object ceVlr_Total: TCurrencyEdit
      Left = 670
      Top = 84
      Width = 145
      Height = 31
      AutoSize = False
      BorderStyle = bsNone
      Ctl3D = False
      DecimalPlaces = 3
      DisplayFormat = '0.000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585152
      Font.Height = -25
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
    end
    object ceID_Produto: TCurrencyEdit
      Left = 16
      Top = 85
      Width = 145
      Height = 31
      TabStop = False
      AutoSize = False
      BorderStyle = bsNone
      Color = 11579568
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5585152
      Font.Height = -25
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object btnExcluir: TNxButton
      Left = 856
      Top = 82
      Width = 75
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = btnExcluirClick
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 129
    Width = 963
    Height = 396
    Align = alClient
    Ctl3D = False
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Flat = True
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'MS Sans Serif'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 12
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTEMISSAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE_NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_PRODUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_PRODUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_UNITARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_DESCONTO'
        Visible = True
      end>
  end
end

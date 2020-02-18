object frmSel_Troca: TfrmSel_Troca
  Left = 167
  Top = 98
  Width = 979
  Height = 563
  Caption = 'frmSel_Troca'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 963
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 40
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'ID Produto:'
    end
    object Label2: TLabel
      Left = 32
      Top = 59
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Refer'#234'ncia:'
    end
    object Label3: TLabel
      Left = 264
      Top = 59
      Width = 71
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome Produto:'
    end
    object Label4: TLabel
      Left = 278
      Top = 16
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Inicial:'
    end
    object Label5: TLabel
      Left = 35
      Top = 18
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Cupom:'
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 88
      Top = 32
      Width = 81
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 89
      Top = 51
      Width = 166
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 337
      Top = 51
      Width = 352
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object btnConsulta: TNxButton
      Left = 88
      Top = 72
      Width = 121
      Caption = 'Efetuar Pesquisa'
      TabOrder = 3
      OnClick = btnConsultaClick
    end
    object DateEdit1: TDateEdit
      Left = 336
      Top = 9
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 4
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 88
      Top = 10
      Width = 81
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 5
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 97
    Width = 963
    Height = 387
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
    OnDblClick = SMDBGrid1DblClick
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
  object Panel2: TPanel
    Left = 0
    Top = 484
    Width = 963
    Height = 41
    Align = alBottom
    Caption = 'Panel2'
    TabOrder = 2
    object btnCopiar: TNxButton
      Left = 96
      Top = 10
      Width = 121
      Caption = 'Copiar Item Selecionado'
      TabOrder = 0
      OnClick = btnConsultaClick
    end
  end
end

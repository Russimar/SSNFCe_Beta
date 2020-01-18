object fCupomFiscalPgto: TfCupomFiscalPgto
  Left = 31
  Top = 106
  Width = 1311
  Height = 602
  BorderIcons = [biSystemMenu]
  Caption = 'fCupomFiscalPgto - Pagamento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShortCut = FormShortCut
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TAdvPanel
    Left = 0
    Top = 0
    Width = 1295
    Height = 514
    Align = alClient
    BevelInner = bvRaised
    BorderStyle = bsSingle
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -31
    Font.Name = 'Verdana'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 0
    UseDockManager = True
    Version = '2.0.1.0'
    AutoHideChildren = False
    BorderColor = clGray
    BorderShadow = True
    Caption.Color = clHighlight
    Caption.ColorTo = clBlue
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Verdana'
    Caption.Font.Style = []
    Caption.Indent = 2
    CollapsColor = clBtnFace
    CollapsDelay = 0
    ColorTo = clActiveCaption
    HoverColor = clBlack
    HoverFontColor = clBlack
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clGray
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 14938354
    StatusBar.ColorTo = clWhite
    Styler = AdvPanelStyler1
    FullHeight = 0
    object Label15: TLabel
      Left = 734
      Top = 51
      Width = 59
      Height = 25
      Alignment = taRightJustify
      Caption = 'Total:'
      Color = clMenuBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3683329
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 734
      Top = 124
      Width = 99
      Height = 25
      Alignment = taRightJustify
      Caption = 'Recebido:'
      Color = clMenuBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7300393
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 734
      Top = 197
      Width = 64
      Height = 25
      Alignment = taRightJustify
      Caption = 'Troco:'
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3683329
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label8: TLabel
      Left = 988
      Top = 123
      Width = 101
      Height = 25
      Alignment = taRightJustify
      Caption = 'Desconto:'
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3683329
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 988
      Top = 58
      Width = 157
      Height = 25
      Alignment = taRightJustify
      Caption = 'Valor Produtos:'
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3683329
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label17: TLabel
      Left = 837
      Top = 296
      Width = 114
      Height = 23
      Alignment = taRightJustify
      Caption = 'Perc. Juros:'
      Color = 16776176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object Label10: TLabel
      Left = 992
      Top = 233
      Width = 58
      Height = 23
      Alignment = taRightJustify
      Caption = 'NFCe:'
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Visible = False
    end
    object edtTotal: TDBEdit
      Left = 734
      Top = 80
      Width = 183
      Height = 40
      TabStop = False
      Color = 12633514
      DataField = 'VLR_TOTAL'
      DataSource = dmCupomFiscal.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3683329
      Font.Height = -27
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtVlrRecebido: TDBEdit
      Left = 734
      Top = 153
      Width = 183
      Height = 40
      Color = 12633514
      DataField = 'VLR_RECEBIDO'
      DataSource = dmCupomFiscal.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7300393
      Font.Height = -27
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnExit = edtVlrRecebidoExit
    end
    object edtTroco: TDBEdit
      Left = 734
      Top = 226
      Width = 183
      Height = 40
      TabStop = False
      Color = 12633514
      Ctl3D = True
      DataField = 'VLR_TROCO'
      DataSource = dmCupomFiscal.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3683329
      Font.Height = -27
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edtDesconto: TDBEdit
      Left = 988
      Top = 152
      Width = 183
      Height = 40
      Color = 12633514
      DataField = 'VLR_DESCONTO'
      DataSource = dmCupomFiscal.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtValorProdutos: TDBEdit
      Left = 988
      Top = 86
      Width = 183
      Height = 33
      TabStop = False
      Color = 12633514
      Ctl3D = True
      DataField = 'VLR_PRODUTOS'
      DataSource = dmCupomFiscal.dsCupomFiscal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3683329
      Font.Height = -20
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object grCliente: TJvGroupBox
      Left = 13
      Top = 240
      Width = 268
      Height = 105
      Caption = 'Dados Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object JvLabel1: TJvLabel
        Left = 8
        Top = 24
        Width = 55
        Height = 13
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel2: TJvLabel
        Left = 8
        Top = 59
        Width = 32
        Height = 13
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object lblDocumento: TJvLabel
        Left = 16
        Top = 35
        Width = 7
        Height = 20
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object lblCliente: TJvLabel
        Left = 16
        Top = 72
        Width = 7
        Height = 20
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
    end
    object grVendedor: TJvGroupBox
      Left = 288
      Top = 240
      Width = 251
      Height = 105
      Caption = 'Dados Vendedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object lblVendedor: TJvLabel
        Left = 16
        Top = 44
        Width = 7
        Height = 20
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
      object JvLabel3: TJvLabel
        Left = 8
        Top = 30
        Width = 46
        Height = 13
        Caption = 'Vendedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'MS Sans Serif'
        HotTrackFont.Style = []
      end
    end
    object pnlPagamentos: TAdvPanel
      Left = 8
      Top = 1
      Width = 540
      Height = 229
      BevelInner = bvRaised
      BorderStyle = bsSingle
      Color = clWhite
      TabOrder = 7
      UseDockManager = True
      Version = '2.0.1.0'
      AutoHideChildren = False
      BorderColor = clGray
      BorderShadow = True
      Caption.Color = clHighlight
      Caption.ColorTo = clBlue
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clHighlightText
      Caption.Font.Height = -11
      Caption.Font.Name = 'Verdana'
      Caption.Font.Style = []
      Caption.Indent = 2
      CollapsColor = clBtnFace
      CollapsDelay = 0
      ColorTo = clActiveCaption
      HoverColor = clBlack
      HoverFontColor = clBlack
      ShadowColor = clBlack
      ShadowOffset = 0
      StatusBar.BorderColor = clGray
      StatusBar.BorderStyle = bsSingle
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clWindowText
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      StatusBar.Color = 14938354
      StatusBar.ColorTo = clWhite
      Styler = AdvPanelStyler1
      FullHeight = 0
      object Label6: TLabel
        Left = 8
        Top = 66
        Width = 189
        Height = 16
        Caption = 'Pagamentos Selecionados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 7
        Width = 91
        Height = 16
        Caption = 'Pagamentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 136
        Top = 7
        Width = 37
        Height = 16
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 275
        Top = 7
        Width = 179
        Height = 16
        Caption = 'Pagamentos Dispon'#237'veis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
      end
      object gridPagamento: TDBGrid
        Left = 8
        Top = 80
        Width = 265
        Height = 143
        DataSource = dsPagamentosSelecionados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = [fsBold, fsItalic]
        Columns = <
          item
            Expanded = False
            FieldName = 'Nome'
            Title.Alignment = taCenter
            Width = 138
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Title.Alignment = taCenter
            Visible = True
          end>
      end
      object edtPagamento: TAdvEdit
        Left = 8
        Top = 23
        Width = 112
        Height = 33
        EditAlign = eaCenter
        LabelPosition = lpLeftCenter
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        Lookup.Separator = ';'
        Color = clWindow
        Enabled = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
        Visible = True
        OnKeyDown = edtPagamentoKeyDown
        Version = '2.8.6.1'
      end
      object edtValorPagamento: TCurrencyEdit
        Left = 136
        Top = 24
        Width = 112
        Height = 33
        AutoSize = False
        DisplayFormat = ',0.00;-,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 2
        OnKeyDown = edtValorPagamentoKeyDown
      end
      object gridPagamentosDisponiveis: TDBGrid
        Left = 275
        Top = 22
        Width = 257
        Height = 201
        DataSource = dmCupomFiscal.dsTipoCobranca
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsItalic]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = [fsBold, fsItalic]
        OnDblClick = gridPagamentosDisponiveisDblClick
        OnKeyDown = gridPagamentosDisponiveisKeyDown
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Alignment = taCenter
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Alignment = taCenter
            Width = 166
            Visible = True
          end>
      end
    end
    object ceJuros: TCurrencyEdit
      Left = 960
      Top = 287
      Width = 96
      Height = 32
      AutoSize = False
      DisplayFormat = '0.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3683329
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      Visible = False
      OnExit = ceJurosExit
    end
    object cbNFCe: TComboBox
      Left = 1058
      Top = 223
      Width = 145
      Height = 32
      Style = csDropDownList
      DropDownCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3683329
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 24
      ItemIndex = 0
      ParentFont = False
      TabOrder = 9
      Text = 'SIM'
      Visible = False
      OnKeyDown = cbNFCeKeyDown
      Items.Strings = (
        'SIM'
        'N'#195'O')
    end
    object Edit1: TEdit
      Left = 1138
      Top = 274
      Width = 57
      Height = 46
      TabStop = False
      TabOrder = 10
      Visible = False
    end
  end
  object pnlBotton: TAdvPanel
    Left = 0
    Top = 514
    Width = 1295
    Height = 50
    Align = alBottom
    BevelInner = bvRaised
    BorderStyle = bsSingle
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -31
    Font.Name = 'Verdana'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 1
    UseDockManager = True
    Version = '2.0.1.0'
    AutoHideChildren = False
    BorderColor = clGray
    BorderShadow = True
    Caption.Color = clHighlight
    Caption.ColorTo = clBlue
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'Verdana'
    Caption.Font.Style = []
    Caption.Indent = 2
    CollapsColor = clBtnFace
    CollapsDelay = 0
    ColorTo = clActiveCaption
    HoverColor = clBlack
    HoverFontColor = clBlack
    ShadowColor = clBlack
    ShadowOffset = 0
    StatusBar.BorderColor = clGray
    StatusBar.BorderStyle = bsSingle
    StatusBar.Font.Charset = DEFAULT_CHARSET
    StatusBar.Font.Color = clWindowText
    StatusBar.Font.Height = -11
    StatusBar.Font.Name = 'Tahoma'
    StatusBar.Font.Style = []
    StatusBar.Color = 14938354
    StatusBar.ColorTo = clWhite
    Styler = AdvPanelStyler1
    FullHeight = 0
    object btConfirmar: TNxButton
      Left = 126
      Top = 8
      Width = 187
      Height = 30
      Hint = 'Grava e finaliza a venda'
      Caption = '&Confirmar (F10)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      GlyphSpacing = 5
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Transparent = True
      OnClick = btConfirmarClick
    end
    object brCancelar: TNxButton
      Left = 313
      Top = 8
      Width = 187
      Height = 30
      Caption = 'Ca&ncelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 1
      TabStop = False
      Transparent = True
      OnClick = brCancelarClick
    end
    object btGaveta: TNxButton
      Left = 500
      Top = 8
      Width = 187
      Height = 30
      Caption = '&Gaveta (F8)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 2
      TabStop = False
      Transparent = True
      OnClick = btGavetaClick
    end
  end
  object AdvPanelStyler1: TAdvPanelStyler
    Tag = 0
    Settings.AnchorHint = False
    Settings.AutoHideChildren = False
    Settings.BevelInner = bvRaised
    Settings.BevelOuter = bvRaised
    Settings.BevelWidth = 1
    Settings.BorderColor = clGray
    Settings.BorderShadow = True
    Settings.BorderStyle = bsSingle
    Settings.BorderWidth = 0
    Settings.CanMove = False
    Settings.CanSize = False
    Settings.Caption.Color = clHighlight
    Settings.Caption.ColorTo = clBlue
    Settings.Caption.Font.Charset = DEFAULT_CHARSET
    Settings.Caption.Font.Color = clHighlightText
    Settings.Caption.Font.Height = -11
    Settings.Caption.Font.Name = 'Verdana'
    Settings.Caption.Font.Style = []
    Settings.Caption.Indent = 2
    Settings.Collaps = False
    Settings.CollapsColor = clBtnFace
    Settings.CollapsDelay = 0
    Settings.CollapsSteps = 0
    Settings.Color = clWhite
    Settings.ColorTo = clActiveCaption
    Settings.ColorMirror = clNone
    Settings.ColorMirrorTo = clNone
    Settings.Cursor = crDefault
    Settings.Font.Charset = DEFAULT_CHARSET
    Settings.Font.Color = clBlue
    Settings.Font.Height = -31
    Settings.Font.Name = 'Verdana'
    Settings.Font.Style = [fsBold, fsItalic]
    Settings.FixedTop = False
    Settings.FixedLeft = False
    Settings.FixedHeight = False
    Settings.FixedWidth = False
    Settings.Height = 120
    Settings.Hover = False
    Settings.HoverColor = clBlack
    Settings.HoverFontColor = clBlack
    Settings.Indent = 0
    Settings.ShadowColor = clBlack
    Settings.ShadowOffset = 0
    Settings.ShowHint = False
    Settings.ShowMoveCursor = False
    Settings.StatusBar.BorderColor = clGray
    Settings.StatusBar.BorderStyle = bsSingle
    Settings.StatusBar.Font.Charset = DEFAULT_CHARSET
    Settings.StatusBar.Font.Color = clWindowText
    Settings.StatusBar.Font.Height = -11
    Settings.StatusBar.Font.Name = 'Tahoma'
    Settings.StatusBar.Font.Style = []
    Settings.StatusBar.Color = 14938354
    Settings.StatusBar.ColorTo = clWhite
    Settings.TextVAlign = tvaTop
    Settings.TopIndent = 0
    Settings.URLColor = clBlue
    Settings.Width = 0
    Left = 749
    Top = 9
  end
  object mPagamentosSelecionados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 302
    object mPagamentosSelecionadosNome: TStringField
      DisplayWidth = 12
      FieldName = 'Nome'
      Size = 12
    end
    object mPagamentosSelecionadosValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = ',0.00'
    end
    object mPagamentosSelecionadosId: TIntegerField
      FieldName = 'Id'
    end
  end
  object dsPagamentosSelecionados: TDataSource
    DataSet = mPagamentosSelecionados
    Left = 112
    Top = 302
  end
end

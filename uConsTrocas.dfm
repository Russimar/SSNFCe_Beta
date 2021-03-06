object frmConsTrocas: TfrmConsTrocas
  Left = 200
  Top = 146
  Width = 1087
  Height = 524
  Caption = 'Consulta Trocas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 1071
    Height = 485
    Align = alClient
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 1
      Top = 108
      Width = 1069
      Height = 376
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DMConsCupom.dsConsTroca
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsSelection.MultiSelect = True
        object cxGrid1DBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Width = 64
        end
        object cxGrid1DBTableView1ITEM: TcxGridDBColumn
          DataBinding.FieldName = 'ITEM'
          Width = 41
        end
        object cxGrid1DBTableView1DTEMISSAO: TcxGridDBColumn
          DataBinding.FieldName = 'DTEMISSAO'
          Width = 101
        end
        object cxGrid1DBTableView1NUMCUPOM: TcxGridDBColumn
          DataBinding.FieldName = 'NUMCUPOM'
        end
        object cxGrid1DBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'SERIE'
          Width = 46
        end
        object cxGrid1DBTableView1NUM_CUPOM_TROCA: TcxGridDBColumn
          DataBinding.FieldName = 'NUM_CUPOM_TROCA'
          Width = 130
        end
        object cxGrid1DBTableView1Column2: TcxGridDBColumn
          DataBinding.FieldName = 'SERIE_TROCA'
          Width = 62
        end
        object cxGrid1DBTableView1ITEM_TROCA: TcxGridDBColumn
          DataBinding.FieldName = 'ITEM_TROCA'
        end
        object cxGrid1DBTableView1QTD: TcxGridDBColumn
          DataBinding.FieldName = 'QTD'
          Width = 88
        end
        object cxGrid1DBTableView1VLR_UNITARIO: TcxGridDBColumn
          DataBinding.FieldName = 'VLR_UNITARIO'
          Width = 104
        end
        object cxGrid1DBTableView1VLR_TOTAL: TcxGridDBColumn
          DataBinding.FieldName = 'VLR_TOTAL'
          Width = 104
        end
        object cxGrid1DBTableView1ID_PRODUTO: TcxGridDBColumn
          DataBinding.FieldName = 'ID_PRODUTO'
        end
        object cxGrid1DBTableView1NOME_PRODUTO: TcxGridDBColumn
          DataBinding.FieldName = 'NOME_PRODUTO'
          Width = 350
        end
        object cxGrid1DBTableView1REFERENCIA: TcxGridDBColumn
          DataBinding.FieldName = 'REFERENCIA'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object AdvPanel1: TAdvPanel
      Left = 1
      Top = 1
      Width = 1069
      Height = 107
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      UseDockManager = True
      Version = '2.0.1.0'
      AutoHideChildren = False
      BorderColor = clGray
      BorderShadow = True
      Caption.Color = clWhite
      Caption.ColorTo = clNone
      Caption.Font.Charset = DEFAULT_CHARSET
      Caption.Font.Color = clBlack
      Caption.Font.Height = -11
      Caption.Font.Name = 'Tahoma'
      Caption.Font.Style = []
      Caption.Indent = 4
      Caption.ShadeLight = 255
      Caption.ShadeType = stRMetal
      Caption.Visible = True
      CollapsColor = clBtnFace
      CollapsDelay = 0
      ColorTo = 15000804
      HoverColor = clBlack
      HoverFontColor = clBlack
      ShadowColor = clBlack
      ShadowOffset = 0
      StatusBar.BorderColor = clWhite
      StatusBar.BorderStyle = bsSingle
      StatusBar.Font.Charset = DEFAULT_CHARSET
      StatusBar.Font.Color = clBlack
      StatusBar.Font.Height = -11
      StatusBar.Font.Name = 'Tahoma'
      StatusBar.Font.Style = []
      StatusBar.Color = 14606046
      StatusBar.ColorTo = 11119017
      Styler = dmCupomFiscal.AdvPanelStyler1
      URLColor = clTeal
      FullHeight = 0
      object Label1: TLabel
        Left = 42
        Top = 50
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dt.Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 192
        Top = 50
        Width = 26
        Height = 13
        Caption = 'Final:'
      end
      object Label20: TLabel
        Left = 43
        Top = 28
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'Terminal:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 323
        Top = 28
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'S'#233'rie:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 15
        Top = 88
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome Produto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 32
        Top = 70
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'ID Produto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dtInicial: TDateEdit
        Left = 89
        Top = 42
        Width = 90
        Height = 21
        Ctl3D = False
        NumGlyphs = 2
        ParentCtl3D = False
        TabOrder = 0
      end
      object dtFinal: TDateEdit
        Left = 220
        Top = 42
        Width = 90
        Height = 21
        Ctl3D = False
        NumGlyphs = 2
        ParentCtl3D = False
        TabOrder = 1
      end
      object btnConsultar: TNxButton
        Left = 317
        Top = 69
        Width = 145
        Height = 30
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        Glyph.Data = {
          AE060000424DAE06000000000000360000002800000017000000170000000100
          1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF7F2F0F5F2F0FCFDFDFFFFFF00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6B778D2D52869876
          72B0A3A1FCFDFE000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7780
          0055B812A5FA5E90BDBBA29FFAF5F4000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF5C6377004EAD29BEFFA9ECFFA3F7FF3A89BFF6F5F6000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF75737F0051AC17B1FFA4E7FDD5FFFF12A6E45E90B5FFFCFC00
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFD6C6C7D0057BB25BAFFA5E7FEC7FFFF099DDF6A8A
          A8FFFFFDFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF54657D0057B120B5FFA1E5FECFFFFF
          109CDD4D7EA5FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFCFEFEDADDDDDAD9D9CFCFCFEDEFEFFFFFFFFFFFFFFFFFFF00024A21BCFFA5
          EAFFCAFFFF11A7E86587A9FFFFFCFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFFDDE0E0958E8D7A63657D60628467678065658D77799C9393D3D1D1ADAA
          A749343776B3E0B4FFFF19A4DF5A84A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFD2D8D84C3334846269967570A39388A99E9AAB9E99AE9890
          B69DA4A28E8F867070E7D0CC806B6E005499467EA7FFFFFAFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFC2C2C2533638A27B799D80649A9A7C94988895
          97979498949198849E9478C4AFA8C8B5B7AFA1A1B6B3B1FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FBFBFB816D6E8A66679C6F4A987D
          5A978F7499978499998D99998C989783948769987854C9B1A9C1B4B6DED8D8FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000E0DCDB74575C
          98634797653998765499876899927799977F99967F99907799826295704B9B64
          3AD4CFD8A39C9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000887F83865B54984D1A945C319969439A77559A7F5F998365998364997F5F
          99735095673F81400DC9A391B2ACB0ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000BDAFB38C57459140079352258D562D875732885D3A8D
          6744946E4B92694587532D91572CBB753CCA906BADAAB0CECDCDFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6B7BB8F56428528008B3D08A766
          34CA9765D0A272BC8D5F9E6940A06B3ECB9867EFB984FFCB8ACD8A5FBBB8C0DD
          DBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000B8AEB1906152
          AD5529ECB177FFD29AFED7A5FCDEAEFEE7B6FFEABBFFE8B8FDDCABF7D09CFCCB
          90CF9675AEAAB2CBCBCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          00009B96988F6B68EAA769FFD19BF4CD9BF4D8AAF4E0B4F4E4BBF4E5BDF4E4BB
          F4DDB1F6DBABF8C98AC6A399A8A6A9F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000D2D0D07E6B73B47F67FED295F6DBADF4E4BAF5E5C2F5
          E7C8F5E9CAF4E7C8F5E8C3F9E9B9D29E73DDDEE8A6A2A1FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FCFEFE9B8F91B6A0A5CD9972FDE8
          B2F6EDC7F5E9CCF4EDD4F5EED9F5EED6F9EFCDE4C299F3E4DD867F80D7D8D8FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFD4D6D6
          574849C3AEB2CDA88FF0D9B4F6ECD0F6F3E3F6F1E5F4E8D3E2C2ABE1D0CF9E95
          96C6C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFD3D5D59F969797888CC0A6A1D1B6ACD5BEB2D7C0B7D5BDB8
          C1B4B8ADA7AAC0BFBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFCFDFDD2D0D0A3A0A2CEC5C7E1
          D7D8DCD3D4A09C9EE7E5E5F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 2
        Transparent = True
        OnClick = btnConsultarClick
      end
      object ComboTerminal: TRxDBLookupCombo
        Left = 89
        Top = 20
        Width = 221
        Height = 21
        DropDownCount = 8
        Ctl3D = False
        DisplayEmpty = '[Todos]'
        LookupField = 'ID'
        LookupDisplay = 'NOME'
        LookupSource = dmCupomFiscal.dsTerminal
        ParentCtl3D = False
        TabOrder = 3
      end
      object edtSerie: TEdit
        Left = 353
        Top = 20
        Width = 89
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
      end
      object edtNome_Produto: TEdit
        Left = 89
        Top = 80
        Width = 224
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
      end
      object ceID_Produto: TCurrencyEdit
        Left = 88
        Top = 62
        Width = 121
        Height = 19
        AutoSize = False
        Ctl3D = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ParentCtl3D = False
        TabOrder = 6
      end
    end
  end
  object cxGridViewRepository1: TcxGridViewRepository
    Left = 616
    Top = 327
  end
  object cxLookAndFeelController1: TcxLookAndFeelController
    SkinName = 'Office2007Blue'
    Left = 857
    Top = 312
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 888
    Top = 312
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsItalic]
    end
  end
end

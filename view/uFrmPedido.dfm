object frmPedido: TfrmPedido
  Left = 0
  Top = 0
  ActiveControl = pgPedido
  Caption = '.: Pedido :.'
  ClientHeight = 387
  ClientWidth = 738
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgPedido: TPageControl
    Left = 0
    Top = 0
    Width = 738
    Height = 387
    ActivePage = tbPedido
    Align = alClient
    TabOrder = 0
    object tbPesquisa: TTabSheet
      Caption = 'tbPesquisa'
      object Panel2: TPanel
        Left = 0
        Top = 318
        Width = 730
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = clScrollBar
        ParentBackground = False
        TabOrder = 0
        object btnNovo: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnAlterar: TButton
          Left = 89
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 1
          OnClick = btnAlterarClick
        end
        object btnExcluir: TButton
          Left = 170
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 730
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        Color = clScrollBar
        ParentBackground = False
        TabOrder = 1
        object btnPesquisar: TButton
          Left = 647
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 0
        end
        object edtPesquisa: TLabeledEdit
          Left = 8
          Top = 20
          Width = 631
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = 'Pesquisa'
          TabOrder = 1
        end
      end
      object strgridPedidos: TStringGrid
        Left = 0
        Top = 49
        Width = 730
        Height = 269
        Align = alClient
        ColCount = 3
        DefaultColWidth = 100
        DefaultRowHeight = 21
        DrawingStyle = gdsGradient
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        TabOrder = 2
      end
    end
    object tbPedido: TTabSheet
      Caption = 'tbPedido'
      ImageIndex = 1
      object pnlDigitacaoItem: TPanel
        Left = 0
        Top = 51
        Width = 730
        Height = 51
        Align = alTop
        BevelOuter = bvNone
        Color = cl3DLight
        ParentBackground = False
        TabOrder = 1
        object lblQuantidade: TLabel
          Left = 324
          Top = 6
          Width = 56
          Height = 13
          Caption = 'Quantidade'
        end
        object lblValorUnitario: TLabel
          Left = 414
          Top = 6
          Width = 64
          Height = 13
          Caption = 'Valor Unit'#225'rio'
        end
        object lblItem: TLabel
          Left = 8
          Top = 6
          Width = 22
          Height = 13
          Caption = 'Item'
        end
        object lblValorTotalItem: TLabel
          Left = 519
          Top = 6
          Width = 51
          Height = 13
          Caption = 'Valor Total'
        end
        object btnIncluirAlterar: TButton
          Left = 655
          Top = 20
          Width = 65
          Height = 25
          Caption = 'I&ncluir'
          TabOrder = 4
          OnClick = btnIncluirAlterarClick
        end
        object edtQuantidade: TEdit
          Left = 290
          Top = 22
          Width = 90
          Height = 21
          Alignment = taRightJustify
          MaxLength = 14
          TabOrder = 1
          Text = '0,00'
          OnChange = edtQuantidadeChange
          OnExit = edtQuantidadeExit
        end
        object edtValorUnitario: TEdit
          Left = 388
          Top = 22
          Width = 90
          Height = 21
          Alignment = taRightJustify
          MaxLength = 14
          TabOrder = 2
          Text = '0,00'
          OnChange = edtValorUnitarioChange
          OnExit = edtValorUnitarioExit
        end
        object cbxItem: TComboBox
          Left = 8
          Top = 22
          Width = 274
          Height = 21
          TabOrder = 0
          Text = 'cbxItem'
        end
        object edtValorTotalItem: TEdit
          Left = 486
          Top = 22
          Width = 90
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          TabOrder = 3
          Text = '0,00'
        end
        object btnCancelarItem: TButton
          Left = 584
          Top = 20
          Width = 65
          Height = 25
          Caption = 'C&ancelar'
          TabOrder = 5
          OnClick = btnCancelarItemClick
        end
      end
      object pnlCabecalho: TPanel
        Left = 0
        Top = 0
        Width = 730
        Height = 51
        Align = alTop
        BevelOuter = bvNone
        Color = clScrollBar
        ParentBackground = False
        TabOrder = 0
        object lblData: TLabel
          Left = 86
          Top = 6
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object edtNumero: TLabeledEdit
          Left = 10
          Top = 22
          Width = 70
          Height = 21
          EditLabel.Width = 37
          EditLabel.Height = 13
          EditLabel.Caption = 'N'#250'mero'
          MaxLength = 9
          TabOrder = 0
          OnKeyPress = edtNumeroKeyPress
        end
        object dtpData: TDateTimePicker
          Left = 86
          Top = 22
          Width = 100
          Height = 21
          Date = 43963.000000000000000000
          Time = 0.375276527774985900
          TabOrder = 1
        end
        object edtCliente: TLabeledEdit
          Left = 194
          Top = 22
          Width = 528
          Height = 21
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'Cliente'
          MaxLength = 100
          TabOrder = 2
        end
      end
      object pnlRodape: TPanel
        Left = 0
        Top = 318
        Width = 730
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = clScrollBar
        ParentBackground = False
        TabOrder = 3
        object lblValorTotalPedido: TLabel
          Left = 559
          Top = 14
          Width = 36
          Height = 13
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnCancelar: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Cancelar'
          TabOrder = 0
          OnClick = btnCancelarClick
        end
        object btnGravar: TButton
          Left = 89
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Gravar'
          TabOrder = 1
          OnClick = btnGravarClick
        end
        object edtValorTotalPedido: TEdit
          Left = 601
          Top = 10
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Text = '0,00'
        end
      end
      object strgridItens: TStringGrid
        Left = 0
        Top = 102
        Width = 730
        Height = 216
        Align = alClient
        BevelOuter = bvNone
        ColCount = 7
        DefaultColWidth = 100
        DefaultRowHeight = 21
        DrawingStyle = gdsGradient
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        TabOrder = 2
        OnDrawCell = strgridItensDrawCell
        OnSelectCell = strgridItensSelectCell
      end
    end
  end
  object imgList: TImageList
    Left = 580
    Top = 264
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FFBBBBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF002B2B2B000101
      0100000000000101010000000000010101000000000002020200000000003333
      3300FFFFFF00FFFFFF00FFFFFF00FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FFBBBBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFA00FFFFFF00000000000404
      0400030303000303030000000000000000000505050000000000020202000000
      0000FFFFFF00FFFFFF00F9F9F900FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FFBBBBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00F9F9F900020202000202
      0200DADADA00E5E5E5000000000007070700E8E8E800E5E5E500000000000404
      0400F6F6F600FFFFFF00FFFFFF00F6F6F6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FFBBBBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FDFDFD00010101000000
      0000FFFFFF00FAFAFA001E1E1E0000000000F9F9F900FBFBFB00232323000000
      0000FFFFFF00FEFEFE00FDFDFD00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BBBBBBFF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FFBBBBBBFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F700FFFFFF00010101000000
      0000FEFEFE00FFFFFF002222220004040400FEFEFE00FFFFFF001F1F1F000000
      0000FFFFFF00FFFFFF00FAFAFA00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFBBBBBBFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFBBBBBBFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00000000000404
      0400FAFAFA00FCFCFC001A1A1A0000000000FCFCFC00FEFEFE001B1B1B000000
      0000FBFBFB00FFFFFF00FCFCFC00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFBBBBBBFF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FFBBBBBBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FBFBFB00000000000000
      0000FFFFFF00FFFFFF001C1C1C0002020200FEFEFE00FFFFFF00151515000505
      0500FDFDFD00FFFFFF00FFFFFF00FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFBBBB
      BBFF000000FF000000FF000000FF000000FF000000FF000000FF000000FFBBBB
      BBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD00FFFFFF00000000000101
      0100FCFCFC00FBFBFB001F1F1F0000000000FCFCFC00FFFFFF001F1F1F000000
      0000FDFDFD00FDFDFD00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFBBBBBBFF000000FF000000FF000000FF000000FF000000FF000000FFBBBB
      BBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE00FFFFFF00000000000000
      0000FFFFFF00FFFFFF001515150002020200FAFAFA00FFFFFF00171717000303
      0300FDFDFD00FFFFFF00FFFFFF00FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFBBBBBBFF000000FF000000FF000000FF000000FFBBBBBBFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00F8F8F800040404000202
      0200F3F3F300FFFFFF001F1F1F0002020200FDFDFD00FFFFFF00212121000000
      0000FAFAFA00FFFFFF00F8F8F800FDFDFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFBBBBBBFF000000FF000000FFBBBBBBFFFFFFFFFFFFFF
      FFFFFFFFFFFFBBBBBBFFBBBBBBFFFFFFFFFFFEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFEFE00FEFEFE00FEFEFE00FFFFFF00F7F7F700FFFFFF00FFFF
      FF00FAFAFA00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBFFBBBBBBFFFFFFFFFFFFFFFFFFFFFF
      FFFFBBBBBBFF000000FF000000FFBBBBBBFFFFFFFF00FCFCFC00FCFCFC00FBFB
      FB00F8F8F800FFFFFF00FFFFFF00FEFEFE00FFFFFF00FEFEFE00FFFFFF00FBFB
      FB00FFFFFF00FEFEFE00FCFCFC00FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBB
      BBFF000000FF000000FF000000FFBBBBBBFF4B4B4B0006060600000000000707
      0700030303000000000007070700000000000000000002020200000000000303
      03000000000051515100FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBFF0000
      00FF000000FF000000FFBBBBBBFFFFFFFFFFDBDBDB0054545400000000000000
      0000040404000101010001010100000000000404040000000000000000000202
      020057575700D8D8D800FFFFFF00FAFAFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBFF0000
      00FF000000FFBBBBBBFFFFFFFFFFFFFFFFFFFCFCFC00FFFFFF00FFFFFF00FBFB
      FB004C4C4C000909090000000000060606000000000059595900FFFFFF00FDFD
      FD00F3F3F300FFFFFF00F7F7F700FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBB
      BBFFBBBBBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FCFCFC00FFFF
      FF00D8D8D8004E4E4E00030303000000000050505000D8D8D800FBFBFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FCFCFC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end

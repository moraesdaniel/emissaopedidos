object frmPedido: TfrmPedido
  Left = 0
  Top = 0
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
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
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
        end
        object btnAlterar: TButton
          Left = 89
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 1
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
      object DBGrid1: TDBGrid
        Left = 0
        Top = 49
        Width = 730
        Height = 269
        Align = alClient
        DrawingStyle = gdsGradient
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tbPedido: TTabSheet
      Caption = 'tbPedido'
      ImageIndex = 1
      ExplicitLeft = 8
      ExplicitTop = 28
      object pnlDigitacaoItem: TPanel
        Left = 0
        Top = 51
        Width = 730
        Height = 51
        Align = alTop
        BevelOuter = bvNone
        Color = cl3DLight
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 449
          Top = 8
          Width = 56
          Height = 13
          Caption = 'Quantidade'
        end
        object Label3: TLabel
          Left = 561
          Top = 8
          Width = 64
          Height = 13
          Caption = 'Valor Unit'#225'rio'
        end
        object edtItem: TLabeledEdit
          Left = 8
          Top = 22
          Width = 70
          Height = 21
          EditLabel.Width = 22
          EditLabel.Height = 13
          EditLabel.Caption = 'Item'
          TabOrder = 0
        end
        object btnIncluir: TButton
          Left = 647
          Top = 20
          Width = 75
          Height = 25
          Caption = 'I&ncluir'
          TabOrder = 3
        end
        object edtQuantidade: TEdit
          Left = 433
          Top = 22
          Width = 90
          Height = 21
          Alignment = taRightJustify
          MaxLength = 14
          TabOrder = 1
          Text = '0,00'
          OnChange = edtQuantidadeChange
        end
        object edtValorUnitario: TEdit
          Left = 545
          Top = 19
          Width = 90
          Height = 21
          Alignment = taRightJustify
          MaxLength = 14
          TabOrder = 2
          Text = '0,00'
          OnChange = edtValorUnitarioChange
        end
        object ComboBox1: TComboBox
          Left = 89
          Top = 22
          Width = 248
          Height = 21
          TabOrder = 4
          Text = 'ComboBox1'
          Items.Strings = (
            'Daniel Moraes'
            'Isabela Tais Rufatto')
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
        TabOrder = 1
        object Label2: TLabel
          Left = 86
          Top = 6
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object edtNumero: TLabeledEdit
          Left = 8
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
        object btnIniciar: TButton
          Left = 647
          Top = 20
          Width = 75
          Height = 25
          Caption = '&Iniciar'
          TabOrder = 3
        end
        object edtCliente: TLabeledEdit
          Left = 194
          Top = 22
          Width = 445
          Height = 21
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'Cliente'
          MaxLength = 200
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
        TabOrder = 2
        ExplicitTop = 308
        object btnCancelar: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Cancelar'
          TabOrder = 0
        end
        object btnGravar: TButton
          Left = 89
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Gravar'
          TabOrder = 1
        end
        object Edit1: TEdit
          Left = 601
          Top = 10
          Width = 121
          Height = 21
          Alignment = taRightJustify
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
    end
  end
end

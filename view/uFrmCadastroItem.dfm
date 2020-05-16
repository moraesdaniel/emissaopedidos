object frmCadastroItem: TfrmCadastroItem
  Left = 0
  Top = 0
  Caption = '.: Cadastro de Produtos :.'
  ClientHeight = 364
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgCadastroProduto: TPageControl
    Left = 0
    Top = 0
    Width = 404
    Height = 364
    ActivePage = tbPesquisa
    Align = alClient
    TabOrder = 0
    object tbPesquisa: TTabSheet
      Caption = 'tbPesquisa'
      object pnlPesquisa: TPanel
        Left = 0
        Top = 0
        Width = 396
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        Color = clScrollBar
        ParentBackground = False
        TabOrder = 0
        object edtPesquisa: TLabeledEdit
          Left = 8
          Top = 20
          Width = 299
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = 'Pesquisa'
          TabOrder = 0
        end
        object btnPesquisar: TButton
          Left = 313
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
      end
      object pnlBotoesPesquisa: TPanel
        Left = 0
        Top = 296
        Width = 396
        Height = 40
        Align = alBottom
        BevelOuter = bvNone
        Color = clScrollBar
        ParentBackground = False
        TabOrder = 1
        object btnAlterar: TButton
          Left = 89
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 0
          OnClick = btnAlterarClick
        end
        object btnNovo: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 1
          OnClick = btnNovoClick
        end
        object btnExcluir: TButton
          Left = 170
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btnExcluirClick
        end
      end
      object dbgPesquisa: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 52
        Width = 390
        Height = 241
        Align = alClient
        DataSource = dsPesquisa
        DrawingStyle = gdsGradient
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Color = clWhite
            Expanded = False
            FieldName = 'ID_ITEM'
            Title.Caption = 'C'#243'digo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_ITEM'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
    object tbManutencao: TTabSheet
      Caption = 'tbManutencao'
      ImageIndex = 1
      object pnlBotoesManutencao: TPanel
        Left = 0
        Top = 296
        Width = 396
        Height = 40
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object btnVoltar: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = '<<'
          TabOrder = 0
          OnClick = btnVoltarClick
        end
        object btnGravar: TButton
          Left = 89
          Top = 7
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 1
          OnClick = btnGravarClick
        end
      end
      object edtCodigo: TLabeledEdit
        Left = 11
        Top = 24
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        Enabled = False
        TabOrder = 1
      end
      object edtDescricao: TLabeledEdit
        Left = 11
        Top = 72
        Width = 358
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 100
        TabOrder = 2
      end
    end
  end
  object dsPesquisa: TDataSource
    DataSet = DmItem.cdsPesquisar
    Left = 264
    Top = 136
  end
end

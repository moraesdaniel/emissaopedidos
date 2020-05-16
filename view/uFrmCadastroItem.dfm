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
        TabOrder = 2
        object btnAlterar: TButton
          Left = 89
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 1
          OnClick = btnAlterarClick
        end
        object btnNovo: TButton
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
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
        object btnImprimir: TButton
          Left = 251
          Top = 8
          Width = 75
          Height = 25
          Caption = '&Imprimir'
          TabOrder = 3
          OnClick = btnImprimirClick
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
        TabOrder = 1
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
  object relItens: TfrxDBDataset
    UserName = 'relItens'
    CloseDataSource = False
    DataSet = DmItem.SQLPesquisar
    BCDToCurrency = False
    Left = 156
    Top = 192
  end
  object frxReportItens: TfrxReport
    Version = '6.6.17'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43967.598717268500000000
    ReportOptions.LastChange = 43967.613708668990000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 156
    Top = 144
    Datasets = <
      item
        DataSet = relItens
        DataSetName = 'relItens'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 64.252010000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 224.881889763780000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DE ITENS CADASTRADOS')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 721.889763780000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 41.574803149606300000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 102.047310000000000000
          Top = 41.574803149606300000
          Width = 377.952755910000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897637795275590000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = -3.779530000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[TIME]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 143.622140000000000000
        Width = 718.110700000000000000
        DataSet = relItens
        DataSetName = 'relItens'
        RowCount = 0
        object relItensID_ITEM: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          DataField = 'ID_ITEM'
          DataSet = relItens
          DataSetName = 'relItens'
          Frame.Typ = []
          Memo.UTF8W = (
            '[relItens."ID_ITEM"]')
        end
        object relItensDESC_ITEM: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 102.047244090000000000
          Width = 377.952755910000000000
          Height = 18.897650000000000000
          DataField = 'DESC_ITEM'
          DataSet = relItens
          DataSetName = 'relItens'
          Frame.Typ = []
          Memo.UTF8W = (
            '[relItens."DESC_ITEM"]')
        end
      end
    end
  end
end

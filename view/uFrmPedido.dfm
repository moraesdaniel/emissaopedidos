object frmPedido: TfrmPedido
  Left = 0
  Top = 0
  Caption = '.: Pedido :.'
  ClientHeight = 366
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 738
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Color = clScrollBar
    ParentBackground = False
    TabOrder = 0
    object btnPesquisar: TButton
      Left = 313
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 0
    end
    object edtPesquisa: TLabeledEdit
      Left = 8
      Top = 20
      Width = 299
      Height = 21
      EditLabel.Width = 42
      EditLabel.Height = 13
      EditLabel.Caption = 'Pesquisa'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 325
    Width = 738
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = clScrollBar
    ParentBackground = False
    TabOrder = 1
  end
end

object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = '.: Emiss'#227'o Pedidos :.'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 304
    Top = 96
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Item1: TMenuItem
        Caption = 'Item'
        OnClick = Item1Click
      end
    end
    object Venda1: TMenuItem
      Caption = 'Venda'
      object Pedido1: TMenuItem
        Caption = 'Pedido'
        OnClick = Pedido1Click
      end
    end
  end
end

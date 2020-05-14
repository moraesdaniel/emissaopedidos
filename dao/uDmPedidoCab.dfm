object DmPedidoCab: TDmPedidoCab
  OldCreateOrder = False
  Height = 207
  Width = 416
  object SQLInserir: TSQLDataSet
    CommandText = 
      'INSERT INTO PEDIDOCAB '#13#10#9'(ID_PED, DTEMISSAO, NUMERO, CLIENTE) '#13#10 +
      'VALUES '#13#10#9'(:ID_PED, :DTEMISSAO, :NUMERO, :CLIENTE)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_PED'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DTEMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 24
    Top = 8
  end
  object SQLAtualizar: TSQLDataSet
    CommandText = 
      'UPDATE'#13#10#9'PEDIDOCAB'#13#10'SET'#13#10#9'DTEMISSAO = :DTEMISSAO,'#13#10#9'NUMERO = :NU' +
      'MERO,'#13#10#9'CLIENTE = :CLIENTE'#13#10'WHERE'#13#10#9'ID_PED = :ID_PED'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DTEMISSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMERO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_PED'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 96
    Top = 8
  end
  object SQLExcluir: TSQLDataSet
    CommandText = 'DELETE FROM PEDIDOCAB WHERE ID_PED = :ID_PED'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PED'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 168
    Top = 8
  end
end

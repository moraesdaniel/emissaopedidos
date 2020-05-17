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
  object SQLBuscar: TSQLDataSet
    CommandText = 
      'SELECT '#13#10#9'ID_PED,'#13#10#9'NUMERO,'#13#10#9'CLIENTE'#13#10'FROM '#13#10#9'PEDIDOCAB'#13#10'WHERE ' +
      #13#10#9'CLIENTE LIKE (:CLIENTE)'#13#10'ORDER BY'#13#10#9'CLIENTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CLIENTE'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 224
    Top = 8
  end
  object SQLRelatorio: TSQLDataSet
    CommandText = 
      'SELECT'#13#10#9'PED.ID_PED,'#13#10#9'PED.NUMERO,'#13#10#9'PED.DTEMISSAO,'#13#10#9'PED.CLIENT' +
      'E,'#13#10#9'PEDITEM.ID_ITEMSEQ,'#13#10#9'PEDITEM.ID_ITEM,'#13#10#9'ITE.DESC_ITEM,'#13#10#9'P' +
      'EDITEM.QUANTIDADE,'#13#10#9'PEDITEM.VALORUNIT,'#13#10#9'PEDITEM.QUANTIDADE * P' +
      'EDITEM.VALORUNIT AS VALOTOTAL'#13#10'FROM'#13#10#9'PEDIDOCAB PED'#13#10#9'LEFT JOIN ' +
      'PEDIDOITEM PEDITEM ON'#13#10#9#9'PEDITEM.ID_PED = PED.ID_PED'#13#10#9'LEFT JOIN' +
      ' ITEM ITE ON'#13#10#9#9'ITE.ID_ITEM = PEDITEM.ID_ITEM'#13#10'WHERE'#13#10#9'PED.ID_PE' +
      'D = :ID_PED'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PED'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 72
    Top = 80
  end
  object dspRelatorio: TDataSetProvider
    DataSet = SQLRelatorio
    Left = 144
    Top = 88
  end
  object cdsRelatorio: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PED'
        ParamType = ptInput
      end>
    ProviderName = 'dspRelatorio'
    Left = 200
    Top = 104
  end
end

object DmPedidoItem: TDmPedidoItem
  OldCreateOrder = False
  Height = 150
  Width = 325
  object SQLInserir: TSQLDataSet
    CommandText = 
      'INSERT INTO PEDIDOCAB '#13#10#9'(ID_PED, ID_ITEM, ID_ITEMSEQ, QUANTIDAD' +
      'E, VALORUNIT) '#13#10'VALUES '#13#10#9'(:ID_PED, :ID_ITEM, :ID_ITEMSEQ, :QUAN' +
      'TIDADE, :VALORUNIT)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PED'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_ITEMSEQ'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VALORUNIT'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 24
    Top = 16
  end
  object SQLExcluirTodos: TSQLDataSet
    CommandText = 'DELETE FROM PEDIDOITEM WHERE ID_PED = :ID_PED'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PED'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 104
    Top = 16
  end
end

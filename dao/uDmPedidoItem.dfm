object DmPedidoItem: TDmPedidoItem
  OldCreateOrder = False
  Height = 150
  Width = 325
  object SQLInserir: TSQLDataSet
    CommandText = 
      'INSERT INTO PEDIDOITEM '#13#10#9'(ID_PED, ID_ITEM, ID_ITEMSEQ, QUANTIDA' +
      'DE, VALORUNIT) '#13#10'VALUES '#13#10#9'(:ID_PED, :ID_ITEM, :ID_ITEMSEQ, :QUA' +
      'NTIDADE, :VALORUNIT)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_PED'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_ITEMSEQ'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'QUANTIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
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

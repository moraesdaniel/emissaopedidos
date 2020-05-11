object DmItem: TDmItem
  OldCreateOrder = False
  Height = 231
  Width = 364
  object SQLPesquisar: TSQLDataSet
    CommandText = 
      'SELECT ID_ITEM, DESC_ITEM FROM ITEM'#13#10'WHERE DESC_ITEM LIKE (:NOME' +
      ')'#13#10'ORDER BY DESC_ITEM'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 24
    Top = 16
  end
  object SQLInserir: TSQLDataSet
    CommandText = 'INSERT INTO ITEM (DESC_ITEM) VALUES (:DESC_ITEM)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'DESC_ITEM'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 112
    Top = 16
  end
  object SQLAtualizar: TSQLDataSet
    CommandText = 'UPDATE ITEM SET DESC_ITEM = :DESC_ITEM WHERE ID_ITEM = :ID_ITEM'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'DESC_ITEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_ITEM'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 200
    Top = 16
  end
  object dspPesquisar: TDataSetProvider
    DataSet = SQLPesquisar
    Left = 24
    Top = 64
  end
  object cdsPesquisar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end>
    ProviderName = 'dspPesquisar'
    Left = 24
    Top = 112
    object cdsPesquisarID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Required = True
    end
    object cdsPesquisarDESC_ITEM: TStringField
      FieldName = 'DESC_ITEM'
      Required = True
      Size = 100
    end
  end
  object SQLExcluir: TSQLDataSet
    CommandText = 'DELETE FROM ITEM WHERE ID_ITEM = :ID_ITEM'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_ITEM'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.SQLConexao
    Left = 280
    Top = 16
  end
end

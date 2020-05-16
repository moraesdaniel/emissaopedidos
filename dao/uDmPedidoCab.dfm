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
    object SQLRelatorioID_PED: TIntegerField
      FieldName = 'ID_PED'
      Required = True
    end
    object SQLRelatorioNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object SQLRelatorioDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      Required = True
    end
    object SQLRelatorioCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Required = True
      Size = 100
    end
    object SQLRelatorioID_ITEMSEQ: TIntegerField
      FieldName = 'ID_ITEMSEQ'
    end
    object SQLRelatorioID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
    end
    object SQLRelatorioDESC_ITEM: TStringField
      FieldName = 'DESC_ITEM'
      Size = 100
    end
    object SQLRelatorioQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object SQLRelatorioVALORUNIT: TFMTBCDField
      FieldName = 'VALORUNIT'
      Precision = 18
      Size = 2
    end
    object SQLRelatorioVALOTOTAL: TFMTBCDField
      FieldName = 'VALOTOTAL'
      Precision = 18
      Size = 4
    end
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
    object cdsRelatorioID_PED: TIntegerField
      FieldName = 'ID_PED'
      Required = True
    end
    object cdsRelatorioNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object cdsRelatorioDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      Required = True
    end
    object cdsRelatorioCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Required = True
      Size = 100
    end
    object cdsRelatorioID_ITEMSEQ: TIntegerField
      FieldName = 'ID_ITEMSEQ'
    end
    object cdsRelatorioID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
    end
    object cdsRelatorioDESC_ITEM: TStringField
      FieldName = 'DESC_ITEM'
      Size = 100
    end
    object cdsRelatorioQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object cdsRelatorioVALORUNIT: TFMTBCDField
      FieldName = 'VALORUNIT'
      Precision = 18
      Size = 2
    end
    object cdsRelatorioVALOTOTAL: TFMTBCDField
      FieldName = 'VALOTOTAL'
      Precision = 18
      Size = 4
    end
  end
end

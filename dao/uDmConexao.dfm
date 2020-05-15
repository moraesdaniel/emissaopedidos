object DmConexao: TDmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object SQLConexao: TSQLConnection
    DriverName = 'Firebird'
    LoadParamsOnConnect = True
    LoginPrompt = False
    Left = 40
    Top = 16
  end
end

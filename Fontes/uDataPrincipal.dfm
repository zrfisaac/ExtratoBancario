object dtmDataPrincipal: TdtmDataPrincipal
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object conPrincipal: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    Transaction = traPrincipal
    Left = 40
    Top = 16
  end
  object traPrincipal: TFDTransaction
    Connection = conPrincipal
    Left = 40
    Top = 72
  end
  object qryTransacaoSequence: TFDQuery
    Connection = conPrincipal
    Transaction = traPrincipal
    SQL.Strings = (
      'CREATE SEQUENCE SQ_TB_TRANSACAO_CL_ID;')
    Left = 176
    Top = 16
  end
  object qryTransacaoTabela: TFDQuery
    Connection = conPrincipal
    Transaction = traPrincipal
    SQL.Strings = (
      'CREATE TABLE TB_TRANSACAO ('
      #9' CL_ID'#9#9'INT PRIMARY KEY'
      #9',CL_DATA'#9'DATE'#9#9'NOT NULL'
      #9',CL_NOME'#9'VARCHAR(200)'#9'NOT NULL'
      #9',CL_VALOR'#9'DECIMAL(15,2)'#9'NOT NULL'
      #9',CL_TIPO'#9#9'VARCHAR(20)'#9'NOT NULL'
      ');')
    Left = 176
    Top = 72
  end
  object qryTransacaoTrigger: TFDQuery
    Connection = conPrincipal
    Transaction = traPrincipal
    SQL.Strings = (
      'CREATE TRIGGER TR_TB_TRANSACAO_CL_ID FOR TB_TRANSACAO'
      'BEFORE INSERT'
      'AS'
      'BEGIN'
      #9'IF (NEW.CL_ID IS NULL) THEN'
      #9'NEW.CL_ID = NEXT VALUE FOR SQ_TB_TRANSACAO_CL_ID;'
      'END')
    Left = 176
    Top = 128
  end
  object qryTransacaoIndice: TFDQuery
    Connection = conPrincipal
    Transaction = traPrincipal
    SQL.Strings = (
      'CREATE INDEX IDX_TRANSACAO_DATA ON TB_TRANSACAO (CL_DATA);')
    Left = 176
    Top = 184
  end
  object qryPrincipal: TFDQuery
    Connection = conPrincipal
    Transaction = traPrincipal
    SQL.Strings = (
      'SELECT * FROM TB_TRANSACAO;')
    Left = 40
    Top = 128
  end
  object dtsPrincipal: TDataSource
    DataSet = qryPrincipal
    Left = 40
    Top = 184
  end
end

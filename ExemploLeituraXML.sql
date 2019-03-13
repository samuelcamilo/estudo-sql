USE BANCO
GO

WITH XMLNAMESPACES(DEFAULT 'http://www.portalfiscal.inf.br/nfe')
SELECT
       NFe.value('@nItem', 'int') AS nItem,
       NFe.query('(./prod/cProd)').value('.', 'nvarchar(2000)') AS cProd,
       X1.isnNFeXML,
       X1.codChaveAcesso,
       X1.dscMotivo,
       X1.numNFe
FROM 
       BANCO..TABELA X1
CROSS APPLY 
       X1.CAMPODESCRICAO.nodes('//NFe/infNFe/det') AS NFes(NFe)
WHERE X1.CHAVE = '25160806626253077537550110000001281128000001'

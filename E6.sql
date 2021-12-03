SELECT b.Codigo_Bairro, b.Nome_Bairro, m.Nome_Municipio, m.Sigla_UF
FROM BAIRRO b
INNER JOIN MUNICIPIO m ON m.Codigo_Municipio = b.Codigo_Municipio
ORDER BY m.Sigla_UF, m.Nome_Municipio;

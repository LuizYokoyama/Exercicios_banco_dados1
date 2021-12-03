SELECT b.Codigo_Bairro, b.Nome_Bairro, m.Nome_Municipio, m.Sigla_UF,
COUNT(l.Codigo_Bairro) AS Quantidade_de_logradouros_deste_Bairro
FROM BAIRRO b
INNER JOIN MUNICIPIO m ON m.Codigo_Municipio = b.Codigo_Municipio
INNER JOIN LOGRADOURO l ON l.Codigo_Bairro = b.Codigo_Bairro
GROUP BY b.Codigo_bairro, m.Codigo_Municipio, m.Sigla_UF
HAVING (m.Sigla_UF LIKE 'AL' OR  m.Sigla_UF LIKE 'BA')
AND COUNT(l.Codigo_Bairro) > 19
ORDER BY m.Sigla_UF, m.Nome_Municipio;

SELECT u.Sigla_UF, u.Nome_Uf, COUNT(m.Codigo_Municipio)
FROM UF u
INNER JOIN MUNICIPIO m ON u.Sigla_UF = m.Sigla_UF
GROUP BY u.Sigla_UF
ORDER BY u.Nome_UF

SELECT m.Nome_Municipio, u.Sigla_UF, u.Nome_Uf 
FROM UF u
INNER JOIN MUNICIPIO m ON u.Sigla_UF = m.Sigla_UF
ORDER BY u.Nome_UF

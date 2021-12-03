SELECT *, u.Nome_UF FROM PESSOA p
LEFT JOIN POSSUI ps ON ps.cpf = p.cpf
INNER JOIN ENDERECO e ON e.Id_Endereco = ps.Id_Endereco
INNER JOIN LOGRADOURO l ON l.Codigo_Logradouro = e.Codigo_Logradouro
INNER JOIN BAIRRO b ON l.Codigo_Bairro = b.Codigo_Bairro
INNER JOIN MUNICIPIO m ON m.Codigo_Municipio = b.Codigo_Municipio
INNER JOIN TIPODEENDERECO te ON te.Codigo_Tipo_End = ps.Codigo_Tipo_End
LEFT JOIN TELEFONE t ON t.Id_Endereco = e.Id_Endereco
LEFT JOIN DEPENDENTE d ON p.cpf = d.cpf
INNER JOIN UF u ON m.Sigla_UF = u.Sigla_UF
GROUP BY p.cpf, ps.cpf, ps.Id_Endereco, t.Id_Endereco, e.Id_Endereco,
l.Codigo_Logradouro, b.Codigo_Bairro,m.Codigo_Municipio,
te.Codigo_Tipo_End, ps.Codigo_Tipo_End, t.Telefone, d.cpf,
d.Nome_Dependente, d.Data_Nascimento, d.Tipo_Dependente, u.Sigla_UF
ORDER BY p.nome;

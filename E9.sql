SELECT p.cpf, p.nome, p.data_nascimento, te.Nome_Tipo_End,
l.Nome_Logradouro, l.CEP, e.Quadra, e.Lote, e.Numero, e.Complemento,
b.Nome_Bairro, m.Nome_Municipio, m.Sigla_UF, t.Telefone
FROM PESSOA p
INNER JOIN POSSUI ps ON ps.cpf = p.cpf
INNER JOIN ENDERECO e ON e.Id_Endereco = ps.Id_Endereco
INNER JOIN LOGRADOURO l ON l.Codigo_Logradouro = e.Codigo_Logradouro
INNER JOIN BAIRRO b ON l.Codigo_Bairro = b.Codigo_Bairro
INNER JOIN MUNICIPIO m ON m.Codigo_Municipio = b.Codigo_Municipio
INNER JOIN TIPODEENDERECO te ON te.Codigo_Tipo_End = ps.Codigo_Tipo_End
INNER JOIN TELEFONE t ON t.Id_Endereco = e.Id_Endereco
GROUP BY p.cpf, e.Id_Endereco, l.Codigo_Logradouro, b.Codigo_Bairro,
m.Codigo_Municipio, te.Codigo_Tipo_End, ps.Codigo_Tipo_End, t.Telefone
HAVING te.Codigo_Tipo_End = 1 OR te.Codigo_Tipo_End = 2;


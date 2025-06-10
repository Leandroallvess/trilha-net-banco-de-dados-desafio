--> Busca completa <--
USE Filmes;
GO
SELECT * FROM Filmes;
--------------------------------------

--> Select do Nome e Ano do filme. <--
SELECT 
	Nome,
	Ano
FROM Filmes
----------------------------------------

--> Busca o nome e ano dos filmes, ordenados por ordem crescente pelo ano <--
SELECT 
	Nome,
	Ano,
	Duracao
FROM Filmes 
ORDER BY Ano ASC

-----------------------------------------

--> Busca pelo filme de volta para o futuro, trazendo o nome, ano e a duracao <--
SELECT
	Nome,
	Ano,
	Duracao
FROM Filmes
WHERE Nome = 'De Volta Para o Futuro'

-----------------------------------------

--> Busca pelos filmes lançados em 1997 <--
SELECT
	Nome,
	Ano,
	Duracao
FROM Filmes
WHERE Ano = 1997

------------------------------------------

--> Busca os filmes lançados APOS o ano 2000 com ordenaçao por ano. <--
SELECT 
    Nome,
    Ano,
    Duracao
FROM Filmes
WHERE Ano > 2000
ORDER BY Ano;


-------------------------------------------

--> Busca os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente <--
SELECT 
    Nome,
    Ano,
    Duracao
FROM Filmes
WHERE Duracao > 100 AND Duracao < 150
ORDER BY Duracao;

---------------------------------------------

--> Busca a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente <--
SELECT
    Ano,
    COUNT(*) AS Quantidade,
    SUM(Duracao) AS DuracaoTotal
FROM Filmes
GROUP BY Ano
ORDER BY DuracaoTotal DESC;

--------------------------------------------------------

--> Busca a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente, dizendo em um CASE quantos filmes teve no ano <--
SELECT
    Ano,
    COUNT(*) AS Quantidade,
    CASE 
        WHEN COUNT(*) > 2 THEN 'Mais que 2 Filmes'
        WHEN COUNT(*) > 1 THEN '2 Filmes'
        ELSE 'Apenas 1 Filme'
    END AS QuatidadeFilmesNoAno
FROM Filmes
GROUP BY Ano
ORDER BY Quantidade DESC, Ano DESC;

----------------------------------------------------------------------------

--> Busca os Atores do genero masculino, retornando o PrimeiroNome, UltimoNome <--
SELECT
    PrimeiroNome,
    UltimoNome
FROM Atores
WHERE Genero = 'M'

----------------------------------------------------------------------------

--> Busca as Atrizes (Genero Feminino), retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome <--
SELECT
    PrimeiroNome,
    UltimoNome
FROM Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome

-----------------------------------------------------------------------------

--> Busca o nome do filme e o genero, com o Genero em Ordem Crescente <--
SELECT
    f.Nome AS Filme,
    g.Genero
FROM Filmes f
JOIN FilmesGenero fg ON f.Id = fg.IdFilme
JOIN Generos g ON fg.IdGenero = g.Id
ORDER BY g.Genero, f.Nome;

---------------------------------------------------------------------------

--> Busca o nome do filme e o genero do tipo "Mistério" <--
SELECT
    f.Nome AS Filme,
    g.Genero
FROM Filmes f
JOIN FilmesGenero fg ON f.Id = fg.IdFilme
JOIN Generos g ON fg.IdGenero = g.Id
WHERE g.Genero = 'Mistério'
ORDER BY f.Nome;

-----------------------------------------------------------------------------

--> Busca o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome, seu Papel. Adicionais: Ano, Duraçao(min), Genero do Ator. <--
SELECT
    f.Nome AS Filme,
    a.PrimeiroNome,
    a.UltimoNome,
    e.Papel,
    f.Ano,
    f.Duracao AS 'Dura��o (min)',
    CASE 
        WHEN a.Genero = 'M' THEN 'Masculino'
        WHEN a.Genero = 'F' THEN 'Feminino'
        ELSE 'N�o especificado'
    END AS 'G�nero do Ator'
FROM ElencoFilme e
INNER JOIN Atores a ON e.IdAtor = a.Id
INNER JOIN Filmes f ON e.IdFilme = f.Id
ORDER BY f.Nome, a.UltimoNome, a.PrimeiroNome;

--------------------------------------------------------------------------------------
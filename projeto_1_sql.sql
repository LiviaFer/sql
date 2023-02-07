-- Análise de Dados com SQL 
-- Objetivos: decisão de investir baseado em um determinado filme (nota)

-- Indicadores: 
-- Valor total de locações para definir a receita da empresa
-- Média de avaliação(nota) dos filmes para definir a satisfação dos clientes
-- Número de clientes ativos para definir o engajamento dos clientes 

-- Selecionado as tabelas 
SELECT * FROM alugueis;
SELECT * FROM atores; 
SELECT * FROM atuacoes;
SELECT * FROM clientes;
SELECT * FROM filmes;

-- Analisar o preço médio de aluguel dos filmes por gênero 
SELECT genero as 'Gênero', 
	ROUND(avg(preco_aluguel), 2) AS 'Média de Preço do Aluguel', 
    count(genero) as 'Quantidade de filmes por Gênero'
from filmes
group by genero;

-- Analisar o preço médio predio de filmes com o lançamento igual a 2011
SELECT genero,
	ROUND(AVG(preco_aluguel), 2) as 'Média de Preços do Aluguel'
from filmes
WHERE ano_lancamento = 2011
GROUP BY genero;

-- Análise de desempenho dos aluguéis. Identificar quais aluguéis tiveram uma nota acima e abaixo da média 
SELECT ROUND(AVG(nota), 2) from alugueis; -- Média 7.94

SELECT * from alugueis
WHERE nota >= (SELECT ROUND(AVG(nota), 2));


set schema 'appcc'

-- 1. Quantos funcionários participando cada departamento possui?

SELECT d.nome AS departamento, COUNT(f.id) AS qtd_funcionarios
FROM departamento d
LEFT JOIN funcionario f ON d.id = f.cod_depto
GROUP BY d.nome;

-- 2. Quais são os funcionários que pertencem ao departamento de Vendas?

SELECT f.pnome, f.unome
FROM funcionario f
INNER JOIN departamento d ON f.cod_depto = d.id
WHERE d.nome = 'Vendas';

-- 3. Quais os nomes dos funcionas com os trajetos que têm uma quantidade de carbono emitido superior a 5?

SELECT f.pnome, f.unome
FROM funcionario f
INNER JOIN trajeto t ON f.id = t.cod_funcionario
WHERE t.qtd_carbono_emitido > 5;

-- 4. Qual é a quantidade total de redução de emissão nas segundas-feiras?

SELECT SUM(qtd_reducao) AS total_reducao
FROM reducao_de_emissao
WHERE dia_semana = 'Segunda-feira';

-- 5. Quais funcionários utilizam ônibus como meio de transporte para reduzir a emissão?

SELECT f.pnome, f.unome
FROM funcionario f
JOIN trajeto t ON f.id = t.cod_funcionario
JOIN reducao_de_emissao r ON t.id = r.cod_trajeto
WHERE r.meio_transporte = 'Ônibus';

-- 6. Quais são os dias da semana em que houve redução de emissão superior a 3?

SELECT dia_semana
FROM reducao_de_emissao
WHERE qtd_reducao > 3;

-- 7. Quais são os funcionários que pertencem a departamentos com mais de 2 funcionários?

SELECT f.pnome, f.unome
FROM funcionario f
JOIN departamento d ON f.cod_depto = d.id
WHERE d.qtd_funcionarios > 2;

-- 8. Qual é a média de quilômetros percorridos por trajeto?

SELECT AVG(qtd_km) AS media_quilometros
FROM trajeto;

-- 9. Quais  o nome dos funcionarios que  os trajetos que utilizam veículos do tipo "Moto"?

SELECT f.pnome, f.unome
FROM funcionario f
JOIN trajeto t ON f.id = t.cod_funcionario
WHERE t.veiculo = 'Moto';

-- 10. Qual é a quantidade total de carbono emitido e de redução de emissão de cada funcionario e o nome dele nos trajetos?

SELECT f.pnome || ' ' || f.unome AS nome,
       SUM(t.qtd_carbono_emitido) AS total_carbono_emitido,
       COALESCE(SUM(r.qtd_reducao), 0) AS total_reducao_emissao
FROM funcionario f
JOIN trajeto t ON f.id = t.cod_funcionario
LEFT JOIN reducao_de_emissao r ON t.id = r.cod_trajeto
GROUP BY f.id, f.pnome, f.unome;




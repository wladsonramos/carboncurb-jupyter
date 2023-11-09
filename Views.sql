-- 5. Quais funcionários utilizam Ônibus como meio de transporte para reduzir a emissão?

CREATE VIEW transporte_onibus as
SELECT f.pnome, f.unome
FROM funcionario f
JOIN trajeto t ON f.id = t.cod_funcionario
JOIN reducao_de_emissao r ON t.id = r.cod_trajeto
WHERE r.meio_transporte = 'Ônibus';

-- 10. Qual é a quantidade total de carbono emitido e de redução de emissão de cada funcionario e o nome dele nos trajetos?

CREATE VIEW resumo_funcionarios as
SELECT f.pnome || ' ' || f.unome AS nome,
       SUM(t.qtd_carbono_emitido) AS total_carbono_emitido,
       COALESCE(SUM(r.qtd_reducao), 0) AS total_reducao_emissao
FROM funcionario f
JOIN trajeto t ON f.id = t.cod_funcionario
LEFT JOIN reducao_de_emissao r ON t.id = r.cod_trajeto
GROUP BY f.id, f.pnome, f.unome;




-- Criação da trigger
CREATE OR REPLACE FUNCTION aumentar_qtd_funcionarios()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE departamento
    SET qtd_funcionarios = qtd_funcionarios + 1
    WHERE id = NEW.cod_depto;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Associa a trigger à tabela funcionario
CREATE TRIGGER aumentar_qtd_funcionarios_trigger
AFTER INSERT ON funcionario
FOR EACH ROW
EXECUTE FUNCTION aumentar_qtd_funcionarios();

-- Criação da trigger
CREATE OR REPLACE FUNCTION atualizar_qtd_carbono_emitido()
    RETURNS TRIGGER AS $$
BEGIN
    -- Verifica se o veículo é um carro
    IF NEW.veiculo = 'Carro' THEN
        -- Calcula o novo valor de qtd_carbono_emitido
        NEW.qtd_carbono_emitido := ((NEW.qtd_km * 2) / 10) * 0.82 * 0.75 * 3.2;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Associa a trigger à tabela trajeto 
CREATE TRIGGER atualizar_qtd_carbono_trigger
BEFORE UPDATE ON trajeto
FOR EACH ROW
EXECUTE FUNCTION atualizar_qtd_carbono_emitido();
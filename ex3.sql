CREATE OR REPLACE FUNCTION desempenho_medico(data_inicial date, data_final date) 
RETURNS 
setof record
AS
$$
DECLARE
	atendimentos record;
BEGIN	
	for atendimentos in
		SELECT M.NOME, COUNT(*) AS qtd
		FROM MEDICO M
		LEFT JOIN ATENDE AT 
			ON AT.ID_MEDICO = M.ID_MEDICO
		WHERE AT.DATA BETWEEN data_inicial AND data_final
		GROUP BY M.NOME
	loop
		return next atendimentos;
	end loop;
	RETURN;
END;
$$
LANGUAGE plpgsql;

SELECT * FROM desempenho_medico('2000-01-04', '2025-01-30') as (Nome_do_Médico varchar , quantidade_de_atendimentos bigint );

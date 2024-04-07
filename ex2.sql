CREATE OR REPLACE FUNCTION f_criar_cirurgia(codigo_cirurgia varchar(11), codigo_paciente varchar(11),data_cirurgia date, descricao_cirurgia text) RETURNS record 
AS 
$$
DECLARE
	result_consulta integer;
	dados_cirurgia record;
BEGIN
	SELECT paciente.id_paciente INTO result_consulta 
	FROM paciente
	WHERE codigo_paciente = paciente.codigo;
	IF (result_consulta IS NOT NULL) THEN 
		INSERT INTO cirurgia VALUES
		(nextval('sid_cirurgia'), codigo_cirurgia, data_cirurgia, descricao_cirurgia, result_consulta);
	ELSE 
		RAISE 'Paciente não foi encontrado.';
	END IF;
	RETURN dados_cirurgia;
END;
$$ 
LANGUAGE PLPGSQL;

SELECT f_criar_cirurgia('c5', '145', '2023-04-20', 'Transplante de Coração');
SELECT f_criar_cirurgia('c6', '146', '2024-04-20', 'Transplante de Rim');

select * from cirurgia;
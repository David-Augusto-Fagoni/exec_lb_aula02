CREATE DATABASE exec_lb_aula02
GO
USE exec_lb_aula02


--a) Dado um número inteiro. Calcule e mostre o seu fatorial. (Não usar entrada superior a 12)
DECLARE @fa	INT,
		@tt INT
SET @fa = 5
SET @tt = 1
WHILE (@fa > 0)
BEGIN
	SET @tt = @tt * @fa
	SET @fa = @fa - 1
END
PRINT @tt

-- b) Dados A, B, e C de uma equação do 2o grau da fórmula AX2+BX+C=0. Verifique e mostre a
-- existência de raízes reais e se caso exista, calcule e mostre. Caso não existam, exibir mensagem.
DECLARE @A	DECIMAL(7,2),
		@B	DECIMAL(7,2),
		@C	DECIMAL(7,2),
		@D  DECIMAL(7,2)

		SET @A = 2
		SET @B = 3
		SET @C = 5

		SET @D = ((@B*@B) -4*@A*@C)
		PRINT (-@B + SQRT(@D)) / (2*@A)
		PRINT (-@B - SQRT(@D)) / (2*@A)

		--c) Calcule e mostre quantos anos serão necessários para que Ana seja maior que Maria sabendo
		--que Ana tem 1,10 m e cresce 3 cm ao ano e Maria tem 1,5 m e cresce 2 cm ao ano.

		DECLARE @Ana	DECIMAL(7,2),
				@Maria	DECIMAL(7,2),
				@cont	INT

		SET @Ana	=  1.10
		SET @Maria	=  1.5
		SET @cont = 0

		WHILE (@Ana < @Maria)
		BEGIN
			SET @Ana = @Ana + 0.3
			SET @Maria = @Maria + 0.2

			SET @cont = @cont + 1

		END
			PRINT @cont

		--d) Seja a seguinte série: 1, 4, 4, 2, 5, 5, 3, 6, 6, 4, 7, 7, ...

		DECLARE
				@N	INT,
				@Cnt INT

				SET	@N = 4
				SET @Cnt = 1
		WHILE (@Cnt < 5)
		BEGIN
			PRINT @Cnt
			PRINT @N
			PRINT @N
			SET @N = @N +1
			SET @Cnt = @Cnt + 1
		END
		--e) Considerando a tabela abaixo, gere uma massa de dados, com 50 registros, para fins de teste
		--com as regras estabelecidas (Não usar constraints na criação da tabela)

		CREATE TABLE produto (
		codigo		INT				NOT NULL,
		nome		VARCHAR(30)		NOT NULL,
		valor		DECIMAL(7,2)	NOT NULL,
		vencimento	DATE			NOT NULL
		)

		DECLARE	@codigo			INT,
				@nome			VARCHAR(30),
				@valor			DECIMAL(7,2),
				@vencimento		DATE,
				@con			INT
		SET @codigo = 50000
		SET @nome = 'Produto'
		SET @valor = 100
		SET @vencimento = GETDATE()
		SET @con = 1

		WHILE (@con < 51)
		BEGIN
		INSERT INTO produto VALUES
		(@codigo + @con,CONCAT(@nome,' ', @con), @valor + CAST(RAND() * 91 + 10 AS decimal(7,2)),DATEADD(DAY, CAST(RAND() * 5 + 3 AS INT), @vencimento))
		SET @con = @con + 1
		END

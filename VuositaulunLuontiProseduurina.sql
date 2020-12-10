-- Proseduuri, jonka avulla luodaan taulu dynaamisia SQL-kometoja käyttäen
USE Tivi20OAesimerkit
GO

-- Proseduurin määrittely
CREATE PROCEDURE sp_luo_vuositaulu
	-- Muuttuja taulun nimeä varten
	@taulu NVARCHAR(50)
AS
BEGIN
	-- Määritellään muuttuja, johon SQL-lauseet tallennetaan
	-- ja annetaan sen arvoksi taulun luontikomento merkkijonona
	DECLARE @sqlkomento NVARCHAR(MAX) = '
	BEGIN
	CREATE TABLE ' +@taulu+ '
		(TarkastusID INT,
		TyomaaID INT)
	END'

	-- Suoritetaan muuttujaan tallennettut SQL-lauseet, huom. sulkeet (ilman sulkeita suorittaa vain proseduureja)
	EXECUTE(@sqlkomento)

END

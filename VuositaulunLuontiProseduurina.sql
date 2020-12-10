-- Proseduuri, jonka avulla luodaan taulu dynaamisia SQL-kometoja k‰ytt‰en
USE Tivi20OAesimerkit
GO

-- Proseduurin m‰‰rittely
CREATE PROCEDURE sp_luo_vuositaulu
	-- Muuttuja taulun nime‰ varten
	@taulu NVARCHAR(50)
AS
BEGIN
	-- M‰‰ritell‰‰n muuttuja, johon SQL-lauseet tallennetaan
	-- ja annetaan sen arvoksi taulun luontikomento merkkijonona
	DECLARE @sqlkomento NVARCHAR(MAX) = '
	BEGIN
	CREATE TABLE ' +@taulu+ '
		(TarkastusID INT,
		TyomaaID INT)
	END'

	-- Suoritetaan muuttujaan tallennettut SQL-lauseet, huom. sulkeet
	EXECUTE(@sqlkomento)

END
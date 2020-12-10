-- Proseduuri, joka luo tilap‰isen taulun tempdb-tietokantaan
USE Tivi20OAesimerkit
GO

-- M‰‰ritell‰‰n taulumuuttuja
DECLARE @Taulu TABLE
(TarkastusID INT,
TyomaaID INT)

-- Annetaan muuttujalle arvoja
INSERT INTO @Taulu
VALUES 
(1, 1),
(2, 2)

-- Tehd‰‰n kysely muuttujan arvoista
SELECT *
FROM @Taulu
-- PERINTEINEN TRANSAKTIO, JOKA ILMOITTAA VIRHEEST�

USE Joukkooppi
GO

CREATE PROCEDURE dbo.SiirraElakkeelle2
	@ty�ntekij�ID INT = 0
AS
BEGIN
	BEGIN TRANSACTION El�kesiirto2
		BEGIN TRY
		-- YRITET��N TEHD� KAKSIVAIHEINEN EL�KESIIRTO
				-- Selvitet��n, onko ty�ntekij� olemassa
				IF(SELECT Henkil�ID FROM dbo.Ty�ntekij�2020 WHERE Henkil�ID = @ty�ntekij�ID) IS NULL 
				-- Jos ei l�ydy generoidaan virhe koodilla 55 555
				THROW 55555,'Ty�ntekij�� ei l�ydy',1

				-- Lis�t��n ty�ntekij�, jonka id on @ty�ntekij�ID el�kel�isiin
				INSERT dbo.El�kel�inen2020 (Henkil�ID, Etunimi, Sukunimi)
				(SELECT Henkil�ID, Etunimi, Sukunimi
				FROM dbo.Ty�ntekij�2020
				WHERE Henkil�ID = @ty�ntekij�ID)

			-- Poistetaan henkil� ty�ntekij�ist�
				DELETE FROM dbo.Ty�ntekij�2020
				WHERE Henkil�ID = @ty�ntekij�ID

			-- Vahvistetaan tapahtuma
			COMMIT TRANSACTION El�kesiirto2
			PRINT 'Henkil� siirrettiin onnistuneesti el�kkeelle'
		END TRY

		-- Vikatilanteen toiminnot
		BEGIN CATCH
			-- Peruutetaan kaikki toimintoon liittyv�t teht�v�t
			ROLLBACK TRANSACTION El�kesiirto2
			PRINT 'Siirto el�kkeelle ep�onnistui'
		END CATCH
END
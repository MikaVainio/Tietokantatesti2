-- PERINTEINEN TRANSAKTIO, JOKA ILMOITTAA VIRHEESTÄ

USE Joukkooppi
GO

CREATE PROCEDURE dbo.SiirraElakkeelle2
	@työntekijäID INT = 0
AS
BEGIN
	BEGIN TRANSACTION Eläkesiirto2
		BEGIN TRY
		-- YRITETÄÄN TEHDÄ KAKSIVAIHEINEN ELÄKESIIRTO
				-- Selvitetään, onko työntekijä olemassa
				IF(SELECT HenkilöID FROM dbo.Työntekijä2020 WHERE HenkilöID = @työntekijäID) IS NULL 
				-- Jos ei löydy generoidaan virhe koodilla 55 555
				THROW 55555,'Työntekijää ei löydy',1

				-- Lisätään työntekijä, jonka id on @työntekijäID eläkeläisiin
				INSERT dbo.Eläkeläinen2020 (HenkilöID, Etunimi, Sukunimi)
				(SELECT HenkilöID, Etunimi, Sukunimi
				FROM dbo.Työntekijä2020
				WHERE HenkilöID = @työntekijäID)

			-- Poistetaan henkilö työntekijöistä
				DELETE FROM dbo.Työntekijä2020
				WHERE HenkilöID = @työntekijäID

			-- Vahvistetaan tapahtuma
			COMMIT TRANSACTION Eläkesiirto2
			PRINT 'Henkilö siirrettiin onnistuneesti eläkkeelle'
		END TRY

		-- Vikatilanteen toiminnot
		BEGIN CATCH
			-- Peruutetaan kaikki toimintoon liittyvät tehtävät
			ROLLBACK TRANSACTION Eläkesiirto2
			PRINT 'Siirto eläkkeelle epäonnistui'
		END CATCH
END
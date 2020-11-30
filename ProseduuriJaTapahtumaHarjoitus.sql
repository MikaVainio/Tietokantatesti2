-- PROSEDUURI, JOKA POISTAA EDELLISEN VUODEN TARKASTUKSET JA SIIRTƒƒ NE OMAAN TAULUUN


-- Proseduurille annetaan parametrina p‰iv‰m‰‰r‰, jota vanhemmat merkinn‰t siirret‰‰n
-- uuteen tauluun ja poistetaan tarkastuk‰ynti-taulusta. Luotavan taulun nimi annetaan toisena parametrina

-- Lis‰‰minen ja poistaminen tehd‰‰n transaktiona

USE Tarkastus
GO

CREATE PROCEDURE dbo.vuodenvaihde
	@pvm DATE,
	@uusiTaulu NVARCHAR(50)

AS

	BEGIN
		-- Luodaan taulu vanhoille tarkastustiedoille
		CREATE TABLE 
		-- Suoritetaan vanhojen tietojen lis‰‰minen uuteen tauluun ja poistaminen vanhasta taulusta
		BEGIN TRANSACTION vuosiajo
			BEGIN TRY
			-- Vahvistetaan onnistunut toiminto
			COMMIT TRANSACTION vuosiajo
			END TRY

			BEGIN CATCH
			-- Kumotaan toiminnot, jos jokin ep‰onnistuu
			ROLLBACK TRANSACTION vuosiajo
			END CATCH
	END

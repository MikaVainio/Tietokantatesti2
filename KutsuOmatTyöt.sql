-- Käytetään proseduuria OmatTyot
USE Käyttäjätiedot
GO

-- Määritellään muuttuja käyttäjätunnusta varten
DECLARE @user nvarchar(50) = SUSER_NAME()

-- Suoritetaan proseduuri 
EXECUTE dbo.OmatTyot @user
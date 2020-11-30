-- K‰ytet‰‰n proseduuria OmatTyot
USE K‰ytt‰j‰tiedot
GO

-- M‰‰ritell‰‰n muuttuja k‰ytt‰j‰tunnusta varten
DECLARE @user nvarchar(50) = SUSER_NAME()

-- Suoritetaan proseduuri 
EXECUTE dbo.OmatTyot @user
USE [Joukkooppi]
GO

/****** Object:  StoredProcedure [dbo].[SiirraElakkeelle]    Script Date: 23.11.2020 14.51.04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Luodaan proseduuri ja määritellään sen parametri
CREATE PROCEDURE [dbo].[SiirraElakkeelle]
	@henkilöid INT = 0
AS
BEGIN
-- Kytketään automaattinen ROLLBACK päälle
	SET XACT_ABORT ON

-- KAKSIVAIHEINEN ELÄKESIIRTO
	BEGIN TRANSACTION Eläkesiirto
	-- Lisästään työntekijä, jonka id on annettu parametrinä, eläkeläisiin
		INSERT dbo.Eläkeläinen2020 (HenkilöID, Etunimi, Sukunimi)
		(SELECT HenkilöID, Etunimi, Sukunimi
		FROM dbo.Työntekijä2020
		WHERE HenkilöID = @henkilöid)
	-- Poistetaan henkilö työntekijöistä
		DELETE FROM dbo.Työntekijä2020
		WHERE HenkilöID = @henkilöid
	COMMIT TRANSACTION
END
GO


-- Skriptejä joukko-opillisten operaatioiden testaamiseen


-- 1. Siirretään työntekijä eläkkeelle
-- Varmistetaan, että skripti suoritetaan oikeassa tietokannassa
USE Joukkooppi
GO

-- Lisätään Eläkeläinen2020-tauluun uusia tietueita (henkilöt joiden id:t  ovat 5 ja 6)
INSERT dbo.Eläkeläinen2020 (HenkilöID, Etunimi, Sukunimi)
-- Valitaan siirrettävä tiettue
(SELECT dbo.Työntekijä2020.HenkilöID, dbo.Työntekijä2020.Etunimi, dbo.Työntekijä2020.Sukunimi
FROM Työntekijä2020
WHERE HenkilöID IN (5,6))


-- 2. Haetaan työntekijät ja eläkeläiset vuodelta 2020 (ei duplikaatteja)
USE Joukkooppi
GO

SELECT HenkilöID, Etunimi, Sukunimi
FROM Työntekijä2020
UNION
SELECT HenkilöID, Etunimi, Sukunimi
FROM Eläkeläinen2020


-- 3. Haetaan vuonna 2020 eläköityneet so leikkaus työntekijä ja eläkeläiset 2020
USE Joukkooppi
GO

SELECT HenkilöID, Etunimi, Sukunimi
FROM Työntekijä2020
INTERSECT
SELECT HenkilöID, Etunimi, Sukunimi
FROM Eläkeläinen2020

-- Haetaan työntekijät jotka eivät esiinny eläkelistalla
USE Joukkooppi
GO

SELECT HenkilöID, Etunimi, Sukunimi
FROM Työntekijä2020
EXCEPT
SELECT HenkilöID, Etunimi, Sukunimi
FROM Eläkeläinen2020

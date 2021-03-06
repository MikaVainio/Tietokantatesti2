USE [Tarkastus]
GO
SET IDENTITY_INSERT [dbo].[tarkastustyyppi] ON 

INSERT [dbo].[tarkastustyyppi] ([tarkastustyyppiid], [tyyppinimitys]) VALUES (1, N'Käyttöönottotarkastus')
INSERT [dbo].[tarkastustyyppi] ([tarkastustyyppiid], [tyyppinimitys]) VALUES (2, N'Määräaikaistarkastus')
INSERT [dbo].[tarkastustyyppi] ([tarkastustyyppiid], [tyyppinimitys]) VALUES (3, N'Varmennustarkastus')
SET IDENTITY_INSERT [dbo].[tarkastustyyppi] OFF
GO
SET IDENTITY_INSERT [dbo].[rakennusliike] ON 

INSERT [dbo].[rakennusliike] ([rakennusliikeid], [nimi], [postiosoite], [postinumero], [postitoimipaikka]) VALUES (1, N'Kuonakartio', N'Grynderikatu 2', N'21200', N'Raisio')
INSERT [dbo].[rakennusliike] ([rakennusliikeid], [nimi], [postiosoite], [postinumero], [postitoimipaikka]) VALUES (2, N'Roiske & Rappaus', N'Kirveskatu 2', N'20100', N'Turku')
SET IDENTITY_INSERT [dbo].[rakennusliike] OFF
GO
SET IDENTITY_INSERT [dbo].[tyomaa] ON 

INSERT [dbo].[tyomaa] ([tyomaaid], [tyomaannimi], [rakennusliikeid], [postiosoite], [psotinumero], [postitoimipaikka]) VALUES (1, N'Kauppakeskus Tuuba', 1, N'Juhaninkuja 1', N'21200', N'Raisio')
INSERT [dbo].[tyomaa] ([tyomaaid], [tyomaannimi], [rakennusliikeid], [postiosoite], [psotinumero], [postitoimipaikka]) VALUES (2, N'Raseko Laajennus', 1, N'Eeronkuja 4', N'21200', N'Raisio')
INSERT [dbo].[tyomaa] ([tyomaaid], [tyomaannimi], [rakennusliikeid], [postiosoite], [psotinumero], [postitoimipaikka]) VALUES (3, N'OK Möttönen', 2, N'Rantasentie 3', N'23100', N'Mynämäki')
INSERT [dbo].[tyomaa] ([tyomaaid], [tyomaannimi], [rakennusliikeid], [postiosoite], [psotinumero], [postitoimipaikka]) VALUES (4, N'AsOy Peräkorpi', 2, N'Viertotie 5', N'23120', N'Perähikiä')
SET IDENTITY_INSERT [dbo].[tyomaa] OFF
GO
SET IDENTITY_INSERT [dbo].[tarkastaja] ON 

INSERT [dbo].[tarkastaja] ([tarkastajaid], [etunimi], [sukunimi], [kayttajatunnus]) VALUES (1, N'Sakke', N'Sähkäri', N'sakke.sahkari@testaus.intra')
INSERT [dbo].[tarkastaja] ([tarkastajaid], [etunimi], [sukunimi], [kayttajatunnus]) VALUES (2, N'Kirsi', N'Kipinä', N'kirsi.kipina@testauss.intra')
INSERT [dbo].[tarkastaja] ([tarkastajaid], [etunimi], [sukunimi], [kayttajatunnus]) VALUES (3, N'Pauli', N'Purske', N'pauli.purske@testaus.intra')
SET IDENTITY_INSERT [dbo].[tarkastaja] OFF
GO
SET IDENTITY_INSERT [dbo].[tarkastuskaynti] ON 

INSERT [dbo].[tarkastuskaynti] ([tarkatuskayntiid], [tyomaaid], [tarkastustyyppiid], [tarkastajaid], [tarkastuspaiva], [poytakirjanumero]) VALUES (1, 1, 1, 1, CAST(N'2020-11-09T00:00:00.000' AS DateTime), 155)
INSERT [dbo].[tarkastuskaynti] ([tarkatuskayntiid], [tyomaaid], [tarkastustyyppiid], [tarkastajaid], [tarkastuspaiva], [poytakirjanumero]) VALUES (2, 3, 1, 1, CAST(N'2020-10-07T00:00:00.000' AS DateTime), 123)
INSERT [dbo].[tarkastuskaynti] ([tarkatuskayntiid], [tyomaaid], [tarkastustyyppiid], [tarkastajaid], [tarkastuspaiva], [poytakirjanumero]) VALUES (3, 2, 2, 2, CAST(N'2020-10-15T00:00:00.000' AS DateTime), 111)
INSERT [dbo].[tarkastuskaynti] ([tarkatuskayntiid], [tyomaaid], [tarkastustyyppiid], [tarkastajaid], [tarkastuspaiva], [poytakirjanumero]) VALUES (4, 4, 3, 3, CAST(N'2020-11-09T00:00:00.000' AS DateTime), 444)
INSERT [dbo].[tarkastuskaynti] ([tarkatuskayntiid], [tyomaaid], [tarkastustyyppiid], [tarkastajaid], [tarkastuspaiva], [poytakirjanumero]) VALUES (5, 1, 3, 3, CAST(N'2020-11-05T00:00:00.000' AS DateTime), 666)
SET IDENTITY_INSERT [dbo].[tarkastuskaynti] OFF
GO

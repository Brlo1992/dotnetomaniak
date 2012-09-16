USE [dotnetomaniak];
SET NOCOUNT ON;
SET XACT_ABORT ON;
GO

ALTER TABLE Category ADD [Description] NVARCHAR(200)

BEGIN TRANSACTION;
UPDATE SET [Description] = N'Przydatne narz�dzia dla ka�dego' 
WHERE UniqueName = N'Narzedzia'

UPDATE SET [Description] = N'RIA od MS. Wszyelkie wersje i dodatki.'
WHERE UniqueName = N'Silverlight'

UPDATE SET [Description] = N'Web Forms, MVC, jQuery i inne przydante rzeczy dla ka�dego siedz�cego w Web Development'
WHERE UniqueName = N'ASP.NET'

UPDATE SET [Description] = N'Pozosta�e nigdzie indziej niesklasyfikowane artyku�y' 
WHERE UniqueName = N'Inne'

UPDATE SET [Description] = N'WP7, WindowsMobile, WindowsCE ale tak�e inne platformy mobilne' 
WHERE UniqueName = N'Mobile development'

UPDATE SET [Description] = N'WinForms, WPF, kontrolki i wszystko inne zwi�zane z programwoaniem na platform� Windows'
WHERE UniqueName = N'Windows'

UPDATE SET [Description] = N'MSSQL, Oracle, mySQL, PostgreSQL i nie tylko'
WHERE UniqueName = N'Bazy danych i XML'

UPDATE SET [Description] = N'Sharepoint i wszystko co zwi�zane z programowaniem na t� platform�'
WHERE UniqueName = N'Office'

UPDATE SET [Description] = N'Wszystko co zwi�zane z rozwojem aplikcji przystosowanych do obs�ugo wi�cej ni� 1 maszyny'
WHERE UniqueName = N'Programowanie rozproszone'

UPDATE SET [Description] =  N'Rozwi�zania na wy�szym poziomie abstrakcji. Wzorce, dobre praktyki i pomys�y.'
WHERE UniqueName = N'Architecture'
COMMIT;



use NomeDB;
/*
Eliminare Assembly e Aggregate dipendente.
*/
DROP AGGREGATE MyAgg
DROP ASSEMBLY MyAgg

/*
Once you compile the code into MyAgg.dll, you can register the aggregate in SQL Server as follows:
*/
CREATE ASSEMBLY MyAgg FROM 'F:\MyAgg.dll'
GO
CREATE AGGREGATE MyAgg (@input nvarchar(200), @separatore nvarchar(10)) RETURNS nvarchar(max)
EXTERNAL NAME MyAgg.Concatenate

/*
Esempio
*/
select Nazione, COUNT(*), dbo.MyAgg(Nome, '----  ')
from BlogSet
group by Nazione

/*
Abilitare CLR su SQL Server
*/
sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
sp_configure 'clr enabled', 1;
GO
RECONFIGURE;
GO

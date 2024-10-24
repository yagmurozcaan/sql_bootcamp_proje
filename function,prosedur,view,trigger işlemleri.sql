--- prosedur view index iþlemleri

-------------------------
-----prosedür-----------------
CREATE PROCEDURE GetOdaServisleri
    @odaNumarasi INT
AS
BEGIN
    SELECT o.odaNumarasi, s.servisTuru 
    FROM odaservisleri s
    JOIN odalar o
    ON o.odaID = s.odaID
    WHERE o.odaNumarasi = @odaNumarasi
    GROUP BY o.odaNumarasi, s.servisTuru;
END;
EXEC GetOdaServisleri @odaNumarasi = 62;
--------------------------------------------------
-----------view------------------------------
CREATE VIEW vw_MusterilerOdalar
AS
SELECT m.musteriID,m.musteriad,m.musterisoyad,m.musteritelefon,m.musteriemail,
m.musteriadres,o.odanumarasi,o.odatipi
FROM 
    musteriler m
INNER JOIN 
    rezervasyon r ON m.musteriID = r.musteriID
INNER JOIN 
    odalar o ON r.odaID = o.odaID;

select*from vw_MusterilerOdalar
------------------------------------------------------
-------------------index--------------------------------
create nonclustered index IX_musteriler on musteriler(musteriAd)

set statistics time on

select * from musteriler where musteriAd='yaðmur'

set statistics time off
-----------------------------------------------------------------

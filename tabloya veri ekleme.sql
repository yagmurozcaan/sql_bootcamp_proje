USE otelDB;
----------------------------------------------------
--MÜÞTERÝ TABLOSUNA RANDOM VERÝ OLUÞTURMA--
-------------------------------------------------
-- Gerekli deðiþkenleri tanýmlýyoruz
/*DECLARE @i INT = 1;
DECLARE @Ad NVARCHAR(50);
DECLARE @Soyad NVARCHAR(50);
DECLARE @Email NVARCHAR(1000);
DECLARE @Sehir NVARCHAR(50);
DECLARE @Telefon NVARCHAR(20);
DECLARE @Adres NVARCHAR(200);
DECLARE @TC NVARCHAR(11) = '';

ALTER TABLE musteriler
ALTER COLUMN musteriEmail NVARCHAR(100);
-- Ýsimler tablosu
DECLARE @Isimler TABLE (Ad NVARCHAR(50));
INSERT INTO @Isimler (Ad) VALUES
('Ahmet'), ('Mehmet'), ('Ayþe'), ('Fatma'), ('Ali'), ('Veli'),
('Elif'), ('Zeynep'), ('Hasan'), ('Hüseyin'), ('Emine'), ('Selin'),
('Kemal'), ('Leyla'), ('Murat'), ('Hakan'), ('Cem'), ('Sibel'),
('Merve'), ('Barýþ'), ('Gül'), ('Melike'), ('Burak'), ('Furkan'),
('Berk'), ('Serkan'), ('Deniz'), ('Derya'), ('Ceren'), ('Gizem'),
('Yaðmur'), ('Esra'), ('Can'), ('Bora'), ('Nazlý'), ('Zehra');

-- Soyadlar tablosu
DECLARE @Soyadlar TABLE (Soyad NVARCHAR(50));
INSERT INTO @Soyadlar VALUES
('Kaya'), ('Yýlmaz'), ('Koþar'), ('Çelik'), ('Demir'), ('Yýldýz'),
('Aydýn'), ('Korkmaz'), ('Özdemir'), ('Koç'), ('Doðan'), ('Þahin'),
('Eren'), ('Çiçek'), ('Aþkýn'), ('Karabulut'), ('Aksoy'), ('Güler'),
('Uzun'), ('Acar'), ('Polat'), ('Büyük'), ('Sezer'), ('Bozkurt'),
('Yavuz'), ('Güneþ'), ('Aslan'), ('Sevinç'), ('Erden'), ('Öztürk'),
('Duman'), ('Þen'), ('Toprak'), ('Korkut'), ('Iþýk'), ('Özcan');

-- Þehirler tablosu
DECLARE @Sehirler TABLE(Sehir NVARCHAR(50));
INSERT INTO @Sehirler VALUES
('Ýstanbul'), ('Ankara'), ('Mersin'), ('Ýzmir'), ('Van'), ('Diyarbakýr'),
('Bursa'), ('Aydýn'), ('Balýkesir'), ('Eskiþehir'), ('Adýyaman'), ('Konya'),
('Antalya'), ('Gaziantep'), ('Samsun'), ('Kayseri'), ('Þanlýurfa'), ('Trabzon'),
('Muðla'), ('Malatya'), ('Sakarya'), ('Tekirdað'), ('Kocaeli'), ('Adana'),
('Manisa'), ('Ordu'), ('Denizli'), ('Afyonkarahisar'), ('Nevþehir'), ('Rize'),
('Kütahya'), ('Erzurum'), ('Sivas'), ('Elazýð'), ('Hatay'), ('Çorum'),
('Kýrklareli'), ('Edirne'), ('Amasya'), ('Isparta'), ('Mardin'), ('Kars'),
('Giresun'), ('Bartýn'), ('Sinop'), ('Tokat'), ('Bolu'), ('Düzce');

-- 1000 rastgele müþteri verisi eklenmesi için döngü
WHILE @i <= 100000
BEGIN
    -- Rastgele ad seçimi
    SELECT TOP 1 @Ad = Ad FROM @Isimler ORDER BY NEWID();

    -- Rastgele soyad seçimi
    SELECT TOP 1 @Soyad = Soyad FROM @Soyadlar ORDER BY NEWID();

    -- Rastgele e-posta oluþturma
    SET @Email = LOWER(@Ad) + LOWER(@Soyad) +'@gmail.com';

    -- Rastgele þehir seçimi
    SELECT TOP 1 @Sehir = Sehir FROM @Sehirler ORDER BY NEWID();

    -- Rastgele telefon numarasý oluþturma (05XX XXX XXXX formatýnda)
    SET @Telefon = '05' + CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 9 + 1) AS NVARCHAR(1)) + 
                   CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 900 + 100) AS NVARCHAR(3)) + 
                   CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 9000 + 1000) AS NVARCHAR(4));

    -- Rastgele adres oluþturma
    SET @Adres = @Sehir + ' Mahallesi, No: ' + CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 100 + 1) AS NVARCHAR(3));

    -- Rastgele TC Kimlik Numarasý oluþturma (11 haneli)
	
		-- Ýlk hane 1-9 arasý rastgele bir rakam
	SET @TC = CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 9) + 1 AS NVARCHAR);

	-- Kalan 9 hane için rastgele rakamlar (10. hane)
	WHILE LEN(@TC) < 10
	BEGIN
		SET @TC = @TC + CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 10) AS NVARCHAR);
	END

	-- 11. hane için tek sayý oluþtur
	SET @TC = @TC + CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 5) * 2 + 1 AS NVARCHAR); -- 1, 3, 5, 7, 9


    INSERT INTO Musteriler(musteriAd, musteriSoyad, musteriTelefon, musteriEmail, musteriAdres,musteriTC)
    VALUES (@Ad, @Soyad, @Telefon, @Email, @Adres,@TC);

    -- Sayaç artýrma
    SET @i = @i + 1;
END*/
/*DELETE FROM musteriler;
DBCC CHECKIDENT ('musteriler', RESEED, 0);*/
------------------------------------------------------------------
--------------------------------------------------------------------
--ODA TABLOSUNA VERÝ EKLEME---
/* DECLARE @k int =1;
 Declare @l int =1;
 declare @odanumarasi int;
 declare @odatipi nvarchar(20);
 declare @odafiyati decimal(10,2);
 declare @odadurumu nvarchar(20);
 ---oda durumu 
 declare @odadurumutable table (odadurumu nvarchar(20));
 insert into @odadurumutable values ('dolu'),('boþ'),('Tadilat'),('temizlik');
 ----------------------------------------------------------------------------------
 declare @odatipitable table (odatipi nvarchar(20));
 ----oda tipi
 insert into @odatipitable values ('Tek Kiþilik Oda'),('Çift Kiþilik Oda'),('üç Kiþilik Oda'),('Aile Odasý'),
 ('Süit Oda'),('Deluxe Oda'),('King Oda'),('Queen Oda'),('Balayý Süiti '),('Spa Süiti'),('Yüzme Havuzlu Oda'),
 ('Panoramik Oda:'),('Engelli Dostu Oda');
 -----------------------------------------------------------------------------------
 ----oda numarasý
 declare @odanumarasitable table(odanumarasi int);
  --SET @odanumarasi = FLOOR(RAND(CHECKSUM(NEWID())) * 1000) + 1;
 --insert into @odanumarasitable values (@OdaNumarasý)
 while @l <10000
 begin
	 SET @odanumarasi = FLOOR(RAND(CHECKSUM(NEWID())) * 1000) + 1;
	 SET @OdaFiyati = CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 4001) + 1000 AS DECIMAL(10,2));

	 select @odatipi =odatipi from @odatipitable ORDER BY NEWID();
	 select @odadurumu = odadurumu from @odadurumutable order by newid();
	 insert into odalar(odaNumarasi,odatipi,odafiyati,odaDurumu) values(@odanumarasi,@odatipi,@odafiyati,@odadurumu);
	 set @l=@l+1;
  end
 */
 -------------------------
 select * from odalar
 ----------------------------------------------------
 -- Oda servisleri için deðiþkenleri tanýmlama 
 ---------------------------------------------------------
 /*DECLARE @odaID INT;
DECLARE @servisTuru NVARCHAR(50);
DECLARE @servisTarihi DATE;
DECLARE @fiyat DECIMAL(10, 2);

-- Servis türleri için tablo oluþturma
DECLARE @servisTuruTable TABLE (servisTuru NVARCHAR(50));
INSERT INTO @servisTuruTable VALUES 
('Oda Temizliði'), ('Oda Servisi'), ('Çamaþýrhane Servisi'), ('Minibar Servisi'), 
('Spa Hizmeti'), ('Yemek Servisi'), ('Wi-Fi Kullanýmý'), ('Klima Bakýmý'), ('TV Servisi');

-- Oda servislerine rastgele veri eklemek için döngü
DECLARE @i INT = 1;
WHILE @i <= 10000 
BEGIN
    
    SELECT TOP 1 @odaID = odaID FROM odalar ORDER BY NEWID();--odalar tablosundan sesçme
    SELECT TOP 1 @servisTuru = servisTuru FROM @servisTuruTable ORDER BY NEWID();
	
	SET @servisTarihi = DATEADD(DAY, -FLOOR(RAND(CHECKSUM(NEWID())) * 365), GETDATE());

    
    SET @fiyat = CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 451) + 50 AS DECIMAL(10, 2));--  50 ile 500 TL arasýnda
   
    INSERT INTO odaservisleri (odaID, servisTuru, servistarihi, fiyat)
    VALUES (@odaID, @servisTuru, @servisTarihi, @fiyat);

    SET @i = @i + 1;
END;*/
---------------------------------------
----rezervasyon tablosuna veri ekleme 
/*
declare @odaid int;
declare @musterid int;
declare @giristarihi date;
declare @cikistarihi date;
declare @durum nvarchar(20);

declare @durumlar table(durum nvarchar(20));
insert into @durumlar values('onaylandý'),('bekliyor'),('iptal edildi');
declare @i int=1;
while @i<100000
	begin
	 SELECT TOP 1 @odaid = odaID FROM odalar ORDER BY NEWID();
	 SELECT TOP 1 @musterid=musteriID from musteriler order by newid();
	 select top 1 @durum=durum from @durumlar order by newid();
	if @durum = 'onaylandý'
    begin
        set @giristarihi = DATEADD(day, -ABS(CHECKSUM(NEWID()) % 30), GETDATE()); -- son 30 gün içinden rastgele bir tarih
        set @cikistarihi = DATEADD(day, ABS(CHECKSUM(NEWID()) % 10), @giristarihi); -- giriþ tarihinden 1-10 gün sonrasýna kadar çýkýþ
    end

    if @durum = 'bekliyor'
    begin
        set @giristarihi = DATEADD(day, ABS(CHECKSUM(NEWID()) % 30), GETDATE()); -- gelecekteki 30 gün içinde bir giriþ tarihi
        set @cikistarihi = DATEADD(day, ABS(CHECKSUM(NEWID()) % 10), @giristarihi); -- giriþ tarihinden 1-10 gün sonrasýna kadar çýkýþ
    end

    if @durum = 'iptal edildi'
    begin
        set @giristarihi = NULL; -- Ýptal edilen rezervasyon için tarih olmasýn
        set @cikistarihi = NULL;
    end

    INSERT INTO rezervasyon(odaID, musteriID, girisTarihi, cikisTarihi, durum)
    VALUES (@odaid, @musterid, @giristarihi, @cikistarihi, @durum);
    set @i = @i + 1;
	end
	*/


------ÖDEMELER TABLOSU OLUÞTURMA 
--------------------------------------------------------

/*DECLARE @rezervasyonid INT;
DECLARE @odememiktari INT;
DECLARE @odemetarihi DATE;
DECLARE @odemeturu NVARCHAR(10);
DECLARE @rezervasyonmiktar INT;


SELECT @rezervasyonmiktar = COUNT(*) 
FROM rezervasyon;


DECLARE @odemeturleri TABLE(odemeturleri NVARCHAR(10));
INSERT INTO @odemeturleri VALUES ('nakit'),('kart'),('havale');


DECLARE @i INT = 1;

WHILE @i <= @rezervasyonmiktar 
BEGIN
   
    SELECT 
        @rezervasyonid = r.rezervasyonID,
        @odemetarihi = r.giristarihi,
        @odememiktari = DATEDIFF(DAY, r.giristarihi, r.cikistarihi) * o.odafiyati
    FROM 
        rezervasyon r
    INNER JOIN 
        odalar o ON r.odaID = o.odaID
     WHERE 
        r.rezervasyonID = @i;
	if @odemetarihi is null or @odemetarihi>getdate()
		begin
			set @odemeturu='iþlem yok';
		end

	
	else
		begin
			 select top 1 @odemeturu =odemeturleri from @odemeturleri order by newid();
		end
 
    insert into odemeler(rezervasyonID,odememiktari,odemeTArihi,odemeTuru)
	values(@rezervasyonid,@odememiktari,@odemetarihi,@odemeturu);

    
    SET @i = @i + 1;
END*/


------------------------------------------

select*from odemeler 
select *from rezervasyon
select * from odalar

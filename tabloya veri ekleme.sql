USE otelDB;
----------------------------------------------------
--MÜŞTERİ TABLOSUNA RANDOM VERİ OLUŞTURMA--
-------------------------------------------------
-- Gerekli değişkenleri tanımlıyoruz
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
-- İsimler tablosu
DECLARE @Isimler TABLE (Ad NVARCHAR(50));
INSERT INTO @Isimler (Ad) VALUES
('Ahmet'), ('Mehmet'), ('Ayşe'), ('Fatma'), ('Ali'), ('Veli'),
('Elif'), ('Zeynep'), ('Hasan'), ('Hüseyin'), ('Emine'), ('Selin'),
('Kemal'), ('Leyla'), ('Murat'), ('Hakan'), ('Cem'), ('Sibel'),
('Merve'), ('Barış'), ('Gül'), ('Melike'), ('Burak'), ('Furkan'),
('Berk'), ('Serkan'), ('Deniz'), ('Derya'), ('Ceren'), ('Gizem'),
('Yağmur'), ('Esra'), ('Can'), ('Bora'), ('Nazlı'), ('Zehra');

-- Soyadlar tablosu
DECLARE @Soyadlar TABLE (Soyad NVARCHAR(50));
INSERT INTO @Soyadlar VALUES
('Kaya'), ('Yılmaz'), ('Koşar'), ('Çelik'), ('Demir'), ('Yıldız'),
('Aydın'), ('Korkmaz'), ('Özdemir'), ('Koç'), ('Doğan'), ('Şahin'),
('Eren'), ('Çiçek'), ('Aşkın'), ('Karabulut'), ('Aksoy'), ('Güler'),
('Uzun'), ('Acar'), ('Polat'), ('Büyük'), ('Sezer'), ('Bozkurt'),
('Yavuz'), ('Güneş'), ('Aslan'), ('Sevinç'), ('Erden'), ('Öztürk'),
('Duman'), ('Şen'), ('Toprak'), ('Korkut'), ('Işık'), ('Özcan');

-- Şehirler tablosu
DECLARE @Sehirler TABLE(Sehir NVARCHAR(50));
INSERT INTO @Sehirler VALUES
('İstanbul'), ('Ankara'), ('Mersin'), ('İzmir'), ('Van'), ('Diyarbakır'),
('Bursa'), ('Aydın'), ('Balıkesir'), ('Eskişehir'), ('Adıyaman'), ('Konya'),
('Antalya'), ('Gaziantep'), ('Samsun'), ('Kayseri'), ('Şanlıurfa'), ('Trabzon'),
('Muğla'), ('Malatya'), ('Sakarya'), ('Tekirdağ'), ('Kocaeli'), ('Adana'),
('Manisa'), ('Ordu'), ('Denizli'), ('Afyonkarahisar'), ('Nevşehir'), ('Rize'),
('Kütahya'), ('Erzurum'), ('Sivas'), ('Elazığ'), ('Hatay'), ('Çorum'),
('Kırklareli'), ('Edirne'), ('Amasya'), ('Isparta'), ('Mardin'), ('Kars'),
('Giresun'), ('Bartın'), ('Sinop'), ('Tokat'), ('Bolu'), ('Düzce');

-- 1000 rastgele müşteri verisi eklenmesi için döngü
WHILE @i <= 100000
BEGIN
    -- Rastgele ad seçimi
    SELECT TOP 1 @Ad = Ad FROM @Isimler ORDER BY NEWID();

    -- Rastgele soyad seçimi
    SELECT TOP 1 @Soyad = Soyad FROM @Soyadlar ORDER BY NEWID();

    -- Rastgele e-posta oluşturma
    SET @Email = LOWER(@Ad) + LOWER(@Soyad) +'@gmail.com';

    -- Rastgele şehir seçimi
    SELECT TOP 1 @Sehir = Sehir FROM @Sehirler ORDER BY NEWID();

    -- Rastgele telefon numarası oluşturma (05XX XXX XXXX formatında)
    SET @Telefon = '05' + CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 9 + 1) AS NVARCHAR(1)) + 
                   CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 900 + 100) AS NVARCHAR(3)) + 
                   CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 9000 + 1000) AS NVARCHAR(4));


SET @Adres = @Sehir + ' Mahallesi, No: ' + CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 100 + 1) AS NVARCHAR(3));

    
	
		-- İlk hane 1-9 arası rastgele bir rakam
	SET @TC = CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 9) + 1 AS NVARCHAR);

	-- Kalan 9 hane için rastgele rakamlar (10. hane)
	WHILE LEN(@TC) < 10
	BEGIN
		SET @TC = @TC + CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 10) AS NVARCHAR);
	END

	
	SET @TC = @TC + CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 5) * 2 + 1 AS NVARCHAR); 


    INSERT INTO Musteriler(musteriAd, musteriSoyad, musteriTelefon, musteriEmail, musteriAdres,musteriTC)
    VALUES (@Ad, @Soyad, @Telefon, @Email, @Adres,@TC);

    -- Sayaç artırma
    SET @i = @i + 1;
END*/
/*DELETE FROM musteriler;
DBCC CHECKIDENT ('musteriler', RESEED, 0);*/
------------------------------------------------------------------
--------------------------------------------------------------------
--ODA TABLOSUNA VERİ EKLEME---
/* DECLARE @k int =1;
 Declare @l int =1;
 declare @odanumarasi int;
 declare @odatipi nvarchar(20);
 declare @odafiyati decimal(10,2);
 declare @odadurumu nvarchar(20);
 ---oda durumu 
 declare @odadurumutable table (odadurumu nvarchar(20));
 insert into @odadurumutable values ('dolu'),('boş'),('Tadilat'),('temizlik');
 ----------------------------------------------------------------------------------
 declare @odatipitable table (odatipi nvarchar(20));
 ----oda tipi
 insert into @odatipitable values ('Tek Kişilik Oda'),('Çift Kişilik Oda'),('üç Kişilik Oda'),('Aile Odası'),
 ('Süit Oda'),('Deluxe Oda'),('King Oda'),('Queen Oda'),('Balayı Süiti '),('Spa Süiti'),('Yüzme Havuzlu Oda'),
 ('Panoramik Oda:'),('Engelli Dostu Oda');
 -----------------------------------------------------------------------------------
 ----oda numarası
 declare @odanumarasitable table(odanumarasi int);
  --SET @odanumarasi = FLOOR(RAND(CHECKSUM(NEWID())) * 1000) + 1;
 --insert into @odanumarasitable values (@OdaNumarası)
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
 -- Oda servisleri için değişkenleri tanımlama 
 ---------------------------------------------------------
 /*DECLARE @odaID INT;
DECLARE @servisTuru NVARCHAR(50);
DECLARE @servisTarihi DATE;
DECLARE @fiyat DECIMAL(10, 2);

-- Servis türleri için tablo oluşturma
DECLARE @servisTuruTable TABLE (servisTuru NVARCHAR(50));
INSERT INTO @servisTuruTable VALUES 
('Oda Temizliği'), ('Oda Servisi'), ('Çamaşırhane Servisi'), ('Minibar Servisi'), 
('Spa Hizmeti'), ('Yemek Servisi'), ('Wi-Fi Kullanımı'), ('Klima Bakımı'), ('TV Servisi');

-- Oda servislerine rastgele veri eklemek için döngü
DECLARE @i INT = 1;
WHILE @i <= 10000 
BEGIN
    
    SELECT TOP 1 @odaID = odaID FROM odalar ORDER BY NEWID();--odalar tablosundan sesçme
    SELECT TOP 1 @servisTuru = servisTuru FROM @servisTuruTable ORDER BY NEWID();
	
	SET @servisTarihi = DATEADD(DAY, -FLOOR(RAND(CHECKSUM(NEWID())) * 365), GETDATE());

    
    SET @fiyat = CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 451) + 50 AS DECIMAL(10, 2));--  50 ile 500 TL arasında
   
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
insert into @durumlar values('onaylandı'),('bekliyor'),('iptal edildi');
declare @i int=1;
while @i<100000
	begin
	 SELECT TOP 1 @odaid = odaID FROM odalar ORDER BY NEWID();
	 SELECT TOP 1 @musterid=musteriID from musteriler order by newid();
	 select top 1 @durum=durum from @durumlar order by newid();
	if @durum = 'onaylandı'
    begin
        set @giristarihi = DATEADD(day, -ABS(CHECKSUM(NEWID()) % 30), GETDATE()); -- son 30 gün içinden rastgele bir tarih
        set @cikistarihi = DATEADD(day, ABS(CHECKSUM(NEWID()) % 10), @giristarihi); -- giriş tarihinden 1-10 gün sonrasına kadar çıkış
    end

    if @durum = 'bekliyor'
    begin
        set @giristarihi = DATEADD(day, ABS(CHECKSUM(NEWID()) % 30), GETDATE()); -- gelecekteki 30 gün içinde bir giriş tarihi
        set @cikistarihi = DATEADD(day, ABS(CHECKSUM(NEWID()) % 10), @giristarihi); -- giriş tarihinden 1-10 gün sonrasına kadar çıkış
    end

    if @durum = 'iptal edildi'
    begin
        set @giristarihi = NULL; -- İptal edilen rezervasyon için tarih olmasın
        set @cikistarihi = NULL;
    end

    INSERT INTO rezervasyon(odaID, musteriID, girisTarihi, cikisTarihi, durum)
    VALUES (@odaid, @musterid, @giristarihi, @cikistarihi, @durum);
    set @i = @i + 1;
	end
	*/


------ÖDEMELER TABLOSU OLUŞTURMA 
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
			set @odemeturu='işlem yok';
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

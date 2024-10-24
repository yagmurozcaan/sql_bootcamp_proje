USE otelDB;
----------------------------------------------------
--M��TER� TABLOSUNA RANDOM VER� OLU�TURMA--
-------------------------------------------------
-- Gerekli de�i�kenleri tan�ml�yoruz
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
-- �simler tablosu
DECLARE @Isimler TABLE (Ad NVARCHAR(50));
INSERT INTO @Isimler (Ad) VALUES
('Ahmet'), ('Mehmet'), ('Ay�e'), ('Fatma'), ('Ali'), ('Veli'),
('Elif'), ('Zeynep'), ('Hasan'), ('H�seyin'), ('Emine'), ('Selin'),
('Kemal'), ('Leyla'), ('Murat'), ('Hakan'), ('Cem'), ('Sibel'),
('Merve'), ('Bar��'), ('G�l'), ('Melike'), ('Burak'), ('Furkan'),
('Berk'), ('Serkan'), ('Deniz'), ('Derya'), ('Ceren'), ('Gizem'),
('Ya�mur'), ('Esra'), ('Can'), ('Bora'), ('Nazl�'), ('Zehra');

-- Soyadlar tablosu
DECLARE @Soyadlar TABLE (Soyad NVARCHAR(50));
INSERT INTO @Soyadlar VALUES
('Kaya'), ('Y�lmaz'), ('Ko�ar'), ('�elik'), ('Demir'), ('Y�ld�z'),
('Ayd�n'), ('Korkmaz'), ('�zdemir'), ('Ko�'), ('Do�an'), ('�ahin'),
('Eren'), ('�i�ek'), ('A�k�n'), ('Karabulut'), ('Aksoy'), ('G�ler'),
('Uzun'), ('Acar'), ('Polat'), ('B�y�k'), ('Sezer'), ('Bozkurt'),
('Yavuz'), ('G�ne�'), ('Aslan'), ('Sevin�'), ('Erden'), ('�zt�rk'),
('Duman'), ('�en'), ('Toprak'), ('Korkut'), ('I��k'), ('�zcan');

-- �ehirler tablosu
DECLARE @Sehirler TABLE(Sehir NVARCHAR(50));
INSERT INTO @Sehirler VALUES
('�stanbul'), ('Ankara'), ('Mersin'), ('�zmir'), ('Van'), ('Diyarbak�r'),
('Bursa'), ('Ayd�n'), ('Bal�kesir'), ('Eski�ehir'), ('Ad�yaman'), ('Konya'),
('Antalya'), ('Gaziantep'), ('Samsun'), ('Kayseri'), ('�anl�urfa'), ('Trabzon'),
('Mu�la'), ('Malatya'), ('Sakarya'), ('Tekirda�'), ('Kocaeli'), ('Adana'),
('Manisa'), ('Ordu'), ('Denizli'), ('Afyonkarahisar'), ('Nev�ehir'), ('Rize'),
('K�tahya'), ('Erzurum'), ('Sivas'), ('Elaz��'), ('Hatay'), ('�orum'),
('K�rklareli'), ('Edirne'), ('Amasya'), ('Isparta'), ('Mardin'), ('Kars'),
('Giresun'), ('Bart�n'), ('Sinop'), ('Tokat'), ('Bolu'), ('D�zce');

-- 1000 rastgele m��teri verisi eklenmesi i�in d�ng�
WHILE @i <= 100000
BEGIN
    -- Rastgele ad se�imi
    SELECT TOP 1 @Ad = Ad FROM @Isimler ORDER BY NEWID();

    -- Rastgele soyad se�imi
    SELECT TOP 1 @Soyad = Soyad FROM @Soyadlar ORDER BY NEWID();

    -- Rastgele e-posta olu�turma
    SET @Email = LOWER(@Ad) + LOWER(@Soyad) +'@gmail.com';

    -- Rastgele �ehir se�imi
    SELECT TOP 1 @Sehir = Sehir FROM @Sehirler ORDER BY NEWID();

    -- Rastgele telefon numaras� olu�turma (05XX XXX XXXX format�nda)
    SET @Telefon = '05' + CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 9 + 1) AS NVARCHAR(1)) + 
                   CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 900 + 100) AS NVARCHAR(3)) + 
                   CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 9000 + 1000) AS NVARCHAR(4));

    -- Rastgele adres olu�turma
    SET @Adres = @Sehir + ' Mahallesi, No: ' + CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 100 + 1) AS NVARCHAR(3));

    -- Rastgele TC Kimlik Numaras� olu�turma (11 haneli)
	
		-- �lk hane 1-9 aras� rastgele bir rakam
	SET @TC = CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 9) + 1 AS NVARCHAR);

	-- Kalan 9 hane i�in rastgele rakamlar (10. hane)
	WHILE LEN(@TC) < 10
	BEGIN
		SET @TC = @TC + CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 10) AS NVARCHAR);
	END

	-- 11. hane i�in tek say� olu�tur
	SET @TC = @TC + CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 5) * 2 + 1 AS NVARCHAR); -- 1, 3, 5, 7, 9


    INSERT INTO Musteriler(musteriAd, musteriSoyad, musteriTelefon, musteriEmail, musteriAdres,musteriTC)
    VALUES (@Ad, @Soyad, @Telefon, @Email, @Adres,@TC);

    -- Saya� art�rma
    SET @i = @i + 1;
END*/
/*DELETE FROM musteriler;
DBCC CHECKIDENT ('musteriler', RESEED, 0);*/
------------------------------------------------------------------
--------------------------------------------------------------------
--ODA TABLOSUNA VER� EKLEME---
/* DECLARE @k int =1;
 Declare @l int =1;
 declare @odanumarasi int;
 declare @odatipi nvarchar(20);
 declare @odafiyati decimal(10,2);
 declare @odadurumu nvarchar(20);
 ---oda durumu 
 declare @odadurumutable table (odadurumu nvarchar(20));
 insert into @odadurumutable values ('dolu'),('bo�'),('Tadilat'),('temizlik');
 ----------------------------------------------------------------------------------
 declare @odatipitable table (odatipi nvarchar(20));
 ----oda tipi
 insert into @odatipitable values ('Tek Ki�ilik Oda'),('�ift Ki�ilik Oda'),('�� Ki�ilik Oda'),('Aile Odas�'),
 ('S�it Oda'),('Deluxe Oda'),('King Oda'),('Queen Oda'),('Balay� S�iti '),('Spa S�iti'),('Y�zme Havuzlu Oda'),
 ('Panoramik Oda:'),('Engelli Dostu Oda');
 -----------------------------------------------------------------------------------
 ----oda numaras�
 declare @odanumarasitable table(odanumarasi int);
  --SET @odanumarasi = FLOOR(RAND(CHECKSUM(NEWID())) * 1000) + 1;
 --insert into @odanumarasitable values (@OdaNumaras�)
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
 -- Oda servisleri i�in de�i�kenleri tan�mlama 
 ---------------------------------------------------------
 /*DECLARE @odaID INT;
DECLARE @servisTuru NVARCHAR(50);
DECLARE @servisTarihi DATE;
DECLARE @fiyat DECIMAL(10, 2);

-- Servis t�rleri i�in tablo olu�turma
DECLARE @servisTuruTable TABLE (servisTuru NVARCHAR(50));
INSERT INTO @servisTuruTable VALUES 
('Oda Temizli�i'), ('Oda Servisi'), ('�ama��rhane Servisi'), ('Minibar Servisi'), 
('Spa Hizmeti'), ('Yemek Servisi'), ('Wi-Fi Kullan�m�'), ('Klima Bak�m�'), ('TV Servisi');

-- Oda servislerine rastgele veri eklemek i�in d�ng�
DECLARE @i INT = 1;
WHILE @i <= 10000 
BEGIN
    
    SELECT TOP 1 @odaID = odaID FROM odalar ORDER BY NEWID();--odalar tablosundan ses�me
    SELECT TOP 1 @servisTuru = servisTuru FROM @servisTuruTable ORDER BY NEWID();
	
	SET @servisTarihi = DATEADD(DAY, -FLOOR(RAND(CHECKSUM(NEWID())) * 365), GETDATE());

    
    SET @fiyat = CAST(FLOOR(RAND(CHECKSUM(NEWID())) * 451) + 50 AS DECIMAL(10, 2));--  50 ile 500 TL aras�nda
   
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
insert into @durumlar values('onayland�'),('bekliyor'),('iptal edildi');
declare @i int=1;
while @i<100000
	begin
	 SELECT TOP 1 @odaid = odaID FROM odalar ORDER BY NEWID();
	 SELECT TOP 1 @musterid=musteriID from musteriler order by newid();
	 select top 1 @durum=durum from @durumlar order by newid();
	if @durum = 'onayland�'
    begin
        set @giristarihi = DATEADD(day, -ABS(CHECKSUM(NEWID()) % 30), GETDATE()); -- son 30 g�n i�inden rastgele bir tarih
        set @cikistarihi = DATEADD(day, ABS(CHECKSUM(NEWID()) % 10), @giristarihi); -- giri� tarihinden 1-10 g�n sonras�na kadar ��k��
    end

    if @durum = 'bekliyor'
    begin
        set @giristarihi = DATEADD(day, ABS(CHECKSUM(NEWID()) % 30), GETDATE()); -- gelecekteki 30 g�n i�inde bir giri� tarihi
        set @cikistarihi = DATEADD(day, ABS(CHECKSUM(NEWID()) % 10), @giristarihi); -- giri� tarihinden 1-10 g�n sonras�na kadar ��k��
    end

    if @durum = 'iptal edildi'
    begin
        set @giristarihi = NULL; -- �ptal edilen rezervasyon i�in tarih olmas�n
        set @cikistarihi = NULL;
    end

    INSERT INTO rezervasyon(odaID, musteriID, girisTarihi, cikisTarihi, durum)
    VALUES (@odaid, @musterid, @giristarihi, @cikistarihi, @durum);
    set @i = @i + 1;
	end
	*/


------�DEMELER TABLOSU OLU�TURMA 
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
			set @odemeturu='i�lem yok';
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

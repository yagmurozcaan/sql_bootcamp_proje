create database otelDB
use otelDB
-----tablo taslaklar�n� olu�turma i�lemleri:

--odalar tablosu olu�turma
create table odalar(
	odaID int primary key identity (1,1),
	odaNumarasi nvarchar(10),
	odatipi nvarchar(20),
	odafiyati decimal(10,2),
	odaDurumu nvarchar(10)
	)
-------------------------------------
-- m��teriler tablosu olu�turma
create table musteriler(
	musteriID int primary key identity(1,1),
	musteriAd nvarchar(50),
	musteriSoyad nvarchar(50),
	musteriTelefon nvarchar(20),
	musteriEmail nvarchar(20),
	musteriAdres nvarchar(100),
	musteriTC nvarchar(20),
)
--rezervasyon tablosu olu�turma
create table rezervasyon(
	rezervasyonID int primary key identity(1,1),
	odaID int,
	musteriID int,
	giristarihi DATE,
	cikistarihi DATE,
	durum nvarchar,
	FOREIGN KEY (odaID) REFERENCES odalar(odaID) ON DELETE CASCADE,
    FOREIGN KEY (musteriID) REFERENCES musteriler(musteriID) ON DELETE CASCADE
)
--�demeler tablosu olu�turma
create table odemeler(
	odemeID int primary key identity(1,1),
	rezervasyonID int,
	odememiktari decimal(10,2),
	odemeTArihi DATE,
	odemeTuru nvarchar(10)
	FOREIGN KEY (rezervasyonID) REFERENCES rezervasyon(rezervasyonID) ON DELETE CASCADE
)
-- oda servisleri tablosu olu�turma 
create table odaservisleri(
	servisID int primary key identity(1,1),
	odaID int,
	servisTuru nvarchar(50),
	servistarihi DATE,
	fiyat decimal(10,2),
	FOREIGN KEY (odaID) REFERENCES odalar(odaID) ON DELETE CASCADE
)
-- personel tablosu olu�turma
 create table personel(
	personelID int primary key identity (1,1),
	personelAd nvarchar(20),
	personelSoyad nvarchar(20),
	gorev nvarchar(20),
	personelTelefon nvarchar (20),
	personelEmail nvarchar(50),
	vardiyaVakti nvarchar(20),
 )

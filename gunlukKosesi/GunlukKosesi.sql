CREATE DATABASE Gunluk_KosesiDB
GO
USE Gunluk_KosesiDB
GO
CREATE TABLE YoneticiTurleri
(
	ID int IDENTITY(1,1),
	Isim nvarchar(50),
	CONSTRAINT pk_yoneticiTur PRIMARY KEY(ID)
)
GO
INSERT INTO YoneticiTurleri(Isim) VALUES('Admin')
INSERT INTO YoneticiTurleri(Isim) VALUES('Mod')
GO
CREATE TABLE Yoneticiler
(
	ID int IDENTITY(1,1),
	YoneticiTurID int,
	Isim nvarchar(50),
	Soyisim nvarchar(50),
	KullaniciAdi nvarchar(50),
	Mail nvarchar(120),
	Sifre nvarchar(20),
	Durum bit,
	Silinmis bit,
	CONSTRAINT pk_yonetici PRIMARY KEY(ID),
	CONSTRAINT fk_yoneticiYoneticiTur FOREIGN KEY(YoneticiTurID)
	REFERENCES YoneticiTurleri(ID)
)
GO
INSERT INTO Yoneticiler(YoneticiTurID, Isim, Soyisim,KullaniciAdi,Mail,Sifre,Durum,Silinmis)
VALUES(1, 'Furkan', 'Kocaoðlu','Admin','furkankocaoglu26@gmail.com','00174235',1,0)
GO
CREATE TABLE Gunlukler
(
	ID int IDENTITY(1000,1),
	Baslik nvarchar(250),
	Icerik ntext,
	OlusturmaTarihi Datetime,
	GoruntulemeSayisi bigint,
	Durum bit,
	CONSTRAINT pk_gunluk PRIMARY KEY(ID),
	CONSTRAINT fk_gunlukyonetýcý FOREIGN KEY(ID)
	REFERENCES Yoneticiler(ID)
)
GO
CREATE TABLE Uyeler
(
	ID int IDENTITY(1598756,1),
	Isim nvarchar(50),
	Soyisim nvarchar(50),
	KullaniciAdi nvarchar(50),
	Mail nvarchar(120),
	Sifre nvarchar(20),
	Durum bit,
	Silinmis bit,
	CONSTRAINT pk_Uye PRIMARY KEY(ID)
)
GO
CREATE TABLE Yorumlar
(
	ID int IDENTITY(1,1),
	MakaleID int,
	UyeID int,
	Icerik nvarchar(500),
	EklemeTarihi datetime,
	Durum bit,
	CONSTRAINT pk_Yorum PRIMARY KEY(ID),
	CONSTRAINT fk_yorumgunluk FOREIGN KEY(ID)
	REFERENCES Gunlukler(ID),
	CONSTRAINT fk_yorumUye FOREIGN KEY(UyeID)
	REFERENCES Uyeler(ID)
)
GO
CREATE TABLE GunlukGoruntuleme
(
    ID int IDENTITY(1,1),
    GunlukID int,
    UyeID int,
    GoruntulemeTarihi datetime,
	CONSTRAINT pk_gunlukgoruntu PRIMARY KEY(ID),
    CONSTRAINT fk_gunlukgoruntugunluk FOREIGN KEY(GunlukID) REFERENCES Gunlukler(ID),
	CONSTRAINT fk_gunlukgoruntuUye FOREIGN KEY(UyeID) REFERENCES Uyeler(ID)
)
GO
CREATE TABLE YorumYanýtlar
(
    ID int IDENTITY(1,1),      
    YorumID int,                 
    YanýtIcerik nvarchar(500),           
    EklemeTarihi datetime,
	CONSTRAINT pk_YorumYanýt PRIMARY KEY(ID),
	CONSTRAINT fk_YorumYanýtYorum FOREIGN KEY(YorumID) REFERENCES Yorumlar(ID),  
)
GO
CREATE TABLE Favoriler 
(
    ID INT IDENTITY(1,1),
	UyeID int,
	GunlukID int,
	EklemeTarihi datetime,
	CONSTRAINT pk_favori PRIMARY KEY(ID),
	CONSTRAINT fk_favoriUye FOREIGN KEY(UyeID) REFERENCES Uyeler(ID),
	CONSTRAINT fk_favorigunluk FOREIGN KEY(GunlukID) REFERENCES Gunlukler(ID)
)
GO
CREATE TABLE OneCikanGunlukYazilari 
(
    ID INT IDENTITY(1,1),
    GunlukID INT,
    EklenmeTarihi DATETIME 
	CONSTRAINT pk_OneCikanGunlukYazi PRIMARY KEY(ID),
	CONSTRAINT fk_OneCikanGunlukYazigunluk FOREIGN KEY(GunlukID)REFERENCES Gunlukler(ID)    
)
GO

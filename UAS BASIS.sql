-- Tabel Pembeli
CREATE TABLE Pembeli (
    ID_Pembeli INT PRIMARY KEY,  -- ID Pembeli sebagai primary key
    Nama_Pembeli VARCHAR(100),
    Alamat_Pembeli TEXT,
    No_Hp_Pembeli VARCHAR(15)
);

-- Tabel Penjual
CREATE TABLE Penjual (
    ID_Penjual INT PRIMARY KEY,  -- ID Penjual sebagai primary key
    Nama_Penjual VARCHAR(100)
);

-- Tabel Produk
CREATE TABLE Produk (
    ID_Produk INT PRIMARY KEY,  -- ID Produk sebagai primary key
    Nama_Produk VARCHAR(255),
    Variasi VARCHAR(100),
    Harga_Produk DECIMAL(10, 2)
);

-- Tabel Pesanan
CREATE TABLE Pesanan (
    ID_Pesanan INT PRIMARY KEY,  -- ID Pesanan sebagai primary key
    ID_Pembeli INT,
    ID_Penjual INT,
    Waktu_Pembayaran DATE NOT NULL,  -- Menggunakan DATE untuk menyimpan hanya tanggal
    Metode_Pembayaran VARCHAR(50),
    Jasa_Kirim VARCHAR(50),
    Total_Pembayaran DECIMAL(10, 2),
    FOREIGN KEY (ID_Pembeli) REFERENCES Pembeli(ID_Pembeli),
    FOREIGN KEY (ID_Penjual) REFERENCES Penjual(ID_Penjual)
);

-- Tabel Detail_Pesanan
CREATE TABLE Detail_Pesanan (
    ID_Detail_Pesanan INT PRIMARY KEY,  -- ID Detail Pesanan sebagai primary key
    ID_Pesanan INT,
    ID_Produk INT,
    Kuantitas INT,
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (ID_Pesanan) REFERENCES Pesanan(ID_Pesanan),
    FOREIGN KEY (ID_Produk) REFERENCES Produk(ID_Produk)
);

-- Tabel Biaya_Tambahan
CREATE TABLE Biaya_Tambahan (
    ID_Biaya INT PRIMARY KEY,  -- ID Biaya sebagai primary key
    ID_Pesanan INT,
    Subtotal_Pengiriman DECIMAL(10, 2),
    Biaya_Layanan DECIMAL(10, 2),
    Diskon_Pengiriman DECIMAL(10, 2),
    FOREIGN KEY (ID_Pesanan) REFERENCES Pesanan(ID_Pesanan)
);

-- Data ke Tabel Pembeli
INSERT INTO Pembeli (ID_Pembeli, Nama_Pembeli, Alamat_Pembeli, No_Hp_Pembeli)
VALUES (1, 'ramacand', 'jl.dr.soetomo', '081575471245');

-- Data ke Tabel Penjual
INSERT INTO Penjual (ID_Penjual, Nama_Penjual)
VALUES (1, 'Bantex Indonesia Official Shop');

-- Data ke Tabel Produk
INSERT INTO Produk (ID_Produk, Nama_Produk, Variasi, Harga_Produk)
VALUES (1, 'BigBoss Loose Leaf B5 Bergaris 100 Lembar', '-', 9240);

-- Data ke Tabel Pesanan
INSERT INTO Pesanan (ID_Pesanan, ID_Pembeli, ID_Penjual, Waktu_Pembayaran, Metode_Pembayaran, Jasa_Kirim, Total_Pembayaran)
VALUES (1, 1, 1, '2023-11-20 00:00:00', 'Shopeepay', 'Hemat', 46960);

-- Data ke Tabel Detail_Pesanan
INSERT INTO Detail_Pesanan (ID_Detail_Pesanan, ID_Pesanan, ID_Produk, Kuantitas, Subtotal)
VALUES (1, 1, 1, 4, 36960);

-- Data ke Tabel Biaya_Tambahan
INSERT INTO Biaya_Tambahan (ID_Biaya, ID_Pesanan, Subtotal_Pengiriman, Biaya_Layanan, Diskon_Pengiriman)
VALUES (1, 1, 19000, 1000, 10000);

SELECT * FROM Pembeli;
SELECT * FROM Penjual;
SELECT * FROM Produk;
SELECT * FROM Pesanan;
SELECT * FROM Detail_Pesanan;
SELECT * FROM Biaya_Tambahan;

SELECT * 
FROM Pesanan
JOIN Pembeli ON Pesanan.ID_Pembeli = Pembeli.ID_Pembeli
JOIN Detail_Pesanan ON Pesanan.ID_Pesanan = Detail_Pesanan.ID_Pesanan
JOIN Produk ON Detail_Pesanan.ID_Produk = Produk.ID_Produk;

UPDATE Produk 
SET Harga_Produk = 9555 
WHERE ID_Produk = '1';

DELETE FROM Pembeli WHERE ID_Pembeli = '1';

CREATE ROLE super_user LOGIN PASSWORD 'password123';
GRANT ALL PRIVILEGES ON DATABASE "UAS BASIS SATA" TO super_user;

CREATE ROLE admin_user LOGIN PASSWORD 'password123';
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO admin_user;

CREATE ROLE basic_user LOGIN PASSWORD 'password123';
GRANT SELECT ON ALL TABLES IN SCHEMA public TO basic_user;

SELECT * FROM pg_roles WHERE rolname = 'nama_pengguna';
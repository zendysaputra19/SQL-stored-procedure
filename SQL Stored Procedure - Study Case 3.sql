-- Case Study 3
-- 1.  Membuat dan mengisi id_mbuku menggunakan Loop

DROP TABLE IF EXISTS id_buku;
DROP PROCEDURE IF EXISTS buatidbuku;

CREATE TABLE id_buku (id INT);

SELECT * FROM id_buku;

INSERT INTO id_buku VALUES (0);

DELIMITER $$
CREATE PROCEDURE buatidbuku() 
BEGIN 
	DECLARE Counter Int ;
	SET
		Counter = 0; 
	WHILE Counter <= 5 DO
		INSERT INTO
			id_buku (id)
		VALUES
			(Counter);
		SET
			Counter = Counter + 1;
	END WHILE;
END $$ DELIMITER ;

CALL buatidbuku();

SELECT * FROM id_buku;


-- 2. Membuat stored procedure untuk menghitung luas segitiga dan persegi panjang.
-- Stored procedure ini akan memiliki 4 parameter, yaitu:
-- a. jenis bangun datar (IN) (string), yaitu jenis bangun datar yang akan dihitung; saat ini kita hanya akan menghitung segitiga dan persegi panjang saja
-- b. x (IN) (float), yaitu jika jenis bangun datar segitiga, x adalah alas dan jika persegi panjang, x adalah panjang
-- c. y (IN) (float), yaitu jika jenis bangun datar segitiga, y adalah tinggi dan jika persegi panjang, y adalah lebar
-- d. luas (OUT) (float), yaitu luas bangun datar yang dihitung
-- e. keterangan (OUT) (string), yaitu keterangan apakah perhitungan berhasil dilakukan 
DELIMITER $$
CREATE PROCEDURE hitung_luas (
    IN jenis VARCHAR (255),
    IN x FLOAT,
    IN y FLOAT,
    OUT hasil FLOAT,
    OUT keterangan VARCHAR (255)
) BEGIN
    CASE
        WHEN jenis = 'segitiga' THEN SET hasil = 0.5 * x * y, keterangan = 'Perhitungan berhasil!';
        WHEN jenis = 'persegi panjang' THEN SET hasil = x * y, keterangan = 'Perhitungan berhasil!';
        ELSE SET hasil = NULL ; SET keterangan = 'Perhitungan gagal. Bangun datar tidak didukung';
    END CASE;
END $$
DELIMITER ;

-- segitiga
SET @jenis_bangun_datar = 'segitiga';
SET @x = 10 ; -- input angka berapapun, jenis data FLOAT
SET @y = 20 ; -- input angka berapapun, jenis data FLOAT

CALL hitung_luas(@jenis_bangun_datar, @x, @y, @luas, @keterangan);
SELECT @jenis_bangun_datar, @x, @y, @luas, @keterangan;

-- persegi panjang
SET @jenis_bangun_datar = 'persegi panjang';
SET @x = 10 ; -- atau angka berapapun, jenis data FLOAT
SET @y = 20 ; -- atau angka berapapun, jenis data FLOAT

CALL hitung_luas(@jenis_bangun_datar, @x, @y, @luas, @keterangan);
SELECT @jenis_bangun_datar, @x, @y, @luas, @keterangan;

-- lingkaran
SET @jenis_bangun_datar = 'lingkaran';-- atau SET @jenis_bangun_datar = 'persegi panjang'
SET @x = 10 ; -- atau angka berapapun, jenis data FLOAT
SET @y = 20 ; -- atau angka berapapun, jenis data FLOAT

CALL hitung_luas(@jenis_bangun_datar, @x, @y, @luas, @keterangan);
SELECT @jenis_bangun_datar, @x, @y, @luas, @keterangan;
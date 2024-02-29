-- Case Study 2
-- impor table StudentsPerformance.csv
SELECT * FROM ds.studentsperformance;

-- 1. Bagaimana query untuk membuat stored procedure yang menampilkan seluruh data pada tabel ds.studenstsperformance?
DELIMITER $$
CREATE PROCEDURE get_all_data () 
BEGIN
    SELECT * FROM ds.studentsperformance;
END $$
DELIMITER ;

CALL get_all_data();

-- 2. Buatlah stored procedure untuk memunculkan seluruh data dengan memasukkan race_or_ethnicity
-- Membuat stored procedure dengan memasukan parameter IN
DELIMITER $$
CREATE PROCEDURE get_all_data_by_race (IN race_group VARCHAR(100))
BEGIN
    SELECT * FROM ds.studentsperformance WHERE race_or_ethnicity = race_group;
END $$ 
DELIMITER ;

SET @race = 'group B' ;
CALL get_all_data_by_race(@race);

-- 3.a. Buatlah stored procedure untuk mendapatkan rata-rata nilai math pada tabel ds.studentsperformance
-- Membuat stored procedure dengan menggunakan parameter OUT
DELIMITER $$
CREATE PROCEDURE get_math_score_avg (OUT math_score_avg FLOAT)
BEGIN
    SELECT AVG(ds.studentsperformance.math_score) INTO math_score_avg
    FROM ds.studentsperformance;
END $$
DELIMITER ;

CALL get_math_score_avg(@rerata_nilai_math);
SELECT @rerata_nilai_math;

-- 3.b. Menampilkan seluruh data yang memiliki nilai math lebih dari rata-rata menggunakan output 3.a.
SELECT * FROM ds.studentsperformance WHERE reading_score > @rerata_nilai_math;

-- 4. Buat query stored procedure yang menghasilkan rata-rata nilai matematika dengan gender male
DELIMITER $$
CREATE PROCEDURE get_gend_math_score_avg (IN gender_var VARCHAR(255), OUT math_score_avg FLOAT)
BEGIN
    SELECT AVG(ds.studentsperformance.math_score) INTO math_score_avg
    FROM ds.studentsperformance WHERE gender = gender_var;
END $$ DELIMITER ;

SET @jenis_gender = 'male';
CALL get_gend_math_score_avg(@jenis_gender, @rerata_nilai_math);
SELECT @jenis_gender, @rerata_nilai_math;


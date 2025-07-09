CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    no_hp VARCHAR(20),
    role ENUM('siswa', 'admin') DEFAULT 'siswa',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tutor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    bio TEXT,
    keahlian VARCHAR(100),
    foto VARCHAR(255)
);

CREATE TABLE kategori (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100)
);

CREATE TABLE kelas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(255),
    deskripsi TEXT,
    harga DECIMAL(10,2),
    kategori_id INT,
    tutor_id INT,
    FOREIGN KEY (kategori_id) REFERENCES kategori(id),
    FOREIGN KEY (tutor_id) REFERENCES tutor(id)
);

CREATE TABLE modul (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kelas_id INT,
    nama VARCHAR(255),
    urutan INT,
    FOREIGN KEY (kelas_id) REFERENCES kelas(id)
);

CREATE TABLE material (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modul_id INT,
    judul VARCHAR(255),
    tipe ENUM('video', 'artikel', 'quiz'),
    konten TEXT,
    urutan INT,
    FOREIGN KEY (modul_id) REFERENCES modul(id)
);

CREATE TABLE pretest (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kelas_id INT,
    soal TEXT,
    jawaban TEXT,
    FOREIGN KEY (kelas_id) REFERENCES kelas(id)
);

CREATE TABLE kelas_saya (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    kelas_id INT,
    status ENUM('aktif', 'selesai') DEFAULT 'aktif',
    tanggal_mulai DATE,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (kelas_id) REFERENCES kelas(id)
);

CREATE TABLE review (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    kelas_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    komentar TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (kelas_id) REFERENCES kelas(id)
);

CREATE TABLE transaksi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    kelas_id INT,
    tanggal_order DATE,
    status ENUM('pending', 'berhasil', 'gagal') DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (kelas_id) REFERENCES kelas(id)
);

CREATE TABLE pembayaran (
    id INT AUTO_INCREMENT PRIMARY KEY,
    transaksi_id INT,
    metode VARCHAR(50),
    jumlah DECIMAL(10,2),
    tanggal_bayar DATE,
    FOREIGN KEY (transaksi_id) REFERENCES transaksi(id)
);

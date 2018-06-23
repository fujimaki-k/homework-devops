-- 実行環境用のデータベースを作成
CREATE DATABASE IF NOT EXISTS homework CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE homework;

-- 著者テーブルを作成
CREATE TABLE IF NOT EXISTS authors (
    author_id INTEGER NOT NULL AUTO_INCREMENT COMMENT "著者 ID",
    name VARCHAR(255) NOT NULL COMMENT "著者名",
    
    PRIMARY KEY(author_id)
) Engine = InnoDB;

-- 出版社テーブルを作成
CREATE TABLE IF NOT EXISTS publishers (
    publisher_id INTEGER NOT NULL AUTO_INCREMENT COMMENT "出版社 ID",
    name VARCHAR(255) NOT NULL COMMENT "出版社名",
    
    PRIMARY KEY(publisher_id)
) Engine = InnoDB;

-- 本テーブルを作成
CREATE TABLE IF NOT EXISTS books (
    book_id INTEGER NOT NULL AUTO_INCREMENT COMMENT "ID",
    title VARCHAR(255) NOT NULL COMMENT "本のタイトル",
    author_id INTEGER NOT NULL COMMENT "著者 ID",
    publisher_id INTEGER NOT NULL COMMENT "出版社 ID",

    PRIMARY KEY(id),
    FOREIGN KEY(author_id) REFERENCES authors(author_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY(author_id) REFERENCES publishers(publisher_id) ON UPDATE CASCADE ON DELETE RESTRICT
) Engine = InnoDB;



-- テスト用のデータベースを作成
CREATE DATABASE IF NOT EXISTS homework_test CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE homework_test;

-- 著者テーブルを作成
CREATE TABLE IF NOT EXISTS authors (
    author_id INTEGER NOT NULL AUTO_INCREMENT COMMENT "著者 ID",
    name VARCHAR(255) NOT NULL COMMENT "著者名",
    
    PRIMARY KEY(author_id)
) Engine = InnoDB;

-- 出版社テーブルを作成
CREATE TABLE IF NOT EXISTS publishers (
    publisher_id INTEGER NOT NULL AUTO_INCREMENT COMMENT "出版社 ID",
    name VARCHAR(255) NOT NULL COMMENT "出版社名",
    
    PRIMARY KEY(publisher_id)
) Engine = InnoDB;

-- 本テーブルを作成
CREATE TABLE IF NOT EXISTS books (
    book_id INTEGER NOT NULL AUTO_INCREMENT COMMENT "ID",
    title VARCHAR(255) NOT NULL COMMENT "本のタイトル",
    author_id INTEGER NOT NULL COMMENT "著者 ID",
    publisher_id INTEGER NOT NULL COMMENT "出版社 ID",

    PRIMARY KEY(book_id),
    FOREIGN KEY(author_id) REFERENCES authors(author_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY(publisher_id) REFERENCES publishers(publisher_id) ON UPDATE CASCADE ON DELETE RESTRICT
) Engine = InnoDB;

-- テーブルの内容をクリア
SET foreign_key_checks = 0;
TRUNCATE TABLE authors;
TRUNCATE TABLE publishers;
TRUNCATE TABLE books;
SET foreign_key_checks = 1;

-- テストデータの投入
INSERT INTO authors VALUES
    (1, "高坂穂乃果"),
    (2, "南ことり"),
    (3, "園田海未");

INSERT INTO publishers VALUES
    (1, "Printemps"),
    (2, "lily White");

INSERT INTO books VALUES
    (1, "ファイトだよっ！", 1, 1),
    (2, "（・８・）", 2, 1),
    (3, "ラブアローシュート！", 3, 2);


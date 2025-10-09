CREATE TABLE genres(
    id SERIAL PRIMARY KEY,
    name varchar(25) NOT NULL
);

CREATE TABLE videogames (
    id SERIAL PRIMARY KEY,
    genre_id INT NOT NULL REFERENCES genres(id),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price INT NOT NULL
);

CREATE TABLE videogame_images(
    id SERIAL PRIMARY KEY,
    videogame_id INT NOT NULL REFERENCES videogames(id),
    image_path varchar(255)
);


CREATE TABLE roles(
    id INT PRIMARY KEY,
    name varchar(8) NOT NULL
);


CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    email varchar(55),
    name varchar(55),
    password TEXT,
    role INT REFERENCES roles(id)
);

CREATE TABLE sales(
    id SERIAL PRIMARY KEY,
    buyer INT NOT NULL REFERENCES users(id),
    videogame INT NOT NULL REFERENCES videogames(id),
    nIntercambios INT NOT NULL,
    totalprice INT
);





INSERT INTO genres(name) VALUES('Acción');
INSERT INTO genres(name) VALUES('Plataformas');
INSERT INTO genres(name) VALUES('FPS');
INSERT INTO genres(name) VALUES('Estratégia');

SELECT * FROM genres;


INSERT INTO roles(id,name) VALUES(0,'Usuario');
INSERT INTO roles(id,name) VALUES(1,'Editor');
INSERT INTO roles(id,name) VALUES(2,'Admin');

SELECT * FROM roles;

INSERT INTO users(email,name,password,role) VALUES('admin','admin','admin',2);





INSERT INTO videogames(genre_id,name,price) VALUES(1,'Overcooked 2',10000);
INSERT INTO videogames(genre_id,name,description,price) VALUES(0,'The Last of Us™ Part I','Descubre el galardonado juego que inspiró la aclamada serie de televisión. Guía a Joel y Ellie en su travesía por una América posapocalíptica y encuentra aliados y enemigos inolvidables en The Last of Us™. ',50000);




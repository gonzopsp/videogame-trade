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
    email varchar(55) UNIQUE NOT NULL,
    name varchar(55),
    password TEXT,
    role INT REFERENCES roles(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_profiles(
    id SERIAL PRIMARY KEY,
    user_id INT UNIQUE NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(55),
    phone VARCHAR(25),
    avatar VARCHAR(255),           
    address TEXT,
    bio TEXT,
    birthdate DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sales(
    id SERIAL PRIMARY KEY,
    buyer INT NOT NULL REFERENCES users(id),
    totalprice INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sales_items(
    id SERIAL PRIMARY KEY,
    sale_id INT NOT NULL REFERENCES sales(id),
    videogame INT NOT NULL REFERENCES videogames(id),
    nIntercambios INT NOT NULL,
    totalprice INT,
    status VARCHAR(20) NOT NULL DEFAULT 'en_biblioteca'
);

CREATE TABLE library(
    id SERIAL PRIMARY KEY,	
    unique_game_id INT NOT NULL REFERENCES sales_items(id),
    owner INT NOT NULL REFERENCES users(id)
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





INSERT INTO videogames(genre_id,name,description,price) VALUES(2,'Overcooked 2',"¡Overcooked vuelve con un nuevo y caótico juego de cocina en acción! Regresa al Reino de la Cebolla y organiza tu equipo de chefs en un cooperativo clásico o en partidas en línea de hasta cuatro jugadores. Agarraos los delantales... es hora de salvar el mundo (¡otra vez!)",10000);
INSERT INTO videogames(genre_id,name,description,price) VALUES(1,'The Last of Us™ Part I','Descubre el galardonado juego que inspiró la aclamada serie de televisión. Guía a Joel y Ellie en su travesía por una América posapocalíptica y encuentra aliados y enemigos inolvidables en The Last of Us™.',50000);

INSERT INTO videogames(genre_id,name,description,price) VALUES(4,"Sid Meier’s Civilization® VI","Expande tu imperio, haz avanzar tu cultura y enfréntate a los mejores líderes de la historia. ¿Podrá tu civilización superar la prueba del tiempo? ",44990);
INSERT INTO videogames(genre_id,name,description,price) VALUES(1,"Red Dead Redemption 2","Arthur Morgan y la banda de Van der Linde se ven obligados a huir. Con agentes federales y cazarrecompensas pisándoles los talones, la banda deberá atracar, robar y luchar para sobrevivir en su camino por el escabroso territorio.",53990);
INSERT INTO videogames(genre_id,name,description,price) VALUES(3,"Battlefield™ 6","La experiencia bélica definitiva. En una guerra de tanques, cazas y gigantescos arsenales de combate, el arma más mortífera es tu patrulla.",62990);




INSERT INTO videogame_images(videogame_id, image_path) VALUES(1,"data/img/overcooked2-header.jpg");
INSERT INTO videogame_images(videogame_id, image_path) VALUES(1,"data/img/overcooked2-img-1.jpg");
INSERT INTO videogame_images(videogame_id, image_path) VALUES(2,"data/img/tlou-p1-header.jpg");
INSERT INTO videogame_images(videogame_id, image_path) VALUES(2,"data/img/tlou-p1-img-1.jpg");
INSERT INTO videogame_images(videogame_id, image_path) VALUES(3,"data/img/civ6-header.jpg");

INSERT INTO videogame_images(videogame_id, image_path) VALUES(3,"data/img/civ6-img1.jpg");
INSERT INTO videogame_images(videogame_id, image_path) VALUES(4,"data/img/rdr2-header.jpg");
INSERT INTO videogame_images(videogame_id, image_path) VALUES(4,"data/img/rdr2-img1.jpg");
INSERT INTO videogame_images(videogame_id, image_path) VALUES(5,"data/img/battlefield6-header.jpg");
INSERT INTO videogame_images(videogame_id, image_path) VALUES(5,"data/img/battlefield6-img1.jpg");

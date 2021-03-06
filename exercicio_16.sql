CREATE TABLE PAI(
    CODIGO NUMBER(18) NOT NULL PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL
);

CREATE TABLE MAE(
    CODIGO NUMBER(18) NOT NULL PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL
);

CREATE TABLE FILHO(
    CODIGO NUMBER(18) NOT NULL PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    PAI_CODIGO NUMBER(18),
    MAE_CODIGO NUMBER(18),
    FOREIGN KEY (PAI_CODIGO) REFERENCES PAI (CODIGO),
    FOREIGN KEY (MAE_CODIGO) REFERENCES MAE (CODIGO)
);

INSERT INTO MAE (CODIGO, NOME)
VALUES (1, 'Maria');

INSERT INTO MAE (CODIGO, NOME)
VALUES (2, 'Joana');

INSERT INTO MAE (CODIGO, NOME)
VALUES (3, 'Gabriela');

INSERT INTO MAE (CODIGO, NOME)
VALUES (4, 'Juliana');

INSERT INTO MAE (CODIGO, NOME)
VALUES (5, 'Marina');

-------------------------------------------------
INSERT INTO PAI (CODIGO, NOME)
VALUES (1, 'Alfredo');

INSERT INTO PAI (CODIGO, NOME)
VALUES (2, 'Joaquim');

INSERT INTO PAI (CODIGO, NOME)
VALUES (3, 'Juca');

INSERT INTO PAI (CODIGO, NOME)
VALUES (4, 'Juliano');

INSERT INTO PAI (CODIGO, NOME)
VALUES (5, 'Moacir');

--------------------------------------------------
INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (1, 'Z�zinho', 2, 1);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (2, 'Tuca', null, 1);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (3, 'Jucelino', 3, 1);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (4, 'Marcelo', 4, 3);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (5, 'Chiquinha', 1, 4);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (6, 'Margarida', null, null);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (7, 'Rosa', 5, 5);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (8, 'Murilo', 1, 4);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (9, 'Rodrigo', 2, 2);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (10, 'Gustavo', 1, 2);

INSERT INTO FILHO (CODIGO, NOME, PAI_CODIGO, MAE_CODIGO)
VALUES (11, 'Le�nidas', 3, 3);

COMMIT;
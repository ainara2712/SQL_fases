/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupament d'aplicacions web.
    Mòdul: 0484 Bases de dades. 
    AUTORS: Marcos Góngora Carriedo i Ainara Juàrez Moreno.
    DATA: 12/12/24
****************************************************** */

-- Creació de les taules

DROP TABLE IF EXISTS Companyia;

CREATE TABLE Companyia (
    nom VARCHAR(40) NOT NULL,
    IATA CHAR(6) NOT NULL,
    CODE3 CHAR(6) NOT NULL,
    ICAO CHAR(6) NOT NULL,
    pais VARCHAR(40) NOT NULL
);

DROP TABLE IF EXISTS Avió;

CREATE TABLE Avió (
    num_serie VARCHAR(30) NOT NULL,
    tipus VARCHAR(10) NOT NULL,
    fabricant VARCHAR(20) NOT NULL,
    any_fabricacio YEAR
);

DROP TABLE IF EXISTS Aeroport;

CREATE TABLE Aeroport (
    codi CHAR(4) NOT NULL,
    pais VARCHAR(40) NOT NULL,
    ciutat VARCHAR(40) NOT NULL,
    IATA CHAR(4) NOT NULL,
    nom VARCHAR(55) NOT NULL,
    any_construccio YEAR
);

DROP TABLE IF EXISTS Mostrador;

CREATE TABLE Mostrador (
    numero INTEGER 
);

DROP TABLE IF EXISTS Personal;

CREATE TABLE Personal (
    num_empleat INTEGER,
    nom VARCHAR(25) NOT NULL,
    cognom VARCHAR(35) NOT NULL,
    passaport VARCHAR(20) NOT NULL,
    sou FLOAT NOT NULL
);

DROP TABLE  IF EXISTS Hostessa;

CREATE TABLE Hostessa (
    
);

DROP TABLE IF EXISTS Pilot;

CREATE TABLE Pilot (
    hores_vol INTEGER (4)
);

DROP TABLE IF EXISTS Passatger;

CREATE TABLE Passatger (
    passaport VARCHAR(20) NOT NULL,
    nom VARCHAR(20) NOT NULL,
    cognom VARCHAR(50) NOT NULL,
    adreca VARCHAR(70),
    telefon CHAR(9),
    email VARCHAR(40) NOT NULL,
    data_naixement YEAR,
    genere CHAR(1)
);

DROP TABLE IF EXISTS Vol;

CREATE TABLE Vol (
    codi VARCHAR(9) NOT NULL,
    data YEAR NOT NULL,
    durada MINUTS NOT NULL,
    descripcio VARCHAR()
);
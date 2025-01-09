/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupament d'aplicacions web.
    Mòdul: 0484 Bases de dades. 
    AUTORS: Marcos Góngora Carriedo i Ainara Juàrez Moreno.
    DATA: 09/01/2025
****************************************************** */

-- Taula Companyia

ALTER TABLE companyia ADD CONSTRAINT pk_companyia PRIMARY KEY(nom);

-- Taula Hostessa

ALTER TABLE hostessa ADD CONSTRAINT pk_personal_hostessa FOREIGN KEY(num_empleat) REFERENCES personal(num_emple);

-- Taula Avio

ALTER TABLE avio ADD CONSTRAINT pk_avio PRIMARY KEY(num_serie);

-- Taula Aeroport

ALTER TABLE aeroport ADD CONSTRAINT pk_aeroport PRIMARY KEY(codi);

-- Taula Mostrador

ALTER TABLE mostrador ADD CONSTRAINT pk_mostrador PRIMARY KEY (numero);
 
-- Taula Personal

ALTER TABLE personal ADD CONSTRAINT pk_personal PRIMARY KEY(num_empleat);

-- Taula Vol

ALTER TABLE vol ADD CONSTRAINT pk_vol PRIMARY KEY(codi);

-- Taula Passatger

ALTER TABLE passatger ADD CONSTRAINT pk_passatger PRIMARY KEY (passaport)

-- Taula Pilot

ALTER TABLE pilot ADD CONSTRAINT fk_personal_pilot FOREIGN KEY(num_empleat) REFERENCES personal(num_empleat);

-- Taula Volar

ALTER TABLE volar ADD CONSTRAINT pk_volar FOREIGN KEY(passaport, codi) REFERENCES  

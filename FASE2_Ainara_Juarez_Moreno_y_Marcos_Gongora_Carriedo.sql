/* *****************************************************
  INSTITUT TIC de Barcelona
    CFGS Desenvolupament d'aplicacions web.
    Mòdul: 0484 Bases de dades. 
    AUTORS: Marcos Góngora Carriedo i Ainara Juàrez Moreno.
    DATA: 09/01/2025
****************************************************** */

-- Taula Companyia

ALTER TABLE companyia ADD CONSTRAINT pk_companyia PRIMARY KEY(nom);
ALTER TABLE companyia ADD CONSTRAINT uq_companyia_iata UNIQUE (IATA);

-- Taula Avio

ALTER TABLE avio ADD CONSTRAINT pk_avio PRIMARY KEY(num_serie);
ALTER TABLE avio ADD CONSTRAINT ch_tipus_avio CHECK(tipus = "COM-PAS" or tipus = "JET" or tipus = "CARGO");

-- Taula Aeroport

ALTER TABLE aeroport ADD CONSTRAINT pk_aeroport PRIMARY KEY(codi);

-- Taula Mostrador

ALTER TABLE mostrador ADD CONSTRAINT pk_mostrador PRIMARY KEY (numero);

-- Taula Personal

ALTER TABLE personal ADD CONSTRAINT pk_personal PRIMARY KEY(num_empleat);
ALTER TABLE personal ADD CONSTRAINT uq_personal_passaport UNIQUE (passaport);
ALTER TABLE personal ADD CONSTRAINT ck_personal_sou CHECK(sou >= 20000);

-- Taula Vol

ALTER TABLE vol ADD CONSTRAINT pk_vol PRIMARY KEY(codi);
ALTER TABLE vol ADD CONSTRAINT ch_descripcio_vol CHECK (descripcio = 'ON-TIME' OR descripcio = 'DELAYED' OR descripcio = 'UNKNOWN');
ALTER TABLE vol ADD CONSTRAINT durada_vols CHECK(durada >= 10 AND durada <= 1200);

-- Taula Passatger

ALTER TABLE passatger ADD CONSTRAINT pk_passatger PRIMARY KEY (passaport);

-- Taula Pilot

ALTER TABLE pilot ADD CONSTRAINT fk_personal_pilot FOREIGN KEY(num_empleat) REFERENCES personal(num_empleat);
ALTER TABLE pilot ADD CONSTRAINT ch_pilot_hores_vol CHECK(hores_vol >= 400);

-- Taula Volar

ALTER TABLE volar ADD CONSTRAINT fk_volar_passatger FOREIGN KEY(passatger) REFERENCES passatger(passaport);
ALTER TABLE volar ADD CONSTRAINT fk_volar_vol FOREIGN KEY(vol) REFERENCES vol(codi);
ALTER TABLE volar ADD CONSTRAINT ch_volar_seient CHECK(seient >= 1 AND seient <= 200);
ALTER TABLE volar ADD CONSTRAINT uq_volar_seient UNIQUE (seient);
-- Taula Hostessa

ALTER TABLE hostessa ADD CONSTRAINT fk_personal_hostessa FOREIGN KEY(num_empleat) REFERENCES personal(num_empleat);

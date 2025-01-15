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
ALTER TABLE companyia ADD CONSTRAINT fk_companyia_filial_de FOREIGN KEY(filial_de) REFERENCES companyia(nom) ON DELETE RESTRICT ON UPDATE CASCADE;


-- Taula Avio

ALTER TABLE avio ADD CONSTRAINT pk_avio PRIMARY KEY(num_serie);
ALTER TABLE avio ADD CONSTRAINT ch_avio_tipus CHECK(tipus = "COM-PAS" or tipus = "JET" or tipus = "CARGO");
ALTER TABLE avio ADD CONSTRAINT fk_avio_companyia_nom FOREIGN KEY(companyia) REFERENCES companyia(nom) ON DELETE RESTRICT ON UPDATE CASCADE;

-- Taula Aeroport

ALTER TABLE aeroport ADD CONSTRAINT pk_aeroport PRIMARY KEY(codi);

-- Taula Mostrador

ALTER TABLE mostrador ADD CONSTRAINT pk_mostrador PRIMARY KEY (numero);
ALTER TABLE mostrador ADD CONSTRAINT fk_mostrador_codi_aeroport FOREIGN KEY(codi_aeroport) REFERENCES aeroport(codi) ON DELETE CASCADE ON UPDATE CASCADE;

-- Taula Personal

ALTER TABLE personal ADD CONSTRAINT pk_personal PRIMARY KEY(num_empleat);
ALTER TABLE personal ADD CONSTRAINT uq_personal_passaport UNIQUE (passaport);
ALTER TABLE personal ADD CONSTRAINT ck_personal_sou CHECK(sou >= 20000);

-- Taula Pilot

ALTER TABLE pilot ADD CONSTRAINT pk_pilot PRIMARY KEY (num_empleat);
ALTER TABLE pilot ADD CONSTRAINT fk_pilot_personal FOREIGN KEY(num_empleat) REFERENCES personal(num_empleat) ON DELETE CASCADE ON UPDATE CASCADE;  
ALTER TABLE pilot ADD CONSTRAINT ch_pilot_hores_vol CHECK(hores_vol >= 400);

-- Taula Hostessa

ALTER TABLE hostessa ADD CONSTRAINT pk_hostessa PRIMARY KEY(num_empleat);
ALTER TABLE hostessa ADD CONSTRAINT fk_hostessa_personal FOREIGN KEY(num_empleat) REFERENCES personal(num_empleat) ON DELETE CASCADE ON UPDATE CASCADE;

-- Taula Vol

ALTER TABLE vol ADD CONSTRAINT pk_vol PRIMARY KEY(codi);
ALTER TABLE vol ADD CONSTRAINT ch_vol_descripcio CHECK(descripcio = 'ON-TIME' OR descripcio = 'DELAYED' OR descripcio = 'UNKNOWN');
ALTER TABLE vol ADD CONSTRAINT ch_vol_durada CHECK(durada >= 10 AND durada <= 1200);
ALTER TABLE vol ADD CONSTRAINT fk_vol_aeroport_origen FOREIGN KEY(aeroport_origen) REFERENCES aeroport(codi) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE vol ADD CONSTRAINT fk_vol_aeroport_desti FOREIGN KEY(aeroport_desti) REFERENCES aeroport(codi) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE vol ADD CONSTRAINT fk_vol_avio FOREIGN KEY(avio) REFERENCES avio(num_serie) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE vol ADD CONSTRAINT fk_vol_hostessa FOREIGN KEY(hostessa) REFERENCES hostessa(num_empleat) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE vol ADD CONSTRAINT fk_vol_pilot FOREIGN KEY(pilot) REFERENCES pilot(num_empleat) ON DELETE RESTRICT ON UPDATE CASCADE;

-- Taula Passatger

ALTER TABLE passatger ADD CONSTRAINT pk_passatger PRIMARY KEY(passaport);

-- Taula Volar

ALTER TABLE volar ADD CONSTRAINT fk_volar_passatger FOREIGN KEY(passatger) REFERENCES passatger(passaport) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE volar ADD CONSTRAINT fk_volar_vol FOREIGN KEY(vol) REFERENCES vol(codi) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE volar ADD CONSTRAINT ch_volar_seient CHECK(seient >= 1 AND seient <= 200);
ALTER TABLE volar ADD CONSTRAINT uq_volar_vol_seient UNIQUE (vol,seient); 
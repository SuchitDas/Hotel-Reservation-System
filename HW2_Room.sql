--------------------------
----Room Table
--------------------------

DROP TABLE Room;

CREATE SEQUENCE room_seq
    START WITH 1 INCREMENT BY 1
    MINVALUE 0 MAXVALUE 1000000;

CREATE SEQUENCE location_seq
    START WITH 1 INCREMENT BY 1
    MINVALUE 0 MAXVALUE 1000000;

CREATE TABLE Room
(
  Room_id            NUMBER          DEFAULT room_seq.NEXTVAL ,
  Location_id        NUMBER          DEFAULT location_seq.NEXTVAL ,
  Floor              VARCHAR2(50)    NOT NULL,
  Room_Number        NUMBER          NOT NULL,
  Room_Type          CHAR(1)         NOT NULL,
  Square_Footage     NUMBER(9,2)     DEFAULT 0,
  credit_total       NUMBER(9,2)     DEFAULT 0,
  Max_People         NUMBER          NOT NULL,
  Weekday_Rate       NUMBER(9,2)     DEFAULT 0,
  Weekend_Rate       NUMBER(9,2)     DEFAULT 0,
  CONSTRAINT room_pk PRIMARY KEY (Room_id),
  CONSTRAINT room_fk FOREIGN KEY (Location_id) REFERENCES Location (Location_ID),
  CONSTRAINT room_ck 
    CHECK (Room_Type = 'D' OR Room_Type = 'Q' OR Room_Type = 'K' OR Room_Type = 'S' or Room_Type = 'C')
  );

CREATE INDEX Location_id_fk_ix
  ON Room (Location_id);




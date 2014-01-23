/*
* FinTP - Financial Transactions Processing Application
* Copyright (C) 2013 Business Information Systems (Allevo) S.R.L.
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>
* or contact Allevo at : 031281 Bucuresti, 23C Calea Vitan, Romania,
* phone +40212554577, office@allevo.ro <mailto:office@allevo.ro>, www.allevo.ro.
*/


--Table: fincfg.queuesrolemap

--DROP TABLE fincfg.queuesrolemap;

CREATE TABLE fincfg.queuesrolemap (
  mapid       integer NOT NULL,
  queueid     integer,
  roleid      integer NOT NULL,
  actiontype  varchar(2) NOT NULL,
  /* Keys */
  CONSTRAINT "PK_QUEUESROLEMAP_MAPID"
    PRIMARY KEY (mapid), 
  CONSTRAINT uk_qrm_qr
    UNIQUE (queueid, roleid),
  /* Checks */
  CONSTRAINT chk_qrm_acttype
    CHECK (actiontype::text = ANY (ARRAY['R'::character varying, 'W'::character varying, 'RW'::character varying]::text[])),
  /* Foreign keys */
  CONSTRAINT "FK_Q_QRM_QUEUEID"
    FOREIGN KEY (queueid)
    REFERENCES fincfg.queues(guid)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION, 
  CONSTRAINT "FK_R_QRM_ROLEID"
    FOREIGN KEY (roleid)
    REFERENCES fincfg.roles(roleid)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) WITH (
    OIDS = FALSE
  );

ALTER TABLE fincfg.queuesrolemap
  OWNER TO fincfg;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER, TRUNCATE
  ON fincfg.queuesrolemap
TO fincfg;

GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER, TRUNCATE
  ON fincfg.queuesrolemap
TO finuiuser;
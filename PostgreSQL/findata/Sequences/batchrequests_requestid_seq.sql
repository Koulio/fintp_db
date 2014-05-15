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

--Sequence: findata.batchrequests_requestid_seq

--DROP SEQUENCE findata.batchrequests_requestid_seq;

CREATE SEQUENCE findata.batchrequests_requestid_seq
  START 1
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2147483647
  CACHE 1;

ALTER TABLE findata.batchrequests_requestid_seq
  OWNER TO findata;

GRANT SELECT, UPDATE, USAGE
  ON SEQUENCE findata.batchrequests_requestid_seq
TO findata;

GRANT SELECT, UPDATE, USAGE
  ON SEQUENCE findata.batchrequests_requestid_seq
TO finuiuser;
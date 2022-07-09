--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4

-- Started on 2022-07-10 00:19:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16385)
-- Name: Dealership; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Dealership";


ALTER SCHEMA "Dealership" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16386)
-- Name: Customers; Type: TABLE; Schema: Dealership; Owner: postgres
--

CREATE TABLE "Dealership"."Customers" (
    "CustomerId" character varying(16) NOT NULL,
    "Name" character varying(256),
    "Phone" text
);


ALTER TABLE "Dealership"."Customers" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16391)
-- Name: Employees; Type: TABLE; Schema: Dealership; Owner: postgres
--

CREATE TABLE "Dealership"."Employees" (
    "EmployeeId" character varying(16) NOT NULL,
    "Name" character varying(256)
);


ALTER TABLE "Dealership"."Employees" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16394)
-- Name: Manufacturers; Type: TABLE; Schema: Dealership; Owner: postgres
--

CREATE TABLE "Dealership"."Manufacturers" (
    "ManufacturerId" character varying(16) NOT NULL,
    "Name" character varying(256)
);


ALTER TABLE "Dealership"."Manufacturers" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16397)
-- Name: Transactions; Type: TABLE; Schema: Dealership; Owner: postgres
--

CREATE TABLE "Dealership"."Transactions" (
    "SerialNumber" character varying(17) NOT NULL,
    "CustomerId" character varying(16) NOT NULL,
    "EmployeeId" character varying(16) NOT NULL,
    "Timestamp" timestamp with time zone NOT NULL,
    "ManufacturerId" character varying(16),
    "ModelName" character varying(256),
    "Weight" double precision,
    "Price" double precision
);


ALTER TABLE "Dealership"."Transactions" OWNER TO postgres;

--
-- TOC entry 3329 (class 0 OID 16386)
-- Dependencies: 210
-- Data for Name: Customers; Type: TABLE DATA; Schema: Dealership; Owner: postgres
--

COPY "Dealership"."Customers" ("CustomerId", "Name", "Phone") FROM stdin;
8877704716678617	Ah Rick Chou	98102312
8762291780512674	Zoe Jie Lun	89127312
0921348557356655	Jaejay Lin	81237123
\.


--
-- TOC entry 3330 (class 0 OID 16391)
-- Dependencies: 211
-- Data for Name: Employees; Type: TABLE DATA; Schema: Dealership; Owner: postgres
--

COPY "Dealership"."Employees" ("EmployeeId", "Name") FROM stdin;
0927850938544715	Tan Ya Chua
9752851346861070	Rain Ni Yang
0593895754085629	Hi Bi Tien
\.


--
-- TOC entry 3331 (class 0 OID 16394)
-- Dependencies: 212
-- Data for Name: Manufacturers; Type: TABLE DATA; Schema: Dealership; Owner: postgres
--

COPY "Dealership"."Manufacturers" ("ManufacturerId", "Name") FROM stdin;
5362322661186481	Toyota
8769142801116024	Nissan
8700801130150749	Subaru
9462322661186481	Tesla
\.


--
-- TOC entry 3332 (class 0 OID 16397)
-- Dependencies: 213
-- Data for Name: Transactions; Type: TABLE DATA; Schema: Dealership; Owner: postgres
--

COPY "Dealership"."Transactions" ("SerialNumber", "CustomerId", "EmployeeId", "Timestamp", "ManufacturerId", "ModelName", "Weight", "Price") FROM stdin;
1FDWE35SX5HA40825	8877704716678617	0593895754085629	2022-07-10 08:23:54+00	8769142801116024	2005 Ford E 350	3032	120000
1FTEX1C85AFB83192	8877704716678617	9752851346861070	2022-06-20 08:23:54+00	5362322661186481	2010 Ford F 150\n	4098.3	150200
2HNYD18661H524556	0921348557356655	0593895754085629	2022-05-20 08:23:54+00	8769142801116024	2001 Acura MDX\n	2300	150000
JH4KA3240JC014910	0921348557356655	0593895754085629	2021-11-19 08:23:54+00	9462322661186481	1988 Acura Legend	4812.12	90000
1YVHZ8CH2A5M03260	8877704716678617	0593895754085629	2022-06-21 08:23:54+00	8700801130150749	2010 Mazda MAZDA6\n	4213.31	183000
JH4KA2550HC005889	8762291780512674	9752851346861070	2022-06-19 08:23:54+00	5362322661186481	1987 Acura Legend\n	3012.99	177000
\.


--
-- TOC entry 3180 (class 2606 OID 16401)
-- Name: Customers Customers_pkey; Type: CONSTRAINT; Schema: Dealership; Owner: postgres
--

ALTER TABLE ONLY "Dealership"."Customers"
    ADD CONSTRAINT "Customers_pkey" PRIMARY KEY ("CustomerId");


--
-- TOC entry 3182 (class 2606 OID 16403)
-- Name: Employees Employees_pkey; Type: CONSTRAINT; Schema: Dealership; Owner: postgres
--

ALTER TABLE ONLY "Dealership"."Employees"
    ADD CONSTRAINT "Employees_pkey" PRIMARY KEY ("EmployeeId");


--
-- TOC entry 3184 (class 2606 OID 16405)
-- Name: Manufacturers Manufacturers_pkey; Type: CONSTRAINT; Schema: Dealership; Owner: postgres
--

ALTER TABLE ONLY "Dealership"."Manufacturers"
    ADD CONSTRAINT "Manufacturers_pkey" PRIMARY KEY ("ManufacturerId");


--
-- TOC entry 3186 (class 2606 OID 16407)
-- Name: Transactions Transactions_pkey; Type: CONSTRAINT; Schema: Dealership; Owner: postgres
--

ALTER TABLE ONLY "Dealership"."Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY ("SerialNumber");


--
-- TOC entry 3187 (class 2606 OID 16408)
-- Name: Transactions Transactions_CustomerId_fkey; Type: FK CONSTRAINT; Schema: Dealership; Owner: postgres
--

ALTER TABLE ONLY "Dealership"."Transactions"
    ADD CONSTRAINT "Transactions_CustomerId_fkey" FOREIGN KEY ("CustomerId") REFERENCES "Dealership"."Customers"("CustomerId") NOT VALID;


--
-- TOC entry 3188 (class 2606 OID 16413)
-- Name: Transactions Transactions_EmployeeId_fkey; Type: FK CONSTRAINT; Schema: Dealership; Owner: postgres
--

ALTER TABLE ONLY "Dealership"."Transactions"
    ADD CONSTRAINT "Transactions_EmployeeId_fkey" FOREIGN KEY ("EmployeeId") REFERENCES "Dealership"."Employees"("EmployeeId") NOT VALID;


--
-- TOC entry 3189 (class 2606 OID 16418)
-- Name: Transactions Transactions_ManufacturerId_fkey; Type: FK CONSTRAINT; Schema: Dealership; Owner: postgres
--

ALTER TABLE ONLY "Dealership"."Transactions"
    ADD CONSTRAINT "Transactions_ManufacturerId_fkey" FOREIGN KEY ("ManufacturerId") REFERENCES "Dealership"."Manufacturers"("ManufacturerId") NOT VALID;


-- Completed on 2022-07-10 00:19:41

--
-- PostgreSQL database dump complete
--


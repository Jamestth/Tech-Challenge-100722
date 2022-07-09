--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4

-- Started on 2022-07-09 23:08:23

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
-- TOC entry 4 (class 2615 OID 16386)
-- Name: Dealership; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "Dealership";


ALTER SCHEMA "Dealership" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 16466)
-- Name: Customers; Type: TABLE; Schema: Dealership; Owner: postgres
--

CREATE TABLE "Dealership"."Customers" (
    "CustomerId" character varying(16) NOT NULL,
    "Name" character varying(256),
    "Phone" text
);


ALTER TABLE "Dealership"."Customers" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16473)
-- Name: Employees; Type: TABLE; Schema: Dealership; Owner: postgres
--

CREATE TABLE "Dealership"."Employees" (
    "EmployeeId" character varying(16) NOT NULL,
    "Name" character varying(256)
);


ALTER TABLE "Dealership"."Employees" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16452)
-- Name: Manufacturers; Type: TABLE; Schema: Dealership; Owner: postgres
--

CREATE TABLE "Dealership"."Manufacturers" (
    "ManufacturerId" character varying(16) NOT NULL,
    "Name" character varying(256)
);


ALTER TABLE "Dealership"."Manufacturers" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16459)
-- Name: Transactions; Type: TABLE; Schema: Dealership; Owner: postgres
--

CREATE TABLE "Dealership"."Transactions" (
    "SerialNumber" character varying(17) NOT NULL,
    "CustomerId" character varying(16) NOT NULL,
    "EmployeeId" character varying(16) NOT NULL,
    "TransactionId" character varying(16) NOT NULL,
    "Timestamp" timestamp with time zone NOT NULL,
    "ManufacturerId" character varying(16),
    "ModelName" character varying(256),
    "Weight" double precision,
    "Price" double precision
);


ALTER TABLE "Dealership"."Transactions" OWNER TO postgres;

--
-- TOC entry 3331 (class 0 OID 16466)
-- Dependencies: 212
-- Data for Name: Customers; Type: TABLE DATA; Schema: Dealership; Owner: postgres
--

COPY "Dealership"."Customers" ("CustomerId", "Name", "Phone") FROM stdin;
\.


--
-- TOC entry 3332 (class 0 OID 16473)
-- Dependencies: 213
-- Data for Name: Employees; Type: TABLE DATA; Schema: Dealership; Owner: postgres
--

COPY "Dealership"."Employees" ("EmployeeId", "Name") FROM stdin;
\.


--
-- TOC entry 3329 (class 0 OID 16452)
-- Dependencies: 210
-- Data for Name: Manufacturers; Type: TABLE DATA; Schema: Dealership; Owner: postgres
--

COPY "Dealership"."Manufacturers" ("ManufacturerId", "Name") FROM stdin;
\.


--
-- TOC entry 3330 (class 0 OID 16459)
-- Dependencies: 211
-- Data for Name: Transactions; Type: TABLE DATA; Schema: Dealership; Owner: postgres
--

COPY "Dealership"."Transactions" ("SerialNumber", "CustomerId", "EmployeeId", "TransactionId", "Timestamp", "ManufacturerId", "ModelName", "Weight", "Price") FROM stdin;
\.


--
-- TOC entry 3184 (class 2606 OID 16472)
-- Name: Customers Customers_pkey; Type: CONSTRAINT; Schema: Dealership; Owner: postgres
--

ALTER TABLE ONLY "Dealership"."Customers"
    ADD CONSTRAINT "Customers_pkey" PRIMARY KEY ("CustomerId");


--
-- TOC entry 3186 (class 2606 OID 16479)
-- Name: Employees Employees_pkey; Type: CONSTRAINT; Schema: Dealership; Owner: postgres
--

ALTER TABLE ONLY "Dealership"."Employees"
    ADD CONSTRAINT "Employees_pkey" PRIMARY KEY ("EmployeeId");


--
-- TOC entry 3180 (class 2606 OID 16458)
-- Name: Manufacturers Manufacturers_pkey; Type: CONSTRAINT; Schema: Dealership; Owner: postgres
--

ALTER TABLE ONLY "Dealership"."Manufacturers"
    ADD CONSTRAINT "Manufacturers_pkey" PRIMARY KEY ("ManufacturerId");


--
-- TOC entry 3182 (class 2606 OID 16465)
-- Name: Transactions Transactions_pkey; Type: CONSTRAINT; Schema: Dealership; Owner: postgres
--

ALTER TABLE ONLY "Dealership"."Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY ("SerialNumber");


--
-- TOC entry 3187 (class 2606 OID 16480)
-- Name: Transactions Transactions_CustomerId_fkey; Type: FK CONSTRAINT; Schema: Dealership; Owner: postgres
--

ALTER TABLE ONLY "Dealership"."Transactions"
    ADD CONSTRAINT "Transactions_CustomerId_fkey" FOREIGN KEY ("CustomerId") REFERENCES "Dealership"."Customers"("CustomerId") NOT VALID;


--
-- TOC entry 3188 (class 2606 OID 16485)
-- Name: Transactions Transactions_EmployeeId_fkey; Type: FK CONSTRAINT; Schema: Dealership; Owner: postgres
--

ALTER TABLE ONLY "Dealership"."Transactions"
    ADD CONSTRAINT "Transactions_EmployeeId_fkey" FOREIGN KEY ("EmployeeId") REFERENCES "Dealership"."Employees"("EmployeeId") NOT VALID;


--
-- TOC entry 3189 (class 2606 OID 16490)
-- Name: Transactions Transactions_ManufacturerId_fkey; Type: FK CONSTRAINT; Schema: Dealership; Owner: postgres
--

ALTER TABLE ONLY "Dealership"."Transactions"
    ADD CONSTRAINT "Transactions_ManufacturerId_fkey" FOREIGN KEY ("ManufacturerId") REFERENCES "Dealership"."Manufacturers"("ManufacturerId") NOT VALID;


-- Completed on 2022-07-09 23:08:23

--
-- PostgreSQL database dump complete
--


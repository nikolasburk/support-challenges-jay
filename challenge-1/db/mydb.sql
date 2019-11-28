--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11
-- Dumped by pg_dump version 11.5

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Post; Type: TABLE; Schema: public; Owner: nikolasburk
--

CREATE TABLE public."Post" (
    content text,
    "createdAt" timestamp(3) without time zone DEFAULT '1970-01-01 00:00:00'::timestamp without time zone NOT NULL,
    id text NOT NULL,
    published boolean DEFAULT true NOT NULL,
    title text DEFAULT ''::text NOT NULL,
    "updatedAt" timestamp(3) without time zone DEFAULT '1970-01-01 00:00:00'::timestamp without time zone NOT NULL,
    author text
);


ALTER TABLE public."Post" OWNER TO nikolasburk;

--
-- Name: User; Type: TABLE; Schema: public; Owner: nikolasburk
--

CREATE TABLE public."User" (
    email text DEFAULT ''::text NOT NULL,
    id text NOT NULL,
    name text
);


ALTER TABLE public."User" OWNER TO nikolasburk;

--
-- Name: _Migration; Type: TABLE; Schema: public; Owner: nikolasburk
--

CREATE TABLE public."_Migration" (
    revision integer NOT NULL,
    name text NOT NULL,
    datamodel text NOT NULL,
    status text NOT NULL,
    applied integer NOT NULL,
    rolled_back integer NOT NULL,
    datamodel_steps text NOT NULL,
    database_migration text NOT NULL,
    errors text NOT NULL,
    started_at timestamp(3) without time zone NOT NULL,
    finished_at timestamp(3) without time zone
);


ALTER TABLE public."_Migration" OWNER TO nikolasburk;

--
-- Name: _Migration_revision_seq; Type: SEQUENCE; Schema: public; Owner: nikolasburk
--

CREATE SEQUENCE public."_Migration_revision_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."_Migration_revision_seq" OWNER TO nikolasburk;

--
-- Name: _Migration_revision_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nikolasburk
--

ALTER SEQUENCE public."_Migration_revision_seq" OWNED BY public."_Migration".revision;


--
-- Name: _Migration revision; Type: DEFAULT; Schema: public; Owner: nikolasburk
--

ALTER TABLE ONLY public."_Migration" ALTER COLUMN revision SET DEFAULT nextval('public."_Migration_revision_seq"'::regclass);


--
-- Data for Name: Post; Type: TABLE DATA; Schema: public; Owner: nikolasburk
--

COPY public."Post" (content, "createdAt", id, published, title, "updatedAt", author) FROM stdin;
https://www.prisma.io/blog/z11sg6ipb3i1/	2019-11-25 10:19:45.849	ck3ea50sc0001gxcbus0chevh	t	Watch the talks from Prisma Day 2019	2019-11-25 10:19:45.849	ck3ea50s90000gxcbjhnx44mn
https://graphqlweekly.com/	2019-11-25 10:19:45.865	ck3ea50sv0003gxcbegv2kf57	t	Subscribe to GraphQL Weekly for community news	2019-11-25 10:19:45.865	ck3ea50st0002gxcb1lh4cjb1
https://twitter.com/prisma/	2019-11-25 10:19:45.865	ck3ea50sw0004gxcbzepczcnw	f	Follow Prisma on Twitter	2019-11-25 10:19:45.865	ck3ea50st0002gxcb1lh4cjb1
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: nikolasburk
--

COPY public."User" (email, id, name) FROM stdin;
alice@prisma.io	ck3ea50s90000gxcbjhnx44mn	Alice
bob@prisma.io	ck3ea50st0002gxcb1lh4cjb1	Bob
\.


--
-- Data for Name: _Migration; Type: TABLE DATA; Schema: public; Owner: nikolasburk
--

COPY public."_Migration" (revision, name, datamodel, status, applied, rolled_back, datamodel_steps, database_migration, errors, started_at, finished_at) FROM stdin;
1	watch-20191125111909	model User {\n  id    String  @default(cuid()) @id\n  email String  @unique\n  name  String?\n  posts Post[]\n}\n\nmodel Post {\n  id        String   @default(cuid()) @id\n  createdAt DateTime @default(now())\n  updatedAt DateTime\n  published Boolean  @default(true)\n  title     String\n  content   String?\n  author    User?\n}	MigrationSuccess	3	0	[{"stepType":"CreateModel","name":"User","embedded":false},{"stepType":"CreateModel","name":"Post","embedded":false},{"stepType":"CreateField","model":"User","name":"id","type":{"Base":"String"},"arity":"required","isUnique":false,"id":{"strategy":"Auto","sequence":null},"default":{"Expression":["cuid","String",[]]}},{"stepType":"CreateField","model":"User","name":"email","type":{"Base":"String"},"arity":"required","isUnique":true},{"stepType":"CreateField","model":"User","name":"name","type":{"Base":"String"},"arity":"optional","isUnique":false},{"stepType":"CreateField","model":"User","name":"posts","type":{"Relation":{"to":"Post","to_fields":[],"name":"PostToUser","on_delete":"None"}},"arity":"list","isUnique":false},{"stepType":"CreateField","model":"Post","name":"id","type":{"Base":"String"},"arity":"required","isUnique":false,"id":{"strategy":"Auto","sequence":null},"default":{"Expression":["cuid","String",[]]}},{"stepType":"CreateField","model":"Post","name":"createdAt","type":{"Base":"DateTime"},"arity":"required","isUnique":false,"default":{"Expression":["now","DateTime",[]]}},{"stepType":"CreateField","model":"Post","name":"updatedAt","type":{"Base":"DateTime"},"arity":"required","isUnique":false},{"stepType":"CreateField","model":"Post","name":"published","type":{"Base":"Boolean"},"arity":"required","isUnique":false,"default":{"Boolean":true}},{"stepType":"CreateField","model":"Post","name":"title","type":{"Base":"String"},"arity":"required","isUnique":false},{"stepType":"CreateField","model":"Post","name":"content","type":{"Base":"String"},"arity":"optional","isUnique":false},{"stepType":"CreateField","model":"Post","name":"author","type":{"Relation":{"to":"User","to_fields":["id"],"name":"PostToUser","on_delete":"None"}},"arity":"optional","isUnique":false}]	{"before":{"tables":[{"name":"_Migration","columns":[{"name":"applied","tpe":{"raw":"int4","family":"int"},"arity":"required","default":null,"autoIncrement":false},{"name":"database_migration","tpe":{"raw":"text","family":"string"},"arity":"required","default":null,"autoIncrement":false},{"name":"datamodel","tpe":{"raw":"text","family":"string"},"arity":"required","default":null,"autoIncrement":false},{"name":"datamodel_steps","tpe":{"raw":"text","family":"string"},"arity":"required","default":null,"autoIncrement":false},{"name":"errors","tpe":{"raw":"text","family":"string"},"arity":"required","default":null,"autoIncrement":false},{"name":"finished_at","tpe":{"raw":"timestamp","family":"dateTime"},"arity":"nullable","default":null,"autoIncrement":false},{"name":"name","tpe":{"raw":"text","family":"string"},"arity":"required","default":null,"autoIncrement":false},{"name":"revision","tpe":{"raw":"int4","family":"int"},"arity":"required","default":"nextval('\\"_Migration_revision_seq\\"'::regclass)","autoIncrement":false},{"name":"rolled_back","tpe":{"raw":"int4","family":"int"},"arity":"required","default":null,"autoIncrement":false},{"name":"started_at","tpe":{"raw":"timestamp","family":"dateTime"},"arity":"required","default":null,"autoIncrement":false},{"name":"status","tpe":{"raw":"text","family":"string"},"arity":"required","default":null,"autoIncrement":false}],"indices":[],"primaryKey":{"columns":["revision"],"sequence":{"name":"_Migration_revision_seq","initialValue":1,"allocationSize":1}},"foreignKeys":[]}],"enums":[],"sequences":[{"name":"_Migration_revision_seq","initialValue":1,"allocationSize":1}]},"after":{"tables":[{"name":"User","columns":[{"name":"email","tpe":{"raw":"","family":"string"},"arity":"required","default":"","autoIncrement":false},{"name":"id","tpe":{"raw":"","family":"string"},"arity":"required","default":null,"autoIncrement":false},{"name":"name","tpe":{"raw":"","family":"string"},"arity":"nullable","default":"","autoIncrement":false}],"indices":[{"name":"User.email","columns":["email"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[]},{"name":"Post","columns":[{"name":"author","tpe":{"raw":"","family":"string"},"arity":"nullable","default":null,"autoIncrement":false},{"name":"content","tpe":{"raw":"","family":"string"},"arity":"nullable","default":"","autoIncrement":false},{"name":"createdAt","tpe":{"raw":"","family":"dateTime"},"arity":"required","default":"1970-01-01 00:00:00","autoIncrement":false},{"name":"id","tpe":{"raw":"","family":"string"},"arity":"required","default":null,"autoIncrement":false},{"name":"published","tpe":{"raw":"","family":"boolean"},"arity":"required","default":"true","autoIncrement":false},{"name":"title","tpe":{"raw":"","family":"string"},"arity":"required","default":"","autoIncrement":false},{"name":"updatedAt","tpe":{"raw":"","family":"dateTime"},"arity":"required","default":"1970-01-01 00:00:00","autoIncrement":false}],"indices":[],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["author"],"referencedTable":"User","referencedColumns":["id"],"onDeleteAction":"setNull"}]}],"enums":[],"sequences":[]},"original_steps":[{"CreateTable":{"table":{"name":"User","columns":[{"name":"email","tpe":{"raw":"","family":"string"},"arity":"required","default":"","autoIncrement":false},{"name":"id","tpe":{"raw":"","family":"string"},"arity":"required","default":null,"autoIncrement":false},{"name":"name","tpe":{"raw":"","family":"string"},"arity":"nullable","default":"","autoIncrement":false}],"indices":[{"name":"User.email","columns":["email"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[]}}},{"CreateTable":{"table":{"name":"Post","columns":[{"name":"author","tpe":{"raw":"","family":"string"},"arity":"nullable","default":null,"autoIncrement":false},{"name":"content","tpe":{"raw":"","family":"string"},"arity":"nullable","default":"","autoIncrement":false},{"name":"createdAt","tpe":{"raw":"","family":"dateTime"},"arity":"required","default":"1970-01-01 00:00:00","autoIncrement":false},{"name":"id","tpe":{"raw":"","family":"string"},"arity":"required","default":null,"autoIncrement":false},{"name":"published","tpe":{"raw":"","family":"boolean"},"arity":"required","default":"true","autoIncrement":false},{"name":"title","tpe":{"raw":"","family":"string"},"arity":"required","default":"","autoIncrement":false},{"name":"updatedAt","tpe":{"raw":"","family":"dateTime"},"arity":"required","default":"1970-01-01 00:00:00","autoIncrement":false}],"indices":[],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["author"],"referencedTable":"User","referencedColumns":["id"],"onDeleteAction":"setNull"}]}}},{"CreateIndex":{"table":"User","index":{"name":"User.email","columns":["email"],"tpe":"unique"}}}],"corrected_steps":[{"CreateTable":{"table":{"name":"User","columns":[{"name":"email","tpe":{"raw":"","family":"string"},"arity":"required","default":"","autoIncrement":false},{"name":"id","tpe":{"raw":"","family":"string"},"arity":"required","default":null,"autoIncrement":false},{"name":"name","tpe":{"raw":"","family":"string"},"arity":"nullable","default":"","autoIncrement":false}],"indices":[{"name":"User.email","columns":["email"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[]}}},{"CreateTable":{"table":{"name":"Post","columns":[{"name":"content","tpe":{"raw":"","family":"string"},"arity":"nullable","default":"","autoIncrement":false},{"name":"createdAt","tpe":{"raw":"","family":"dateTime"},"arity":"required","default":"1970-01-01 00:00:00","autoIncrement":false},{"name":"id","tpe":{"raw":"","family":"string"},"arity":"required","default":null,"autoIncrement":false},{"name":"published","tpe":{"raw":"","family":"boolean"},"arity":"required","default":"true","autoIncrement":false},{"name":"title","tpe":{"raw":"","family":"string"},"arity":"required","default":"","autoIncrement":false},{"name":"updatedAt","tpe":{"raw":"","family":"dateTime"},"arity":"required","default":"1970-01-01 00:00:00","autoIncrement":false}],"indices":[],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["author"],"referencedTable":"User","referencedColumns":["id"],"onDeleteAction":"setNull"}]}}},{"AlterTable":{"table":{"name":"Post","columns":[{"name":"content","tpe":{"raw":"","family":"string"},"arity":"nullable","default":"","autoIncrement":false},{"name":"createdAt","tpe":{"raw":"","family":"dateTime"},"arity":"required","default":"1970-01-01 00:00:00","autoIncrement":false},{"name":"id","tpe":{"raw":"","family":"string"},"arity":"required","default":null,"autoIncrement":false},{"name":"published","tpe":{"raw":"","family":"boolean"},"arity":"required","default":"true","autoIncrement":false},{"name":"title","tpe":{"raw":"","family":"string"},"arity":"required","default":"","autoIncrement":false},{"name":"updatedAt","tpe":{"raw":"","family":"dateTime"},"arity":"required","default":"1970-01-01 00:00:00","autoIncrement":false}],"indices":[],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["author"],"referencedTable":"User","referencedColumns":["id"],"onDeleteAction":"setNull"}]},"changes":[{"AddColumn":{"column":{"name":"author","tpe":{"raw":"","family":"string"},"arity":"nullable","default":null,"autoIncrement":false}}}]}},{"CreateIndex":{"table":"User","index":{"name":"User.email","columns":["email"],"tpe":"unique"}}}],"rollback":[{"DropIndex":{"table":"User","name":"User.email"}},{"DropTable":{"name":"User"}},{"DropTable":{"name":"Post"}}]}	[]	2019-11-25 10:19:09.925	2019-11-25 10:19:09.946
\.


--
-- Name: _Migration_revision_seq; Type: SEQUENCE SET; Schema: public; Owner: nikolasburk
--

SELECT pg_catalog.setval('public."_Migration_revision_seq"', 1, true);


--
-- Name: Post Post_pkey; Type: CONSTRAINT; Schema: public; Owner: nikolasburk
--

ALTER TABLE ONLY public."Post"
    ADD CONSTRAINT "Post_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: nikolasburk
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _Migration _Migration_pkey; Type: CONSTRAINT; Schema: public; Owner: nikolasburk
--

ALTER TABLE ONLY public."_Migration"
    ADD CONSTRAINT "_Migration_pkey" PRIMARY KEY (revision);


--
-- Name: User.email; Type: INDEX; Schema: public; Owner: nikolasburk
--

CREATE UNIQUE INDEX "User.email" ON public."User" USING btree (email);


--
-- Name: Post Post_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nikolasburk
--

ALTER TABLE ONLY public."Post"
    ADD CONSTRAINT "Post_author_fkey" FOREIGN KEY (author) REFERENCES public."User"(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--


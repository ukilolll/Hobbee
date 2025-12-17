--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cart_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_items (
    id integer NOT NULL,
    cart_id integer,
    product_id integer,
    quantity integer NOT NULL
);


ALTER TABLE public.cart_items OWNER TO postgres;

--
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_items_id_seq OWNER TO postgres;

--
-- Name: cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_items_id_seq OWNED BY public.cart_items.id;


--
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id integer NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carts_id_seq OWNER TO postgres;

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_id_seq OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id uuid,
    status text NOT NULL,
    total_amount numeric(12,2) NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL,
    description jsonb,
    category_id integer,
    price numeric(12,2) NOT NULL,
    stock integer DEFAULT 0 NOT NULL,
    image_name text NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password_hash text NOT NULL,
    status text,
    profile_image text,
    first_name text,
    last_name text,
    phone_number text,
    date_of_birth date
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: cart_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items ALTER COLUMN id SET DEFAULT nextval('public.cart_items_id_seq'::regclass);


--
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_items (id, cart_id, product_id, quantity) FROM stdin;
27	7	3	2
26	7	4	3
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts (id, user_id) FROM stdin;
107	57a1a504-b105-4347-8a47-2c0a980c0daa
7	0ac013a9-8e13-469d-b602-bf1470224a05
9	688c0398-f4a5-4a52-ae17-d9bd7c18d853
8	688c0398-f4a5-4a52-ae17-d9bd7c18d853
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name) FROM stdin;
1	Electronics
2	Home Appliances
3	Kitchen Appliances
4	Lighting
5	computer
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, order_id, product_id, quantity) FROM stdin;
1	6	1	3
2	6	2	1
3	7	3	2
4	7	4	1
5	8	3	2
6	8	4	1
7	9	3	2
8	9	4	1
9	10	3	3
10	10	4	1
11	11	11	2
12	11	3	1
13	12	6	1
14	13	4	2
15	14	2	1
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, status, total_amount, created_at) FROM stdin;
6	0ac013a9-8e13-469d-b602-bf1470224a05	paid	46960.00	2025-10-06 11:46:33.692671
8	0ac013a9-8e13-469d-b602-bf1470224a05	pending	53270.00	2025-10-29 16:44:32.529615
9	0ac013a9-8e13-469d-b602-bf1470224a05	pending	53270.00	2025-10-29 16:45:00.385957
10	0ac013a9-8e13-469d-b602-bf1470224a05	pending	78260.00	2025-10-29 16:51:10.22561
7	0ac013a9-8e13-469d-b602-bf1470224a05	delivered	53270.00	2025-10-29 16:40:56.274126
11	688c0398-f4a5-4a52-ae17-d9bd7c18d853	pending	25220.00	2025-11-01 01:47:06.479228
12	688c0398-f4a5-4a52-ae17-d9bd7c18d853	pending	17990.00	2025-11-01 02:01:23.961959
13	da8c1cfb-962d-460c-9f61-5f0831974cfc	shipping	6580.00	2025-11-01 02:12:11.411072
14	da8c1cfb-962d-460c-9f61-5f0831974cfc	pending	19990.00	2025-11-01 02:20:28.845361
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, description, category_id, price, stock, image_name) FROM stdin;
1	Smartphone Galaxy A15	{"brand": "Samsung", "color": "Blue", "screen": "6.5 inch", "storage": "128GB"}	1	8990.00	120	galaxy-a15.jpg
2	Laptop Aspire 5	{"ram": "8GB", "brand": "Acer", "screen": "15.6 inch", "storage": "512GB SSD"}	1	19990.00	40	aspire-5.jpg
3	Smart TV 55 inch 4K	{"brand": "LG", "panel": "OLED", "hdmi_ports": 3, "resolution": "4K UHD"}	1	24990.00	25	lg-55-4k.jpg
10	iphone 10	\N	1	13900.00	69	1759662597492-625478211-iphone10Golden.jpg
14	abc	{"color": "red"}	4	100.00	20	1761963324982-642570343-usecase_SAD.jpg
6	Air Conditioner 12000 BTU	{"btu": 12000, "type": "Inverter", "brand": "Daikin", "energy_saving": true}	2	17990.00	15	daikin-12000.jpg
5	Refrigerator 2 Door 7.4Q	{"type": "2 Door", "brand": "Toshiba", "color": "Silver", "capacity": "210L"}	3	8490.00	35	fridge-2door.jpg
7	Washing Machine 8KG	{"type": "Front Load", "brand": "Panasonic", "capacity": "8KG", "programs": ["Quick Wash", "Eco"]}	2	9990.00	22	washing-8kg.jpg
4	Microwave Oven 23L	{"brand": "Sharp", "power": "800W", "capacity": "23L", "functions": ["Grill", "Defrost"]}	3	3290.00	60	microwave-23l.jpg
11	หลอดไฟ LED PHILIPS STICK 9.5 วัตต์ WARM WHITE E27	{"โทนแสง": "WARM WHITE", "กำลังไฟ": "9.5 วัตต์"}	4	115.00	123	1761910283937-345216851-lighting.jpg
12	หลอดไฟ T5 BL UV 	{"กำลังไฟ": "4 วัตต์", "โคมไฟสี": "ใส"}	4	43.00	67	1761914830681-114750391-long.png
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password_hash, status, profile_image, first_name, last_name, phone_number, date_of_birth) FROM stdin;
0ac013a9-8e13-469d-b602-bf1470224a05	ukibutsucker	peerawit.av@ku.th	$2b$11$X.JOwMIe4ZlfTjhSZ9HHoeULZwhZ8Rj/6cSBjhQtsZvR/S9vDIV7G	member	1761030884143-269531666-mowl.jpg	พีรวิชญ์	อวิรุทธ์ชีวิน	0816163850	2004-03-08
0705cce0-a1c7-4f4e-a7bb-0f0cc3d8628d	realtest	realtest@gmail.com	$2b$11$LIloKKHRo4NsYWHcpf/C6.8VLXrl2y32tSFIDp2H9QK/r.39Fl0yC	member	\N	\N	\N	\N	\N
688c0398-f4a5-4a52-ae17-d9bd7c18d853	ukilolll	ukikillme@gmail.com	$2b$11$xoYV6Ej9/QyuTMMDAIGjfuUh/BhEJC0AaFA5f4h2gzby3iM3cHeiG	admin	1761918769450-516829177-nignok.jpg	\N	\N	\N	\N
da8c1cfb-962d-460c-9f61-5f0831974cfc	Surapat	surapatmajan@gmail.com	$2b$11$H69FSBLy6vWUt5oRVekx7uqXUGzuOhENl5ykR8wS9CbWSdUbpG02u	admin	\N	aaa		09385466666	2025-10-21
85e688dc-8ecd-43ee-999c-faba8db63d42	test1	test1@gmail.com	$2b$11$.Hnoqre9xr88ZSt9MgOtQOxPzgs0yk6JG2thiaejS9nKK6ICsbDxa	member	\N	\N	\N	\N	\N
39343524-4c4c-44bc-845b-516c509788d7	test02	test02@gmail.com	$2b$11$BCfJWwjOCm8qPAeuB6umo.yUUfF85OYK1/zHXQeskZgA2jvnY0zAK	member	\N	\N	\N	\N	\N
57a1a504-b105-4347-8a47-2c0a980c0daa	test03	test03@gmail.com	$2b$11$nKFhckDBj0Rp8osm3VE9TOQwVEtAb7ZPf8owPTeDeDgC4BjU.pkwy	member	\N	\N	\N	\N	\N
e024971b-9f77-409f-b1ff-e7c86e72292b	test04	test04@gmail.com	$2b$11$UWdR/AliA3TPU0jd79LVYucyF0mIprBCev3mBfWQvMpYvxnY15eT2	member	\N	\N	\N	\N	\N
16a3c7eb-f890-47df-a92a-6ea9261e95c1	test05	test05@gmail.com	$2b$11$tW3aKpWl4If7TanG47hpcuGVqyrb0oKWu1YAUsVhs4QfBbeoTEF.i	member	\N	\N	\N	\N	\N
\.


--
-- Name: cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_items_id_seq', 40, true);


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_id_seq', 121, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 15, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 14, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 14, true);


--
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: cart_items cart_items_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.carts(id);


--
-- Name: cart_items cart_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: carts carts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- PostgreSQL database dump complete
--


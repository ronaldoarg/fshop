--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-11-12 19:42:29 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12655)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 186 (class 1259 OID 16397)
-- Name: interacoes; Type: TABLE; Schema: public; Owner: ronaldoarg
--

CREATE TABLE interacoes (
    id integer NOT NULL,
    field character varying(255),
    text character varying(255),
    user_id integer
);


ALTER TABLE interacoes OWNER TO ronaldoarg;

--
-- TOC entry 185 (class 1259 OID 16395)
-- Name: interacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: ronaldoarg
--

CREATE SEQUENCE interacoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE interacoes_id_seq OWNER TO ronaldoarg;

--
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 185
-- Name: interacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ronaldoarg
--

ALTER SEQUENCE interacoes_id_seq OWNED BY interacoes.id;


--
-- TOC entry 188 (class 1259 OID 16671)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produto (
    id integer NOT NULL,
    categoria character varying(255),
    name character varying(255),
    preco double precision,
    quantidade integer,
    autor character varying(255),
    editora character varying(255)
);


ALTER TABLE produto OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16669)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE produto_id_seq OWNER TO postgres;

--
-- TOC entry 2443 (class 0 OID 0)
-- Dependencies: 187
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produto_id_seq OWNED BY produto.id;


--
-- TOC entry 190 (class 1259 OID 16682)
-- Name: usuario; Type: TABLE; Schema: public; Owner: ronaldoarg
--

CREATE TABLE usuario (
    id integer NOT NULL,
    date_created timestamp without time zone,
    email character varying(255),
    lastname character varying(255),
    name character varying(255),
    password character varying(255),
    permission boolean,
    username character varying(255)
);


ALTER TABLE usuario OWNER TO ronaldoarg;

--
-- TOC entry 189 (class 1259 OID 16680)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: ronaldoarg
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_seq OWNER TO ronaldoarg;

--
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 189
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ronaldoarg
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- TOC entry 193 (class 1259 OID 16722)
-- Name: venda; Type: TABLE; Schema: public; Owner: ronaldoarg
--

CREATE TABLE venda (
    id_venda integer NOT NULL,
    data_hora timestamp without time zone NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE venda OWNER TO ronaldoarg;

--
-- TOC entry 192 (class 1259 OID 16720)
-- Name: venda_id_venda_seq; Type: SEQUENCE; Schema: public; Owner: ronaldoarg
--

CREATE SEQUENCE venda_id_venda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE venda_id_venda_seq OWNER TO ronaldoarg;

--
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 192
-- Name: venda_id_venda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ronaldoarg
--

ALTER SEQUENCE venda_id_venda_seq OWNED BY venda.id_venda;


--
-- TOC entry 191 (class 1259 OID 16699)
-- Name: venda_produto; Type: TABLE; Schema: public; Owner: ronaldoarg
--

CREATE TABLE venda_produto (
    quantidade integer NOT NULL,
    id_venda integer NOT NULL,
    id_produto integer NOT NULL
);


ALTER TABLE venda_produto OWNER TO ronaldoarg;

--
-- TOC entry 2292 (class 2604 OID 16400)
-- Name: interacoes id; Type: DEFAULT; Schema: public; Owner: ronaldoarg
--

ALTER TABLE ONLY interacoes ALTER COLUMN id SET DEFAULT nextval('interacoes_id_seq'::regclass);


--
-- TOC entry 2293 (class 2604 OID 16674)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto ALTER COLUMN id SET DEFAULT nextval('produto_id_seq'::regclass);


--
-- TOC entry 2294 (class 2604 OID 16685)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: ronaldoarg
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


--
-- TOC entry 2295 (class 2604 OID 16725)
-- Name: venda id_venda; Type: DEFAULT; Schema: public; Owner: ronaldoarg
--

ALTER TABLE ONLY venda ALTER COLUMN id_venda SET DEFAULT nextval('venda_id_venda_seq'::regclass);


--
-- TOC entry 2427 (class 0 OID 16397)
-- Dependencies: 186
-- Data for Name: interacoes; Type: TABLE DATA; Schema: public; Owner: ronaldoarg
--

INSERT INTO interacoes VALUES (42, 'main-menu', 'undefined', 1);
INSERT INTO interacoes VALUES (43, 'main-menu', 'undefined', 1);
INSERT INTO interacoes VALUES (44, 'main-menu', '45', 1);
INSERT INTO interacoes VALUES (45, 'main-menu', '45', 1);
INSERT INTO interacoes VALUES (46, 'main-menu', '45', 1);
INSERT INTO interacoes VALUES (47, 'main-menu', '45', 1);
INSERT INTO interacoes VALUES (48, 'main-menu', '45', 1);
INSERT INTO interacoes VALUES (49, 'main-menu', 'Acessórios', 1);
INSERT INTO interacoes VALUES (50, 'main-menu', 'Calçado', 1);
INSERT INTO interacoes VALUES (51, 'main-menu', 'Roupas', 1);
INSERT INTO interacoes VALUES (52, 'button-buy', 'Blusa Azul Masculina P', 1);
INSERT INTO interacoes VALUES (53, 'button-buy', 'Blusa Cinza Masculina P', 1);
INSERT INTO interacoes VALUES (54, 'button-buy', 'Blusa Azul Masculina G', 1);
INSERT INTO interacoes VALUES (55, 'button-buy', 'Blusa Cinza Masculina M', 1);
INSERT INTO interacoes VALUES (56, 'button-buy', 'Blusa Azul Masculina M', 1);
INSERT INTO interacoes VALUES (57, 'button-buy', 'Blusa Cinza Masculina G', 1);
INSERT INTO interacoes VALUES (58, 'sidebar-filters', 'Masculino', 1);
INSERT INTO interacoes VALUES (59, 'sidebar-filters', 'Blusas', 1);
INSERT INTO interacoes VALUES (60, 'button-buy', 'Blusa Azul Masculina M', NULL);
INSERT INTO interacoes VALUES (61, 'button-buy', 'Blusa Cinza Masculina G', NULL);
INSERT INTO interacoes VALUES (62, 'button-buy', 'Blusa Azul Masculina G', NULL);
INSERT INTO interacoes VALUES (63, 'button-buy', 'Blusa Cinza Masculina P', NULL);
INSERT INTO interacoes VALUES (64, 'button-buy', 'Blusa Azul Masculina M', NULL);
INSERT INTO interacoes VALUES (65, 'button-buy', 'Blusa Cinza Masculina P', NULL);
INSERT INTO interacoes VALUES (66, 'button-buy', 'Blusa Azul Masculina P', NULL);
INSERT INTO interacoes VALUES (67, 'button-buy', 'Blusa Azul Masculina M', NULL);
INSERT INTO interacoes VALUES (68, 'button-buy', 'Blusa Cinza Masculina P', NULL);
INSERT INTO interacoes VALUES (69, 'button-buy', 'Blusa Azul Masculina P', NULL);
INSERT INTO interacoes VALUES (70, 'button-buy', 'Blusa Azul Masculina M', 4);
INSERT INTO interacoes VALUES (71, 'button-buy', 'Blusa Azul Masculina M', 1);
INSERT INTO interacoes VALUES (72, 'sidebar-filters', 'Bermudas', 1);
INSERT INTO interacoes VALUES (73, 'sidebar-filters', 'Bermudas', 1);
INSERT INTO interacoes VALUES (74, 'sidebar-filters', 'Meias', 1);
INSERT INTO interacoes VALUES (75, 'button-buy', 'Blusa Azul Masculina G', 1);
INSERT INTO interacoes VALUES (76, 'sidebar-filters', 'Mais de 300', 1);
INSERT INTO interacoes VALUES (77, 'sidebar-filters', 'PP', 4);
INSERT INTO interacoes VALUES (78, 'sidebar-filters', 'P', 4);
INSERT INTO interacoes VALUES (79, 'sidebar-filters', 'M', 4);
INSERT INTO interacoes VALUES (80, 'sidebar-filters', 'G', 4);
INSERT INTO interacoes VALUES (81, 'sidebar-filters', 'GG', 4);
INSERT INTO interacoes VALUES (82, 'button-buy', 'Blusa Azul Masculina P', 1);
INSERT INTO interacoes VALUES (83, 'button-buy', 'Blusa Azul Masculina G', 1);
INSERT INTO interacoes VALUES (84, 'button-buy', 'Blusa Azul Masculina M', 1);
INSERT INTO interacoes VALUES (85, 'button-buy', 'Blusa Cinza Masculina P', 3);
INSERT INTO interacoes VALUES (86, 'button-buy', 'Blusa Azul Masculina P', 3);
INSERT INTO interacoes VALUES (87, 'button-buy', 'Blusa Azul Masculina G', 3);
INSERT INTO interacoes VALUES (88, 'button-buy', 'Bluza Vermelha', 4);
INSERT INTO interacoes VALUES (89, 'button-buy', 'Bluza Vermelha', 4);
INSERT INTO interacoes VALUES (90, 'button-buy', 'Bluza Azul', 4);
INSERT INTO interacoes VALUES (91, 'button-buy', 'Bluza Vermelha', 4);
INSERT INTO interacoes VALUES (92, 'button-buy', 'Bluza Azul', 5);
INSERT INTO interacoes VALUES (93, 'button-buy', 'Bluza Vermelha', 5);
INSERT INTO interacoes VALUES (94, 'button-buy', 'Bluza Azul Masculina M', 5);
INSERT INTO interacoes VALUES (95, 'button-buy', 'Bluza Azul Masculina M', 4);
INSERT INTO interacoes VALUES (96, 'button-buy', 'Blusa Azul Masculina PP', 10);
INSERT INTO interacoes VALUES (97, 'button-buy', 'Blusa Azul Masculina PP', 1);
INSERT INTO interacoes VALUES (98, 'button-buy', 'Blusa Azul Masculina P', 1);
INSERT INTO interacoes VALUES (99, 'button-buy', 'Blusa Azul Feminina GG', 1);
INSERT INTO interacoes VALUES (100, 'button-buy', 'Blusa Azul Feminina GG', 1);
INSERT INTO interacoes VALUES (101, 'button-buy', 'Bluza Azul Masculina M', 1);
INSERT INTO interacoes VALUES (102, 'button-buy', 'Blusa Azul Masculina P', 1);
INSERT INTO interacoes VALUES (103, 'button-buy', 'Blusa Azul Feminina M', 1);
INSERT INTO interacoes VALUES (104, 'button-buy', 'Blusa Azul Masculina G', 1);
INSERT INTO interacoes VALUES (105, 'button-buy', 'Blusa Azul Feminina M', 4);
INSERT INTO interacoes VALUES (106, 'button-buy', 'Blusa Vermelha Feminina GG', 4);
INSERT INTO interacoes VALUES (107, 'button-buy', 'Blusa Azul Masculina P', 4);
INSERT INTO interacoes VALUES (108, 'button-buy', 'BLusa Vermelha Feminina P', 4);
INSERT INTO interacoes VALUES (109, 'button-buy', 'Estruturas de dados e algoritmos em JavaScript', 3);
INSERT INTO interacoes VALUES (110, 'button-buy', 'Aprendendo JavaScript', 3);
INSERT INTO interacoes VALUES (111, 'button-buy', 'Construindo aplicações com NodeJS', 3);
INSERT INTO interacoes VALUES (112, 'button-buy', 'Aprendendo JavaScript', 3);
INSERT INTO interacoes VALUES (113, 'button-buy', 'Estruturas de dados e algoritmos em JavaScript', 3);
INSERT INTO interacoes VALUES (114, 'button-buy', 'Meteor', 3);
INSERT INTO interacoes VALUES (115, 'button-buy', 'Até Mais, e Obrigado Pelos Peixes', 3);
INSERT INTO interacoes VALUES (116, 'button-buy', 'Segredos do Ninja JavaScript', 3);
INSERT INTO interacoes VALUES (117, 'button-buy', 'Estruturas de dados e algoritmos em JavaScript', 3);
INSERT INTO interacoes VALUES (118, 'button-buy', 'Aprendendo NodeJS', 3);
INSERT INTO interacoes VALUES (119, 'button-buy', 'Estruturas de dados e algoritmos em JavaScript', 3);
INSERT INTO interacoes VALUES (120, 'button-buy', 'Aprendendo JavaScript', 3);
INSERT INTO interacoes VALUES (121, 'button-buy', 'Aprendendo NodeJS', 3);
INSERT INTO interacoes VALUES (122, 'button-buy', 'Aprendendo NodeJS', 3);
INSERT INTO interacoes VALUES (123, 'button-buy', 'Estruturas de dados e algoritmos em JavaScript', 3);
INSERT INTO interacoes VALUES (124, 'button-buy', 'Estruturas de dados e algoritmos em JavaScript', 3);
INSERT INTO interacoes VALUES (125, 'button-buy', 'Aprendendo NodeJS', 3);
INSERT INTO interacoes VALUES (126, 'button-buy', 'Aprendendo JavaScript', 3);
INSERT INTO interacoes VALUES (127, 'button-buy', 'Estruturas de dados e algoritmos em JavaScript', 3);
INSERT INTO interacoes VALUES (128, 'button-buy', 'Esopo: Fábulas Completas', 3);
INSERT INTO interacoes VALUES (129, 'button-buy', 'Hamlet', 3);
INSERT INTO interacoes VALUES (130, 'button-buy', 'A Vida, o Universo e Tudo Mais', 3);
INSERT INTO interacoes VALUES (131, 'button-buy', 'Java EE', 3);
INSERT INTO interacoes VALUES (132, 'button-buy', 'Estruturas de dados e algoritmos em JavaScript', 3);
INSERT INTO interacoes VALUES (133, 'button-buy', 'Aprendendo NodeJS', 3);
INSERT INTO interacoes VALUES (134, 'button-buy', 'Guerra, Açúcar E Religião No Brasil Dos Holandeses', 3);
INSERT INTO interacoes VALUES (135, 'button-buy', 'Guerra, Açúcar E Religião No Brasil Dos Holandeses', 3);
INSERT INTO interacoes VALUES (136, 'button-buy', 'Aprendendo NodeJS', 3);
INSERT INTO interacoes VALUES (137, 'button-buy', 'Guerra, Açúcar E Religião No Brasil Dos Holandeses', 3);
INSERT INTO interacoes VALUES (138, 'button-buy', 'Guerra, Açúcar E Religião No Brasil Dos Holandeses', 3);
INSERT INTO interacoes VALUES (139, 'button-buy', 'Estruturas de dados e algoritmos em JavaScript', 3);
INSERT INTO interacoes VALUES (140, 'button-buy', 'Guerra, Açúcar E Religião No Brasil Dos Holandeses', 3);
INSERT INTO interacoes VALUES (141, 'button-buy', 'Aprendendo NodeJS', 3);
INSERT INTO interacoes VALUES (142, 'button-buy', 'Guerra, Açúcar E Religião No Brasil Dos Holandeses', 3);
INSERT INTO interacoes VALUES (143, 'button-buy', 'Guerra, Açúcar E Religião No Brasil Dos Holandeses', 3);
INSERT INTO interacoes VALUES (144, 'button-buy', 'Guerra, Açúcar E Religião No Brasil Dos Holandeses', 3);
INSERT INTO interacoes VALUES (145, 'button-buy', 'Guerra, Açúcar E Religião No Brasil Dos Holandeses', 3);
INSERT INTO interacoes VALUES (146, 'button-buy', 'Guerra, Açúcar E Religião No Brasil Dos Holandeses', 3);
INSERT INTO interacoes VALUES (147, 'button-buy', 'Guerra, Açúcar E Religião No Brasil Dos Holandeses', 3);
INSERT INTO interacoes VALUES (148, 'button-buy', 'Guerra, Açúcar E Religião No Brasil Dos Holandeses', 3);
INSERT INTO interacoes VALUES (149, 'button-buy', 'Guerra, Açúcar E Religião No Brasil Dos Holandeses', 3);
INSERT INTO interacoes VALUES (150, 'button-buy', 'Guerra, Açúcar E Religião No Brasil Dos Holandeses', 3);
INSERT INTO interacoes VALUES (151, 'button-buy', 'Estruturas de dados e algoritmos em JavaScript', 3);
INSERT INTO interacoes VALUES (152, 'button-buy', 'Introdução e boas práticas em UX Design', 3);
INSERT INTO interacoes VALUES (153, 'button-buy', 'Aprendendo NodeJS', 3);
INSERT INTO interacoes VALUES (154, 'button-buy', 'Segredos do Ninja JavaScript', 3);
INSERT INTO interacoes VALUES (155, 'button-buy', 'Quincas Borba', 3);


--
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 185
-- Name: interacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ronaldoarg
--

SELECT pg_catalog.setval('interacoes_id_seq', 155, true);


--
-- TOC entry 2429 (class 0 OID 16671)
-- Dependencies: 188
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO produto VALUES (26, 'Programação', 'Estruturas de dados e algoritmos em JavaScript', 29.8999999999999986, 20, 'Loiane Groner', 'Novatec');
INSERT INTO produto VALUES (27, 'Programação', 'Aprendendo NodeJS', 29.8999999999999986, 20, 'Shelley Powers', 'Novatec');
INSERT INTO produto VALUES (28, 'Programação', 'Aprendendo JavaScript', 29.8999999999999986, 20, 'Shelley Powers', 'Novatec');
INSERT INTO produto VALUES (29, 'Programação', 'Construindo aplicações com NodeJS', 29.8999999999999986, 20, 'William Bruno Moraes', 'Novatec');
INSERT INTO produto VALUES (30, 'Programação', 'Segredos do Ninja JavaScript', 29.8999999999999986, 20, 'John Resig', 'Novatec');
INSERT INTO produto VALUES (31, 'Programação', 'Machine Learning', 29.8999999999999986, 20, 'Guilherme Silveira', 'Casa do código');
INSERT INTO produto VALUES (32, 'Programação', 'Mean: Full stack JavaScript para aplicações web com MongoDB, Express, Angular e Node', 29.8999999999999986, 20, 'Flávio Almeida', 'Casa do código');
INSERT INTO produto VALUES (33, 'Design', 'Introdução e boas práticas em UX Design', 29.8999999999999986, 20, 'Fabricio Teixeira', 'Casa do código');
INSERT INTO produto VALUES (34, 'Programação', 'Guia Front-End', 29.8999999999999986, 20, 'Diego Eis', 'Casa do código');
INSERT INTO produto VALUES (35, 'Programação', 'Introdução à Web Semântica', 29.8999999999999986, 20, 'Diego Eis', 'Casa do código');
INSERT INTO produto VALUES (36, 'Programação', 'Java EE', 29.8999999999999986, 20, 'Alberto Souza', 'Casa do código');
INSERT INTO produto VALUES (37, 'Programação', 'Spring MVC', 29.8999999999999986, 20, 'Alberto Souza', 'Casa do código');
INSERT INTO produto VALUES (38, 'Programação', 'Construindo APIs REST com NodeJS', 29.8999999999999986, 20, 'Caio Ribeiro Pereira', 'Casa do código');
INSERT INTO produto VALUES (39, 'Programação', 'Meteor', 29.8999999999999986, 20, 'Caio Ribeiro Pereira', 'Casa do código');
INSERT INTO produto VALUES (40, 'Programação', 'Aplicações web real-time com NodeJS', 29.8999999999999986, 20, 'Caio Ribeiro Pereira', 'Casa do código');
INSERT INTO produto VALUES (41, 'Poesia', 'Vida', 29.8999999999999986, 20, 'Paulo Leminski', 'Companhia das Letras');
INSERT INTO produto VALUES (42, 'Poesia', 'Uns e Outros', 29.8999999999999986, 20, 'Paulo Leminski', 'Landy');
INSERT INTO produto VALUES (43, 'Poesia', 'Toda Poesia', 29.8999999999999986, 20, 'Paulo Leminski', 'Companhia das Letras');
INSERT INTO produto VALUES (44, 'Poesia', 'Outro silêncio', 29.8999999999999986, 20, 'Paulo Leminski', 'Companhia das Letras');
INSERT INTO produto VALUES (45, 'Poesia', 'Odisseia', 29.8999999999999986, 20, 'Homero', 'Nova Fronteira');
INSERT INTO produto VALUES (46, 'Poesia', 'Ilíada', 29.8999999999999986, 20, 'Homero', 'Nova Fronteira');
INSERT INTO produto VALUES (47, 'Design', 'História do Design Gráfico', 29.8999999999999986, 20, 'Philip B. Meggs', 'Cosac & Naify');
INSERT INTO produto VALUES (48, 'Design', 'Novos Fundamentos Do Design', 29.8999999999999986, 20, 'Ellen Lupton', 'Cosac & Naify');
INSERT INTO produto VALUES (49, 'Design', 'Pensar com Tipos', 29.8999999999999986, 20, 'Ellen Lupton', 'Cosac & Naify');
INSERT INTO produto VALUES (50, 'Design', 'Grid. Construção e Desconstrução', 29.8999999999999986, 20, 'Timothy Samara', 'Cosac & Naify');
INSERT INTO produto VALUES (51, 'Design', 'Evolução do Design. Da Teoria à Prática', 29.8999999999999986, 20, 'Timothy Samara', 'Cosac & Naify');
INSERT INTO produto VALUES (52, 'Literatura Estrangeira', 'Hamlet', 29.8999999999999986, 20, 'William Shakespeare', 'Wisehouse Classics');
INSERT INTO produto VALUES (53, 'Literatura Estrangeira', 'Romeo e Julieta', 29.8999999999999986, 20, 'William Shakespeare', 'Wisehouse Classics');
INSERT INTO produto VALUES (54, 'Literatura Estrangeira', 'A Coisa', 29.8999999999999986, 20, 'Stephen King', 'Suma de Letras');
INSERT INTO produto VALUES (55, 'Literatura Estrangeira', 'O Iluminado', 29.8999999999999986, 20, 'Stephen King', 'Suma de Letras');
INSERT INTO produto VALUES (56, 'Literatura Estrangeira', 'O Cemitério', 29.8999999999999986, 20, 'Stephen King', 'Suma de Letras');
INSERT INTO produto VALUES (57, 'Literatura Estrangeira', 'O Guia do Mochileiro das Galáxias', 29.8999999999999986, 20, 'Douglas Adams', 'Arqueiro');
INSERT INTO produto VALUES (58, 'Literatura Estrangeira', 'O Restaurante no Fim do Universo', 29.8999999999999986, 20, 'Douglas Adams', 'Arqueiro');
INSERT INTO produto VALUES (59, 'Literatura Estrangeira', 'A Vida, o Universo e Tudo Mais', 29.8999999999999986, 20, 'Douglas Adams', 'Arqueiro');
INSERT INTO produto VALUES (60, 'Literatura Estrangeira', 'Até Mais, e Obrigado Pelos Peixes', 29.8999999999999986, 20, 'Douglas Adams', 'Arqueiro');
INSERT INTO produto VALUES (61, 'Literatura Estrangeira', 'Praticamente Inofensiva', 29.8999999999999986, 20, 'Douglas Adams', 'Arqueiro');
INSERT INTO produto VALUES (62, 'Literatura Brasileira', 'Helena', 29.8999999999999986, 20, 'Machado de Assis', 'Martin Claret');
INSERT INTO produto VALUES (63, 'Literatura Brasileira', 'Esaú e Jacó', 29.8999999999999986, 20, 'Machado de Assis', 'Penguin');
INSERT INTO produto VALUES (64, 'Literatura Brasileira', 'Quincas Borba', 29.8999999999999986, 20, 'Machado de Assis', 'Penguin');
INSERT INTO produto VALUES (65, 'Literatura Brasileira', 'Dom Casmurro', 29.8999999999999986, 20, 'Machado de Assis', 'Penguin');
INSERT INTO produto VALUES (66, 'Literatura Brasileira', 'Memórias Póstumas de Brás Cubas', 29.8999999999999986, 20, 'Machado de Assis', 'Martin Claret');
INSERT INTO produto VALUES (67, 'Literatura Brasileira', 'Senhora', 29.8999999999999986, 20, 'José de Alencar', 'Penguin');
INSERT INTO produto VALUES (68, 'Literatura Brasileira', 'Iracema', 29.8999999999999986, 20, 'José de Alencar', 'Panda Books');
INSERT INTO produto VALUES (69, 'Literatura Brasileira', 'O Quinze', 29.8999999999999986, 20, 'Rachel de Queiroz', 'José Olympio');
INSERT INTO produto VALUES (70, 'Literatura Brasileira', 'Dôra. Doralina', 29.8999999999999986, 20, 'Rachel de Queiroz', 'José Olympio');
INSERT INTO produto VALUES (71, 'Infantil', 'O Pequeno Príncipe', 29.8999999999999986, 20, 'Antoine de Saint-Exupéry', 'Geração');
INSERT INTO produto VALUES (72, 'Infantil', 'Esopo: Fábulas Completas', 29.8999999999999986, 20, 'Esopo', 'Cosac & Naify');
INSERT INTO produto VALUES (73, 'Marketing', 'Marketing 4.0. Do Tradicional ao Digital', 29.8999999999999986, 20, 'Philip Kotler', 'Sextante');
INSERT INTO produto VALUES (74, 'Marketing', 'Marketing 3.0. As Forças que Estão Definindo o Novo Marketing Centrado', 29.8999999999999986, 20, 'Philip Kotler', 'Elsevier');
INSERT INTO produto VALUES (75, 'Marketing', 'Marketing e Comunicação na Era Pós-Digital', 29.8999999999999986, 20, 'Walter Longo', 'HSM');
INSERT INTO produto VALUES (76, 'Marketing', 'O Marketing na Era do Nexo', 29.8999999999999986, 20, 'Walter Longo', 'Best Seller');
INSERT INTO produto VALUES (77, 'Filosofia', 'Marketing Existencial', 29.8999999999999986, 20, 'Luiz Felipe Pondé', 'Três Estrelas');
INSERT INTO produto VALUES (78, 'Filosofia', 'Filosofia Para Corajosos', 29.8999999999999986, 20, 'Luiz Felipe Pondé', 'Planeta');
INSERT INTO produto VALUES (79, 'Filosofia', 'Amor Para Corajosos', 29.8999999999999986, 20, 'Luiz Felipe Pondé', 'Planeta');
INSERT INTO produto VALUES (80, 'Filosofia', 'O príncipe', 29.8999999999999986, 20, 'Nicolau Maquiavel', 'Vozes');
INSERT INTO produto VALUES (81, 'Filosofia', 'O Anticristo', 29.8999999999999986, 20, 'Friedrich Nietzsche', 'L&PM Editores');
INSERT INTO produto VALUES (82, 'Filosofia', 'Além do bem e do mal', 29.8999999999999986, 20, 'Friedrich Nietzsche', 'Companhia das Letras');
INSERT INTO produto VALUES (83, 'Direito', 'Direito Constitucional Esquematizado', 29.8999999999999986, 20, 'Pedro Lenza', 'Saraiva');
INSERT INTO produto VALUES (84, 'Direito', 'Direito Administrativo Descomplicado', 29.8999999999999986, 20, 'Marcelo Alexandrino', 'Método');
INSERT INTO produto VALUES (85, 'Direito', 'Manual de Direito Civil', 29.8999999999999986, 20, 'Flávio Tartuce', 'Método');
INSERT INTO produto VALUES (86, 'Direito', 'Manual de Direito Processual Civil', 29.8999999999999986, 20, 'Daniel Amorim Assumpção Neves', 'Juspodivm');
INSERT INTO produto VALUES (87, 'Direito', 'Direito Processual Civil Esquematizado', 29.8999999999999986, 20, 'Marcus Vinicius Rios Gonçalves', 'Saraiva');
INSERT INTO produto VALUES (88, 'Direito', 'Direito Empresarial', 29.8999999999999986, 20, 'André Luiz Santa Cruz Ramos', 'Método');
INSERT INTO produto VALUES (89, 'Biografia', 'Einstein. Uma Biografia', 29.8999999999999986, 20, 'Jürgen Neffe', 'Novo Século');
INSERT INTO produto VALUES (90, 'Biografia', 'Rita Lee', 29.8999999999999986, 20, 'Rita Lee', 'Globo');
INSERT INTO produto VALUES (91, 'Biografia', 'Frida. A Biografia', 29.8999999999999986, 20, 'Hayden Herrera', 'Biblioteca Azul');
INSERT INTO produto VALUES (92, 'Biografia', 'Steve Jobs', 29.8999999999999986, 20, 'Walter Isaacson', 'Companhia das Letras');
INSERT INTO produto VALUES (93, 'Biografia', 'Stephen King. A Biografia', 29.8999999999999986, 20, 'Stephen King. A Biografia', 'DarkSide');
INSERT INTO produto VALUES (94, 'Biografia', 'Lincoln', 29.8999999999999986, 20, 'Doris Kearns Goodwin', 'Record');
INSERT INTO produto VALUES (95, 'Biografia', 'The Beatles: A única biografia autorizada', 29.8999999999999986, 20, 'Hunter Davies', 'Best Seller');
INSERT INTO produto VALUES (96, 'Biografia', 'Bowie. A Biografia', 29.8999999999999986, 20, 'Marc Spitz', 'Arx');
INSERT INTO produto VALUES (97, 'Religião', 'Cinema & religião: Perguntas e respostas', 29.8999999999999986, 20, 'Luiz Antonio Vadico', 'Paco e Littera');
INSERT INTO produto VALUES (98, 'Religião', 'O campo do filme religioso: Cinema, religião e sociedade', 29.8999999999999986, 20, 'Luiz Antonio Vadico', 'Paco Editorial');
INSERT INTO produto VALUES (99, 'Religião', 'Sincretismo Religioso e Ritos Sacrificiais. Influências das Religiões Afro no Catolicismo Popular Brasileiro', 29.8999999999999986, 20, 'José Carlos Pereira', 'Zouk');
INSERT INTO produto VALUES (100, 'Religião', 'Guerra, Açúcar E Religião No Brasil Dos Holandeses', 29.8999999999999986, 20, 'Adriana Lopez', 'Senac SP');


--
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 187
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('produto_id_seq', 100, true);


--
-- TOC entry 2431 (class 0 OID 16682)
-- Dependencies: 190
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: ronaldoarg
--

INSERT INTO usuario VALUES (1, '2017-07-09 21:35:55.566', 'ronaldo@email.com', 'Aragao', 'Ronaldo', '123', true, 'admin');
INSERT INTO usuario VALUES (3, '2017-07-10 00:40:24.278', 'ronaldo@email.com', 'Gomes', 'Ronaldo', '123', false, 'ronaldo');
INSERT INTO usuario VALUES (4, '2017-10-09 21:33:50.249', 'gigi@email.com', 'fonseca', 'giselle', 'senha123', false, 'gigi');


--
-- TOC entry 2448 (class 0 OID 0)
-- Dependencies: 189
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ronaldoarg
--

SELECT pg_catalog.setval('usuario_id_seq', 4, true);


--
-- TOC entry 2434 (class 0 OID 16722)
-- Dependencies: 193
-- Data for Name: venda; Type: TABLE DATA; Schema: public; Owner: ronaldoarg
--

INSERT INTO venda VALUES (3, '2017-07-09 21:54:15.474', 1);
INSERT INTO venda VALUES (4, '2017-07-09 21:55:02.775', 1);
INSERT INTO venda VALUES (5, '2017-07-09 21:55:58.719', 1);
INSERT INTO venda VALUES (6, '2017-10-07 13:52:34.497', 3);
INSERT INTO venda VALUES (7, '2017-10-09 21:34:04.037', 4);
INSERT INTO venda VALUES (8, '2017-10-11 02:15:42.357', 4);
INSERT INTO venda VALUES (9, '2017-10-11 02:20:30.025', 4);
INSERT INTO venda VALUES (10, '2017-10-11 02:23:22.441', 4);
INSERT INTO venda VALUES (11, '2017-10-11 02:25:00.195', 4);
INSERT INTO venda VALUES (12, '2017-11-10 23:50:46.852', 3);
INSERT INTO venda VALUES (13, '2017-11-10 23:53:33.758', 3);
INSERT INTO venda VALUES (14, '2017-11-10 23:55:15.159', 3);
INSERT INTO venda VALUES (15, '2017-11-10 23:57:14.46', 3);
INSERT INTO venda VALUES (16, '2017-11-10 23:58:40.042', 3);
INSERT INTO venda VALUES (17, '2017-11-10 23:59:30.309', 3);
INSERT INTO venda VALUES (18, '2017-11-11 00:01:05.957', 3);
INSERT INTO venda VALUES (19, '2017-11-11 00:02:27.026', 3);
INSERT INTO venda VALUES (20, '2017-11-11 00:03:06.701', 3);
INSERT INTO venda VALUES (21, '2017-11-11 00:05:00.781', 3);
INSERT INTO venda VALUES (22, '2017-11-11 00:08:16.345', 3);
INSERT INTO venda VALUES (23, '2017-11-11 00:09:21.29', 3);
INSERT INTO venda VALUES (24, '2017-11-11 00:14:02.954', 3);
INSERT INTO venda VALUES (25, '2017-11-11 00:20:15.281', 3);
INSERT INTO venda VALUES (26, '2017-11-11 00:22:33.273', 3);
INSERT INTO venda VALUES (27, '2017-11-11 00:26:25.788', 3);
INSERT INTO venda VALUES (28, '2017-11-11 00:26:55.564', 3);
INSERT INTO venda VALUES (29, '2017-11-11 00:28:23.652', 3);
INSERT INTO venda VALUES (30, '2017-11-11 00:29:48.445', 3);
INSERT INTO venda VALUES (31, '2017-11-11 00:32:23.397', 3);
INSERT INTO venda VALUES (32, '2017-11-11 00:34:45.35', 3);
INSERT INTO venda VALUES (33, '2017-11-11 00:52:34.98', 3);
INSERT INTO venda VALUES (34, '2017-11-11 00:56:54.327', 3);
INSERT INTO venda VALUES (35, '2017-11-11 00:59:28.096', 3);
INSERT INTO venda VALUES (36, '2017-11-11 01:06:40.5', 3);
INSERT INTO venda VALUES (37, '2017-11-11 01:10:21.303', 3);
INSERT INTO venda VALUES (38, '2017-11-11 01:21:27.679', 3);
INSERT INTO venda VALUES (39, '2017-11-11 01:21:57.525', 3);
INSERT INTO venda VALUES (40, '2017-11-11 01:27:59.074', 3);
INSERT INTO venda VALUES (41, '2017-11-11 01:35:11.238', 3);
INSERT INTO venda VALUES (42, '2017-11-11 01:35:24.178', 3);
INSERT INTO venda VALUES (43, '2017-11-11 01:44:27.053', 3);
INSERT INTO venda VALUES (44, '2017-11-11 01:45:14.903', 3);
INSERT INTO venda VALUES (45, '2017-11-11 01:51:12.886', 3);
INSERT INTO venda VALUES (46, '2017-11-11 01:52:55.558', 3);
INSERT INTO venda VALUES (47, '2017-11-11 01:53:04.903', 3);
INSERT INTO venda VALUES (48, '2017-11-11 01:53:15.824', 3);
INSERT INTO venda VALUES (49, '2017-11-11 01:54:44.424', 3);
INSERT INTO venda VALUES (50, '2017-11-11 01:56:50.042', 3);
INSERT INTO venda VALUES (51, '2017-11-11 01:58:39.484', 3);
INSERT INTO venda VALUES (52, '2017-11-11 02:02:11.325', 3);
INSERT INTO venda VALUES (53, '2017-11-11 02:04:41.054', 3);
INSERT INTO venda VALUES (54, '2017-11-11 02:07:25.495', 3);
INSERT INTO venda VALUES (55, '2017-11-11 02:11:08.446', 3);
INSERT INTO venda VALUES (56, '2017-11-11 02:13:18.415', 3);
INSERT INTO venda VALUES (57, '2017-11-11 02:16:53.221', 3);
INSERT INTO venda VALUES (58, '2017-11-11 02:18:25.063', 3);
INSERT INTO venda VALUES (59, '2017-11-11 02:20:04.174', 3);
INSERT INTO venda VALUES (60, '2017-11-11 02:22:12.453', 3);
INSERT INTO venda VALUES (61, '2017-11-11 02:23:38.256', 3);
INSERT INTO venda VALUES (62, '2017-11-11 02:24:36.074', 3);
INSERT INTO venda VALUES (63, '2017-11-11 02:26:09.124', 3);
INSERT INTO venda VALUES (64, '2017-11-11 02:27:52.325', 3);
INSERT INTO venda VALUES (65, '2017-11-11 02:35:36.363', 3);
INSERT INTO venda VALUES (66, '2017-11-11 02:36:06.252', 3);
INSERT INTO venda VALUES (67, '2017-11-11 02:38:48.802', 3);
INSERT INTO venda VALUES (68, '2017-11-11 02:39:06.129', 3);
INSERT INTO venda VALUES (69, '2017-11-11 02:39:30.504', 3);
INSERT INTO venda VALUES (70, '2017-11-11 02:39:47.266', 3);


--
-- TOC entry 2449 (class 0 OID 0)
-- Dependencies: 192
-- Name: venda_id_venda_seq; Type: SEQUENCE SET; Schema: public; Owner: ronaldoarg
--

SELECT pg_catalog.setval('venda_id_venda_seq', 70, true);


--
-- TOC entry 2432 (class 0 OID 16699)
-- Dependencies: 191
-- Data for Name: venda_produto; Type: TABLE DATA; Schema: public; Owner: ronaldoarg
--

INSERT INTO venda_produto VALUES (1, 12, 26);
INSERT INTO venda_produto VALUES (1, 12, 99);
INSERT INTO venda_produto VALUES (1, 13, 26);
INSERT INTO venda_produto VALUES (1, 14, 28);
INSERT INTO venda_produto VALUES (1, 15, 29);
INSERT INTO venda_produto VALUES (1, 16, 28);
INSERT INTO venda_produto VALUES (1, 17, 26);
INSERT INTO venda_produto VALUES (1, 18, 39);
INSERT INTO venda_produto VALUES (2, 19, 39);
INSERT INTO venda_produto VALUES (1, 20, 60);
INSERT INTO venda_produto VALUES (1, 21, 30);
INSERT INTO venda_produto VALUES (1, 22, 26);
INSERT INTO venda_produto VALUES (1, 23, 26);
INSERT INTO venda_produto VALUES (1, 24, 27);
INSERT INTO venda_produto VALUES (1, 25, 26);
INSERT INTO venda_produto VALUES (1, 26, 28);
INSERT INTO venda_produto VALUES (1, 27, 27);
INSERT INTO venda_produto VALUES (1, 28, 27);
INSERT INTO venda_produto VALUES (1, 29, 26);
INSERT INTO venda_produto VALUES (1, 30, 28);
INSERT INTO venda_produto VALUES (1, 30, 27);
INSERT INTO venda_produto VALUES (1, 30, 26);
INSERT INTO venda_produto VALUES (1, 31, 26);
INSERT INTO venda_produto VALUES (1, 32, 72);
INSERT INTO venda_produto VALUES (1, 33, 72);
INSERT INTO venda_produto VALUES (1, 34, 52);
INSERT INTO venda_produto VALUES (1, 35, 59);
INSERT INTO venda_produto VALUES (1, 36, 36);
INSERT INTO venda_produto VALUES (1, 37, 26);
INSERT INTO venda_produto VALUES (1, 38, 27);
INSERT INTO venda_produto VALUES (1, 39, 27);
INSERT INTO venda_produto VALUES (1, 40, 100);
INSERT INTO venda_produto VALUES (1, 41, 100);
INSERT INTO venda_produto VALUES (1, 42, 27);
INSERT INTO venda_produto VALUES (2, 43, 100);
INSERT INTO venda_produto VALUES (1, 44, 26);
INSERT INTO venda_produto VALUES (1, 45, 26);
INSERT INTO venda_produto VALUES (1, 46, 100);
INSERT INTO venda_produto VALUES (1, 47, 100);
INSERT INTO venda_produto VALUES (1, 48, 27);
INSERT INTO venda_produto VALUES (2, 49, 27);
INSERT INTO venda_produto VALUES (1, 50, 27);
INSERT INTO venda_produto VALUES (1, 51, 27);
INSERT INTO venda_produto VALUES (2, 52, 27);
INSERT INTO venda_produto VALUES (1, 53, 27);
INSERT INTO venda_produto VALUES (1, 54, 27);
INSERT INTO venda_produto VALUES (1, 55, 27);
INSERT INTO venda_produto VALUES (1, 56, 27);
INSERT INTO venda_produto VALUES (1, 57, 100);
INSERT INTO venda_produto VALUES (1, 58, 100);
INSERT INTO venda_produto VALUES (1, 59, 100);
INSERT INTO venda_produto VALUES (1, 60, 100);
INSERT INTO venda_produto VALUES (1, 61, 100);
INSERT INTO venda_produto VALUES (1, 62, 100);
INSERT INTO venda_produto VALUES (1, 63, 100);
INSERT INTO venda_produto VALUES (1, 64, 100);
INSERT INTO venda_produto VALUES (2, 65, 100);
INSERT INTO venda_produto VALUES (1, 66, 26);
INSERT INTO venda_produto VALUES (1, 67, 33);
INSERT INTO venda_produto VALUES (1, 68, 27);
INSERT INTO venda_produto VALUES (1, 69, 30);
INSERT INTO venda_produto VALUES (1, 70, 64);


--
-- TOC entry 2297 (class 2606 OID 16405)
-- Name: interacoes interacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: ronaldoarg
--

ALTER TABLE ONLY interacoes
    ADD CONSTRAINT interacoes_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 16679)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 16690)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: ronaldoarg
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 16727)
-- Name: venda venda_pkey; Type: CONSTRAINT; Schema: public; Owner: ronaldoarg
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (id_venda);


--
-- TOC entry 2303 (class 2606 OID 16703)
-- Name: venda_produto venda_produto_pkey; Type: CONSTRAINT; Schema: public; Owner: ronaldoarg
--

ALTER TABLE ONLY venda_produto
    ADD CONSTRAINT venda_produto_pkey PRIMARY KEY (id_venda, id_produto);


--
-- TOC entry 2308 (class 2606 OID 16728)
-- Name: venda fkd74vip3fhkvh86yr4sfv3mewu; Type: FK CONSTRAINT; Schema: public; Owner: ronaldoarg
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT fkd74vip3fhkvh86yr4sfv3mewu FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- TOC entry 2307 (class 2606 OID 16733)
-- Name: venda_produto fknkpfsn1umbllhm6gqcqnu9o5q; Type: FK CONSTRAINT; Schema: public; Owner: ronaldoarg
--

ALTER TABLE ONLY venda_produto
    ADD CONSTRAINT fknkpfsn1umbllhm6gqcqnu9o5q FOREIGN KEY (id_venda) REFERENCES venda(id_venda);


--
-- TOC entry 2306 (class 2606 OID 16714)
-- Name: venda_produto fkp0jnynwk8f89iffcv0enc8omc; Type: FK CONSTRAINT; Schema: public; Owner: ronaldoarg
--

ALTER TABLE ONLY venda_produto
    ADD CONSTRAINT fkp0jnynwk8f89iffcv0enc8omc FOREIGN KEY (id_produto) REFERENCES produto(id);


-- Completed on 2017-11-12 19:42:33 -03

--
-- PostgreSQL database dump complete
--


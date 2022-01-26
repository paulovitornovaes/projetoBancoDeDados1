-- Table: public.Obra_mangaAnimeAdapta

-- DROP TABLE IF EXISTS public."Obra_mangaAnimeAdapta";

CREATE TABLE IF NOT EXISTS public."Obra_mangaAnimeAdapta"
(
    anime_fk integer NOT NULL,
    obra_manga_fk integer NOT NULL,
    id integer NOT NULL,
    CONSTRAINT "Obra_mangaAnimeAdapta_pkey" PRIMARY KEY (id),
    CONSTRAINT "Obra_mangaAnimeAdapta_anime_fk_fkey" FOREIGN KEY (anime_fk)
        REFERENCES public.anime (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Obra_mangaAnimeAdapta_obra_manga_fk_fkey" FOREIGN KEY (obra_manga_fk)
        REFERENCES public.obra_manga (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Obra_mangaAnimeAdapta"
    OWNER to postgres;


-- Table: public.Obra_mangaCategoriaClassifica

-- DROP TABLE IF EXISTS public."Obra_mangaCategoriaClassifica";

CREATE TABLE IF NOT EXISTS public."Obra_mangaCategoriaClassifica"
(
    obra_manga_fk integer NOT NULL,
    categoria_fk integer NOT NULL,
    id integer NOT NULL,
    CONSTRAINT "Obra_mangaCategoriaClassifica_pkey" PRIMARY KEY (id),
    CONSTRAINT "Obra_mangaCategoriaClassifica_categoria_fk_fkey" FOREIGN KEY (categoria_fk)
        REFERENCES public.categoria (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Obra_mangaCategoriaClassifica_obra_manga_fk_fkey" FOREIGN KEY (obra_manga_fk)
        REFERENCES public.obra_manga (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Obra_mangaCategoriaClassifica"
    OWNER to postgres;


-- Table: public.anime

-- DROP TABLE IF EXISTS public.anime;

CREATE TABLE IF NOT EXISTS public.anime
(
    id integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    class_ind character varying COLLATE pg_catalog."default" NOT NULL,
    obra_manga_fk integer NOT NULL,
    estudio_fk integer NOT NULL,
    CONSTRAINT anime_pkey PRIMARY KEY (id),
    CONSTRAINT anime_estudio_fk_fkey FOREIGN KEY (estudio_fk)
        REFERENCES public.estudio (cnpj) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.anime
    OWNER to postgres;


-- Table: public.categoria

-- DROP TABLE IF EXISTS public.categoria;

CREATE TABLE IF NOT EXISTS public.categoria
(
    id integer NOT NULL,
    nome character(1) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT categoria_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.categoria
    OWNER to postgres;


-- Table: public.editora

-- DROP TABLE IF EXISTS public.editora;

CREATE TABLE IF NOT EXISTS public.editora
(
    cnpj integer NOT NULL,
    nome character varying COLLATE pg_catalog."default",
    "endereço" character varying COLLATE pg_catalog."default",
    CONSTRAINT editora_pkey PRIMARY KEY (cnpj)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.editora
    OWNER to postgres;


-- Table: public.estudio

-- DROP TABLE IF EXISTS public.estudio;

CREATE TABLE IF NOT EXISTS public.estudio
(
    cnpj integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    endereco character varying COLLATE pg_catalog."default",
    editora_fk integer NOT NULL,
    CONSTRAINT estudio_pkey PRIMARY KEY (cnpj),
    CONSTRAINT estudio_editora_fk_fkey FOREIGN KEY (editora_fk)
        REFERENCES public.editora (cnpj) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.estudio
    OWNER to postgres;


-- Table: public.func_editora

-- DROP TABLE IF EXISTS public.func_editora;

CREATE TABLE IF NOT EXISTS public.func_editora
(
    id integer NOT NULL,
    nome character(1) COLLATE pg_catalog."default" NOT NULL,
    salario double precision NOT NULL,
    editora_fk integer NOT NULL,
    dt_inicio date NOT NULL,
    dt_fim date NOT NULL,
    CONSTRAINT func_editora_pkey PRIMARY KEY (id),
    CONSTRAINT func_editora_editora_fk_fkey FOREIGN KEY (editora_fk)
        REFERENCES public.editora (cnpj) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.func_editora
    OWNER to postgres;


-- Table: public.mangaka

-- DROP TABLE IF EXISTS public.mangaka;

CREATE TABLE IF NOT EXISTS public.mangaka
(
    id integer NOT NULL,
    func_editora_fk integer NOT NULL,
    CONSTRAINT mangaka_pkey PRIMARY KEY (id),
    CONSTRAINT mangaka_func_editora_fk_fkey FOREIGN KEY (func_editora_fk)
        REFERENCES public.func_editora (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.mangaka
    OWNER to postgres;


-- Table: public.mangaka_obraMangaEscreve

-- DROP TABLE IF EXISTS public."mangaka_obraMangaEscreve";

CREATE TABLE IF NOT EXISTS public."mangaka_obraMangaEscreve"
(
    id integer NOT NULL,
    obra_manga_fk integer NOT NULL,
    mangaka_fk integer NOT NULL,
    CONSTRAINT "mangaka_obraMangaEscreve_pkey" PRIMARY KEY (id),
    CONSTRAINT "mangaka_obraMangaEscreve_mangaka_fk_fkey" FOREIGN KEY (mangaka_fk)
        REFERENCES public.mangaka (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "mangaka_obraMangaEscreve_obra_manga_fk_fkey" FOREIGN KEY (obra_manga_fk)
        REFERENCES public.obra_manga (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."mangaka_obraMangaEscreve"
    OWNER to postgres;


-- Table: public.obra_manga

-- DROP TABLE IF EXISTS public.obra_manga;

CREATE TABLE IF NOT EXISTS public.obra_manga
(
    id integer NOT NULL,
    num_leitores integer NOT NULL,
    num_cap integer NOT NULL,
    revista_fk integer NOT NULL,
    CONSTRAINT obra_manga_pkey PRIMARY KEY (id),
    CONSTRAINT obra_manga_revista_fk_fkey FOREIGN KEY (revista_fk)
        REFERENCES public.revista (isbn) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.obra_manga
    OWNER to postgres;


-- Table: public.revista

-- DROP TABLE IF EXISTS public.revista;

CREATE TABLE IF NOT EXISTS public.revista
(
    isbn integer NOT NULL,
    num_vol integer NOT NULL,
    num_cap integer NOT NULL,
    titulo character(1) COLLATE pg_catalog."default" NOT NULL,
    volume_fk integer NOT NULL,
    CONSTRAINT revista_pkey PRIMARY KEY (isbn)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.revista
    OWNER to postgres;


-- Table: public.volume

-- DROP TABLE IF EXISTS public.volume;

CREATE TABLE IF NOT EXISTS public.volume
(
    isbn integer NOT NULL,
    num_vol integer NOT NULL,
    titulo character(1) COLLATE pg_catalog."default" NOT NULL,
    obra_manga_fk integer NOT NULL,
    CONSTRAINT volume_pkey PRIMARY KEY (isbn),
    CONSTRAINT volume_obra_manga_fk_fkey FOREIGN KEY (obra_manga_fk)
        REFERENCES public.obra_manga (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.volume
    OWNER to postgres;
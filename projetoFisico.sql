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
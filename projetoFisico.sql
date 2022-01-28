-- Table: public.animador

-- DROP TABLE IF EXISTS public.animador;

CREATE TABLE IF NOT EXISTS public.animador
(
    func_estudio_fk integer NOT NULL,
    animador_chefe_fk integer NOT NULL,
    avali_desemp character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT animador_pkey PRIMARY KEY (func_estudio_fk)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.animador
    OWNER to postgres;

-- Table: public.animadorEpisodioAnima

-- DROP TABLE IF EXISTS public."animadorEpisodioAnima";

CREATE TABLE IF NOT EXISTS public."animadorEpisodioAnima"
(
    animador_fk integer NOT NULL,
    episodio_fk integer NOT NULL,
    CONSTRAINT "animadorEpisodioAnima_pkey" PRIMARY KEY (animador_fk)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."animadorEpisodioAnima"
    OWNER to postgres;

-- Table: public.anime

-- DROP TABLE IF EXISTS public.anime;

CREATE TABLE IF NOT EXISTS public.anime
(
    id integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    class_ind integer NOT NULL,
    obra_manga_fk integer NOT NULL,
    CONSTRAINT anime_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.anime
    OWNER to postgres;


-- Table: public.animeEstudioProduz

-- DROP TABLE IF EXISTS public."animeEstudioProduz";

CREATE TABLE IF NOT EXISTS public."animeEstudioProduz"
(
    anime_fk integer NOT NULL,
    estudio_fk integer NOT NULL,
    CONSTRAINT "animeEstudioProduz_pkey" PRIMARY KEY (anime_fk)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."animeEstudioProduz"
    OWNER to postgres;

-- Table: public.animeFunc_estudiosEscalam

-- DROP TABLE IF EXISTS public."animeFunc_estudiosEscalam";

CREATE TABLE IF NOT EXISTS public."animeFunc_estudiosEscalam"
(
    anime_fk integer NOT NULL,
    func_estudio integer NOT NULL,
    "dt_escalação" date NOT NULL,
    CONSTRAINT "animeFunc_estudiosEscalam_pkey" PRIMARY KEY (anime_fk)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."animeFunc_estudiosEscalam"
    OWNER to postgres;

-- Table: public.animeGeneroClassifica

-- DROP TABLE IF EXISTS public."animeGeneroClassifica";

CREATE TABLE IF NOT EXISTS public."animeGeneroClassifica"
(
    anime_fk integer NOT NULL,
    genero_fk integer NOT NULL,
    CONSTRAINT "animeGeneroClassifica_pkey" PRIMARY KEY (anime_fk)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."animeGeneroClassifica"
    OWNER to postgres;

-- Table: public.animeStreamingLancados

-- DROP TABLE IF EXISTS public."animeStreamingLancados";

CREATE TABLE IF NOT EXISTS public."animeStreamingLancados"
(
    streaming_fk integer NOT NULL,
    anime_fk integer NOT NULL,
    CONSTRAINT "animeStreamingLancados_pkey" PRIMARY KEY (streaming_fk)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."animeStreamingLancados"
    OWNER to postgres;

-- Table: public.categoria

-- DROP TABLE IF EXISTS public.categoria;

CREATE TABLE IF NOT EXISTS public.categoria
(
    id integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT categoria_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.categoria
    OWNER to postgres;


-- Table: public.editor

-- DROP TABLE IF EXISTS public.editor;

CREATE TABLE IF NOT EXISTS public.editor
(
    func_editora_fk integer NOT NULL,
    editor_chefe_fk integer NOT NULL,
    avali_desemp character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT editor_pkey PRIMARY KEY (func_editora_fk)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.editor
    OWNER to postgres;

-- Table: public.editor_obraMangaEdita

-- DROP TABLE IF EXISTS public."editor_obraMangaEdita";

CREATE TABLE IF NOT EXISTS public."editor_obraMangaEdita"
(
    obra_manga_fk integer NOT NULL,
    func_editora_fk integer NOT NULL,
    CONSTRAINT "editor_obraMangaEdita_pkey" PRIMARY KEY (obra_manga_fk)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."editor_obraMangaEdita"
    OWNER to postgres;

-- Table: public.editora

-- DROP TABLE IF EXISTS public.editora;

CREATE TABLE IF NOT EXISTS public.editora
(
    cnpj integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    "endereço" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT editora_pkey PRIMARY KEY (cnpj)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.editora
    OWNER to postgres;

-- Table: public.episodio

-- DROP TABLE IF EXISTS public.episodio;

CREATE TABLE IF NOT EXISTS public.episodio
(
    num integer NOT NULL,
    titulo character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT episodio_pkey PRIMARY KEY (num)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.episodio
    OWNER to postgres;

-- Table: public.estudio

-- DROP TABLE IF EXISTS public.estudio;

CREATE TABLE IF NOT EXISTS public.estudio
(
    cnpj integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    endereco character varying COLLATE pg_catalog."default" NOT NULL,
    editora_fk integer NOT NULL,
    CONSTRAINT estudio_pkey PRIMARY KEY (cnpj)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.estudio
    OWNER to postgres;

-- Table: public.estudioFunc_estudioContratam

-- DROP TABLE IF EXISTS public."estudioFunc_estudioContratam";

CREATE TABLE IF NOT EXISTS public."estudioFunc_estudioContratam"
(
    estudio_fk integer,
    func_estudio_fk integer,
    dt_fim date,
    dt_inicio date
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."estudioFunc_estudioContratam"
    OWNER to postgres;

-- Table: public.estudioStreamingLicencia

-- DROP TABLE IF EXISTS public."estudioStreamingLicencia";

CREATE TABLE IF NOT EXISTS public."estudioStreamingLicencia"
(
    estudio_fk integer NOT NULL,
    streaming_fk integer NOT NULL,
    CONSTRAINT "estudioStreamingLicencia_pkey" PRIMARY KEY (estudio_fk)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."estudioStreamingLicencia"
    OWNER to postgres;

-- Table: public.func_editora

-- DROP TABLE IF EXISTS public.func_editora;

CREATE TABLE IF NOT EXISTS public.func_editora
(
    id integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    salario double precision NOT NULL,
    tipo character varying COLLATE pg_catalog."default" NOT NULL,
    editora_fk integer NOT NULL,
    dt_inicio date NOT NULL,
    dt_fim date,
    CONSTRAINT func_editora_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.func_editora
    OWNER to postgres;


-- Table: public.func_estudio

-- DROP TABLE IF EXISTS public.func_estudio;

CREATE TABLE IF NOT EXISTS public.func_estudio
(
    id integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    salario double precision NOT NULL,
    tipo character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT func_estudio_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.func_estudio
    OWNER to postgres;


-- Table: public.genero

-- DROP TABLE IF EXISTS public.genero;

CREATE TABLE IF NOT EXISTS public.genero
(
    id integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genero_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.genero
    OWNER to postgres;


-- Table: public.mangaka_obraMangaEscreve

-- DROP TABLE IF EXISTS public."mangaka_obraMangaEscreve";

CREATE TABLE IF NOT EXISTS public."mangaka_obraMangaEscreve"
(
    obra_manga_fk integer NOT NULL,
    func_editora_fk integer NOT NULL,
    CONSTRAINT "mangaka_obraMangaEscreve_pkey" PRIMARY KEY (obra_manga_fk)
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
    CONSTRAINT obra_manga_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.obra_manga
    OWNER to postgres;

-- Table: public.obra_mangaAnimeAdapta

-- DROP TABLE IF EXISTS public."obra_mangaAnimeAdapta";

CREATE TABLE IF NOT EXISTS public."obra_mangaAnimeAdapta"
(
    anime_fk integer NOT NULL,
    obra_manga_fk integer NOT NULL,
    CONSTRAINT "Obra_mangaAnimeAdapta_pkey" PRIMARY KEY (anime_fk)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."obra_mangaAnimeAdapta"
    OWNER to postgres;


-- Table: public.obra_mangaCategoriaClassifica

-- DROP TABLE IF EXISTS public."obra_mangaCategoriaClassifica";

CREATE TABLE IF NOT EXISTS public."obra_mangaCategoriaClassifica"
(
    obra_manga_fk integer NOT NULL,
    categoria_fk integer NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."obra_mangaCategoriaClassifica"
    OWNER to postgres;


-- Table: public.país

-- DROP TABLE IF EXISTS public."país";

CREATE TABLE IF NOT EXISTS public."país"
(
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "país_pkey" PRIMARY KEY (nome)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."país"
    OWNER to postgres;


-- Table: public.personagem

-- DROP TABLE IF EXISTS public.personagem;

CREATE TABLE IF NOT EXISTS public.personagem
(
    id integer NOT NULL,
    dublador_fk integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT personagem_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.personagem
    OWNER to postgres;


-- Table: public.revista

-- DROP TABLE IF EXISTS public.revista;

CREATE TABLE IF NOT EXISTS public.revista
(
    isbn integer NOT NULL,
    num_vol integer NOT NULL,
    num_cap integer,
    titulo character varying COLLATE pg_catalog."default" NOT NULL,
    volume_fk integer,
    CONSTRAINT revista_pkey PRIMARY KEY (isbn)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.revista
    OWNER to postgres;

-- Table: public.roteiristaEpisodioRoteirizam

-- DROP TABLE IF EXISTS public."roteiristaEpisodioRoteirizam";

CREATE TABLE IF NOT EXISTS public."roteiristaEpisodioRoteirizam"
(
    roteirista_fk integer NOT NULL,
    episodio_fk integer NOT NULL,
    CONSTRAINT "roteiristaEpisodioRoteirizam_pkey" PRIMARY KEY (roteirista_fk)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."roteiristaEpisodioRoteirizam"
    OWNER to postgres;


-- Table: public.streaming

-- DROP TABLE IF EXISTS public.streaming;

CREATE TABLE IF NOT EXISTS public.streaming
(
    cnpj integer NOT NULL,
    nome character varying COLLATE pg_catalog."default" NOT NULL,
    estudio_fk integer NOT NULL,
    CONSTRAINT streaming_pkey PRIMARY KEY (cnpj)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.streaming
    OWNER to postgres;

-- Table: public.streamingPaísDisponibilidade

-- DROP TABLE IF EXISTS public."streamingPaísDisponibilidade";

CREATE TABLE IF NOT EXISTS public."streamingPaísDisponibilidade"
(
    streaming_fk integer NOT NULL,
    "país_fk" integer NOT NULL,
    CONSTRAINT "streamingPaísDisponibilidade_pkey" PRIMARY KEY (streaming_fk)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."streamingPaísDisponibilidade"
    OWNER to postgres;


-- Table: public.volume

-- DROP TABLE IF EXISTS public.volume;

CREATE TABLE IF NOT EXISTS public.volume
(
    isbn integer NOT NULL,
    num_vol integer NOT NULL,
    titulo character varying COLLATE pg_catalog."default" NOT NULL,
    obra_manga_fk integer NOT NULL,
    CONSTRAINT volume_pkey PRIMARY KEY (isbn)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.volume
    OWNER to postgres;
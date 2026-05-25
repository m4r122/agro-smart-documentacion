--
-- PostgreSQL database dump
--


-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-05-23 18:20:51

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

SET default_table_access_method = heap;

--
-- TOC entry 245 (class 1259 OID 37227)
-- Name: anomalias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.anomalias (
    id_anomalia integer NOT NULL,
    nombre character varying(300),
    tipo character varying(250),
    estado character varying(250),
    descripcion character varying(500),
    nivel_severidad character varying(100),
    fecha_deteccion timestamp without time zone,
    id_siembra integer,
    id_usuario integer
);


ALTER TABLE public.anomalias OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 37226)
-- Name: anomalias_id_anomalia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.anomalias_id_anomalia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.anomalias_id_anomalia_seq OWNER TO postgres;

--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 244
-- Name: anomalias_id_anomalia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.anomalias_id_anomalia_seq OWNED BY public.anomalias.id_anomalia;


--
-- TOC entry 221 (class 1259 OID 37039)
-- Name: auxiliares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auxiliares (
    id_usuario integer NOT NULL,
    id_productor integer
);


ALTER TABLE public.auxiliares OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 37077)
-- Name: climas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.climas (
    id_clima integer NOT NULL,
    precipitacion double precision,
    condicion character varying(50),
    temperatura numeric,
    fecha_medicion date,
    fecha_registro date,
    id_ubicacion integer
);


ALTER TABLE public.climas OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 37076)
-- Name: climas_id_clima_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.climas_id_clima_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.climas_id_clima_seq OWNER TO postgres;

--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 226
-- Name: climas_id_clima_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.climas_id_clima_seq OWNED BY public.climas.id_clima;


--
-- TOC entry 233 (class 1259 OID 37117)
-- Name: cultivos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cultivos (
    id_cultivo integer NOT NULL,
    numero_lote integer,
    nombre character varying(100),
    id_tipocultivo integer
);


ALTER TABLE public.cultivos OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 37116)
-- Name: cultivos_id_cultivo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cultivos_id_cultivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cultivos_id_cultivo_seq OWNER TO postgres;

--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 232
-- Name: cultivos_id_cultivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cultivos_id_cultivo_seq OWNED BY public.cultivos.id_cultivo;


--
-- TOC entry 255 (class 1259 OID 37291)
-- Name: ejecuciones_tareas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ejecuciones_tareas (
    id_ejecucion_tarea integer NOT NULL,
    id_tarea integer,
    id_auxiliar integer,
    id_operativo integer,
    fecha_estado timestamp without time zone,
    estado character varying(50),
    fecha_limite timestamp without time zone,
    id_creado_por integer
);


ALTER TABLE public.ejecuciones_tareas OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 37290)
-- Name: ejecuciones_tareas_id_ejecucion_tarea_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ejecuciones_tareas_id_ejecucion_tarea_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ejecuciones_tareas_id_ejecucion_tarea_seq OWNER TO postgres;

--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 254
-- Name: ejecuciones_tareas_id_ejecucion_tarea_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ejecuciones_tareas_id_ejecucion_tarea_seq OWNED BY public.ejecuciones_tareas.id_ejecucion_tarea;


--
-- TOC entry 251 (class 1259 OID 37270)
-- Name: estado_tareas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado_tareas (
    idestado_tareas integer NOT NULL,
    nombre character varying(250)
);


ALTER TABLE public.estado_tareas OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 37269)
-- Name: estado_tareas_idestado_tareas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_tareas_idestado_tareas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estado_tareas_idestado_tareas_seq OWNER TO postgres;

--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 250
-- Name: estado_tareas_idestado_tareas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_tareas_idestado_tareas_seq OWNED BY public.estado_tareas.idestado_tareas;


--
-- TOC entry 234 (class 1259 OID 37138)
-- Name: estadoscultivos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estadoscultivos (
    id_estadocultivo integer NOT NULL,
    nombre character varying(500)
);


ALTER TABLE public.estadoscultivos OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 37246)
-- Name: finanzas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.finanzas (
    id_finanza integer NOT NULL,
    descripcion character varying(250),
    fecha_registro timestamp without time zone,
    fecha_actualizacion timestamp without time zone,
    monto double precision,
    tipo_transaccion character varying(100),
    categoria character varying(100),
    id_usuario_productor integer
);


ALTER TABLE public.finanzas OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 37245)
-- Name: finanzas_id_finanza_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.finanzas_id_finanza_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.finanzas_id_finanza_seq OWNER TO postgres;

--
-- TOC entry 5134 (class 0 OID 0)
-- Dependencies: 246
-- Name: finanzas_id_finanza_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.finanzas_id_finanza_seq OWNED BY public.finanzas.id_finanza;


--
-- TOC entry 229 (class 1259 OID 37091)
-- Name: fincas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fincas (
    id_finca integer NOT NULL,
    nombre_finca character varying(100),
    hectareas numeric,
    id_ubicacion integer,
    id_usuario_productor integer,
    num_lotes integer NOT NULL
);


ALTER TABLE public.fincas OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 37090)
-- Name: fincas_id_finca_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fincas_id_finca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fincas_id_finca_seq OWNER TO postgres;

--
-- TOC entry 5137 (class 0 OID 0)
-- Dependencies: 228
-- Name: fincas_id_finca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fincas_id_finca_seq OWNED BY public.fincas.id_finca;


--
-- TOC entry 241 (class 1259 OID 37188)
-- Name: notificaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notificaciones (
    id_notificacion integer NOT NULL,
    estado character varying(50),
    tipo character varying(100),
    prioridad character varying(50),
    fecha_creacion timestamp without time zone,
    id_clima integer,
    id_usuario integer,
    titulo character varying(250),
    mensaje character varying(500),
    id_anomalia integer,
    id_recomendacion integer
);


ALTER TABLE public.notificaciones OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 37187)
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notificaciones_id_notificacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notificaciones_id_notificacion_seq OWNER TO postgres;

--
-- TOC entry 5140 (class 0 OID 0)
-- Dependencies: 240
-- Name: notificaciones_id_notificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notificaciones_id_notificacion_seq OWNED BY public.notificaciones.id_notificacion;


--
-- TOC entry 222 (class 1259 OID 37049)
-- Name: operario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operario (
    id_usuario integer NOT NULL,
    id_productor integer
);


ALTER TABLE public.operario OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 45683)
-- Name: preferencias_notificacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.preferencias_notificacion (
    id_preferencia integer NOT NULL,
    id_usuario integer NOT NULL,
    tipo_alerta character varying(100) NOT NULL,
    activo boolean DEFAULT true NOT NULL,
    nivel_minimo_prioridad character varying(50)
);


ALTER TABLE public.preferencias_notificacion OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 45682)
-- Name: preferencias_notificacion_id_preferencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.preferencias_notificacion_id_preferencia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.preferencias_notificacion_id_preferencia_seq OWNER TO postgres;

--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 258
-- Name: preferencias_notificacion_id_preferencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.preferencias_notificacion_id_preferencia_seq OWNED BY public.preferencias_notificacion.id_preferencia;


--
-- TOC entry 223 (class 1259 OID 37059)
-- Name: productores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productores (
    id_usuario integer NOT NULL
);


ALTER TABLE public.productores OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 37205)
-- Name: reacciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reacciones (
    id_reacciones integer NOT NULL,
    id_operario integer,
    id_productor integer,
    id_recomendacion integer,
    tipo character varying(100),
    fecha_reaccion timestamp without time zone
);


ALTER TABLE public.reacciones OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 37204)
-- Name: reacciones_id_reacciones_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reacciones_id_reacciones_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reacciones_id_reacciones_seq OWNER TO postgres;

--
-- TOC entry 5148 (class 0 OID 0)
-- Dependencies: 242
-- Name: reacciones_id_reacciones_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reacciones_id_reacciones_seq OWNED BY public.reacciones.id_reacciones;


--
-- TOC entry 239 (class 1259 OID 37176)
-- Name: recomendaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recomendaciones (
    id_recomendacion integer NOT NULL,
    descripcion text,
    fecha_generacion timestamp without time zone,
    id_clima integer,
    id_anomalia integer,
    id_siembra integer,
    categoria character varying(100),
    prioridad character varying(50),
    estado character varying(50)
);


ALTER TABLE public.recomendaciones OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 37175)
-- Name: recomendaciones_id_recomendacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recomendaciones_id_recomendacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recomendaciones_id_recomendacion_seq OWNER TO postgres;

--
-- TOC entry 5151 (class 0 OID 0)
-- Dependencies: 238
-- Name: recomendaciones_id_recomendacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recomendaciones_id_recomendacion_seq OWNED BY public.recomendaciones.id_recomendacion;


--
-- TOC entry 249 (class 1259 OID 37258)
-- Name: reportes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reportes (
    id_reporte integer NOT NULL,
    formato character varying(50),
    nombre_reporte character varying(100),
    tipo_periodicidad character varying(100),
    fecha_creacion timestamp without time zone,
    id_usuario_productor integer
);


ALTER TABLE public.reportes OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 37257)
-- Name: reportes_id_reporte_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reportes_id_reporte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reportes_id_reporte_seq OWNER TO postgres;

--
-- TOC entry 5154 (class 0 OID 0)
-- Dependencies: 248
-- Name: reportes_id_reporte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reportes_id_reporte_seq OWNED BY public.reportes.id_reporte;


--
-- TOC entry 218 (class 1259 OID 37017)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id_rol integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 37016)
-- Name: roles_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_rol_seq OWNER TO postgres;

--
-- TOC entry 5157 (class 0 OID 0)
-- Dependencies: 217
-- Name: roles_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_rol_seq OWNED BY public.roles.id_rol;


--
-- TOC entry 236 (class 1259 OID 37144)
-- Name: siembras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siembras (
    id_siembra integer NOT NULL,
    id_cultivo integer NOT NULL,
    id_finca integer NOT NULL,
    num_lote integer NOT NULL
);


ALTER TABLE public.siembras OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 37160)
-- Name: siembras_estadocultivos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siembras_estadocultivos (
    id_siembra integer NOT NULL,
    id_estadocultivo integer NOT NULL,
    fecha_estado timestamp without time zone
);


ALTER TABLE public.siembras_estadocultivos OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 37143)
-- Name: siembras_id_siembra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.siembras_id_siembra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.siembras_id_siembra_seq OWNER TO postgres;

--
-- TOC entry 5161 (class 0 OID 0)
-- Dependencies: 235
-- Name: siembras_id_siembra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.siembras_id_siembra_seq OWNED BY public.siembras.id_siembra;


--
-- TOC entry 253 (class 1259 OID 37277)
-- Name: tareas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tareas (
    id_tarea integer NOT NULL,
    descripcion character varying(250),
    id_tipo_tarea integer,
    id_siembra integer,
    fecha_limite timestamp without time zone
);


ALTER TABLE public.tareas OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 37276)
-- Name: tareas_id_tarea_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tareas_id_tarea_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tareas_id_tarea_seq OWNER TO postgres;

--
-- TOC entry 5164 (class 0 OID 0)
-- Dependencies: 252
-- Name: tareas_id_tarea_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tareas_id_tarea_seq OWNED BY public.tareas.id_tarea;


--
-- TOC entry 231 (class 1259 OID 37110)
-- Name: tipos_cultivos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipos_cultivos (
    idtipos_cultivos integer NOT NULL,
    nombre character varying(100)
);


ALTER TABLE public.tipos_cultivos OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 37109)
-- Name: tipos_cultivos_idtipos_cultivos_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipos_cultivos_idtipos_cultivos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipos_cultivos_idtipos_cultivos_seq OWNER TO postgres;

--
-- TOC entry 5167 (class 0 OID 0)
-- Dependencies: 230
-- Name: tipos_cultivos_idtipos_cultivos_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipos_cultivos_idtipos_cultivos_seq OWNED BY public.tipos_cultivos.idtipos_cultivos;


--
-- TOC entry 257 (class 1259 OID 45626)
-- Name: tipos_tarea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipos_tarea (
    id_tipo_tarea integer NOT NULL,
    nombre character varying(250) NOT NULL,
    descripcion character varying(500)
);


ALTER TABLE public.tipos_tarea OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 45625)
-- Name: tipos_tarea_id_tipo_tarea_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipos_tarea_id_tipo_tarea_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipos_tarea_id_tipo_tarea_seq OWNER TO postgres;

--
-- TOC entry 5170 (class 0 OID 0)
-- Dependencies: 256
-- Name: tipos_tarea_id_tipo_tarea_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipos_tarea_id_tipo_tarea_seq OWNED BY public.tipos_tarea.id_tipo_tarea;


--
-- TOC entry 225 (class 1259 OID 37070)
-- Name: ubicaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ubicaciones (
    id_ubicacion integer NOT NULL,
    nombre character varying(100),
    latitud character varying(100),
    longitud character varying(100)
);


ALTER TABLE public.ubicaciones OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 37069)
-- Name: ubicaciones_id_ubicacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ubicaciones_id_ubicacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ubicaciones_id_ubicacion_seq OWNER TO postgres;

--
-- TOC entry 5173 (class 0 OID 0)
-- Dependencies: 224
-- Name: ubicaciones_id_ubicacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ubicaciones_id_ubicacion_seq OWNED BY public.ubicaciones.id_ubicacion;


--
-- TOC entry 220 (class 1259 OID 37024)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre character varying(250) NOT NULL,
    apellido character varying(250) NOT NULL,
    correo character varying(250) NOT NULL,
    contrasena character varying(500) NOT NULL,
    telefono character varying(50),
    fecha_nacimiento timestamp without time zone,
    id_rol integer NOT NULL,
    activo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 37023)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 5176 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- TOC entry 4866 (class 2604 OID 37230)
-- Name: anomalias id_anomalia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anomalias ALTER COLUMN id_anomalia SET DEFAULT nextval('public.anomalias_id_anomalia_seq'::regclass);


--
-- TOC entry 4858 (class 2604 OID 37080)
-- Name: climas id_clima; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.climas ALTER COLUMN id_clima SET DEFAULT nextval('public.climas_id_clima_seq'::regclass);


--
-- TOC entry 4861 (class 2604 OID 37120)
-- Name: cultivos id_cultivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cultivos ALTER COLUMN id_cultivo SET DEFAULT nextval('public.cultivos_id_cultivo_seq'::regclass);


--
-- TOC entry 4871 (class 2604 OID 37294)
-- Name: ejecuciones_tareas id_ejecucion_tarea; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejecuciones_tareas ALTER COLUMN id_ejecucion_tarea SET DEFAULT nextval('public.ejecuciones_tareas_id_ejecucion_tarea_seq'::regclass);


--
-- TOC entry 4869 (class 2604 OID 37273)
-- Name: estado_tareas idestado_tareas; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_tareas ALTER COLUMN idestado_tareas SET DEFAULT nextval('public.estado_tareas_idestado_tareas_seq'::regclass);


--
-- TOC entry 4867 (class 2604 OID 37249)
-- Name: finanzas id_finanza; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finanzas ALTER COLUMN id_finanza SET DEFAULT nextval('public.finanzas_id_finanza_seq'::regclass);


--
-- TOC entry 4859 (class 2604 OID 37094)
-- Name: fincas id_finca; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fincas ALTER COLUMN id_finca SET DEFAULT nextval('public.fincas_id_finca_seq'::regclass);


--
-- TOC entry 4864 (class 2604 OID 37191)
-- Name: notificaciones id_notificacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones ALTER COLUMN id_notificacion SET DEFAULT nextval('public.notificaciones_id_notificacion_seq'::regclass);


--
-- TOC entry 4873 (class 2604 OID 45686)
-- Name: preferencias_notificacion id_preferencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preferencias_notificacion ALTER COLUMN id_preferencia SET DEFAULT nextval('public.preferencias_notificacion_id_preferencia_seq'::regclass);


--
-- TOC entry 4865 (class 2604 OID 37208)
-- Name: reacciones id_reacciones; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reacciones ALTER COLUMN id_reacciones SET DEFAULT nextval('public.reacciones_id_reacciones_seq'::regclass);


--
-- TOC entry 4863 (class 2604 OID 37179)
-- Name: recomendaciones id_recomendacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recomendaciones ALTER COLUMN id_recomendacion SET DEFAULT nextval('public.recomendaciones_id_recomendacion_seq'::regclass);


--
-- TOC entry 4868 (class 2604 OID 37261)
-- Name: reportes id_reporte; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reportes ALTER COLUMN id_reporte SET DEFAULT nextval('public.reportes_id_reporte_seq'::regclass);


--
-- TOC entry 4854 (class 2604 OID 37020)
-- Name: roles id_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id_rol SET DEFAULT nextval('public.roles_id_rol_seq'::regclass);


--
-- TOC entry 4862 (class 2604 OID 37147)
-- Name: siembras id_siembra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siembras ALTER COLUMN id_siembra SET DEFAULT nextval('public.siembras_id_siembra_seq'::regclass);


--
-- TOC entry 4870 (class 2604 OID 37280)
-- Name: tareas id_tarea; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tareas ALTER COLUMN id_tarea SET DEFAULT nextval('public.tareas_id_tarea_seq'::regclass);


--
-- TOC entry 4860 (class 2604 OID 37113)
-- Name: tipos_cultivos idtipos_cultivos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_cultivos ALTER COLUMN idtipos_cultivos SET DEFAULT nextval('public.tipos_cultivos_idtipos_cultivos_seq'::regclass);


--
-- TOC entry 4872 (class 2604 OID 45629)
-- Name: tipos_tarea id_tipo_tarea; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_tarea ALTER COLUMN id_tipo_tarea SET DEFAULT nextval('public.tipos_tarea_id_tipo_tarea_seq'::regclass);


--
-- TOC entry 4857 (class 2604 OID 37073)
-- Name: ubicaciones id_ubicacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicaciones ALTER COLUMN id_ubicacion SET DEFAULT nextval('public.ubicaciones_id_ubicacion_seq'::regclass);


--
-- TOC entry 4855 (class 2604 OID 37027)
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 4912 (class 2606 OID 37234)
-- Name: anomalias anomalias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anomalias
    ADD CONSTRAINT anomalias_pkey PRIMARY KEY (id_anomalia);


--
-- TOC entry 4882 (class 2606 OID 37043)
-- Name: auxiliares auxiliares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auxiliares
    ADD CONSTRAINT auxiliares_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4890 (class 2606 OID 37084)
-- Name: climas climas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.climas
    ADD CONSTRAINT climas_pkey PRIMARY KEY (id_clima);


--
-- TOC entry 4898 (class 2606 OID 37122)
-- Name: cultivos cultivos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cultivos
    ADD CONSTRAINT cultivos_pkey PRIMARY KEY (id_cultivo);


--
-- TOC entry 4922 (class 2606 OID 37296)
-- Name: ejecuciones_tareas ejecuciones_tareas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejecuciones_tareas
    ADD CONSTRAINT ejecuciones_tareas_pkey PRIMARY KEY (id_ejecucion_tarea);


--
-- TOC entry 4918 (class 2606 OID 37275)
-- Name: estado_tareas estado_tareas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado_tareas
    ADD CONSTRAINT estado_tareas_pkey PRIMARY KEY (idestado_tareas);


--
-- TOC entry 4900 (class 2606 OID 37142)
-- Name: estadoscultivos estadoscultivos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estadoscultivos
    ADD CONSTRAINT estadoscultivos_pkey PRIMARY KEY (id_estadocultivo);


--
-- TOC entry 4914 (class 2606 OID 37251)
-- Name: finanzas finanzas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finanzas
    ADD CONSTRAINT finanzas_pkey PRIMARY KEY (id_finanza);


--
-- TOC entry 4892 (class 2606 OID 37098)
-- Name: fincas fincas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fincas
    ADD CONSTRAINT fincas_pkey PRIMARY KEY (id_finca);


--
-- TOC entry 4908 (class 2606 OID 37193)
-- Name: notificaciones notificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id_notificacion);


--
-- TOC entry 4884 (class 2606 OID 37053)
-- Name: operario operario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operario
    ADD CONSTRAINT operario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4928 (class 2606 OID 45689)
-- Name: preferencias_notificacion preferencias_notificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preferencias_notificacion
    ADD CONSTRAINT preferencias_notificacion_pkey PRIMARY KEY (id_preferencia);


--
-- TOC entry 4886 (class 2606 OID 37063)
-- Name: productores productores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productores
    ADD CONSTRAINT productores_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4910 (class 2606 OID 37210)
-- Name: reacciones reacciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reacciones
    ADD CONSTRAINT reacciones_pkey PRIMARY KEY (id_reacciones);


--
-- TOC entry 4906 (class 2606 OID 37181)
-- Name: recomendaciones recomendaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT recomendaciones_pkey PRIMARY KEY (id_recomendacion);


--
-- TOC entry 4916 (class 2606 OID 37263)
-- Name: reportes reportes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reportes
    ADD CONSTRAINT reportes_pkey PRIMARY KEY (id_reporte);


--
-- TOC entry 4876 (class 2606 OID 37022)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id_rol);


--
-- TOC entry 4904 (class 2606 OID 37164)
-- Name: siembras_estadocultivos siembras_estadocultivos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siembras_estadocultivos
    ADD CONSTRAINT siembras_estadocultivos_pkey PRIMARY KEY (id_siembra, id_estadocultivo);


--
-- TOC entry 4902 (class 2606 OID 37149)
-- Name: siembras siembras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siembras
    ADD CONSTRAINT siembras_pkey PRIMARY KEY (id_siembra);


--
-- TOC entry 4920 (class 2606 OID 37284)
-- Name: tareas tareas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tareas
    ADD CONSTRAINT tareas_pkey PRIMARY KEY (id_tarea);


--
-- TOC entry 4896 (class 2606 OID 37115)
-- Name: tipos_cultivos tipos_cultivos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_cultivos
    ADD CONSTRAINT tipos_cultivos_pkey PRIMARY KEY (idtipos_cultivos);


--
-- TOC entry 4924 (class 2606 OID 45635)
-- Name: tipos_tarea tipos_tarea_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_tarea
    ADD CONSTRAINT tipos_tarea_nombre_key UNIQUE (nombre);


--
-- TOC entry 4926 (class 2606 OID 45633)
-- Name: tipos_tarea tipos_tarea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_tarea
    ADD CONSTRAINT tipos_tarea_pkey PRIMARY KEY (id_tipo_tarea);


--
-- TOC entry 4888 (class 2606 OID 37075)
-- Name: ubicaciones ubicaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicaciones
    ADD CONSTRAINT ubicaciones_pkey PRIMARY KEY (id_ubicacion);


--
-- TOC entry 4894 (class 2606 OID 37324)
-- Name: fincas uq_finca_nombre_productor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fincas
    ADD CONSTRAINT uq_finca_nombre_productor UNIQUE (nombre_finca, id_usuario_productor);


--
-- TOC entry 4878 (class 2606 OID 37033)
-- Name: usuarios usuarios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_correo_key UNIQUE (correo);


--
-- TOC entry 4880 (class 2606 OID 37031)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4955 (class 2606 OID 45653)
-- Name: anomalias anomalias_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anomalias
    ADD CONSTRAINT anomalias_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4938 (class 2606 OID 37318)
-- Name: cultivos cultivos_id_tipocultivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cultivos
    ADD CONSTRAINT cultivos_id_tipocultivo_fkey FOREIGN KEY (id_tipocultivo) REFERENCES public.tipos_cultivos(idtipos_cultivos);


--
-- TOC entry 4961 (class 2606 OID 45636)
-- Name: ejecuciones_tareas ejecuciones_tareas_id_creado_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejecuciones_tareas
    ADD CONSTRAINT ejecuciones_tareas_id_creado_por_fkey FOREIGN KEY (id_creado_por) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4956 (class 2606 OID 45595)
-- Name: anomalias fk_anomalia_siembra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anomalias
    ADD CONSTRAINT fk_anomalia_siembra FOREIGN KEY (id_siembra) REFERENCES public.siembras(id_siembra) ON DELETE CASCADE;


--
-- TOC entry 4930 (class 2606 OID 45575)
-- Name: auxiliares fk_auxiliar_productor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auxiliares
    ADD CONSTRAINT fk_auxiliar_productor FOREIGN KEY (id_productor) REFERENCES public.productores(id_usuario) ON DELETE SET NULL;


--
-- TOC entry 4931 (class 2606 OID 37044)
-- Name: auxiliares fk_auxiliar_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auxiliares
    ADD CONSTRAINT fk_auxiliar_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4935 (class 2606 OID 37085)
-- Name: climas fk_clima_ubicacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.climas
    ADD CONSTRAINT fk_clima_ubicacion FOREIGN KEY (id_ubicacion) REFERENCES public.ubicaciones(id_ubicacion);


--
-- TOC entry 4962 (class 2606 OID 37307)
-- Name: ejecuciones_tareas fk_ejecucion_auxiliar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejecuciones_tareas
    ADD CONSTRAINT fk_ejecucion_auxiliar FOREIGN KEY (id_auxiliar) REFERENCES public.auxiliares(id_usuario);


--
-- TOC entry 4963 (class 2606 OID 37312)
-- Name: ejecuciones_tareas fk_ejecucion_operativo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejecuciones_tareas
    ADD CONSTRAINT fk_ejecucion_operativo FOREIGN KEY (id_operativo) REFERENCES public.operario(id_usuario);


--
-- TOC entry 4964 (class 2606 OID 45615)
-- Name: ejecuciones_tareas fk_ejecucion_tarea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejecuciones_tareas
    ADD CONSTRAINT fk_ejecucion_tarea FOREIGN KEY (id_tarea) REFERENCES public.tareas(id_tarea) ON DELETE CASCADE;


--
-- TOC entry 4957 (class 2606 OID 45555)
-- Name: finanzas fk_finanza_productor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finanzas
    ADD CONSTRAINT fk_finanza_productor FOREIGN KEY (id_usuario_productor) REFERENCES public.productores(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 4936 (class 2606 OID 45580)
-- Name: fincas fk_finca_productor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fincas
    ADD CONSTRAINT fk_finca_productor FOREIGN KEY (id_usuario_productor) REFERENCES public.productores(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 4937 (class 2606 OID 37099)
-- Name: fincas fk_finca_ubicacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fincas
    ADD CONSTRAINT fk_finca_ubicacion FOREIGN KEY (id_ubicacion) REFERENCES public.ubicaciones(id_ubicacion);


--
-- TOC entry 4948 (class 2606 OID 37194)
-- Name: notificaciones fk_notificacion_clima; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT fk_notificacion_clima FOREIGN KEY (id_clima) REFERENCES public.climas(id_clima);


--
-- TOC entry 4949 (class 2606 OID 45620)
-- Name: notificaciones fk_notificacion_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT fk_notificacion_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 4932 (class 2606 OID 45570)
-- Name: operario fk_operario_productor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operario
    ADD CONSTRAINT fk_operario_productor FOREIGN KEY (id_productor) REFERENCES public.productores(id_usuario) ON DELETE SET NULL;


--
-- TOC entry 4933 (class 2606 OID 37054)
-- Name: operario fk_operario_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operario
    ADD CONSTRAINT fk_operario_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4934 (class 2606 OID 37064)
-- Name: productores fk_productor_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productores
    ADD CONSTRAINT fk_productor_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- TOC entry 4952 (class 2606 OID 37211)
-- Name: reacciones fk_reaccion_operario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reacciones
    ADD CONSTRAINT fk_reaccion_operario FOREIGN KEY (id_operario) REFERENCES public.operario(id_usuario);


--
-- TOC entry 4953 (class 2606 OID 37216)
-- Name: reacciones fk_reaccion_productor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reacciones
    ADD CONSTRAINT fk_reaccion_productor FOREIGN KEY (id_productor) REFERENCES public.productores(id_usuario);


--
-- TOC entry 4954 (class 2606 OID 45610)
-- Name: reacciones fk_reaccion_recomendacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reacciones
    ADD CONSTRAINT fk_reaccion_recomendacion FOREIGN KEY (id_recomendacion) REFERENCES public.recomendaciones(id_recomendacion) ON DELETE CASCADE;


--
-- TOC entry 4944 (class 2606 OID 45605)
-- Name: recomendaciones fk_recomendacion_anomalia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT fk_recomendacion_anomalia FOREIGN KEY (id_anomalia) REFERENCES public.anomalias(id_anomalia) ON DELETE CASCADE;


--
-- TOC entry 4945 (class 2606 OID 37182)
-- Name: recomendaciones fk_recomendacion_clima; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT fk_recomendacion_clima FOREIGN KEY (id_clima) REFERENCES public.climas(id_clima);


--
-- TOC entry 4947 (class 2606 OID 45600)
-- Name: recomendaciones fk_recomendacion_siembra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recomendaciones
    ADD CONSTRAINT fk_recomendacion_siembra FOREIGN KEY (id_siembra) REFERENCES public.siembras(id_siembra) ON DELETE CASCADE;


--
-- TOC entry 4958 (class 2606 OID 45560)
-- Name: reportes fk_reporte_productor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reportes
    ADD CONSTRAINT fk_reporte_productor FOREIGN KEY (id_usuario_productor) REFERENCES public.productores(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 4941 (class 2606 OID 37170)
-- Name: siembras_estadocultivos fk_sec_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siembras_estadocultivos
    ADD CONSTRAINT fk_sec_estado FOREIGN KEY (id_estadocultivo) REFERENCES public.estadoscultivos(id_estadocultivo);


--
-- TOC entry 4942 (class 2606 OID 37325)
-- Name: siembras_estadocultivos fk_sec_siembra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siembras_estadocultivos
    ADD CONSTRAINT fk_sec_siembra FOREIGN KEY (id_siembra) REFERENCES public.siembras(id_siembra) ON DELETE CASCADE;


--
-- TOC entry 4939 (class 2606 OID 37150)
-- Name: siembras fk_siembra_cultivo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siembras
    ADD CONSTRAINT fk_siembra_cultivo FOREIGN KEY (id_cultivo) REFERENCES public.cultivos(id_cultivo);


--
-- TOC entry 4940 (class 2606 OID 45585)
-- Name: siembras fk_siembra_finca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siembras
    ADD CONSTRAINT fk_siembra_finca FOREIGN KEY (id_finca) REFERENCES public.fincas(id_finca) ON DELETE CASCADE;


--
-- TOC entry 4943 (class 2606 OID 45590)
-- Name: siembras_estadocultivos fk_siembraestado_siembra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siembras_estadocultivos
    ADD CONSTRAINT fk_siembraestado_siembra FOREIGN KEY (id_siembra) REFERENCES public.siembras(id_siembra) ON DELETE CASCADE;


--
-- TOC entry 4929 (class 2606 OID 37034)
-- Name: usuarios fk_usuario_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES public.roles(id_rol);


--
-- TOC entry 4950 (class 2606 OID 45660)
-- Name: notificaciones notificaciones_id_anomalia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_id_anomalia_fkey FOREIGN KEY (id_anomalia) REFERENCES public.anomalias(id_anomalia);


--
-- TOC entry 4951 (class 2606 OID 45665)
-- Name: notificaciones notificaciones_id_recomendacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_id_recomendacion_fkey FOREIGN KEY (id_recomendacion) REFERENCES public.recomendaciones(id_recomendacion);


--
-- TOC entry 4965 (class 2606 OID 45690)
-- Name: preferencias_notificacion preferencias_notificacion_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preferencias_notificacion
    ADD CONSTRAINT preferencias_notificacion_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- TOC entry 4959 (class 2606 OID 45646)
-- Name: tareas tareas_id_siembra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tareas
    ADD CONSTRAINT tareas_id_siembra_fkey FOREIGN KEY (id_siembra) REFERENCES public.siembras(id_siembra) ON DELETE CASCADE;


--
-- TOC entry 4960 (class 2606 OID 45641)
-- Name: tareas tareas_id_tipo_tarea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tareas
    ADD CONSTRAINT tareas_id_tipo_tarea_fkey FOREIGN KEY (id_tipo_tarea) REFERENCES public.tipos_tarea(id_tipo_tarea);


--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 245
-- Name: TABLE anomalias; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.anomalias TO user_agromag;


--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 244
-- Name: SEQUENCE anomalias_id_anomalia_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.anomalias_id_anomalia_seq TO user_agromag;


--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE auxiliares; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.auxiliares TO user_agromag;


--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE climas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.climas TO user_agromag;


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 226
-- Name: SEQUENCE climas_id_clima_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.climas_id_clima_seq TO user_agromag;


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE cultivos; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.cultivos TO user_agromag;


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 232
-- Name: SEQUENCE cultivos_id_cultivo_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.cultivos_id_cultivo_seq TO user_agromag;


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 255
-- Name: TABLE ejecuciones_tareas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.ejecuciones_tareas TO user_agromag;


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 254
-- Name: SEQUENCE ejecuciones_tareas_id_ejecucion_tarea_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.ejecuciones_tareas_id_ejecucion_tarea_seq TO user_agromag;


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE estado_tareas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.estado_tareas TO user_agromag;


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 250
-- Name: SEQUENCE estado_tareas_idestado_tareas_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.estado_tareas_idestado_tareas_seq TO user_agromag;


--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE estadoscultivos; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.estadoscultivos TO user_agromag;


--
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE finanzas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.finanzas TO user_agromag;


--
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 246
-- Name: SEQUENCE finanzas_id_finanza_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.finanzas_id_finanza_seq TO user_agromag;


--
-- TOC entry 5136 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE fincas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fincas TO user_agromag;


--
-- TOC entry 5138 (class 0 OID 0)
-- Dependencies: 228
-- Name: SEQUENCE fincas_id_finca_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.fincas_id_finca_seq TO user_agromag;


--
-- TOC entry 5139 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE notificaciones; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.notificaciones TO user_agromag;


--
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 240
-- Name: SEQUENCE notificaciones_id_notificacion_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.notificaciones_id_notificacion_seq TO user_agromag;


--
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE operario; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.operario TO user_agromag;


--
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 259
-- Name: TABLE preferencias_notificacion; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.preferencias_notificacion TO user_agromag;


--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 258
-- Name: SEQUENCE preferencias_notificacion_id_preferencia_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.preferencias_notificacion_id_preferencia_seq TO user_agromag;


--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE productores; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.productores TO user_agromag;


--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE reacciones; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.reacciones TO user_agromag;


--
-- TOC entry 5149 (class 0 OID 0)
-- Dependencies: 242
-- Name: SEQUENCE reacciones_id_reacciones_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.reacciones_id_reacciones_seq TO user_agromag;


--
-- TOC entry 5150 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE recomendaciones; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.recomendaciones TO user_agromag;


--
-- TOC entry 5152 (class 0 OID 0)
-- Dependencies: 238
-- Name: SEQUENCE recomendaciones_id_recomendacion_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.recomendaciones_id_recomendacion_seq TO user_agromag;


--
-- TOC entry 5153 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE reportes; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.reportes TO user_agromag;


--
-- TOC entry 5155 (class 0 OID 0)
-- Dependencies: 248
-- Name: SEQUENCE reportes_id_reporte_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.reportes_id_reporte_seq TO user_agromag;


--
-- TOC entry 5156 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE roles; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.roles TO user_agromag;


--
-- TOC entry 5158 (class 0 OID 0)
-- Dependencies: 217
-- Name: SEQUENCE roles_id_rol_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.roles_id_rol_seq TO user_agromag;


--
-- TOC entry 5159 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE siembras; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.siembras TO user_agromag;


--
-- TOC entry 5160 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE siembras_estadocultivos; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.siembras_estadocultivos TO user_agromag;


--
-- TOC entry 5162 (class 0 OID 0)
-- Dependencies: 235
-- Name: SEQUENCE siembras_id_siembra_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.siembras_id_siembra_seq TO user_agromag;


--
-- TOC entry 5163 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE tareas; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tareas TO user_agromag;


--
-- TOC entry 5165 (class 0 OID 0)
-- Dependencies: 252
-- Name: SEQUENCE tareas_id_tarea_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.tareas_id_tarea_seq TO user_agromag;


--
-- TOC entry 5166 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE tipos_cultivos; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tipos_cultivos TO user_agromag;


--
-- TOC entry 5168 (class 0 OID 0)
-- Dependencies: 230
-- Name: SEQUENCE tipos_cultivos_idtipos_cultivos_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.tipos_cultivos_idtipos_cultivos_seq TO user_agromag;


--
-- TOC entry 5169 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE tipos_tarea; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tipos_tarea TO user_agromag;


--
-- TOC entry 5171 (class 0 OID 0)
-- Dependencies: 256
-- Name: SEQUENCE tipos_tarea_id_tipo_tarea_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.tipos_tarea_id_tipo_tarea_seq TO user_agromag;


--
-- TOC entry 5172 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE ubicaciones; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.ubicaciones TO user_agromag;


--
-- TOC entry 5174 (class 0 OID 0)
-- Dependencies: 224
-- Name: SEQUENCE ubicaciones_id_ubicacion_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.ubicaciones_id_ubicacion_seq TO user_agromag;


--
-- TOC entry 5175 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE usuarios; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.usuarios TO user_agromag;


--
-- TOC entry 5177 (class 0 OID 0)
-- Dependencies: 219
-- Name: SEQUENCE usuarios_id_usuario_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.usuarios_id_usuario_seq TO user_agromag;


--
-- TOC entry 2155 (class 826 OID 45652)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO user_agromag;


--
-- TOC entry 2154 (class 826 OID 45651)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO user_agromag;


-- Completed on 2026-05-23 18:20:52

--
-- PostgreSQL database dump complete
--



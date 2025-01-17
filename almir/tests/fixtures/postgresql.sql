PGDMP         6                p            bacula    8.4.11    8.4.11 �    D           0    0    ENCODING    ENCODING     #   SET client_encoding = 'SQL_ASCII';
                       false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     )   SET standard_conforming_strings = 'off';
                       false            F           1262    16385    bacula    DATABASE     }   CREATE DATABASE bacula WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE bacula;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            G           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3            H           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    3            �            1259    16679 	   basefiles    TABLE     �   CREATE TABLE basefiles (
    baseid integer NOT NULL,
    jobid integer NOT NULL,
    fileid bigint NOT NULL,
    fileindex integer,
    basejobid integer
);
    DROP TABLE public.basefiles;
       public         bacula    false    3            �            1259    16677    basefiles_baseid_seq    SEQUENCE     v   CREATE SEQUENCE basefiles_baseid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 +   DROP SEQUENCE public.basefiles_baseid_seq;
       public       bacula    false    175    3            I           0    0    basefiles_baseid_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE basefiles_baseid_seq OWNED BY basefiles.baseid;
            public       bacula    false    174            J           0    0    basefiles_baseid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('basefiles_baseid_seq', 1, false);
            public       bacula    false    174            �            1259    16691    cdimages    TABLE     k   CREATE TABLE cdimages (
    mediaid integer NOT NULL,
    lastburn timestamp without time zone NOT NULL
);
    DROP TABLE public.cdimages;
       public         bacula    false    3            �            1259    16627    client    TABLE     �   CREATE TABLE client (
    clientid integer NOT NULL,
    name text NOT NULL,
    uname text NOT NULL,
    autoprune smallint DEFAULT 0,
    fileretention bigint DEFAULT 0,
    jobretention bigint DEFAULT 0
);
    DROP TABLE public.client;
       public         bacula    false    2019    2020    2021    3            �            1259    16625    client_clientid_seq    SEQUENCE     u   CREATE SEQUENCE client_clientid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 *   DROP SEQUENCE public.client_clientid_seq;
       public       bacula    false    168    3            K           0    0    client_clientid_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE client_clientid_seq OWNED BY client.clientid;
            public       bacula    false    167            L           0    0    client_clientid_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('client_clientid_seq', 1, true);
            public       bacula    false    167            �            1259    16666    counters    TABLE     �   CREATE TABLE counters (
    counter text NOT NULL,
    minvalue integer DEFAULT 0,
    maxvalue integer DEFAULT 0,
    currentvalue integer DEFAULT 0,
    wrapcounter text NOT NULL
);
    DROP TABLE public.counters;
       public         bacula    false    2027    2028    2029    3            �            1259    16572    device    TABLE     �  CREATE TABLE device (
    deviceid integer NOT NULL,
    name text NOT NULL,
    mediatypeid integer NOT NULL,
    storageid integer NOT NULL,
    devmounts integer DEFAULT 0 NOT NULL,
    devreadbytes bigint DEFAULT 0 NOT NULL,
    devwritebytes bigint DEFAULT 0 NOT NULL,
    devreadbytessincecleaning bigint DEFAULT 0 NOT NULL,
    devwritebytessincecleaning bigint DEFAULT 0 NOT NULL,
    devreadtime bigint DEFAULT 0 NOT NULL,
    devwritetime bigint DEFAULT 0 NOT NULL,
    devreadtimesincecleaning bigint DEFAULT 0 NOT NULL,
    devwritetimesincecleaning bigint DEFAULT 0 NOT NULL,
    cleaningdate timestamp without time zone,
    cleaningperiod bigint DEFAULT 0 NOT NULL
);
    DROP TABLE public.device;
       public         bacula    false    1985    1986    1987    1988    1989    1990    1991    1992    1993    1994    3            �            1259    16570    device_deviceid_seq    SEQUENCE     u   CREATE SEQUENCE device_deviceid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 *   DROP SEQUENCE public.device_deviceid_seq;
       public       bacula    false    164    3            M           0    0    device_deviceid_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE device_deviceid_seq OWNED BY device.deviceid;
            public       bacula    false    163            N           0    0    device_deviceid_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('device_deviceid_seq', 1, false);
            public       bacula    false    163            �            1259    16412    file    TABLE       CREATE TABLE file (
    fileid bigint NOT NULL,
    fileindex integer DEFAULT 0 NOT NULL,
    jobid integer NOT NULL,
    pathid integer NOT NULL,
    filenameid integer NOT NULL,
    markid integer DEFAULT 0 NOT NULL,
    lstat text NOT NULL,
    md5 text NOT NULL
);
    DROP TABLE public.file;
       public         bacula    false    1915    1916    3            �            1259    16410    file_fileid_seq    SEQUENCE     q   CREATE SEQUENCE file_fileid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 &   DROP SEQUENCE public.file_fileid_seq;
       public       bacula    false    3    147            O           0    0    file_fileid_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE file_fileid_seq OWNED BY file.fileid;
            public       bacula    false    146            P           0    0    file_fileid_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('file_fileid_seq', 314, true);
            public       bacula    false    146            �            1259    16388    filename    TABLE     �   CREATE TABLE filename (
    filenameid integer NOT NULL,
    name text NOT NULL
);
ALTER TABLE ONLY filename ALTER COLUMN name SET STATISTICS 1000;
    DROP TABLE public.filename;
       public         bacula    false    3            �            1259    16386    filename_filenameid_seq    SEQUENCE     y   CREATE SEQUENCE filename_filenameid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 .   DROP SEQUENCE public.filename_filenameid_seq;
       public       bacula    false    3    143            Q           0    0    filename_filenameid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE filename_filenameid_seq OWNED BY filename.filenameid;
            public       bacula    false    142            R           0    0    filename_filenameid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('filename_filenameid_seq', 157, true);
            public       bacula    false    142            �            1259    16474    fileset    TABLE     �   CREATE TABLE fileset (
    filesetid integer NOT NULL,
    fileset text NOT NULL,
    md5 text NOT NULL,
    createtime timestamp without time zone NOT NULL
);
    DROP TABLE public.fileset;
       public         bacula    false    3            �            1259    16472    fileset_filesetid_seq    SEQUENCE     w   CREATE SEQUENCE fileset_filesetid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.fileset_filesetid_seq;
       public       bacula    false    154    3            S           0    0    fileset_filesetid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE fileset_filesetid_seq OWNED BY fileset.filesetid;
            public       bacula    false    153            T           0    0    fileset_filesetid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('fileset_filesetid_seq', 2, true);
            public       bacula    false    153            �            1259    16427    job    TABLE     �  CREATE TABLE job (
    jobid integer NOT NULL,
    job text NOT NULL,
    name text NOT NULL,
    type character(1) NOT NULL,
    level character(1) NOT NULL,
    clientid integer DEFAULT 0,
    jobstatus character(1) NOT NULL,
    schedtime timestamp without time zone,
    starttime timestamp without time zone,
    endtime timestamp without time zone,
    realendtime timestamp without time zone,
    jobtdate bigint DEFAULT 0,
    volsessionid integer DEFAULT 0,
    volsessiontime integer DEFAULT 0,
    jobfiles integer DEFAULT 0,
    jobbytes bigint DEFAULT 0,
    readbytes bigint DEFAULT 0,
    joberrors integer DEFAULT 0,
    jobmissingfiles integer DEFAULT 0,
    poolid integer DEFAULT 0,
    filesetid integer DEFAULT 0,
    priorjobid integer DEFAULT 0,
    purgedfiles smallint DEFAULT 0,
    hasbase smallint DEFAULT 0,
    hascache smallint DEFAULT 0,
    reviewed smallint DEFAULT 0,
    comment text
);
    DROP TABLE public.job;
       public         bacula    false    1918    1919    1920    1921    1922    1923    1924    1925    1926    1927    1928    1929    1930    1931    1932    1933    3            �            1259    16425    job_jobid_seq    SEQUENCE     o   CREATE SEQUENCE job_jobid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 $   DROP SEQUENCE public.job_jobid_seq;
       public       bacula    false    3    149            U           0    0    job_jobid_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE job_jobid_seq OWNED BY job.jobid;
            public       bacula    false    148            V           0    0    job_jobid_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('job_jobid_seq', 4, true);
            public       bacula    false    148            �            1259    16453    jobhisto    TABLE        CREATE TABLE jobhisto (
    jobid integer NOT NULL,
    job text NOT NULL,
    name text NOT NULL,
    type character(1) NOT NULL,
    level character(1) NOT NULL,
    clientid integer,
    jobstatus character(1) NOT NULL,
    schedtime timestamp without time zone,
    starttime timestamp without time zone,
    endtime timestamp without time zone,
    realendtime timestamp without time zone,
    jobtdate bigint,
    volsessionid integer,
    volsessiontime integer,
    jobfiles integer,
    jobbytes bigint,
    readbytes bigint,
    joberrors integer,
    jobmissingfiles integer,
    poolid integer,
    filesetid integer,
    priorjobid integer,
    purgedfiles smallint,
    hasbase smallint,
    hascache smallint,
    reviewed smallint,
    comment text
);
    DROP TABLE public.jobhisto;
       public         bacula    false    3            �            1259    16486    jobmedia    TABLE     X  CREATE TABLE jobmedia (
    jobmediaid integer NOT NULL,
    jobid integer NOT NULL,
    mediaid integer NOT NULL,
    firstindex integer DEFAULT 0,
    lastindex integer DEFAULT 0,
    startfile integer DEFAULT 0,
    endfile integer DEFAULT 0,
    startblock bigint DEFAULT 0,
    endblock bigint DEFAULT 0,
    volindex integer DEFAULT 0
);
    DROP TABLE public.jobmedia;
       public         bacula    false    1938    1939    1940    1941    1942    1943    1944    3            �            1259    16484    jobmedia_jobmediaid_seq    SEQUENCE     y   CREATE SEQUENCE jobmedia_jobmediaid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 .   DROP SEQUENCE public.jobmedia_jobmediaid_seq;
       public       bacula    false    156    3            W           0    0    jobmedia_jobmediaid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE jobmedia_jobmediaid_seq OWNED BY jobmedia.jobmediaid;
            public       bacula    false    155            X           0    0    jobmedia_jobmediaid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('jobmedia_jobmediaid_seq', 2, true);
            public       bacula    false    155            �            1259    16462    location    TABLE     �   CREATE TABLE location (
    locationid integer NOT NULL,
    location text NOT NULL,
    cost integer DEFAULT 0,
    enabled smallint
);
    DROP TABLE public.location;
       public         bacula    false    1935    3            �            1259    16460    location_locationid_seq    SEQUENCE     y   CREATE SEQUENCE location_locationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 .   DROP SEQUENCE public.location_locationid_seq;
       public       bacula    false    3    152            Y           0    0    location_locationid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE location_locationid_seq OWNED BY location.locationid;
            public       bacula    false    151            Z           0    0    location_locationid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('location_locationid_seq', 1, false);
            public       bacula    false    151            �            1259    16654    locationlog    TABLE       CREATE TABLE locationlog (
    loclogid integer NOT NULL,
    date timestamp without time zone,
    comment text NOT NULL,
    mediaid integer DEFAULT 0,
    locationid integer DEFAULT 0,
    newvolstatus text NOT NULL,
    newenabled smallint,
    CONSTRAINT locationlog_newvolstatus_check CHECK ((newvolstatus = ANY (ARRAY['Full'::text, 'Archive'::text, 'Append'::text, 'Recycle'::text, 'Purged'::text, 'Read-Only'::text, 'Disabled'::text, 'Error'::text, 'Busy'::text, 'Used'::text, 'Cleaning'::text, 'Scratch'::text])))
);
    DROP TABLE public.locationlog;
       public         bacula    false    2024    2025    2026    3            �            1259    16652    locationlog_loclogid_seq    SEQUENCE     z   CREATE SEQUENCE locationlog_loclogid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 /   DROP SEQUENCE public.locationlog_loclogid_seq;
       public       bacula    false    172    3            [           0    0    locationlog_loclogid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE locationlog_loclogid_seq OWNED BY locationlog.loclogid;
            public       bacula    false    171            \           0    0    locationlog_loclogid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('locationlog_loclogid_seq', 1, false);
            public       bacula    false    171            �            1259    16642    log    TABLE     �   CREATE TABLE log (
    logid integer NOT NULL,
    jobid integer NOT NULL,
    "time" timestamp without time zone,
    logtext text NOT NULL
);
    DROP TABLE public.log;
       public         bacula    false    3            �            1259    16640    log_logid_seq    SEQUENCE     o   CREATE SEQUENCE log_logid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 $   DROP SEQUENCE public.log_logid_seq;
       public       bacula    false    3    170            ]           0    0    log_logid_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE log_logid_seq OWNED BY log.logid;
            public       bacula    false    169            ^           0    0    log_logid_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('log_logid_seq', 49, true);
            public       bacula    false    169            �            1259    16502    media    TABLE     �  CREATE TABLE media (
    mediaid integer NOT NULL,
    volumename text NOT NULL,
    slot integer DEFAULT 0,
    poolid integer DEFAULT 0,
    mediatype text NOT NULL,
    mediatypeid integer DEFAULT 0,
    labeltype integer DEFAULT 0,
    firstwritten timestamp without time zone,
    lastwritten timestamp without time zone,
    labeldate timestamp without time zone,
    voljobs integer DEFAULT 0,
    volfiles integer DEFAULT 0,
    volblocks integer DEFAULT 0,
    volmounts integer DEFAULT 0,
    volbytes bigint DEFAULT 0,
    volparts integer DEFAULT 0,
    volerrors integer DEFAULT 0,
    volwrites integer DEFAULT 0,
    volcapacitybytes bigint DEFAULT 0,
    volstatus text NOT NULL,
    enabled smallint DEFAULT 1,
    recycle smallint DEFAULT 0,
    actiononpurge smallint DEFAULT 0,
    volretention bigint DEFAULT 0,
    voluseduration bigint DEFAULT 0,
    maxvoljobs integer DEFAULT 0,
    maxvolfiles integer DEFAULT 0,
    maxvolbytes bigint DEFAULT 0,
    inchanger smallint DEFAULT 0,
    storageid integer DEFAULT 0,
    deviceid integer DEFAULT 0,
    mediaaddressing smallint DEFAULT 0,
    volreadtime bigint DEFAULT 0,
    volwritetime bigint DEFAULT 0,
    endfile integer DEFAULT 0,
    endblock bigint DEFAULT 0,
    locationid integer DEFAULT 0,
    recyclecount integer DEFAULT 0,
    initialwrite timestamp without time zone,
    scratchpoolid integer DEFAULT 0,
    recyclepoolid integer DEFAULT 0,
    comment text,
    CONSTRAINT media_volstatus_check CHECK ((volstatus = ANY (ARRAY['Full'::text, 'Archive'::text, 'Append'::text, 'Recycle'::text, 'Purged'::text, 'Read-Only'::text, 'Disabled'::text, 'Error'::text, 'Busy'::text, 'Used'::text, 'Cleaning'::text, 'Scratch'::text])))
);
    DROP TABLE public.media;
       public         bacula    false    1946    1947    1948    1949    1950    1951    1952    1953    1954    1955    1956    1957    1958    1959    1960    1961    1962    1963    1964    1965    1966    1967    1968    1969    1970    1971    1972    1973    1974    1975    1976    1977    1978    1979    3            �            1259    16500    media_mediaid_seq    SEQUENCE     s   CREATE SEQUENCE media_mediaid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 (   DROP SEQUENCE public.media_mediaid_seq;
       public       bacula    false    158    3            _           0    0    media_mediaid_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE media_mediaid_seq OWNED BY media.mediaid;
            public       bacula    false    157            `           0    0    media_mediaid_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('media_mediaid_seq', 1, true);
            public       bacula    false    157            �            1259    16548 	   mediatype    TABLE     z   CREATE TABLE mediatype (
    mediatypeid integer NOT NULL,
    mediatype text NOT NULL,
    readonly integer DEFAULT 0
);
    DROP TABLE public.mediatype;
       public         bacula    false    1981    3            �            1259    16546    mediatype_mediatypeid_seq    SEQUENCE     {   CREATE SEQUENCE mediatype_mediatypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 0   DROP SEQUENCE public.mediatype_mediatypeid_seq;
       public       bacula    false    3    160            a           0    0    mediatype_mediatypeid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE mediatype_mediatypeid_seq OWNED BY mediatype.mediatypeid;
            public       bacula    false    159            b           0    0    mediatype_mediatypeid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('mediatype_mediatypeid_seq', 1, true);
            public       bacula    false    159            �            1259    16400    path    TABLE     �   CREATE TABLE path (
    pathid integer NOT NULL,
    path text NOT NULL
);
ALTER TABLE ONLY path ALTER COLUMN path SET STATISTICS 1000;
    DROP TABLE public.path;
       public         bacula    false    3            �            1259    16398    path_pathid_seq    SEQUENCE     q   CREATE SEQUENCE path_pathid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 &   DROP SEQUENCE public.path_pathid_seq;
       public       bacula    false    3    145            c           0    0    path_pathid_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE path_pathid_seq OWNED BY path.pathid;
            public       bacula    false    144            d           0    0    path_pathid_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('path_pathid_seq', 1, true);
            public       bacula    false    144            �            1259    16696    pathhierarchy    TABLE     Z   CREATE TABLE pathhierarchy (
    pathid integer NOT NULL,
    ppathid integer NOT NULL
);
 !   DROP TABLE public.pathhierarchy;
       public         bacula    false    3            �            1259    16702    pathvisibility    TABLE     �   CREATE TABLE pathvisibility (
    pathid integer NOT NULL,
    jobid integer NOT NULL,
    size bigint DEFAULT 0,
    files integer DEFAULT 0
);
 "   DROP TABLE public.pathvisibility;
       public         bacula    false    2031    2032    3            �            1259    16593    pool    TABLE       CREATE TABLE pool (
    poolid integer NOT NULL,
    name text NOT NULL,
    numvols integer DEFAULT 0,
    maxvols integer DEFAULT 0,
    useonce smallint DEFAULT 0,
    usecatalog smallint DEFAULT 0,
    acceptanyvolume smallint DEFAULT 0,
    volretention bigint DEFAULT 0,
    voluseduration bigint DEFAULT 0,
    maxvoljobs integer DEFAULT 0,
    maxvolfiles integer DEFAULT 0,
    maxvolbytes bigint DEFAULT 0,
    autoprune smallint DEFAULT 0,
    recycle smallint DEFAULT 0,
    actiononpurge smallint DEFAULT 0,
    pooltype text,
    labeltype integer DEFAULT 0,
    labelformat text NOT NULL,
    enabled smallint DEFAULT 1,
    scratchpoolid integer DEFAULT 0,
    recyclepoolid integer DEFAULT 0,
    nextpoolid integer DEFAULT 0,
    migrationhighbytes bigint DEFAULT 0,
    migrationlowbytes bigint DEFAULT 0,
    migrationtime bigint DEFAULT 0,
    CONSTRAINT pool_pooltype_check CHECK ((pooltype = ANY (ARRAY['Backup'::text, 'Copy'::text, 'Cloned'::text, 'Archive'::text, 'Migration'::text, 'Scratch'::text])))
);
    DROP TABLE public.pool;
       public         bacula    false    1995    1997    1998    1999    2000    2001    2002    2003    2004    2005    2006    2007    2008    2009    2010    2011    2012    2013    2014    2015    2016    2017    3            �            1259    16591    pool_poolid_seq    SEQUENCE     q   CREATE SEQUENCE pool_poolid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 &   DROP SEQUENCE public.pool_poolid_seq;
       public       bacula    false    166    3            e           0    0    pool_poolid_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE pool_poolid_seq OWNED BY pool.poolid;
            public       bacula    false    165            f           0    0    pool_poolid_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('pool_poolid_seq', 3, true);
            public       bacula    false    165            �            1259    16713    status    TABLE     k   CREATE TABLE status (
    jobstatus character(1) NOT NULL,
    jobstatuslong text,
    severity integer
);
    DROP TABLE public.status;
       public         bacula    false    3            �            1259    16560    storage    TABLE     t   CREATE TABLE storage (
    storageid integer NOT NULL,
    name text NOT NULL,
    autochanger integer DEFAULT 0
);
    DROP TABLE public.storage;
       public         bacula    false    1983    3            �            1259    16558    storage_storageid_seq    SEQUENCE     w   CREATE SEQUENCE storage_storageid_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.storage_storageid_seq;
       public       bacula    false    3    162            g           0    0    storage_storageid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE storage_storageid_seq OWNED BY storage.storageid;
            public       bacula    false    161            h           0    0    storage_storageid_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('storage_storageid_seq', 1, true);
            public       bacula    false    161            �            1259    16686    unsavedfiles    TABLE     �   CREATE TABLE unsavedfiles (
    unsavedid integer NOT NULL,
    jobid integer NOT NULL,
    pathid integer NOT NULL,
    filenameid integer NOT NULL
);
     DROP TABLE public.unsavedfiles;
       public         bacula    false    3            �            1259    16710    version    TABLE     9   CREATE TABLE version (
    versionid integer NOT NULL
);
    DROP TABLE public.version;
       public         bacula    false    3            �           2604    16682    baseid    DEFAULT     f   ALTER TABLE ONLY basefiles ALTER COLUMN baseid SET DEFAULT nextval('basefiles_baseid_seq'::regclass);
 ?   ALTER TABLE public.basefiles ALTER COLUMN baseid DROP DEFAULT;
       public       bacula    false    174    175    175            �           2604    16630    clientid    DEFAULT     d   ALTER TABLE ONLY client ALTER COLUMN clientid SET DEFAULT nextval('client_clientid_seq'::regclass);
 >   ALTER TABLE public.client ALTER COLUMN clientid DROP DEFAULT;
       public       bacula    false    168    167    168            �           2604    16575    deviceid    DEFAULT     d   ALTER TABLE ONLY device ALTER COLUMN deviceid SET DEFAULT nextval('device_deviceid_seq'::regclass);
 >   ALTER TABLE public.device ALTER COLUMN deviceid DROP DEFAULT;
       public       bacula    false    163    164    164            z           2604    16415    fileid    DEFAULT     \   ALTER TABLE ONLY file ALTER COLUMN fileid SET DEFAULT nextval('file_fileid_seq'::regclass);
 :   ALTER TABLE public.file ALTER COLUMN fileid DROP DEFAULT;
       public       bacula    false    147    146    147            x           2604    16391 
   filenameid    DEFAULT     l   ALTER TABLE ONLY filename ALTER COLUMN filenameid SET DEFAULT nextval('filename_filenameid_seq'::regclass);
 B   ALTER TABLE public.filename ALTER COLUMN filenameid DROP DEFAULT;
       public       bacula    false    143    142    143            �           2604    16477 	   filesetid    DEFAULT     h   ALTER TABLE ONLY fileset ALTER COLUMN filesetid SET DEFAULT nextval('fileset_filesetid_seq'::regclass);
 @   ALTER TABLE public.fileset ALTER COLUMN filesetid DROP DEFAULT;
       public       bacula    false    154    153    154            }           2604    16430    jobid    DEFAULT     X   ALTER TABLE ONLY job ALTER COLUMN jobid SET DEFAULT nextval('job_jobid_seq'::regclass);
 8   ALTER TABLE public.job ALTER COLUMN jobid DROP DEFAULT;
       public       bacula    false    149    148    149            �           2604    16489 
   jobmediaid    DEFAULT     l   ALTER TABLE ONLY jobmedia ALTER COLUMN jobmediaid SET DEFAULT nextval('jobmedia_jobmediaid_seq'::regclass);
 B   ALTER TABLE public.jobmedia ALTER COLUMN jobmediaid DROP DEFAULT;
       public       bacula    false    156    155    156            �           2604    16465 
   locationid    DEFAULT     l   ALTER TABLE ONLY location ALTER COLUMN locationid SET DEFAULT nextval('location_locationid_seq'::regclass);
 B   ALTER TABLE public.location ALTER COLUMN locationid DROP DEFAULT;
       public       bacula    false    152    151    152            �           2604    16657    loclogid    DEFAULT     n   ALTER TABLE ONLY locationlog ALTER COLUMN loclogid SET DEFAULT nextval('locationlog_loclogid_seq'::regclass);
 C   ALTER TABLE public.locationlog ALTER COLUMN loclogid DROP DEFAULT;
       public       bacula    false    171    172    172            �           2604    16645    logid    DEFAULT     X   ALTER TABLE ONLY log ALTER COLUMN logid SET DEFAULT nextval('log_logid_seq'::regclass);
 8   ALTER TABLE public.log ALTER COLUMN logid DROP DEFAULT;
       public       bacula    false    169    170    170            �           2604    16505    mediaid    DEFAULT     `   ALTER TABLE ONLY media ALTER COLUMN mediaid SET DEFAULT nextval('media_mediaid_seq'::regclass);
 <   ALTER TABLE public.media ALTER COLUMN mediaid DROP DEFAULT;
       public       bacula    false    158    157    158            �           2604    16551    mediatypeid    DEFAULT     p   ALTER TABLE ONLY mediatype ALTER COLUMN mediatypeid SET DEFAULT nextval('mediatype_mediatypeid_seq'::regclass);
 D   ALTER TABLE public.mediatype ALTER COLUMN mediatypeid DROP DEFAULT;
       public       bacula    false    159    160    160            y           2604    16403    pathid    DEFAULT     \   ALTER TABLE ONLY path ALTER COLUMN pathid SET DEFAULT nextval('path_pathid_seq'::regclass);
 :   ALTER TABLE public.path ALTER COLUMN pathid DROP DEFAULT;
       public       bacula    false    144    145    145            �           2604    16596    poolid    DEFAULT     \   ALTER TABLE ONLY pool ALTER COLUMN poolid SET DEFAULT nextval('pool_poolid_seq'::regclass);
 :   ALTER TABLE public.pool ALTER COLUMN poolid DROP DEFAULT;
       public       bacula    false    166    165    166            �           2604    16563 	   storageid    DEFAULT     h   ALTER TABLE ONLY storage ALTER COLUMN storageid SET DEFAULT nextval('storage_storageid_seq'::regclass);
 @   ALTER TABLE public.storage ALTER COLUMN storageid DROP DEFAULT;
       public       bacula    false    162    161    162            =          0    16679 	   basefiles 
   TABLE DATA               I   COPY basefiles (baseid, jobid, fileid, fileindex, basejobid) FROM stdin;
    public       bacula    false    175   8�       ?          0    16691    cdimages 
   TABLE DATA               .   COPY cdimages (mediaid, lastburn) FROM stdin;
    public       bacula    false    177   U�       9          0    16627    client 
   TABLE DATA               X   COPY client (clientid, name, uname, autoprune, fileretention, jobretention) FROM stdin;
    public       bacula    false    168   r�       <          0    16666    counters 
   TABLE DATA               S   COPY counters (counter, minvalue, maxvalue, currentvalue, wrapcounter) FROM stdin;
    public       bacula    false    173   �       7          0    16572    device 
   TABLE DATA                 COPY device (deviceid, name, mediatypeid, storageid, devmounts, devreadbytes, devwritebytes, devreadbytessincecleaning, devwritebytessincecleaning, devreadtime, devwritetime, devreadtimesincecleaning, devwritetimesincecleaning, cleaningdate, cleaningperiod) FROM stdin;
    public       bacula    false    164   ��       .          0    16412    file 
   TABLE DATA               Y   COPY file (fileid, fileindex, jobid, pathid, filenameid, markid, lstat, md5) FROM stdin;
    public       bacula    false    147   �       ,          0    16388    filename 
   TABLE DATA               -   COPY filename (filenameid, name) FROM stdin;
    public       bacula    false    143   F�       2          0    16474    fileset 
   TABLE DATA               ?   COPY fileset (filesetid, fileset, md5, createtime) FROM stdin;
    public       bacula    false    154    �       /          0    16427    job 
   TABLE DATA               +  COPY job (jobid, job, name, type, level, clientid, jobstatus, schedtime, starttime, endtime, realendtime, jobtdate, volsessionid, volsessiontime, jobfiles, jobbytes, readbytes, joberrors, jobmissingfiles, poolid, filesetid, priorjobid, purgedfiles, hasbase, hascache, reviewed, comment) FROM stdin;
    public       bacula    false    149   v�       0          0    16453    jobhisto 
   TABLE DATA               0  COPY jobhisto (jobid, job, name, type, level, clientid, jobstatus, schedtime, starttime, endtime, realendtime, jobtdate, volsessionid, volsessiontime, jobfiles, jobbytes, readbytes, joberrors, jobmissingfiles, poolid, filesetid, priorjobid, purgedfiles, hasbase, hascache, reviewed, comment) FROM stdin;
    public       bacula    false    150   l�       3          0    16486    jobmedia 
   TABLE DATA               �   COPY jobmedia (jobmediaid, jobid, mediaid, firstindex, lastindex, startfile, endfile, startblock, endblock, volindex) FROM stdin;
    public       bacula    false    156   ��       1          0    16462    location 
   TABLE DATA               @   COPY location (locationid, location, cost, enabled) FROM stdin;
    public       bacula    false    152   ��       ;          0    16654    locationlog 
   TABLE DATA               f   COPY locationlog (loclogid, date, comment, mediaid, locationid, newvolstatus, newenabled) FROM stdin;
    public       bacula    false    172   ��       :          0    16642    log 
   TABLE DATA               5   COPY log (logid, jobid, "time", logtext) FROM stdin;
    public       bacula    false    170   
�       4          0    16502    media 
   TABLE DATA                 COPY media (mediaid, volumename, slot, poolid, mediatype, mediatypeid, labeltype, firstwritten, lastwritten, labeldate, voljobs, volfiles, volblocks, volmounts, volbytes, volparts, volerrors, volwrites, volcapacitybytes, volstatus, enabled, recycle, actiononpurge, volretention, voluseduration, maxvoljobs, maxvolfiles, maxvolbytes, inchanger, storageid, deviceid, mediaaddressing, volreadtime, volwritetime, endfile, endblock, locationid, recyclecount, initialwrite, scratchpoolid, recyclepoolid, comment) FROM stdin;
    public       bacula    false    158   �       5          0    16548 	   mediatype 
   TABLE DATA               >   COPY mediatype (mediatypeid, mediatype, readonly) FROM stdin;
    public       bacula    false    160   ��       -          0    16400    path 
   TABLE DATA               %   COPY path (pathid, path) FROM stdin;
    public       bacula    false    145   ��       @          0    16696    pathhierarchy 
   TABLE DATA               1   COPY pathhierarchy (pathid, ppathid) FROM stdin;
    public       bacula    false    178   ��       A          0    16702    pathvisibility 
   TABLE DATA               =   COPY pathvisibility (pathid, jobid, size, files) FROM stdin;
    public       bacula    false    179   �       8          0    16593    pool 
   TABLE DATA               O  COPY pool (poolid, name, numvols, maxvols, useonce, usecatalog, acceptanyvolume, volretention, voluseduration, maxvoljobs, maxvolfiles, maxvolbytes, autoprune, recycle, actiononpurge, pooltype, labeltype, labelformat, enabled, scratchpoolid, recyclepoolid, nextpoolid, migrationhighbytes, migrationlowbytes, migrationtime) FROM stdin;
    public       bacula    false    166   "�       C          0    16713    status 
   TABLE DATA               =   COPY status (jobstatus, jobstatuslong, severity) FROM stdin;
    public       bacula    false    181   ��       6          0    16560    storage 
   TABLE DATA               8   COPY storage (storageid, name, autochanger) FROM stdin;
    public       bacula    false    162   ��       >          0    16686    unsavedfiles 
   TABLE DATA               E   COPY unsavedfiles (unsavedid, jobid, pathid, filenameid) FROM stdin;
    public       bacula    false    176   ��       B          0    16710    version 
   TABLE DATA               %   COPY version (versionid) FROM stdin;
    public       bacula    false    180   �                  2606    16684    basefiles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY basefiles
    ADD CONSTRAINT basefiles_pkey PRIMARY KEY (baseid);
 B   ALTER TABLE ONLY public.basefiles DROP CONSTRAINT basefiles_pkey;
       public         bacula    false    175    175            #           2606    16695    cdimages_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY cdimages
    ADD CONSTRAINT cdimages_pkey PRIMARY KEY (mediaid);
 @   ALTER TABLE ONLY public.cdimages DROP CONSTRAINT cdimages_pkey;
       public         bacula    false    177    177                       2606    16638    client_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY client
    ADD CONSTRAINT client_pkey PRIMARY KEY (clientid);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public         bacula    false    168    168                       2606    16676    counters_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY counters
    ADD CONSTRAINT counters_pkey PRIMARY KEY (counter);
 @   ALTER TABLE ONLY public.counters DROP CONSTRAINT counters_pkey;
       public         bacula    false    173    173                       2606    16590    device_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY device
    ADD CONSTRAINT device_pkey PRIMARY KEY (deviceid);
 <   ALTER TABLE ONLY public.device DROP CONSTRAINT device_pkey;
       public         bacula    false    164    164            �           2606    16422 	   file_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY file
    ADD CONSTRAINT file_pkey PRIMARY KEY (fileid);
 8   ALTER TABLE ONLY public.file DROP CONSTRAINT file_pkey;
       public         bacula    false    147    147            �           2606    16396    filename_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY filename
    ADD CONSTRAINT filename_pkey PRIMARY KEY (filenameid);
 @   ALTER TABLE ONLY public.filename DROP CONSTRAINT filename_pkey;
       public         bacula    false    143    143                       2606    16482    fileset_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY fileset
    ADD CONSTRAINT fileset_pkey PRIMARY KEY (filesetid);
 >   ALTER TABLE ONLY public.fileset DROP CONSTRAINT fileset_pkey;
       public         bacula    false    154    154            �           2606    16451    job_pkey 
   CONSTRAINT     F   ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (jobid);
 6   ALTER TABLE ONLY public.job DROP CONSTRAINT job_pkey;
       public         bacula    false    149    149                       2606    16498    jobmedia_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY jobmedia
    ADD CONSTRAINT jobmedia_pkey PRIMARY KEY (jobmediaid);
 @   ALTER TABLE ONLY public.jobmedia DROP CONSTRAINT jobmedia_pkey;
       public         bacula    false    156    156                        2606    16471    location_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey PRIMARY KEY (locationid);
 @   ALTER TABLE ONLY public.location DROP CONSTRAINT location_pkey;
       public         bacula    false    152    152                       2606    16665    locationlog_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY locationlog
    ADD CONSTRAINT locationlog_pkey PRIMARY KEY (loclogid);
 F   ALTER TABLE ONLY public.locationlog DROP CONSTRAINT locationlog_pkey;
       public         bacula    false    172    172                       2606    16650    log_pkey 
   CONSTRAINT     F   ALTER TABLE ONLY log
    ADD CONSTRAINT log_pkey PRIMARY KEY (logid);
 6   ALTER TABLE ONLY public.log DROP CONSTRAINT log_pkey;
       public         bacula    false    170    170                       2606    16544 
   media_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY media
    ADD CONSTRAINT media_pkey PRIMARY KEY (mediaid);
 :   ALTER TABLE ONLY public.media DROP CONSTRAINT media_pkey;
       public         bacula    false    158    158                       2606    16557    mediatype_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY mediatype
    ADD CONSTRAINT mediatype_pkey PRIMARY KEY (mediatypeid);
 B   ALTER TABLE ONLY public.mediatype DROP CONSTRAINT mediatype_pkey;
       public         bacula    false    160    160            �           2606    16408 	   path_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY path
    ADD CONSTRAINT path_pkey PRIMARY KEY (pathid);
 8   ALTER TABLE ONLY public.path DROP CONSTRAINT path_pkey;
       public         bacula    false    145    145            %           2606    16700    pathhierarchy_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY pathhierarchy
    ADD CONSTRAINT pathhierarchy_pkey PRIMARY KEY (pathid);
 J   ALTER TABLE ONLY public.pathhierarchy DROP CONSTRAINT pathhierarchy_pkey;
       public         bacula    false    178    178            )           2606    16708    pathvisibility_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY pathvisibility
    ADD CONSTRAINT pathvisibility_pkey PRIMARY KEY (jobid, pathid);
 L   ALTER TABLE ONLY public.pathvisibility DROP CONSTRAINT pathvisibility_pkey;
       public         bacula    false    179    179    179                       2606    16623 	   pool_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY pool
    ADD CONSTRAINT pool_pkey PRIMARY KEY (poolid);
 8   ALTER TABLE ONLY public.pool DROP CONSTRAINT pool_pkey;
       public         bacula    false    166    166            +           2606    16720    status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY status
    ADD CONSTRAINT status_pkey PRIMARY KEY (jobstatus);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public         bacula    false    181    181                       2606    16569    storage_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY storage
    ADD CONSTRAINT storage_pkey PRIMARY KEY (storageid);
 >   ALTER TABLE ONLY public.storage DROP CONSTRAINT storage_pkey;
       public         bacula    false    162    162            !           2606    16690    unsavedfiles_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY unsavedfiles
    ADD CONSTRAINT unsavedfiles_pkey PRIMARY KEY (unsavedid);
 H   ALTER TABLE ONLY public.unsavedfiles DROP CONSTRAINT unsavedfiles_pkey;
       public         bacula    false    176    176                       1259    16685    basefiles_jobid_idx    INDEX     C   CREATE INDEX basefiles_jobid_idx ON basefiles USING btree (jobid);
 '   DROP INDEX public.basefiles_jobid_idx;
       public         bacula    false    175                       1259    16639    client_name_idx    INDEX     B   CREATE UNIQUE INDEX client_name_idx ON client USING btree (name);
 #   DROP INDEX public.client_name_idx;
       public         bacula    false    168            �           1259    16424    file_jobid_idx    INDEX     9   CREATE INDEX file_jobid_idx ON file USING btree (jobid);
 "   DROP INDEX public.file_jobid_idx;
       public         bacula    false    147            �           1259    16423    file_jpfid_idx    INDEX     M   CREATE INDEX file_jpfid_idx ON file USING btree (jobid, pathid, filenameid);
 "   DROP INDEX public.file_jpfid_idx;
       public         bacula    false    147    147    147            �           1259    16397    filename_name_idx    INDEX     F   CREATE UNIQUE INDEX filename_name_idx ON filename USING btree (name);
 %   DROP INDEX public.filename_name_idx;
       public         bacula    false    143                       1259    16483    fileset_name_idx    INDEX     @   CREATE INDEX fileset_name_idx ON fileset USING btree (fileset);
 $   DROP INDEX public.fileset_name_idx;
       public         bacula    false    154                       1259    16499    job_media_job_id_media_id_idx    INDEX     U   CREATE INDEX job_media_job_id_media_id_idx ON jobmedia USING btree (jobid, mediaid);
 1   DROP INDEX public.job_media_job_id_media_id_idx;
       public         bacula    false    156    156            �           1259    16452    job_name_idx    INDEX     5   CREATE INDEX job_name_idx ON job USING btree (name);
     DROP INDEX public.job_name_idx;
       public         bacula    false    149            �           1259    16459    jobhisto_idx    INDEX     ?   CREATE INDEX jobhisto_idx ON jobhisto USING btree (starttime);
     DROP INDEX public.jobhisto_idx;
       public         bacula    false    150                       1259    16651    log_name_idx    INDEX     6   CREATE INDEX log_name_idx ON log USING btree (jobid);
     DROP INDEX public.log_name_idx;
       public         bacula    false    170            	           1259    16545    media_volumename_id    INDEX     K   CREATE UNIQUE INDEX media_volumename_id ON media USING btree (volumename);
 '   DROP INDEX public.media_volumename_id;
       public         bacula    false    158            �           1259    16409    path_name_idx    INDEX     >   CREATE UNIQUE INDEX path_name_idx ON path USING btree (path);
 !   DROP INDEX public.path_name_idx;
       public         bacula    false    145            &           1259    16701    pathhierarchy_ppathid    INDEX     K   CREATE INDEX pathhierarchy_ppathid ON pathhierarchy USING btree (ppathid);
 )   DROP INDEX public.pathhierarchy_ppathid;
       public         bacula    false    178            '           1259    16709    pathvisibility_jobid    INDEX     I   CREATE INDEX pathvisibility_jobid ON pathvisibility USING btree (jobid);
 (   DROP INDEX public.pathvisibility_jobid;
       public         bacula    false    179                       1259    16624    pool_name_idx    INDEX     7   CREATE INDEX pool_name_idx ON pool USING btree (name);
 !   DROP INDEX public.pool_name_idx;
       public         bacula    false    166            =      x������ � �      ?      x������ � �      9   ^   x�3�L�H-*��MK�4�3�3R�0�p,(24�T�4�0�-H����+��M�+�IIM�L��).,MM�J�/�L�4�42�4200�44551�b���� ��7      <      x������ � �      7      x������ � �      .      x��|Y��8��5���'�Ö�K�����a5�f����Q�\�[�TT��0ѭ�RyrSČ��GT@F�Xʟ��7k��������������՞l+�?V�������|���^��n�*L�kYi����c2�� ����z�ͬ޿	x��W�����,��x��;۾v�+�Z{�iJulϛ����2Y�v�d�/<L���k���ӹ�ۿ͹oN�|���������/��������E���7+=ދ���*��2��٥�~�x*ޛPǃ�\":�Ѕ�����N���P������ofVͨxu���+sٴ�M���t�����ޤ���2r����٣UZ�.��H=5vURO�K��-hr�ػ�as���}5�zF'�T�ַZ����+���}���l�~�ں�N�d��k�S��//�H%f�i���cd	c�SE�_']�l��+�@nW$����k�����?gգ�x�N�edo��7�\�V>���N����]m��"xy#2��4��er�}����\x+�
֗��(���0�YrPr3+¥)����4+�wU��K�����E��-��QЈ��\�C5w����yiRur���]�ZG�O9#�����Gf}������9��
��AؕK�ͳ�����Z��Nr�Ɋ
\KP�H@� �b`�L>���re��-�[��6@0_.~VT3"���G�3��D��g����Ǘ����Q�m�b�]��>p#"���F'�������k�����ʱy
����k�t��H�'�1��1~���6�G�k��`.��Q���[ ��F�Hs]���b��!��M}Ѯ��Cײ��qi箓{���,�L�Ū�M`�C�Y<�9D�����y=-�����E CX�Y�X���#OV���-����Y��h�4;O^�B2� �F��+3S��^OӲ�|9v�>5f����
�_�@��(с[k6���$6�ī����q�8��Io�m-;���r��=(hcut��&<����!�_앭�_Yo8��T/牼�g��N�^�S�a�1F@-i�\�PY���'v����/W��a4�E�Y��x
}p�j�l
�g���u�U_�����3+	� /rZ����Ο�nM������*8[�qK����	 �H�v�E�#�Ȗ�{��]�ܟ�ɭ���}�OW�V�0c�D��s�f�j�f���p��2����9��r&U;Y	&��Jt�;�*�`~eG�S�Ye�#��r�m?�ұ�	�G��	0��3AeLAlX�&��
�Y�k_�e�W-ϖ��-�_pu%#Q�F��b�p�y�X@5�`�N�UPp����8J���M��
�Y&v�����uKZF"P�b���)'���fWR��m9O�-9˱���ǧR���%I����
��4C�٠��Dt���۵��ꙺ4�] y�'2F##������!BS�	(�(��l\u���{�&C���PТ�=��F�]��Z�u����V� �לt�4�`�7c��W?k��^F{=��)'�m���f���#��?�I~6��i��;��/ed�������!���~�m�
��)?����
�% +=
��~�k�M2���GD��]���zC�{�f=�_9������	 ��A]��]6��BEY��h!�ӕB��+��@�;���k�޻�n�2ܨ��ߡ2�����Hł��.ܯ�BS-g�79I�VN�5���߱2�u֘��\�w�\�6����I��us����]� �7(ӄT�]&mn�z3T�,��톳���>vf�kw�a�aV2
�e�]VA�	�r�5w;$��f4����L_]�.���󵭨���gaݣ�j�t����;�5�I^�Tnԟ�J��u��&��?�(�Rt��3+��DR�4�\�V��i]�w�4/�8�H�ֈ�\������-1��kP��^�dX<��{��]�����N^W��Y�o��c7�d�J%�{g-�1J���VwJ�w���r��B�:	Թ*��G������XXLtU�rR@�"$r�՜�w����t'mv�޷�,L��V=���l��	���zi��nݼ� B�*�Ҁ�3�;\ưZfۃ�,?k��'$4^.΂�!��i�$m�<��Q(XA$������*�e��bc�ދb��n5���4=�ok)�����>�[n}�����gU�2&��}�.ʛF�h}Q)J	\�O���.A7�z��\��,ܶJ�h<Kc�V}Dʞ�p��s]KxƉ�x�����z���5�i�U��J�������K�2J�1pb.$d��[!�6��[��Ŋo󔶝g=���V�(�U%�Ҧi�bc��S�v�����-c�MճfSc;��� 5�lj��M���4a?�ssK;�]�Ӻ��0��GJ���\���Y��k�@S�TԮ'JN/�>T�D~{���<fI��֑٨7�h-zF%Ќ<��d����ˏa�_���<�]t�	~���gfV52*����2�r��ğ����V�z5���(�dqS�N
�]�)�ƻ���k����@k��vm�X�޵9��0��+��Ә*
����:�WG���,���iWΎkf5��0�X���eA�} V��GS�͔vnfV��a�p����v��&�V�����
�.�����jυsxsT[/��kw?����b�X.���}jJF#����.�CL^ib�EO�իK�z�V���~����q�?M�\�t��&T��{&`{A�2��]~�>�AQ�����n��K�}\ΰR�7��w�X}�a����~es�� Ї����U�ثl����>t���۬ u��0���]����V����}�׽�
�����No#�x�2�y�A�.dt1�۴X��x:x:�?ci��pF�o��R�A��zV���O�Q�zʍj�,�ntc9��B<q@|���?V�D-l�;�>�NaV�2:����0�7	�@D�˷��料�j���k?�{y{�̬.gt��J1�N8�۷4mo��J����OC>�\�^�Cx%��
3���w�����$9���?��ѨH�Nu篃GA��M���a�B��~>:�^���8����Z�� -�h�'�+{�'y����$��	���?s�i���<V���r��=��tV���f����Ay����7���`2w�ŦR��K02:Ŧ�M[�/�yC��FUtut	3����h�[_�.ܖ3o��V�YC�4�ƐP`���ݎ�,?�D��`�.+�nN[f�x��s���ۄc]��`"��ɑw-��_�eѴ;]�ѭ���Yx�ƻU���PQq�8AMi�P-�L��:J�N�>� �wr�#�vT�Q�¯���r��j�U�J�0J��x���9c�h!l�XsgL�!m?i�&�w{V>\R5���S��((��@�9#�ȪT��C3*8غ99傒7���ϱmW�PCj� H�u�-�j�H�>�t�\�r5�Z�5no��U���p}�bc��:֙�3��E��C�gc�Ba�<�g�ql)ygv*��Qk�?Z��`���{:����02�kl��D20J&�Fx]�;u�z�)��6��ʺ�[���(����3�<��O袡��^�pL�A/����J��8�O�\�s��{z�36�x�	��D���K�Ԯ�w��b0ݖ�AnPAG H��`�������)T��a����L鞯�v~�ɢV#�!��d��ST��)��M}�f5�����gXN�gc�*ok�":�����E��	��$�ΩX��g8���0�� ��w��6��>�8Ě"\A53�$�D�sg���n��v2�5��zQ��,
*��"J���� �Z�܂��׫���)lyw>���p׵��w�Mh���D�Xm�h��|�I��A=u�]Eۯ�UiJ����:�f|�X��Kx�Q�}0(_���qy�y݁���,DC��[n�h�c���HTk1A���ͫ���k*�p��=�롁Wk��v�Ğ��%��h�^�M+�[߼�s�*�/64Y<DNQ ��R����_�!Ѭ�Zu���   �x��_�����\P��eqg�
��6��>��ե��U6ƮqL���k���ȌD:3$�^?,�Ѣ������h�����^��k(t7(I�I`CfK�u��7UM/��v,uk��v�nrRU)Т����vT�����^���d�Z�8��p�l:�F? =�8�#��9Zݝ=E�o����ga#=:���z]�:8�H��G1ql���1�s�S��SQ|g�FT�k%!f�B����mz��%����C����ʺ� ALG��X����x=�߳EB���>%+�Xf~Y|�
�X[�fn����e�4�6е�g�Xo��3�mqMl�'Zq�{DfGO\cd ��������z�������3.��Imz���Wڝ~���s˸uO�]�y������T�n>+�?��K0����)V�3`^�{@�� Zc�v���B����*��v�R����ez+9���<�|$�Bc��&mrO<��HO��ۋ��YO��({�Os�+��V��慶��֏!L�-�D:o��ޕ�6Y=�g����ں�����ooJ�"�]�A�j�W|��#;��Tx
��h^�yf{^R��o��'y$�[��@�SGj�UƦ�V_O�͇�p�mL��R4�yl�l�=x��#�K�"�M�>I�Y	�A�]�4�in�h*��첂7#��=��
�����ma�oe �����p�B�)9D��Ŷ��N2���L	^9�K�lH�QA�ퟶeC�d�K�g,@	�<튆�i��l;h�v�����ԯd�(w���Xg������%��Bb2;Lޯ$n��+Ȅ�״���w}�ښ���i�-��"��p:�%DYQ!�uNp˥N��|��.[�S�~�,���yH��k)b6�U���5�����6Z���z��gM��sΗ�Vz��<���g,���Qz��� |�p?.M�)8e����	J�<o�%�|Ğ=� D�H�^��7��Ӊ$��EU̇�'�:��c����0r�"�R2b�
��(��	�|�7��o�&��in��Cp7<_���J��`��˳��� ����m��m۲���5��1�5����c�G��&L���o�;�<k��7�o�]U�V`{�����.�Y%5��_���]�ݎvغM}>�����U(�C�ؕ�"3�"�6�K�%qƘ�N��]���-��Vf�r�Dhx�����	JE5������ꩺ���~�٣�:�&7$Bǉ�)�XMM&��4<M�����������jZ��[��XV������f���L�T.����4xaV��UY�;���f�=�S(nW���X-�6F�S������e�:v�~[,��멹Gu�B���t�N��g�%��;c��Cpk�ea # �׈?����\�*�-=�q{gf��P��Q��a1�J*路�3:H��sO�u�e+������
���t�)Vt[l�d���|8;�K����h�s�澋6���),!f5���ᑩ����-����y+L����D�x֝TT�ke���#	S��jBc"���Ķe�]��"�o�b"��P��)�e�_�?��:^�L� ��H^��T�����(�1&��/qEU�HDۑ���(�h�	�!�QTAF�;�ƣ����?�<�����B��G�Sn֣c�N���{$�y���f,���HO��|TQK�H�N�N}���>�������>R��Gղ�H~�P�Jn���HU��~��qR�D�P��"~���IhF�HU_ċ���)h7�<�TߟF��TDY�[�!RD�Im?$A�h�F�H{�,Hzfn������h���(�)��$6.$Y��)�x��3"��f��~Ƅ�/����
)�1$�*>.$�P�/\H�!�ԉq�!�~2���h��6��k�����CRq�!E]GD&�y��d}~>��( ����z�B�h�>�M���o��)x�;�HG���T�P"E�����ID�s"E�%矑"ECF�"6xVdt�|�H�P�¤x�%Z�h������3^��D����H�D�!��IU�͌�$��FR��H hB�/72�)�H �XD.r$�	79 Mr�#��		ex�B����t���H c���|�H*��	ͦ���E�L��)I ��&�M�0$��� �I!�HR��M�����q��ǑLo)I ���$/I2U)$I T����X�@�1�M����&	`��|��$���y� ���\DI*��(	`Y���1%S���$�E���|TIj1�TI �j����\I k���,I7�M�0�P	D�ؒT 7[��X����� �*����� �L#��0O4�M��Wiӕ�1��S� ^�JP�I�$�)� jY% ��L~鈏3	`����&SS
i@W����5	`���>m��*7m�"]�}W>�$��ϛ����'L5�$�ǜ$G�gN	?�`��u��\#���$���F�('y�h��<	`=���>�$�77{��\��%�C��"������� ��:��?#PX}����TŦ0(L�u.�(��hO�PX���|J"��C	d<�Bn��DI��M��T�i%�ǢL�P
�����//��7�@����ţ�Z�i��I�$�M����)J�I	�6h��R�3�S)���R�����N�RX�����b��L	`�g��;lJ�`�#v�|tJ
9n:%���A@�ǧ���� ���4��B��P	`yoH�1*� nF%�QǠ�?�TX��|�J�mnN%@SA}���TR	ܜJ�F��>�é��9�@10�p�8���&�S	T�(	ty8�D?���_��znN%P�~�5�r*S�e
��1�\�J�9�@���	5ܜ�w�L��N%P|��\��T�J�TU��9b�<�J�(nN%@�FtԈ�S�ZΥp*�5�m)>Ne��R8� M}����A$:��ɩL	)�J��N&�'#	�T����9� �"�a$>N�;2�r*�Fz�#qr*SO�©hN�*��S	М��N�y8�d���J�&���9�@��`	0�©���1D?�T��s������f{a/�éL�tS8�@'-~rn.N%�77�� ��Hh��T�V')�J }�HǙ~ʩ��g����p*i���T]����S���N%�U�T���ǩL�©����\�8��]�N%�u<�@.��SI��T��р�l.Nej�©��Sr.N%�ͩ�/⪓�S��pK�T�F�3N%�5�(���é$���TC����é$�9��Pp-Ĕ�SI/��S	OL���ũLp
���~�S	w����v���8���&�S)�oP��M�ĩ�b�X�\��Tg�©��w(�	'NNe��p*%�J��'>N廏�˩��w(����8��EG
�RB_��~�%N���D�=��ũ����TJ�K����2�!�©��7(�	(NNejY�©��W()�0�ũ|砼�J	}����!�RɴV9�2���S)��J�SP���T�p*%�MI_sP|��T)�J	}U����T��'N����l�� UY%a      ,   �  x�]��r�*��^e�)��#�G� �L�����$�G*^`��j>��0��Ġ�قz�*�[����� ����Ŭ�l1+�ٗ�az0����e��"��o2ӫ��ݩc���H��]K\(�9�j�y��E�8g�	�+*� ^2ioS5<v:ή0�
��ẍ́��߰���HU��,|�T�}�gΘ0�b�T��Ѭ�gR;*8��a�E���`�E����u�T��p�@E�b�ݚ"i��"��٩]��P�c�d0�ߨ���g3I*sf77�X�J΂�J����`�.�:�B-f��dKxRY��p�nOY�]�����ʼ�3��Zf�r��-�[��Qm�RB��rv��wX�_���`���U���$oV?/ۘ�FHT�����O�j�����	)3U�LU���eV�"U�xQ�G�A�T�L�Sjtw���k�WAK]�����Q]�]T��}�Q���j��e+xR��l��~���{����5|��1�HA��b��ם�ԓ����(��JM�����4͡9JK1k��s�Q�Ž��=�RZ(���ߘ>���rF-���j�hqROmŜX��:�h�0Wjc.���� T*�kz�~3�ڞ�����}����c9��A�g�VE]ɜ�:3j�����XΟ�l+ֱ" "�BM؂���e��?'�����R���o�h}����|�������L�f(�﫳�����X_�.F_�o~�!�n�
n��cJ�K=�C0+��_�O�ឧ�Ę��'��v�+Q煳�b��Cgp�}��AA�����f̀�mV�M{�n���3P�H�d�A=��� 	�Ǝ��<&$��A�\ �3怤rѯ����W�@��� �K&�p��ax�"�37��_c����`0Xk��r@V���_] ����Dכ��s��)���8-Z�g��N��#�D�����o.̀���>�8ɓ���I^'�̎hr�W� �*�	k�O<*�1���G�0��'�p��r�t���S��;��<����H���;��� ��Vvԭ��9`��C����?�K���02����m�F��_����8O��q�ⴄc�[w:�k���
DO�xG�#��y�x"5���p ��t���)�t4H�bT�^��^@|�TP�u�~f�3nZ�g�oD�?���<      2   f   x�3�tN,I��O�L�0�3�.q��Ψ4�.�(�rq�4204�50�52U0��20�24�2�t+��QN-��7�7����37H7�/qr�7Ŧ�Ȓ+F��� A&\      /   �   x����j1��٧�3�$�$GB/�z�RTD�=��7�u�l�"%����ժ�<�|�u���u� ƒd	�8hr�M"S6��Z+V{56/8Dr�1���L\��f,��{QT,���j�i� :w�+���l��cԈ�"��N3D�٬Ƕ�ۡ�\�V��=��6(m䩍x���^�_�N�z6��}���1Om�hHbT6�36F"��笺�?�^���0ލ��ۚ�ou�47��      0      x������ � �      3   7   x�U��  ��Q�� �b�%��>g	���+��^���'�ZF����f
P      1      x������ � �      ;      x������ � �      :   �  x���n�8�����)lY$哀\4m�6i���� #щP��ꐬ��;��� J��f�5ra��??���B��	�جC{@F��wI���q<��AG7�@\H�D�M&\�.ę�c1�b�=���׽�^�n���4M��M\{<�at{�m߲�5�|�&ּ�jt00:�Ly�±�?m�/G��B�Z�]��e�-�\�c�������#��A�i�Ӿy
��؇q�I�BQgQ�K� �7�X	�U!�P�͂�Q o����Y�G�왲F�Y��c�.�$����\BG�&�Bd��J)�����V���$��a���.JRwDlf����ћ|@�ͱg���H��iY�^�d��퍽A�^�u��ްd���7�Fe{��{�.�c�������.3�;UU �y/yd=�,u�@c?�c���p����ϱ���ԣg������>t��:�<�(�G�+	p����.�~g��L�N���έ��7����	�]t��W㵕���!E��	`�Kb��Ľ��T�V�o�@ȴ�Ydb�7�3Q�X;�X{mb�A(.EY�9�2�|Yj��(4ͺ���:��Iq}%Q{�PO%W-�[����|ҫ���V]���g��!&K�����ͣ�[�oE���"ו����IȧI� �a���/�9VWw��֕��v�o��%���B�{�zu�8�x��e��a1��.<-/��b��gp���q�)�J�U@�yI�ڿ\�����(ϬϦi1f����e��C��%
�� �'��.�,�]�~��dۆ�O�Uҍg<I�=t~�#i��uƺ�b�u%M�1�'�GK9+�%1���e��4S���m�+��^���T=������T�Ξ!LW XTR�ottm�T4瀭G�� �l
&�]T����Ke=q��9q���V���KTQ����Z��_��o�kx�A�a-��R�8�yq9>�
��������>��'�N��M��F���o.}���p��a���7����zA^�#���d�=�;���_��\��t6���s34��k�=�[����cy-�6q�M�&�a!&dTJ]ۮZ����R-�#�mW����s��E�Ba�l��y^4�X�#�0�ڦ����'�#%��p���_����zI~��������Moc��+:��T1AA�4��ư� �t���%l��.�.7j\����9����uXY4W�e�=�dD�ճ�+��Sf�m�N�1Z},�μr2X�=�N�����ԁ'a�l�Gj	SFX{X���y�~<�~xW�yk��JuRջ̡5�[�"�M�L�1�qQ����a��^$�]�V(�"��E6�b9j�Ȥ�2�g��`�s�.�.Vꨚ����J`X�e%@��l@~�4�E��j�6�h�h���l�+a
���� ʒp�Q�K�Ƚ
��A�h���r�^F6�r!�?S9Q/���O��⨏���@7��^�2^Ur/������ы�^c���b/���_ ��/w��7�xT������h���=�F��lDhۦ��3Ąj���G��ڬ�voG���Z��X�Y���`;'Up��lc�1�8���>�1�49̢�Z�����[D��#��+=B��8r��Q��#B�P�T!��!v�#���q�X��Hi�$9���bV���q��'����ox����ͷߦx������Ͽ$w���Fo����3�����mS�7����n5�8�g����Tя������j4�,͙�      4   {   x�eL��0������vB�l]:��P	�L�~��Du��;3��+���uq�,#t�4p��kJ�L��e���g+�,�l�K.�޷m��� � :��2��z�L5OٚoϢi��Ia��v�H"/      5      x�3�t��I�4������ U�      -      x�3��/-.�/N�������� 0[�      @      x������ � �      A      x������ � �      8   X   x�3�tIMK,�)�4 CC 66456300�4������K�-0��9���K�3(0È�-3'�� �@�������A�b���� f$�      C   =  x�U�Mr�0���)t���a�eʮ,�i7lL���Y��7����==ɪ��J�cR�IQ�9a�0�����S�E�;�S�x:1wMC9���=�*�;�������$�$�|a�)>�V���0�L�;aVUf	$��ئ.:tܶ$�1e��vx�!��c�I�2+���òC�`홢�v�o5�=:K!��ÄG�b ��k�>A��a�h���s�rꤡ�8O�t��fB�q߉��R�`�9t���7�{�Պ�r�.����	^������Kt�/)�b��NofX���6'�8�X�e_��$q�i�d���ڼ�      6      x�3�t��I�4������ U�      >      x������ � �      B      x�34����� �     
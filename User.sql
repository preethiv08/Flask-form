PGDMP     /    "                 {            User    15.1    15.1     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24598    User    DATABASE     ?   CREATE DATABASE "User" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United Arab Emirates.1252';
    DROP DATABASE "User";
                postgres    false                       0    0    DATABASE "User"    COMMENT     ]   COMMENT ON DATABASE "User" IS 'This is the database for the flask form created in Jan 2023';
                   postgres    false    3329            ?            1259    24643    User    TABLE     ?   CREATE TABLE public."User" (
    id integer NOT NULL,
    username character varying(80),
    email character varying(80),
    password bytea
);
    DROP TABLE public."User";
       public         heap    postgres    false            ?            1259    24642    User_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    215                       0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    214            e           2604    24646    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            ?          0    24643    User 
   TABLE DATA           ?   COPY public."User" (id, username, email, password) FROM stdin;
    public          postgres    false    215   ?                  0    0    User_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."User_id_seq"', 3, true);
          public          postgres    false    214            g           2606    24654    User User_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_email_key" UNIQUE (email);
 A   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_email_key";
       public            postgres    false    215            i           2606    24650    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    215            k           2606    24652    User User_username_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_username_key" UNIQUE (username);
 D   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_username_key";
       public            postgres    false    215            ?   t   x??1?0C???WZ-?rۘ.?"9~L?WH3?/??\?7k??}?a?i??NU6Uu???y? N??F?????\????C??y?????we??Y1?-?J??}M)? ?%%     
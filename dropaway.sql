PGDMP         0            
    z            dropaway    14.4    14.4 �    C           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            D           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            E           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            F           1262    16803    dropaway    DATABASE     \   CREATE DATABASE dropaway WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF8';
    DROP DATABASE dropaway;
                cloudsqlsuperuser    false            G           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM cloudsqladmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   cloudsqlsuperuser    false    3            H           0    0 4   FUNCTION pg_replication_origin_advance(text, pg_lsn)    ACL     c   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    256            I           0    0 +   FUNCTION pg_replication_origin_create(text)    ACL     Z   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    244            J           0    0 )   FUNCTION pg_replication_origin_drop(text)    ACL     X   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    245            K           0    0 (   FUNCTION pg_replication_origin_oid(text)    ACL     W   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    246            L           0    0 6   FUNCTION pg_replication_origin_progress(text, boolean)    ACL     e   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    247            M           0    0 1   FUNCTION pg_replication_origin_session_is_setup()    ACL     `   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    248            N           0    0 8   FUNCTION pg_replication_origin_session_progress(boolean)    ACL     g   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    257            O           0    0 .   FUNCTION pg_replication_origin_session_reset()    ACL     ]   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    249            P           0    0 2   FUNCTION pg_replication_origin_session_setup(text)    ACL     a   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    250            Q           0    0 +   FUNCTION pg_replication_origin_xact_reset()    ACL     Z   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    251            R           0    0 K   FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone)    ACL     z   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    252            S           0    0    FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn)    ACL     �   GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO cloudsqlsuperuser;
       
   pg_catalog          cloudsqladmin    false    258            �            1259    16913    account_emailaddress    TABLE     �   CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);
 (   DROP TABLE public.account_emailaddress;
       public         heap    postgres    false            �            1259    16912    account_emailaddress_id_seq    SEQUENCE     �   ALTER TABLE public.account_emailaddress ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    16921    account_emailconfirmation    TABLE     �   CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);
 -   DROP TABLE public.account_emailconfirmation;
       public         heap    postgres    false            �            1259    16920     account_emailconfirmation_id_seq    SEQUENCE     �   ALTER TABLE public.account_emailconfirmation ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    16827 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    16826    auth_group_id_seq    SEQUENCE     �   ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    16835    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    16834    auth_group_permissions_id_seq    SEQUENCE     �   ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    16821    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    16820    auth_permission_id_seq    SEQUENCE     �   ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    16841 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    16849    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    16848    auth_user_groups_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    16840    auth_user_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    16855    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    16854 !   auth_user_user_permissions_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    16974    authtoken_token    TABLE     �   CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);
 #   DROP TABLE public.authtoken_token;
       public         heap    postgres    false            �            1259    16987 	   core_item    TABLE     b  CREATE TABLE public.core_item (
    id uuid NOT NULL,
    category character varying(20) NOT NULL,
    title character varying(100) NOT NULL,
    description character varying(500) NOT NULL,
    photo_src character varying(500),
    buyer_id integer,
    status character varying(20) NOT NULL,
    dimensions character varying(100) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    condition character varying(20) NOT NULL,
    pickup_location character varying(200) NOT NULL,
    pickup_time_from character varying(10),
    pickup_time_to character varying(10)
);
    DROP TABLE public.core_item;
       public         heap    postgres    false            �            1259    16946    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    16945    django_admin_log_id_seq    SEQUENCE     �   ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            �            1259    16813    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    16812    django_content_type_id_seq    SEQUENCE     �   ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    212            �            1259    16805    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    16804    django_migrations_id_seq    SEQUENCE     �   ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210            �            1259    17021    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    17031    django_site    TABLE     �   CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.django_site;
       public         heap    postgres    false            �            1259    17030    django_site_id_seq    SEQUENCE     �   ALTER TABLE public.django_site ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            �            1259    17040    socialaccount_socialaccount    TABLE     D  CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);
 /   DROP TABLE public.socialaccount_socialaccount;
       public         heap    postgres    false            �            1259    17039 "   socialaccount_socialaccount_id_seq    SEQUENCE     �   ALTER TABLE public.socialaccount_socialaccount ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            �            1259    17048    socialaccount_socialapp    TABLE     #  CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);
 +   DROP TABLE public.socialaccount_socialapp;
       public         heap    postgres    false            �            1259    17047    socialaccount_socialapp_id_seq    SEQUENCE     �   ALTER TABLE public.socialaccount_socialapp ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            �            1259    17054    socialaccount_socialapp_sites    TABLE     �   CREATE TABLE public.socialaccount_socialapp_sites (
    id bigint NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);
 1   DROP TABLE public.socialaccount_socialapp_sites;
       public         heap    postgres    false            �            1259    17053 $   socialaccount_socialapp_sites_id_seq    SEQUENCE     �   ALTER TABLE public.socialaccount_socialapp_sites ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    241            �            1259    17060    socialaccount_socialtoken    TABLE     �   CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);
 -   DROP TABLE public.socialaccount_socialtoken;
       public         heap    postgres    false            �            1259    17059     socialaccount_socialtoken_id_seq    SEQUENCE     �   ALTER TABLE public.socialaccount_socialtoken ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    243            /          0    16913    account_emailaddress 
   TABLE DATA           W   COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
    public          postgres    false    226   ��       1          0    16921    account_emailconfirmation 
   TABLE DATA           ]   COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
    public          postgres    false    228   9�       %          0    16827 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    216   V�       '          0    16835    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    218   s�       #          0    16821    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    214   ��       )          0    16841 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    220    �       +          0    16849    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    222   ��       -          0    16855    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    224   ��       4          0    16974    authtoken_token 
   TABLE DATA           @   COPY public.authtoken_token (key, created, user_id) FROM stdin;
    public          postgres    false    231   ��       5          0    16987 	   core_item 
   TABLE DATA           �   COPY public.core_item (id, category, title, description, photo_src, buyer_id, status, dimensions, "timestamp", user_id, condition, pickup_location, pickup_time_from, pickup_time_to) FROM stdin;
    public          postgres    false    232   ��       3          0    16946    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    230   �      !          0    16813    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    212   M                0    16805    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    210   	      6          0    17021    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    233   K      8          0    17031    django_site 
   TABLE DATA           7   COPY public.django_site (id, domain, name) FROM stdin;
    public          postgres    false    235   &(      :          0    17040    socialaccount_socialaccount 
   TABLE DATA           v   COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
    public          postgres    false    237   S(      <          0    17048    socialaccount_socialapp 
   TABLE DATA           ]   COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
    public          postgres    false    239   p(      >          0    17054    socialaccount_socialapp_sites 
   TABLE DATA           R   COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
    public          postgres    false    241   �(      @          0    17060    socialaccount_socialtoken 
   TABLE DATA           l   COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
    public          postgres    false    243   �(      T           0    0    account_emailaddress_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 11, true);
          public          postgres    false    225            U           0    0     account_emailconfirmation_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);
          public          postgres    false    227            V           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    215            W           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    217            X           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);
          public          postgres    false    213            Y           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    221            Z           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 12, true);
          public          postgres    false    219            [           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    223            \           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 40, true);
          public          postgres    false    229            ]           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);
          public          postgres    false    211            ^           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 36, true);
          public          postgres    false    209            _           0    0    django_site_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);
          public          postgres    false    234            `           0    0 "   socialaccount_socialaccount_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);
          public          postgres    false    236            a           0    0    socialaccount_socialapp_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);
          public          postgres    false    238            b           0    0 $   socialaccount_socialapp_sites_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);
          public          postgres    false    240            c           0    0     socialaccount_socialtoken_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);
          public          postgres    false    242            M           2606    16943 3   account_emailaddress account_emailaddress_email_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);
 ]   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_email_key;
       public            postgres    false    226            O           2606    16917 .   account_emailaddress account_emailaddress_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_pkey;
       public            postgres    false    226            T           2606    16927 ;   account_emailconfirmation account_emailconfirmation_key_key 
   CONSTRAINT     u   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);
 e   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_key_key;
       public            postgres    false    228            V           2606    16925 8   account_emailconfirmation account_emailconfirmation_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirmation_pkey;
       public            postgres    false    228            1           2606    16972    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    216            6           2606    16870 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    218    218            9           2606    16839 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    218            3           2606    16831    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    216            ,           2606    16861 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    214    214            .           2606    16825 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    214            A           2606    16853 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    222            D           2606    16885 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    222    222            ;           2606    16845    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    220            G           2606    16859 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    224            J           2606    16899 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    224    224            >           2606    16967     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    220            ]           2606    16978 $   authtoken_token authtoken_token_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);
 N   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
       public            postgres    false    231            _           2606    16980 +   authtoken_token authtoken_token_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
       public            postgres    false    231            b           2606    16993    core_item core_item_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.core_item
    ADD CONSTRAINT core_item_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.core_item DROP CONSTRAINT core_item_pkey;
       public            postgres    false    232            Y           2606    16953 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    230            '           2606    16819 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    212    212            )           2606    16817 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    212            %           2606    16811 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    210            f           2606    17027 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    233            j           2606    17037 ,   django_site django_site_domain_a2e37b91_uniq 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);
 V   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_domain_a2e37b91_uniq;
       public            postgres    false    235            l           2606    17035    django_site django_site_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
       public            postgres    false    235            n           2606    17046 <   socialaccount_socialaccount socialaccount_socialaccount_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.socialaccount_socialaccount DROP CONSTRAINT socialaccount_socialaccount_pkey;
       public            postgres    false    237            p           2606    17070 R   socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);
 |   ALTER TABLE ONLY public.socialaccount_socialaccount DROP CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq;
       public            postgres    false    237    237            u           2606    17078 Y   socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);
 �   ALTER TABLE ONLY public.socialaccount_socialapp_sites DROP CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq;
       public            postgres    false    241    241            s           2606    17052 4   socialaccount_socialapp socialaccount_socialapp_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.socialaccount_socialapp DROP CONSTRAINT socialaccount_socialapp_pkey;
       public            postgres    false    239            w           2606    17058 @   socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.socialaccount_socialapp_sites DROP CONSTRAINT socialaccount_socialapp_sites_pkey;
       public            postgres    false    241            }           2606    17068 S   socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);
 }   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq;
       public            postgres    false    243    243                       2606    17066 8   socialaccount_socialtoken socialaccount_socialtoken_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_socialtoken_pkey;
       public            postgres    false    243            K           1259    16944 (   account_emailaddress_email_03be32b2_like    INDEX     ~   CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);
 <   DROP INDEX public.account_emailaddress_email_03be32b2_like;
       public            postgres    false    226            P           1259    16934 %   account_emailaddress_user_id_2c513194    INDEX     i   CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);
 9   DROP INDEX public.account_emailaddress_user_id_2c513194;
       public            postgres    false    226            Q           1259    16941 3   account_emailconfirmation_email_address_id_5b7f8c58    INDEX     �   CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);
 G   DROP INDEX public.account_emailconfirmation_email_address_id_5b7f8c58;
       public            postgres    false    228            R           1259    16940 +   account_emailconfirmation_key_f43612bd_like    INDEX     �   CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);
 ?   DROP INDEX public.account_emailconfirmation_key_f43612bd_like;
       public            postgres    false    228            /           1259    16973    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    216            4           1259    16881 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    218            7           1259    16882 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    218            *           1259    16867 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    214            ?           1259    16897 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    222            B           1259    16896 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    222            E           1259    16911 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    224            H           1259    16910 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    224            <           1259    16968     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    220            [           1259    16986 !   authtoken_token_key_10f0b77e_like    INDEX     p   CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);
 5   DROP INDEX public.authtoken_token_key_10f0b77e_like;
       public            postgres    false    231            `           1259    17148    core_item_buyer_id_36d714b1    INDEX     U   CREATE INDEX core_item_buyer_id_36d714b1 ON public.core_item USING btree (buyer_id);
 /   DROP INDEX public.core_item_buyer_id_36d714b1;
       public            postgres    false    232            c           1259    17209    core_item_user_id_71161597    INDEX     S   CREATE INDEX core_item_user_id_71161597 ON public.core_item USING btree (user_id);
 .   DROP INDEX public.core_item_user_id_71161597;
       public            postgres    false    232            W           1259    16964 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    230            Z           1259    16965 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    230            d           1259    17029 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    233            g           1259    17028 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    233            h           1259    17038     django_site_domain_a2e37b91_like    INDEX     n   CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);
 4   DROP INDEX public.django_site_domain_a2e37b91_like;
       public            postgres    false    235            q           1259    17076 ,   socialaccount_socialaccount_user_id_8146e70c    INDEX     w   CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);
 @   DROP INDEX public.socialaccount_socialaccount_user_id_8146e70c;
       public            postgres    false    237            x           1259    17090 .   socialaccount_socialapp_sites_site_id_2579dee5    INDEX     {   CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);
 B   DROP INDEX public.socialaccount_socialapp_sites_site_id_2579dee5;
       public            postgres    false    241            y           1259    17089 3   socialaccount_socialapp_sites_socialapp_id_97fb6e7d    INDEX     �   CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);
 G   DROP INDEX public.socialaccount_socialapp_sites_socialapp_id_97fb6e7d;
       public            postgres    false    241            z           1259    17101 -   socialaccount_socialtoken_account_id_951f210e    INDEX     y   CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);
 A   DROP INDEX public.socialaccount_socialtoken_account_id_951f210e;
       public            postgres    false    243            {           1259    17102 )   socialaccount_socialtoken_app_id_636a42d7    INDEX     q   CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);
 =   DROP INDEX public.socialaccount_socialtoken_app_id_636a42d7;
       public            postgres    false    243            �           2606    16928 J   account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.account_emailaddress DROP CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id;
       public          postgres    false    220    226    3899            �           2606    16935 U   account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.account_emailconfirmation DROP CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e;
       public          postgres    false    228    226    3919            �           2606    16876 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    3886    218    214            �           2606    16871 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    3891    218    216            �           2606    16862 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    212    214    3881            �           2606    16891 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    222    3891    216            �           2606    16886 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    222    220    3899            �           2606    16905 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    3886    224    214            �           2606    16900 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    224    3899    220            �           2606    16981 @   authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id;
       public          postgres    false    3899    231    220            �           2606    17204 5   core_item core_item_buyer_id_36d714b1_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_item
    ADD CONSTRAINT core_item_buyer_id_36d714b1_fk_auth_user_id FOREIGN KEY (buyer_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 _   ALTER TABLE ONLY public.core_item DROP CONSTRAINT core_item_buyer_id_36d714b1_fk_auth_user_id;
       public          postgres    false    220    232    3899            �           2606    17199 4   core_item core_item_user_id_71161597_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.core_item
    ADD CONSTRAINT core_item_user_id_71161597_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 ^   ALTER TABLE ONLY public.core_item DROP CONSTRAINT core_item_user_id_71161597_fk_auth_user_id;
       public          postgres    false    220    3899    232            �           2606    16954 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    3881    230    212            �           2606    16959 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    220    3899    230            �           2606    17091 O   socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc;
       public          postgres    false    237    243    3950            �           2606    17096 K   socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.socialaccount_socialtoken DROP CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc;
       public          postgres    false    3955    239    243            �           2606    17084 P   socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.socialaccount_socialapp_sites DROP CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si;
       public          postgres    false    235    3948    241            �           2606    17079 U   socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.socialaccount_socialapp_sites DROP CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc;
       public          postgres    false    241    239    3955            �           2606    17071 X   socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.socialaccount_socialaccount DROP CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id;
       public          postgres    false    220    3899    237            /   �   x�]��� @�3�a��i3)R`���g�����}
KT�n��(A��N)�'<A�A����a�L�:+�ٺ���k���!�-kl��Z�MyZl�o#�v�s��l�\�qJ̃=�$��p���Lx<���3/!���s��/��PW      1      x������ � �      %      x������ � �      '      x������ � �      #   `  x�}�A��0E��)r�QȺ��˖F�x2�@@f�o?v�LU�Vv����?�&F�u㩻^O��vr�|)���O��� ��ݍ7'��E`	����&��E`����X� ���f�<�u�Q`�6t��	�1����ےEA�G�]v��ezΪ�����ͥ9�B�pO	A;�d%����๺EU` ,����8��#`������l��q��'�Ӹ�_��}�NYp�[aG��9�hH�����?�g�y���`��zu�W��0>�B����c�턡�c]'\�5}��C5`',u!�S4�i�BX�q��!��}�t�j��-�u)ڛ�x8"��	��a�M �1�6ԅ����TD��m '��8�9V�D�!d�٫Q�_dh�_�Rt9�S9��MD�E *��4���)5�=��V��2�����+�֌G_R"��IШ��gp.q{H�/�ayt[��)(�γ�<�7y���G�����(��RH7h����/���)�	�.nj+�T�H5�"q�rQj��{�Kb٤�̒��}��T<�<k[}�D*d� ��%�"�&��<���4AмH�w�X�'~�l�:)E._^'#�����UB���Q��Ck�E�Q      )   �  x�}�[��H���W��:�
�$�H+��o�d� ��( J����9��GP$Ԯ�Uk���v\���I�6�|���te���dnC��h�n��7Գs���&��f�D��n�lgλvt�B��FC�%��_5�	�O���P"P��CƐ� P�j~|:�v�v�F�.��,N8'���% G)�@,Kԅ�����7��E�Z\iH�:B�ܠ���+W�Λ�(�iy�GLDG�Ձ�\o�0'_���(Q��LĈ��탛l���6x�}.̿#�g��Ȅ
���	ӯ�3�.[�y��j��^�������H�M�<���f�^p�Ѧj'h'N[�'dZi�y	�3
	�!�q����G���Q�T�������h��'/��(��Cx�6�܈cギ�����o3?�*�����;PS�%������$a�å���?�Z���i���w��3/����	}��'f0�|�mM�b�떩��nkO�]�J:	��&��%/��F�V�IꀴW����sL$��͐V�i�T��� ����Ǩ���jZZܟ�Eכ�����ZC�|ag;|%ZD]�N�i{p-4ݢ�l㱸��{�|ՔJ�JrP��H�d��
 P	�k��W�����% G�
ծ����C0Y�������~oyY�1�v�Eo�#`��k|�7O�!~�F���X�cy��I�I p�P^�o�Q��A�\�����^7O��:�DE�	<�ݪ��?�=)>���-X���ҹ�7�C�]������Ɖ�3�"5Z����z����rT��� ��P!D�Ԁ����Jr(RL?b��̗$�����v��T1�n,�!=��>o���<��ɵ{ͳ����2�f��7��+�J+������4�mwWr����2�*�+�1���2ķ&�I������d�:ڰ}e;�`'�����F���(�����u3���N��� ���=ƕW��s�ܧ�aF�GH�Ǽ �1G���"J���b�5Ĺb���W4gNg���E��Y����d��[�!;Ⱦ�rm�� ����0��+���=$�9� �K�1���=��;l&C2ہ�L�KO�,��󳂝V�e]?�^,t�X�zڂY�`���7dTeϰ@�鷏���z�!In� O�4������ֽOp      +      x������ � �      -      x������ � �      4   �  x�]�9r$AP[y
��`'��������Cj�Ň��+5r�������r�Y����~}!~�~�L7��* >�-�%ԁl)���@�$+ʲW�tr�q@큨9�MJWe��KZWI
���o��M|�u�W"nX����ۻ��"&?i�����2S i=mo��Ke�.k�%�Æ%�d�3Hߡ~+\�F��z,�s�p�>��|,����D[�d���@��"]����9b�H�*���5tb�S�O�p)�_��+n�+����fP�6ĂBe"��Ǚt��{�_�ެ�j�:vo1+㤡5E|p�'��.zr�>/ �7�o�7��b�@�J���4E���I+8���1%�'��nd�y@��?B�BJ��LQ��c�ְ�D�|�w�oƋ��?$b�sS�0V�ӧ���g(�]� vś$x#��Δ_�﫵�����      5     x��Yko�H����
�b���.�������m'��ۃ�bUQbD�IY��ޢ��my:�b�$4U���S��s�e�)�Hx��Y@k��p�'4A�����㓋�U���a���a�����^����f��E���f��7��X�iH�MY[�^)�"�H�n�+�m�U��YQγ�W���f:b��wN�;;9�p����Ŕ"O$,�<$t�1���c��o�p��PvE5/�w��[[&��틺a|W
�W�Q�d���@���@,Ҟ�s+��FG�>}>9`t:��0S\s����n|\��v�ݦ��"�Q/[���-Ye��K1�)2¤�儮S�'x:�fX����sr��XS�u\������&G�;�8WeX$��8�����'�����'0QQ%���%"q��^�e|a�E��n���`κB�h� W�u<���By�"7+J߆
5��m@��ZqE���o(~�x�0�{#	]��׫7����/�ןgF�/�_'og|!_.���K�/��|'7�jR��Ӽ~�(�^3�d@�
2�RBlQ�8�}t��g��m�L�A�1�8��� y_T�����s1w�{�I@���<@f���Y�=�s�F'g'�>������"��`ۤ��>�	�������8���a��E߆`�hO^n��i�kۇ����D��_��s/4�˥E\)�,W)��ͥQ��gaJ�'�qX?sΘ�	�_m�- �a@��������� ���i�'!=��H)&��<bZa+<��H�Զ>TI_�e7�ɐaI7��as�V?^X�Uŀ��
<}��b\n�f_�߻�U}�ngDWqF�>|�G,z_֫Т�a��O���US�{�,�����.�������k�4 )���&�l1<:;�xy5�q��.�Eig�H��W�cQ�}���C�tn)AZ`���Y�e�Ym��F>�����M�Y��xLf��������� �6���P���BV,��.���3��m����*�"��]4X9��Lza��9&���5�7�T��f��-�G�G�p��޶��M�P�y@�Pј��2�D�D@6��,G��2�J*U��·��[�f��a�� �tɓ�]�F��k2���O�.���?��>^�~m�s&�ާ*�C��bt���,D�	}�j��+���v�(��ow?fl�KK���� x��,�gB D�{���ܙ���~����H0Y�����>��Jߟ�>Ā<���pNvT��h���Ԁm�4��*��sd�t�b�'#�ތ>^}8�<z[��䯧u�Ӣ-��l �6pR�����妪P?�L�v3��@STw���\�Ҥ��
É�
%\H�e�B)e�Z�礀��)���)�F�g����[u��<�����r�%�e���2)��Ђ)+��7C����Һy�~��1��L7������0�t�RS�$#�F�Q�1'�m��G�_n��e��Q�B�5K�7���Lx��W�&�w�+�Y�
�
��c[ �p���~|����U$���/p9�Q�~�}�|j!Q�pٵ��y0�i��W����mj_^��s��`J0�cAX���0�u��D<a�K �3���Nk��>����[�`�v�n8��������׊.��}~S6]?���O�$.�F>BЊ�h$i��\d)-��`Ǒ6�!`��%lF�}�+kp����&���D2�}w �Z�]���l�H�B��~�T�Q��Hy~������}��C&�@9���x����`��v]���%�^�ԃ���5`�lw:���C�dyp��q��N��b�h��n����ܸY���U�)��x餫��d8�o'��ĵ��G���%�����L��ό�9$x�,w�9/��[?�T������e. tL��� t�������,;��� ��,��j��0M���X~\�i���fٵkJ5���V��go$ǯ][7o@V���]���`G>pM���P�X�0�98	O|�H���P�1������������GJ�z�FIy��z!˸B�9`�H ~IA"%���~z��dur��fV�.�~<*b�����y�O�$����w��Ar���IM:�mD[�C�cw״�_���2���Ӵqg�0Y~�G{?��z;D�iI�$HMYF����u�ux»���YnBʱ��E��A�ILK��c9�ޭ�͵�lP9RJg�#�@�1�-4����{�n�5�_(w�����&�����7 �`{_���U�ہ7����������m5�0+�Y�@@��
�q@a�� 칓ng{H�mT���!i�4X!�U{d4��D��`��ដϬ/�����-�$�IW܄�]rV��X���'���잇��?ҫ_��������3�V�*j<*���0=�N��e���g�@��ge�<$d����ڶ"*y���!�-	�&��h��ei��GC �����G���R���F>�O˃x�q��4Kc�M�_R���I�2�k�4]��P<�� �M�L�\�wo��Q�	hJ�c��zP4�ϸ��XWE���V���~��{B��2
j&K����N�� ��?k�By ���vF8j6�C4��d��*C&�����I�e0q	k\�o�O��/�j��o.��_���W��5~��␪1�;��9\=-�mQ�^Rp9���W`c�
�W��jD	�2���rp<�qg],�W��ɧYQM���Ϫ�S[���F�aRHX.�ʎ��#�dv�E��b&(���@��]�s�U1X��;x)�8A0H P�ܞ$ 4SH�\!*=X`Os��G8�/m�t��!w�p�oɥ]tK0�/� p�]�Ջ/���K���ڟ�S���T��lC����� ������e;�E �B��xm�Ȍx��Y�3��!�*�]��-�uP�o�\>ou���Tf�a�d� E�ҜEE�@{������Ǥ�������?K;��!�N+1]�Շ�iG�U4V�������=�G!E^�F���έ���+H=	�Sfc&*�r-�����ijX��=�3r_P�2d-�vH��7/���J�q�X;c��Z�DI"sG1�Fa� �U��mK�%�:$|,���#ѻp��C�a!� ���   ���C����7������."x>-��	�Er��L��|l��������,,3�B!ñ �����C�$��{�ANTV�"���%��]��R�mQ� q�C����Zd�U!2�%1�}��<��f���m����u].�ge�2��cK�m��|��R�ԙ퀀�S��� ��K�#2��<S��S���	J������]�
nV.E��6���M[T]�߶la�K�$V�%�W
=�S"]��aZ���o'GS�5m�F���7����m��ǍL��K�!gc�yP�=�ʹ�m1$�~�C�-�A�c8X���9����L�6��\��r/��Q�6�����dU����ϔ ���� ����i��i�,���R����|W��(8R(x�Q��y����r�5��<!҈h5��Ǥ�&�]�M�l��p���+�m���������NP��y��i�>��P�Ze����|/"c!��b�7�H�~��n�үݴ�ʰY�z�-���v�����Kh���?��_eh���3	<�5��R���'�V��^,b��	�%�������mH���v�6��d��fb՛t=�-�0�|�t�nx;�i�8�"�ma�L/�UM��u�n��ؙC�mߗT;��s��ի��E}      3   ^  x��WMo�F=ӿ��K�&����xK�X��cDY�$���p5
$���o���-&4�q|#���W�^� ��̈́�t[�H�!ٌ�1���@��W�Nw%_u�׫ڗc���W_?���B�c���������?\�\'|k��Ư��*jt�e6�#J�}�����:+�C#A¦�����WO���}k��V.ǋ�D��r�k�l��9˝�N�(�(�������|T���%RN��Zi���3f�Q�̣��g-�0P�לʛ��U��_?������k��Ws�PX���w�p���Qo8j�k��N�u�X��sKV<Z�x06�R��|j��b���`;T��y�7sx>�r�ݾC7LH�Y�ЂNÂ>f���Vr̤��M�AH%�."d�|5�싛�T�M?��Q��`I�@�ʢ��r��0������~K�tJ�J�*K'j�:n�!Y���y�xΩd�1)i���a>���ad��[vGTvn-��hK�$�^�Ј^��Ҵ%�T A�g�7
B��9��5{9��1<�4�����(	KB+�Rz����$S�z��@����
F�jdln��hb��ޔK��N�֠i.�h������Q�u��,^��DI-�h�s9p�$!}�h��0�p<���X�ޭq��d�ek��bE+N�=�&&Am���!E��Tp��a2��П؛~>0��t��z����LB�]]���U[��,�ܧ�9�$%H�Ջؼ���;�N0=�a�?ci�
� �'��n-J�N��"8�/��eT��@���(j���JEh�.bwH�!���gT2D��l^s��b�,�if˒�i�֭;�Z��z�$s�Yn%&���<�Xs��Y��e��J�H)#�o�� �֭��Y���_!&�EX^�_�1S4 ����`J�J�M�=��c��OH�e�f�dS�Kك��z
=�&�u��)���ii��c�)8�T!�Ajn��!wq�v�ղ�PF�f��Q��C�U�GC!����V�h�u"�s��٫[dw�a�1AGYq�r�ks[�(�h�(
<��Ap�k�Hbr� "��0V�o2�P���=<���b���9O䚜��@�$������ZY(� ���ݗ�Xm��׶���-.Eh=R{�@L.�lQ�S�!K̆ƴ�%br��J���~Ӣ�7�~.�ա?����f��;��r�0�iL����%afD�T+�T:{������C��k��.����5�pnmd5XX�Y-]�PKcX�k5��P���w�ǁ�9-r�Cs4)����������<�(Y��xN���f��͋c�ٔƲ,��2�+v�ק]��-�ZӨ4ʬ걱F�<ɓ�G���(�ĄYk2b�o����}_��ԧe��=C��V�mi�Y��z�f�0��a|��ݕ��1��{�`��� �+A�,��CfkH^���
3um��T�;�(s떆������s�_O�+��o���}��DT�o9�_���?2���i�{��|�I~��&F<���@A?S��O�Mu��Jz�^�.ӈ�3 � ���5f����Ѯ�"e`e.��˸<��%�w´�������"2��J5���V��k�������}���� ���      !   �   x�mN��0;'���x��j�bm�����S:Mbh�(vl�fp��$#�gl�����YU+O3F��d���S��9��<�ru��"�M��ZS���C�x�gB���t-�����d������Xґ�-_�<lt&}��	Tzk�U�AH��9�n������n�         6  x����n�0���S�~��3�#ϲ��7�
8�ۼ����M��
������	}t}���X����@���'�HɊL��1Z�`��z����Fs9����i���G(9W�,�[Z�վ�]�e[���{jaH�բ���oh�0Z�y��m�193������p������)�Y�V]te$����Co���h����d��!陥��ߧ�<���ם�Eqf73ʬ	C[����Ώ�|�Y�c�J˹���ƴ<�,�sI ����K>P8�=��d��̸֡�2�z���>�6�{i�dsry9	�����������m�"&���.G�S��P�0�9�n�`;7��q7�Tr��4��w����TJ���ɕd�<z�Ah���7
�u�tz
c��ĦW��,r�4���&���% _F�����OE�K���¥�c�p���@�\|�:\F2�I'-(�v2�(��Q�E��_��R��D�R�{t`Q�A�t�btw�$'#��D1�����4i"˓�U�CH��S�?��q%Jc@�%'�C��y�!S�"f����b�(�
L���K��B�}š��`���ꩍ�����-���[S���dNg�:|���Bb����u��,[����5���9Z�N7�����XҐ�Og7ܐ�Y!���W2_Ti&|~�mPMj�c�74UU�J=f���֫X�'�|��цDH���ҧTFj��K|��}���߆��ߍa�d&�JP��3+SmC:������\�򕱊��{�4�ܾ$W�~�O��9&b@2��_����?v��      6      x�՛ɒ�ʒ��u����HI�P3SB !�����{=})ɽ�?�~�dN�X��d@��6��m8NS� �K�(���^|�__�a�'
PǘӢ�f��{Z��r�Qk��p�;�D�:���`��y3Y�t7�icD�����T�Ơ�2��˞����N�EVv$��׸:䖦ؙ�̀�B����Xs�����3y�&K]��LG$�G���'��ʆ�b6���X>��Κhw�Ow|ԉs�&iy�Ox;�^����p|�a��o X�`q���iHc��ك�-��逵}Z��K;AMde�]4���Ԫ\,��f�G�/�������C�-�MO��3R���xԭnj���GYLu=E����y�AR)�Y!��2PZ8��z�AF_�#ʦ&JmG8XU�[�$��/��*���6�2���Z��FG�%g�E���Auf�oD;��v*.*�v &��#��[�>N|�xu3�qW�]��J��_D`!���CR8�|#J|*۠��%!$�_�xWh������������8gƮx��4c��&�?�ED��rM� ��I@/�a�/9��&d$&�)vԫK�r�����c��/^ڍ�l�������|����"�K�>���Lv���`�5���7����Mv�m��E]=3A��CK�w*u��i�����4E��A
cd1�gD�7)��c2N�{	��S��^TdM8��'��{AT~�SE�2*/`�f?�����͎�/���B�����oRS$�דC-5{6N@����R�g�G��(��q��b��g��/Ŗ�g��;ܽ���zJ��r2���X�Z%E�w�1!j=��I�1o'2��<BQ���oR���;Ay�¥�O1i g��\���~=���lgW���Uv0�I��D�1����v�����@ߓ��JNy����Լ��㥻ũ���6�VL��U t�Ka����˰J��kq��PS������5�E�d��\�}Mj�J)���T�z���K$��"\��c�y��P(`�9�s:����_E"��D���D�d��j�:`z�=�hb���:��β'8���rɴ����ݡ���`l]U�=�θ�os�����6HOG+;�2Pרo��M��J�<�w9-�����$�p[�w�e��:�q���l.�ڻT�iG��?��e.T��ezJ�Y�qj_���[J�ѓ$Qt�
	��%�M��SiOY �(8�TZ�}o��Ѩ:��ǌ�;�#����U~_�I
}�b�H7�g�N2Q]q�� QU�ѓ���/�Ov2��AKHZ�\����W�9�*w���q��>�`�J��	Ƈ��3o��f��GJƻ)O3��^�4�o(w�����~���9(K��.4��:w�|X�;95�1\|�i��U/w�N������1�J.�=t3
�W�lDZ���)ڽ�*�K���}���魗�M����
f�ِ�Ƌ��X���qi�k�2�!�U�OQL2T�6������ѱS�����]3�;n;3���R��v�)p�d+��!@w�R���N>i'��ǁ��'�4*o�2����q��a����sFz�_�斾���N`���Υ��5M���~�=�ͼ[�\�Dơ��G5<�\�0�.��u��(�W(X�ؾ��>��`Tn�%�y�M@U�ʫ���D��8�g���$~n�/N$�B�`�Z�9Qҵx��p`�~��d�h�b8�UF����K�D��;*���z[�|Fw��I�Xr��8ϩ�����[P��;�Shq¤�l&���o� $Wm���s:�<k������>Gg*uy^[�6s��y������e��t���X�|��oC�#���
��x���f^���g�F��9�/g����(���:��:�(��;�PQi�7�E�c�Gp&(R��\ۮ��ZE�})�¸Ϣ������K��Ϟ)7k�l}r��^}L�r�o!��9�Qxn�Zw%�q^ֽRN�}��.2�Yչa��2�\�oLG��ő�x	Q^�sy������42�FYp9��;A���SN�ſ��A�}�;�2"��"
�����js:k#�-�(�ϕ�i)ٵ{��h�^k��Q�B�zߜ�4ēv6B��ګ���bq�b���Q�mT2���@Ѫ��|09E7���>Q#�#�C�3��\���?$K�Q5�mIGT"�'����\<RL��}i�BDP,�����Cu��L�D�M!(�j"�~��8K�w��h�v�0�@���=��ۈz{�֌�]�'T#���.�/�?��V��0�`�I)#�ti<2�� ��i�LDDKQ����պ��db�xs��6����7jeu_�n�ED�=�?81,X@��3�I�#�'lXSQ��aE�yp�L|pV�7{E30S����xe�)�*�IH2JyJyyƔ�Vk�A�Ø���	~�"�~B�\�|EǔC)��m���jl� �>���ܑ�F!�*����"��	m6��(i﷮���/�I�w�oNo����d�.�&��������0���Yj1�|���)�Č�f� ����W���������'��ém�G���0�8њ�Ƽ�e��:�P��X���<��ݔ�r�rrt>SveG��b��3����lmG��M��盡	; �/v#�ҿ1Qk����B?�q.�4��Q��ˌjP!/M��+�O��3��'��
�3�Qi Eٹ�j�,+"w�?���F��g��[>��"��S�+����du�Ihg6��Ut��=��a,���Z���۞-��SPO�[m坙�f�ʫ�{����� ���F��m��=tѯ�Y��jwvT&	�厷��K�@���
�*��n2��s���L'��%C@{g'�o�M�0���3���}���O�s�o�/)7�����XᓅQ�p/FZnG���[;��5~q"������Y��P,��n�ګ��1��f�]��L�c�����v�L|�n�	İ��a�G̱�4_�����Db_I ���r�i�����&,!s/�12۫��n>����Z�F(T�ϳ&�^XK��E �Jݞ��&�TLM���=�8�N����$��7�AU^��Cث���S�⪞��λ��Z�)��ѶDj���tO�	
�E��G�1,@��$p��� ���% $�2s�[���(����9�{��7G�l��k���l�U�p���g:�V��
�v��ʿ8A�B�kMN�ߜj:�;�l:���C��ȏ�!��&"�ύ;��X�s������=��ڔhd�~��r!����d���/
��R1hs�q�ܩ�4�[<�ҩ�j��t�?����#dH_0�)�����|B��(��4�җ������|�'��ӳ�#V�6*�*�	u���I��#�}/��O�d��˛�ܾ���(g�?���I��8kGQ��"����''|��	f޾ �AWs�D>�T����؆t0{���[��Y3�.�s������WK�4FY�[j���-^:a�+��#��3�w���s5��]�~��$�˹L|��>���IlA<� ;[_�.�oW��Ø���V�2�������0v�����]�G�[��Qz�!�h���#�*'<��{��}cr�K]�����(�}���� �
s*���_�����O��՜�3y��T�wܨ�*,�3Цڐl�:=���|Tspy�Do?�&� ������<�UN���/Kg.����$�1qZ�8�>�m9��5j	?��|-f�V%{~��v:(��)��2����T0�^Z�����`�l_�ot��� �_�ϩ���Fe�΀�7���󥞧�T5��J�:x�9_��n+�L~���,����C9Xe<��0����?8�,A�8�Ő�o�)s�c�aUVTn@dx=E\����񦱍�U���,�!�7�I�Q���}G���b����F���B8��7'�D��0~D��~H�x�y�O�X���.@�^_VU/&��'�O���4�����=ٱ==��Ӣ�ߜp�AO���� �  �aʊ���΢"��.�"�e�L�=��NY�Oψ���'��!���HG��3��M25�}�j7����=X���Δ&�pt|�ɅsM�U�a[<���:^�T�[6͋��Äy-=�I��c��7�~ fŊ�<�5��	�W��?e�g�m�6�c{7]z�_D����E�LL�&�O(.�d�y�&��V4�¶�n�@���܍�?jM�<��P\�e����Ť�HF-��P�!|���cT�}pʺې�ؕ�sl�f�꤈��{(�ȷ�}�܉{%��l_��� xw�@?�9�`l,�Q
�l��W"7��2��2�`N���8Yb{K��+/����.)�� Ժ�Xy�9=�{M��i�����]`k}u��(�`�cЄNцUP<}�T����3�L|�
�տ]J�\"��	3�w�=?���?��K������
H�9�X����"�eB��u6���cv�}.�{���Y���f�-��>J����~9�4���qp���WsaS�o=�����4�;����R�-a�:�A�!�-Y�Q�g�s�"vJJ�h����; /�����C�_C��d7/�dS��D[�@�m;�ƈ��)���F�S�_#��+�G�ǝɗ�L���%�z<��F��7�4WUҨҌ�t��ֻ�<N4�9�́���R9eC@w�i^D���:Q�$I�z���_�1>�w�|��7Ӹ�]Ԝ,� v_��eYr���:Q̽���Y�]̵�r���񌄍��Y��b��s
:Dň�<|�P����a�����/�1���j��l ~"�!�f�����(�ny��"��1e�݌g�N���N�Y��$؇8Jm�u�K��m����"�x�utĴv�����I}�8 ?�Ѧ\ʒt*��)r���XpoI(�Sc�kL���Uz3>���1��<=C�{�.����I��'�8��0��
e�wݧ1��1"�O�)���ȓ�m��<p1�+���7�� r��t�]��-�mU+�w�n�W�ț�/Dg	�k�k��Ъ�:gj3"��qj����(��L��H���S���7�_Er� ���g��)����MD;�l�$�xnڔe�����&�6����xz�/E8�&�nH9߳#���(8vj�s.�.R�8��6Ը��_�1ᤰ��hKߗ#��´��<�[=�M��}e��2҂�p�<�`��EI]߱T�I�=/LL)\h]�I��	���h��o%�9h�	�>*\��'�B���T�t>��Ō26�r�r��:/Aj�0�gƬ%Sת�����HbK��D�= ��U�?�,�t� o+��C&��zKAz���̌��)��Tt
���3\ճ��+7�����{�v�iV������4D?;?w��|�֒C���b���t�@����MDzu��A��d�w9{+��8��֮�g���|w14��ػ�%�;������L���:���(��(�l�~nzj��ˣ�$��&��z��rs�gJ�O����L�TꝌ���Zk��08C��e�D�!]�����]��v�\9Y���%�D�gĪ�<����e�C!�;I0e�(�s��X�����ԾO�4ʩ�sTm]±Ĉ���X9=�5[Tσ�oҝ�C/���NY������\nS��w��o��}��C��h��S��0�~9�͞M�(u��\>DM6�i��y�z��7���:	���Acl
�?\_�'9p�_��}���$��)�F[�Ρ�p�)�T#}��Gg���c�d��U��#�3�E�77�tgdG��'��3.�p���Ԉ�/J�s��0�ћ��s\�`��܇���.x���tXt���R�9l|<���:HFY��9�(��/tpǿ����`���;,|�<M� :����{u�r�5����p�r�釥hgb�;G�ё���T�ώ(�$�d\Jʾ]g�ztenWݦ��i��H��ԗwo�'��,�G�7w��ov���}����:E�3��WH�Ε�]z�c�T�#���ѣY�f�B �Y���)�Y������+��GUr�?7�`[
(��;)�T���ZME�* ��$�#�a�+Oc�ߘ�~��Bkޑ�c�ք�8L��Cw(+�d����Ǣ$��������Dk��)��S�9Y�,H��Q��"���	��M��r(�ъ����BH7��@�
ɀah���KoYr�ɿo	�;���0=�q�{�dn�q�}���~S��} zep�m�;M�o�]j���J�ߏE=Ce�]���[N]S��b�9�>37���'�U�����,K�B��E�d:/��Ҷw��nYƮ��q��*�V�~�L>���C���<T^�*��z�-�w���G�G��y�=���b�p%�[��p�\�4^����D�(�u-��7�J�y�з��,ŋ����ꪼy}�s��~8󶻷dS��򱶿��mK�	��_	��ob	 �tBn�l��ݑ�E����UP��<�5ü��o|��;o2z�=��1�v��#x�DyV�I�.��v�^�xﱣ5��G��B$����ts�m��S��=_��oL��A� ���z�n�8�ʹ�53�l�v�4��m�gW��/^����Į�;�飽f��l���R�{^���A���O.��'pg�U���s��e�;c��rJ$���\�K��]�3�}ZF_���A�[`����7&�{|La����V}�f\5y�2�I���%���=ړڟUs��j��c-PL�~� ߒ������^�����e<����0N7�c
�z޸���Y��~揽����e&�2�;��K����7�S��-3$&��=M�y������ w�2�q��gۿ���O��(9ԇ���,6�8-�f�������|�b���^���M�����i�<�c�-i$1���!A�����a��m+���_����~ؐ5      8      x�3�L�H�-�I�K��Efs��qqq �<	�      :      x������ � �      <      x������ � �      >      x������ � �      @      x������ � �     
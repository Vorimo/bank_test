toc.dat                                                                                             0000600 0004000 0002000 00000036762 14411056723 0014460 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       #    0                {            bank    14.5    14.5 :    ,           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         -           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         .           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         /           1262    26188    bank    DATABASE     a   CREATE DATABASE bank WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1252';
    DROP DATABASE bank;
                postgres    false         �            1259    26267    accounts    TABLE     �   CREATE TABLE public.accounts (
    id bigint NOT NULL,
    number character varying NOT NULL,
    bank_id bigint NOT NULL,
    currency_id bigint NOT NULL,
    amount bigint
);
    DROP TABLE public.accounts;
       public         heap    postgres    false         �            1259    26266    accounts_id_seq    SEQUENCE     x   CREATE SEQUENCE public.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.accounts_id_seq;
       public          postgres    false    219         0           0    0    accounts_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;
          public          postgres    false    218         �            1259    26252    banks    TABLE     �   CREATE TABLE public.banks (
    id bigint NOT NULL,
    name character varying NOT NULL,
    ind_commission real NOT NULL,
    org_commission real NOT NULL
);
    DROP TABLE public.banks;
       public         heap    postgres    false         �            1259    26192    clients_accounts    TABLE     �   CREATE TABLE public.clients_accounts (
    id bigint NOT NULL,
    client_id bigint NOT NULL,
    account_id bigint NOT NULL
);
 $   DROP TABLE public.clients_accounts;
       public         heap    postgres    false         �            1259    26222    banks_clients_id_seq    SEQUENCE     }   CREATE SEQUENCE public.banks_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.banks_clients_id_seq;
       public          postgres    false    209         1           0    0    banks_clients_id_seq    SEQUENCE OWNED BY     P   ALTER SEQUENCE public.banks_clients_id_seq OWNED BY public.clients_accounts.id;
          public          postgres    false    215         �            1259    26251    banks_id_seq    SEQUENCE     u   CREATE SEQUENCE public.banks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.banks_id_seq;
       public          postgres    false    217         2           0    0    banks_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.banks_id_seq OWNED BY public.banks.id;
          public          postgres    false    216         �            1259    26195    clients    TABLE     ~   CREATE TABLE public.clients (
    id bigint NOT NULL,
    name character varying NOT NULL,
    individual boolean NOT NULL
);
    DROP TABLE public.clients;
       public         heap    postgres    false         �            1259    26204    clients_id_seq    SEQUENCE     w   CREATE SEQUENCE public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.clients_id_seq;
       public          postgres    false    210         3           0    0    clients_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;
          public          postgres    false    213         �            1259    26201 
   currencies    TABLE     `   CREATE TABLE public.currencies (
    id bigint NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.currencies;
       public         heap    postgres    false         �            1259    26213    currencies_id_seq    SEQUENCE     z   CREATE SEQUENCE public.currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.currencies_id_seq;
       public          postgres    false    212         4           0    0    currencies_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.currencies_id_seq OWNED BY public.currencies.id;
          public          postgres    false    214         �            1259    26198    translations    TABLE     �   CREATE TABLE public.translations (
    id bigint NOT NULL,
    account_from bigint NOT NULL,
    account_to bigint NOT NULL,
    amount bigint NOT NULL,
    date timestamp with time zone NOT NULL
);
     DROP TABLE public.translations;
       public         heap    postgres    false         �            1259    26278    translations_id_seq    SEQUENCE     |   CREATE SEQUENCE public.translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.translations_id_seq;
       public          postgres    false    211         5           0    0    translations_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.translations_id_seq OWNED BY public.translations.id;
          public          postgres    false    220         z           2604    26270    accounts id    DEFAULT     j   ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);
 :   ALTER TABLE public.accounts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219         y           2604    26255    banks id    DEFAULT     d   ALTER TABLE ONLY public.banks ALTER COLUMN id SET DEFAULT nextval('public.banks_id_seq'::regclass);
 7   ALTER TABLE public.banks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217         v           2604    26205 
   clients id    DEFAULT     h   ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);
 9   ALTER TABLE public.clients ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    210         u           2604    26223    clients_accounts id    DEFAULT     w   ALTER TABLE ONLY public.clients_accounts ALTER COLUMN id SET DEFAULT nextval('public.banks_clients_id_seq'::regclass);
 B   ALTER TABLE public.clients_accounts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    209         x           2604    26214    currencies id    DEFAULT     n   ALTER TABLE ONLY public.currencies ALTER COLUMN id SET DEFAULT nextval('public.currencies_id_seq'::regclass);
 <   ALTER TABLE public.currencies ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    212         w           2604    26279    translations id    DEFAULT     r   ALTER TABLE ONLY public.translations ALTER COLUMN id SET DEFAULT nextval('public.translations_id_seq'::regclass);
 >   ALTER TABLE public.translations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    211         (          0    26267    accounts 
   TABLE DATA           L   COPY public.accounts (id, number, bank_id, currency_id, amount) FROM stdin;
    public          postgres    false    219       3368.dat &          0    26252    banks 
   TABLE DATA           I   COPY public.banks (id, name, ind_commission, org_commission) FROM stdin;
    public          postgres    false    217       3366.dat           0    26195    clients 
   TABLE DATA           7   COPY public.clients (id, name, individual) FROM stdin;
    public          postgres    false    210       3359.dat           0    26192    clients_accounts 
   TABLE DATA           E   COPY public.clients_accounts (id, client_id, account_id) FROM stdin;
    public          postgres    false    209       3358.dat !          0    26201 
   currencies 
   TABLE DATA           .   COPY public.currencies (id, name) FROM stdin;
    public          postgres    false    212       3361.dat            0    26198    translations 
   TABLE DATA           R   COPY public.translations (id, account_from, account_to, amount, date) FROM stdin;
    public          postgres    false    211       3360.dat 6           0    0    accounts_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.accounts_id_seq', 141, true);
          public          postgres    false    218         7           0    0    banks_clients_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.banks_clients_id_seq', 141, true);
          public          postgres    false    215         8           0    0    banks_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.banks_id_seq', 187, true);
          public          postgres    false    216         9           0    0    clients_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.clients_id_seq', 151, true);
          public          postgres    false    213         :           0    0    currencies_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.currencies_id_seq', 3, true);
          public          postgres    false    214         ;           0    0    translations_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.translations_id_seq', 76, true);
          public          postgres    false    220         �           2606    26272    accounts accounts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public            postgres    false    219         |           2606    26228 $   clients_accounts banks_accounts_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.clients_accounts
    ADD CONSTRAINT banks_accounts_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.clients_accounts DROP CONSTRAINT banks_accounts_pkey;
       public            postgres    false    209         �           2606    26257    banks banks_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.banks DROP CONSTRAINT banks_pkey;
       public            postgres    false    217         �           2606    26212    clients clients_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            postgres    false    210         �           2606    26221    currencies currencies_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.currencies DROP CONSTRAINT currencies_pkey;
       public            postgres    false    212         �           2606    26284    translations translations_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.translations
    ADD CONSTRAINT translations_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.translations DROP CONSTRAINT translations_pkey;
       public            postgres    false    211         }           1259    26309    fki_accounts_fk    INDEX     Q   CREATE INDEX fki_accounts_fk ON public.clients_accounts USING btree (client_id);
 #   DROP INDEX public.fki_accounts_fk;
       public            postgres    false    209         �           1259    26290    fki_accounts_fk_1    INDEX     R   CREATE INDEX fki_accounts_fk_1 ON public.translations USING btree (account_from);
 %   DROP INDEX public.fki_accounts_fk_1;
       public            postgres    false    211         ~           1259    26263    fki_banks_fk    INDEX     O   CREATE INDEX fki_banks_fk ON public.clients_accounts USING btree (account_id);
     DROP INDEX public.fki_banks_fk;
       public            postgres    false    209                    1259    26234    fki_clients_fk    INDEX     P   CREATE INDEX fki_clients_fk ON public.clients_accounts USING btree (client_id);
 "   DROP INDEX public.fki_clients_fk;
       public            postgres    false    209         �           1259    26303    fki_currencies_fk    INDEX     M   CREATE INDEX fki_currencies_fk ON public.accounts USING btree (currency_id);
 %   DROP INDEX public.fki_currencies_fk;
       public            postgres    false    219         �           1259    26297    fki_t    INDEX     D   CREATE INDEX fki_t ON public.translations USING btree (account_to);
    DROP INDEX public.fki_t;
       public            postgres    false    211         �           2606    26352    clients_accounts account_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients_accounts
    ADD CONSTRAINT account_fk FOREIGN KEY (account_id) REFERENCES public.accounts(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.clients_accounts DROP CONSTRAINT account_fk;
       public          postgres    false    3211    219    209         �           2606    26375    translations accounts_fk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.translations
    ADD CONSTRAINT accounts_fk_1 FOREIGN KEY (account_from) REFERENCES public.accounts(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.translations DROP CONSTRAINT accounts_fk_1;
       public          postgres    false    3211    211    219         �           2606    26380    translations accounts_fk_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.translations
    ADD CONSTRAINT accounts_fk_2 FOREIGN KEY (account_to) REFERENCES public.accounts(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.translations DROP CONSTRAINT accounts_fk_2;
       public          postgres    false    3211    211    219         �           2606    26365    accounts banks_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT banks_fk FOREIGN KEY (bank_id) REFERENCES public.banks(id) ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.accounts DROP CONSTRAINT banks_fk;
       public          postgres    false    3209    219    217         �           2606    26357    clients_accounts client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients_accounts
    ADD CONSTRAINT client_fk FOREIGN KEY (client_id) REFERENCES public.clients(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.clients_accounts DROP CONSTRAINT client_fk;
       public          postgres    false    3201    210    209         �           2606    26370    accounts currencies_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT currencies_fk FOREIGN KEY (currency_id) REFERENCES public.currencies(id) ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT currencies_fk;
       public          postgres    false    212    219    3207                      3368.dat                                                                                            0000600 0004000 0002000 00000013724 14411056723 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        9	f6203fb2-ed2c-4a46-b7e6-c7a35562f8d3	24	1	2895
12	83f47ce1-01de-4e8a-aaf0-589576b60200	27	1	3000
13	d97c8387-8790-4264-a927-957b6d915aff	28	1	3000
14	dbc18a21-173d-497a-9ffc-91994a4969b3	29	1	3000
15	4f023482-c4f3-4663-b35c-811d88fcf45a	30	1	3000
16	04b785fa-1166-4c34-9384-9d2a9125c177	31	1	3000
17	46b06203-39c7-4f20-a3ea-0ace18e867cc	32	1	2905
18	5232da19-2129-45b1-988e-e201217fccad	33	1	3095
19	ff87c29e-4702-444a-b2c2-3717d7f42f42	34	1	2900
20	e836a02f-c5b8-49df-a34f-75ff442916bb	35	1	3095
21	1612f0e2-33b1-4093-8edf-f9051b135604	36	1	2895
22	ed40f0d9-d027-45af-ab95-ee953afec2a8	37	1	3100
23	90cd7939-1a80-48e4-9fe0-001edb6c12f2	38	1	2895
24	928a4a6d-0107-40ed-9c8f-e08e8d53a12c	39	1	3100
25	7c0e9d1a-24a0-47d2-bbd3-e69a42c82c76	40	1	2895
26	faf0a286-9666-4217-bf79-0733485cb6b3	41	1	3100
27	e5c7b448-23b3-4528-bbed-670a119b4068	43	1	3000
28	3d68dccf-d172-4165-b815-b8161996ff2f	44	1	2895
29	13ca6453-a9d1-4190-bc25-59d9e91f6c6a	45	1	3100
30	513f7f41-1176-4824-84f1-5f454032fb13	47	1	3000
31	4b85b2ae-6ca3-4e5e-9fbd-d55a0741b100	49	1	3000
32	75d7e3df-f238-4058-b883-f2fec62e83c0	51	1	3000
33	c50d61af-7fe3-4822-afa9-bf96e25b7fc0	52	1	2895
34	d4639f14-352c-4512-97ca-3dbbdbd5e743	53	1	3100
35	004e481a-8264-448d-aa94-84e7c70a668a	54	1	3000
36	1012a436-b8e0-4fb0-9f42-ac183df75d6c	55	1	3000
51	7ec44afa-f310-4c2c-97ac-1d0fd472db83	70	1	2685
52	408918a1-9b3a-4b9f-af62-a9892469b1b4	71	1	3300
37	40989085-9013-4abb-a5a0-039b9d710393	56	1	2685
38	58136fa0-4731-47b7-b9fa-f893f165892a	57	1	3300
53	ba1ad920-ae82-46e4-87b3-9f1b19db248d	73	1	3000
43	417bcda1-48bf-44aa-a654-e62302b6bc33	62	1	2685
44	7a38adb8-c217-444e-9142-66f5930e8f0a	63	1	3300
39	7616bf0b-4042-49a8-89c0-f02c5b990db1	58	1	2685
40	f590d5b0-f805-42bc-803c-81462aeee9ac	59	1	3300
54	317c07f9-b462-4fc9-b4b6-ab976d346d1b	74	1	2895
41	09feddd4-fbf2-4177-9968-8ffe01af7429	60	1	2685
55	963b1135-4de6-4cb3-b8e5-1cd79fe67aaf	75	1	3100
45	e2c38b1a-72b5-4483-946b-00288d429152	64	1	2685
46	0704390e-15b1-4dd0-8cd9-1b97caf280c3	65	1	3300
78	dd40a6ed-bb98-478e-81b4-ff0ec74644b1	104	1	3000
79	6da70811-0982-468c-b0a2-58c6e63b23bb	105	1	3000
47	53a70426-2d9f-4ab7-a623-597f25c1a561	66	1	2685
48	27b796dc-2a9b-459b-8eae-319ddea4fad6	67	1	3300
56	887da5d2-d13c-49d2-8627-1c2b03345eb3	76	1	2685
57	0a3bf448-308d-451f-8699-fb5b31fe188f	77	1	3300
58	94c7b31c-c247-4cab-a661-1008b91f8cc7	78	1	3000
59	b3d14f43-1ad6-48d0-81bf-622252a93a7d	79	1	3000
49	8e763fc9-da70-48ff-a02e-223ef723dc05	68	1	2685
50	b53333b8-bdc3-434a-baed-86e1957ca892	69	1	3300
67	94b88435-9592-4851-9fcd-6792418283fa	91	1	2685
68	5e697600-8189-4014-be24-5cefb5361992	92	1	3300
62	a2e86397-4502-45f8-afd0-7181d6617657	84	1	3000
63	f68085cf-9479-4bbb-b1de-8267e2ca9ccb	85	1	3000
64	1f018ffe-cabc-454a-a7eb-e91bd9b558b7	88	1	3000
65	b707adf3-5164-4d90-9da1-7d2ba78ac971	89	1	2895
66	b67abd40-9030-4d7c-a357-13d21c5bdf20	90	1	3100
70	bb7e4ec6-1fbe-4eff-b037-3edd55114409	94	1	3000
71	f61faf5c-67de-4a8a-b7b9-769bb07c8e89	95	1	3000
72	1314b357-eb4c-4d6f-8f61-4067f4cc6c97	98	1	3000
73	8052714b-8481-4780-b25e-192937c09b47	99	1	2895
74	e77d4baa-ba78-42eb-9278-ccc0c8ae970d	100	1	3100
80	faf3a912-7cb9-4468-ba65-a98c42745f26	108	1	3000
75	44959c83-ea84-4ed2-96ea-15ccafd0075f	101	1	2685
76	149df94a-3aea-487c-8b7f-b515d6e627b9	102	1	3300
81	c2a55cba-eba1-4411-a46f-d44709de0fcb	109	1	2895
82	5b3fa864-1751-4abf-aa0b-8ed34c3f849e	110	1	3100
83	1d4af7ff-7755-46be-a256-c9a2b5d0fd71	111	1	2685
84	8c8c3a5d-05d3-4870-be15-7df1f0ac29f7	112	1	3300
86	a1c3458b-ca85-4203-97bc-c830d25ce8b4	114	1	3000
87	45f2428a-31d9-4c03-8655-1586161f4c22	115	1	3000
88	7482e5f2-0576-4aea-86f7-3f151567bde6	118	1	3000
89	51c13c66-16bf-4dc5-97c1-32defda96d19	119	1	2895
90	da846806-4962-4b37-b260-b9dccca643e6	120	1	3100
92	bf258503-cd4f-4998-980c-88ba7c230a24	122	1	3300
11	c6301ed4-68f0-4b95-8fae-e6a177edcb35	26	1	3100
130	9caac7d7-7761-4eb6-8789-f2bf0c998e11	173	1	3100
91	5d5a3f7a-3c92-4114-94b1-99c2a5ec695c	121	1	2685
94	a9f18871-c648-4e0e-862f-d069c61b1e10	124	1	3000
95	6995905b-6227-430b-b926-d99609cab77d	125	1	3000
96	2fe95c1e-ac09-4de8-ad75-fedb62d6b501	128	1	3000
97	1a70ba8f-7685-4f27-ab12-9be1df1d90fa	129	1	2895
98	563f4ff7-1560-4b4d-b4f6-32e98e1d5761	130	1	3100
99	cd4a4a78-ef96-4baf-a5e0-aa27e0b94bab	131	1	2685
100	680e6930-5fb2-4c25-a441-9ea808f510d5	132	1	3300
102	c95dd2e4-8c5c-4545-8711-6a40a00e82ea	134	1	3000
103	292dbeb0-6ba5-4d6b-94ca-16ce8642e5b4	135	1	3000
104	adac67b9-befc-48fd-9624-cbc7a879be08	138	1	3000
105	876118e0-cda0-4dbe-9f43-bd1a3aa1a388	139	1	2895
106	4398b96e-caf1-4084-baeb-f50645ba9c0b	140	1	3100
131	2604a94e-19c9-4419-b061-6ab24471baae	174	1	2685
132	15f2253f-c36f-4b57-a369-97d9332b37fd	175	1	3300
107	e2b406e5-bf60-46eb-b225-cf0016393f1f	141	1	2685
108	49362d58-2533-4546-8f15-022c6a842948	142	1	3300
110	f92d232c-2b33-4d5c-980b-062dc9468d78	145	1	3000
111	ac7c5233-8788-4602-b6de-47ecc82bac17	146	1	3000
112	a708dd13-4b17-4507-8bef-4b755088702b	149	1	3000
113	18a3e170-9c15-447a-9fcb-7808ca36e944	150	1	2895
114	12d68efe-3921-4253-83a4-39a0719a2e7f	151	1	3100
133	9da9da21-d43c-4418-aac4-6d39ae3b47ff	178	1	3000
134	efcb8d82-529f-45b1-a554-3a8cc41c2b54	179	1	2895
115	30d9c659-53de-45c3-8c5f-2efc8171cfd2	152	1	2685
116	6b1e3761-df2b-49eb-9e13-e88cfc9cb764	153	1	3300
118	3caa15b5-6ca1-4bf0-82f0-3c49309243dc	157	1	3000
119	8bd4bf30-2238-455a-8984-ed3f584f1014	158	1	3000
120	c9e4ab4c-87c3-4db7-b372-a21e1c062f65	161	1	3000
121	905210b4-91b0-420f-90b9-cae21d5d8de2	162	1	2895
122	c9d80779-e09a-423c-a1d6-25c502dab5ce	163	1	3100
135	c9cab3b2-7c5d-4148-a3a3-a07c252eeb5f	180	1	3100
123	235c93cf-2682-4e94-a019-2a03f456237e	164	1	2685
124	7f144688-c86e-437a-b6a5-96dd4a1a0e8c	165	1	3300
126	3736caeb-4b53-43d7-8a73-26f7e489e2dd	167	1	3000
127	11749857-2f07-4436-8d6d-4265e370358c	168	1	3000
128	6d1ab9e2-6619-4515-b4ee-3ad9a52df3ab	171	1	3000
129	14488b79-eb96-48bb-bb27-3557f2db04d5	172	1	2895
136	c3023c3d-df93-4b97-8d23-4592fbc658c8	181	1	2685
137	91f2f987-2490-43cf-b3c8-ec7ae8ceca82	182	1	3300
139	ae82ddd6-12c1-41a0-8955-4e610ac3f17c	184	1	3000
140	3371fbd5-4948-453e-a189-07018fd3ba75	185	1	3000
141	cee5f86d-aca0-4638-8ff8-75d082cc8344	24	1	3000
\.


                                            3366.dat                                                                                            0000600 0004000 0002000 00000004102 14411056723 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        24	Prior	5	10
26	Prior	5	10
27	Alpha	1	2
28	Prior	5	10
29	Alpha	1	2
30	Prior	5	10
31	Alpha	1	2
32	Prior	5	10
33	Alpha	1	2
34	Prior	5	10
35	Alpha	1	2
36	Prior	5	10
37	Alpha	1	2
38	Prior	5	10
39	Alpha	1	2
40	Prior	5	10
41	Alpha	1	2
42	Prior	5	10
43	Prior	5	10
44	Prior	5	10
45	Alpha	1	2
46	Prior	5	10
47	Prior	5	10
48	Prior	5	10
49	Prior	5	10
50	Prior	5	10
51	Prior	5	10
52	Prior	5	10
53	Alpha	1	2
54	Prior	5	10
55	Alpha	5	10
56	Prior	5	10
57	Alpha	1	2
58	Prior	5	10
59	Alpha	1	2
60	Prior	5	10
61	Alpha	1	2
62	Prior	5	10
63	Alpha	1	2
64	Prior	5	10
65	Alpha	1	2
66	Prior	5	10
67	Alpha	1	2
68	Prior	5	10
69	Alpha	1	2
70	Prior	5	10
71	Alpha	1	2
72	Prior	5	10
73	Prior	5	10
74	Prior	5	10
75	Alpha	1	2
76	Prior	5	10
77	Alpha	1	2
78	Prior	5	10
79	Alpha	5	10
80	Prior	5	10
83	Prior	5	10
84	Prior	5	10
85	Alpha	5	10
86	Prior	5	10
88	Prior	5	10
89	Prior	5	10
90	Alpha	1	2
91	Prior	5	10
92	Alpha	1	2
93	Prior	5	10
94	Prior	5	10
95	Alpha	5	10
96	Prior	5	10
98	Prior	5	10
99	Prior	5	10
100	Alpha	1	2
101	Prior	5	10
102	Alpha	1	2
103	Prior	5	10
104	Prior	5	10
105	Alpha	5	10
106	Prior	5	10
108	Prior	5	10
109	Prior	5	10
110	Alpha	1	2
111	Prior	5	10
112	Alpha	1	2
113	Prior	5	10
114	Prior	5	10
115	Alpha	5	10
116	Prior	5	10
118	Prior	5	10
119	Prior	5	10
120	Alpha	1	2
121	Prior	5	10
122	Alpha	1	2
123	Prior	5	10
124	Prior	5	10
125	Alpha	5	10
126	Prior	5	10
128	Prior	5	10
129	Prior	5	10
130	Alpha	1	2
131	Prior	5	10
132	Alpha	1	2
133	Prior	5	10
134	Prior	5	10
135	Alpha	5	10
136	Prior	5	10
138	Prior	5	10
139	Prior	5	10
140	Alpha	1	2
141	Prior	5	10
142	Alpha	1	2
144	Prior	5	10
145	Prior	5	10
146	Alpha	5	10
147	Prior	5	10
149	Prior	5	10
150	Prior	5	10
151	Alpha	1	2
152	Prior	5	10
153	Alpha	1	2
156	Prior	5	10
157	Prior	5	10
158	Alpha	5	10
159	Prior	5	10
161	Prior	5	10
162	Prior	5	10
163	Alpha	1	2
164	Prior	5	10
165	Alpha	1	2
166	Prior	5	10
167	Prior	5	10
168	Alpha	5	10
169	Prior	5	10
171	Prior	5	10
172	Prior	5	10
173	Alpha	1	2
174	Prior	5	10
175	Alpha	1	2
176	Prior	5	10
178	Prior	5	10
179	Prior	5	10
180	Alpha	1	2
181	Prior	5	10
182	Alpha	1	2
183	Prior	5	10
184	Prior	5	10
185	Alpha	5	10
186	priora	1	2
187	priora	1	2
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                              3359.dat                                                                                            0000600 0004000 0002000 00000002612 14411056723 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        7	ilya	t
8	denis	t
9	ilya	t
10	denis	t
11	ilya	t
12	denis	t
13	ilya	t
14	denis	t
15	ilya	t
16	denis	t
17	ilya	t
18	denis	t
19	ilya	t
20	denis	t
21	ilya	t
22	denis	t
23	ilya	t
24	denis	t
25	ilya	t
26	ilya	t
27	denis	t
28	ilya	t
29	ilya	t
30	ilya	t
31	ilya	t
32	denis	t
33	ilya	t
34	ilya	t
35	denis	t
36	ilya	t
37	denis	t
38	ilya	t
39	denis	t
40	ilya	t
41	denis	t
42	ilya	t
43	denis	t
44	ilya	t
45	denis	t
46	ilya	t
47	denis	t
48	ilya	t
49	denis	t
50	ilya	t
51	ilya	t
52	denis	t
53	ilya	t
54	denis	t
55	ilya	t
56	ilya	f
57	ilya	f
59	ilya	f
60	ilya	t
61	ilya	t
62	ilya	t
63	ilya	t
65	ilya	f
66	ilya	t
67	denis	t
68	ilya	t
69	denis	t
70	ilya	t
71	ilya	t
72	ilya	t
74	ilya	f
75	ilya	t
76	denis	t
77	ilya	t
78	denis	t
79	ilya	t
80	ilya	t
81	ilya	t
83	ilya	f
84	ilya	t
85	denis	t
86	ilya	t
87	denis	t
88	ilya	t
89	ilya	t
90	ilya	t
92	ilya	f
93	ilya	t
94	denis	t
95	ilya	t
96	denis	t
97	ilya	t
98	ilya	t
99	ilya	t
101	ilya	f
102	ilya	t
103	denis	t
104	ilya	t
105	denis	t
106	ilya	t
107	ilya	t
108	ilya	t
110	ilya	f
111	ilya	t
112	denis	t
113	ilya	t
114	denis	t
115	ilya	t
116	ilya	t
117	ilya	t
119	ilya	f
120	ilya	t
121	denis	t
122	ilya	t
123	denis	t
124	ilya	t
125	ilya	t
126	ilya	t
128	ilya	f
129	ilya	t
130	denis	t
131	ilya	t
132	denis	t
133	ilya	t
134	ilya	t
135	ilya	t
137	ilya	f
138	ilya	t
139	denis	t
140	ilya	t
141	denis	t
142	ilya	t
143	ilya	t
144	denis	t
145	ilya	t
146	denis	t
147	ilya	t
148	ilya	t
150	ilya	f
\.


                                                                                                                      3358.dat                                                                                            0000600 0004000 0002000 00000002253 14411056723 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        9	7	9
11	9	11
12	10	12
13	11	13
14	12	14
15	13	15
16	14	16
17	15	17
18	16	18
19	17	19
20	18	20
21	19	21
22	20	22
23	21	23
24	22	24
25	23	25
26	24	26
27	25	27
28	26	28
29	27	29
30	28	30
31	29	31
32	30	32
33	31	33
34	32	34
35	33	35
36	33	36
37	34	37
38	35	38
39	36	39
40	37	40
41	38	41
43	40	43
44	41	44
45	42	45
46	43	46
47	44	47
48	45	48
49	46	49
50	47	50
51	48	51
52	49	52
53	50	53
54	51	54
55	52	55
56	53	56
57	54	57
58	55	58
59	55	59
62	62	62
63	62	63
64	63	64
65	66	65
66	67	66
67	68	67
68	69	68
70	71	70
71	71	71
72	72	72
73	75	73
74	76	74
75	77	75
76	78	76
78	80	78
79	80	79
80	81	80
81	84	81
82	85	82
83	86	83
84	87	84
86	89	86
87	89	87
88	90	88
89	93	89
90	94	90
91	95	91
92	96	92
94	98	94
95	98	95
96	99	96
97	102	97
98	103	98
99	104	99
100	105	100
102	107	102
103	107	103
104	108	104
105	111	105
106	112	106
107	113	107
108	114	108
110	116	110
111	116	111
112	117	112
113	120	113
114	121	114
115	122	115
116	123	116
118	125	118
119	125	119
120	126	120
121	129	121
122	130	122
123	131	123
124	132	124
126	134	126
127	134	127
128	135	128
129	138	129
130	139	130
131	140	131
132	141	132
133	142	133
134	143	134
135	144	135
136	145	136
137	146	137
139	148	139
140	148	140
141	125	141
\.


                                                                                                                                                                                                                                                                                                                                                     3361.dat                                                                                            0000600 0004000 0002000 00000000027 14411056723 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	USD
2	BYN
3	EUR
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         3360.dat                                                                                            0000600 0004000 0002000 00000005377 14411056723 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	17	18	100	2023-03-29 15:32:10.470413+03
2	19	20	100	2023-03-29 15:33:28.561252+03
3	21	22	100	2023-03-29 15:33:58.336178+03
4	23	24	100	2023-03-29 15:34:21.431551+03
5	25	26	100	2023-03-29 15:34:45.878826+03
6	28	29	100	2023-03-29 15:36:44.063177+03
7	33	34	100	2023-03-29 15:43:42.401229+03
8	37	38	100	2023-03-29 16:14:11.129899+03
9	37	38	100	2023-03-29 16:14:11.140808+03
10	37	38	100	2023-03-29 16:14:11.14991+03
11	39	40	100	2023-03-29 16:14:29.746057+03
12	39	40	100	2023-03-29 16:14:29.75321+03
13	39	40	100	2023-03-29 16:14:29.760922+03
17	43	44	100	2023-03-29 16:18:20.675935+03
18	43	44	100	2023-03-29 16:18:20.68567+03
19	43	44	100	2023-03-29 16:18:20.692846+03
20	45	46	100	2023-03-29 16:19:41.827077+03
21	45	46	100	2023-03-29 16:19:41.834794+03
22	45	46	100	2023-03-29 16:19:41.840816+03
23	47	48	100	2023-03-29 16:19:59.924431+03
24	47	48	100	2023-03-29 16:19:59.931401+03
25	47	48	100	2023-03-29 16:19:59.9378+03
26	49	50	100	2023-03-29 00:00:00+03
27	49	50	100	2023-03-29 00:00:00+03
28	49	50	100	2023-03-29 00:00:00+03
29	51	52	100	2023-03-29 00:00:00+03
30	51	52	100	2023-03-29 00:00:00+03
31	51	52	100	2023-03-29 00:00:00+03
32	54	55	100	2023-03-29 00:00:00+03
33	56	57	100	2023-03-29 00:00:00+03
34	56	57	100	2023-03-29 00:00:00+03
35	56	57	100	2023-03-29 00:00:00+03
36	65	66	100	2023-03-29 00:00:00+03
37	67	68	100	2023-03-29 00:00:00+03
38	67	68	100	2023-03-29 00:00:00+03
39	67	68	100	2023-03-29 00:00:00+03
40	73	74	100	2023-03-29 00:00:00+03
41	75	76	100	2023-03-29 00:00:00+03
42	75	76	100	2023-03-29 00:00:00+03
43	75	76	100	2023-03-29 00:00:00+03
44	81	82	100	2023-03-29 00:00:00+03
45	83	84	100	2023-03-29 00:00:00+03
46	83	84	100	2023-03-29 00:00:00+03
47	83	84	100	2023-03-29 00:00:00+03
48	89	90	100	2023-03-29 00:00:00+03
49	91	92	100	2023-03-29 00:00:00+03
50	91	92	100	2023-03-29 00:00:00+03
51	91	92	100	2023-03-29 00:00:00+03
52	97	98	100	2023-03-29 00:00:00+03
53	99	100	100	2023-03-29 00:00:00+03
54	99	100	100	2023-03-29 00:00:00+03
55	99	100	100	2023-03-29 00:00:00+03
56	105	106	100	2023-03-29 00:00:00+03
57	107	108	100	2023-03-29 00:00:00+03
58	107	108	100	2023-03-29 00:00:00+03
59	107	108	100	2023-03-29 00:00:00+03
60	113	114	100	2023-03-29 00:00:00+03
61	115	116	100	2023-03-29 00:00:00+03
62	115	116	100	2023-03-29 00:00:00+03
63	115	116	100	2023-03-29 00:00:00+03
64	121	122	100	2023-03-29 00:00:00+03
65	123	124	100	2023-03-29 00:00:00+03
66	123	124	100	2023-03-29 00:00:00+03
67	123	124	100	2023-03-29 00:00:00+03
68	129	130	100	2023-03-29 00:00:00+03
69	131	132	100	2023-03-29 00:00:00+03
70	131	132	100	2023-03-29 00:00:00+03
71	131	132	100	2023-03-29 00:00:00+03
72	134	135	100	2023-03-29 00:00:00+03
73	136	137	100	2023-03-29 00:00:00+03
74	136	137	100	2023-03-29 00:00:00+03
75	136	137	100	2023-03-29 00:00:00+03
76	9	11	100	2023-03-29 00:00:00+03
\.


                                                                                                                                                                                                                                                                 restore.sql                                                                                         0000600 0004000 0002000 00000030175 14411056723 0015375 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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

DROP DATABASE bank;
--
-- Name: bank; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bank WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1252';


ALTER DATABASE bank OWNER TO postgres;

\connect bank

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
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id bigint NOT NULL,
    number character varying NOT NULL,
    bank_id bigint NOT NULL,
    currency_id bigint NOT NULL,
    amount bigint
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO postgres;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: banks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banks (
    id bigint NOT NULL,
    name character varying NOT NULL,
    ind_commission real NOT NULL,
    org_commission real NOT NULL
);


ALTER TABLE public.banks OWNER TO postgres;

--
-- Name: clients_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients_accounts (
    id bigint NOT NULL,
    client_id bigint NOT NULL,
    account_id bigint NOT NULL
);


ALTER TABLE public.clients_accounts OWNER TO postgres;

--
-- Name: banks_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banks_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banks_clients_id_seq OWNER TO postgres;

--
-- Name: banks_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banks_clients_id_seq OWNED BY public.clients_accounts.id;


--
-- Name: banks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banks_id_seq OWNER TO postgres;

--
-- Name: banks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banks_id_seq OWNED BY public.banks.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id bigint NOT NULL,
    name character varying NOT NULL,
    individual boolean NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: currencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currencies (
    id bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.currencies OWNER TO postgres;

--
-- Name: currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currencies_id_seq OWNER TO postgres;

--
-- Name: currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.currencies_id_seq OWNED BY public.currencies.id;


--
-- Name: translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.translations (
    id bigint NOT NULL,
    account_from bigint NOT NULL,
    account_to bigint NOT NULL,
    amount bigint NOT NULL,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.translations OWNER TO postgres;

--
-- Name: translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.translations_id_seq OWNER TO postgres;

--
-- Name: translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.translations_id_seq OWNED BY public.translations.id;


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: banks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks ALTER COLUMN id SET DEFAULT nextval('public.banks_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: clients_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients_accounts ALTER COLUMN id SET DEFAULT nextval('public.banks_clients_id_seq'::regclass);


--
-- Name: currencies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies ALTER COLUMN id SET DEFAULT nextval('public.currencies_id_seq'::regclass);


--
-- Name: translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translations ALTER COLUMN id SET DEFAULT nextval('public.translations_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (id, number, bank_id, currency_id, amount) FROM stdin;
\.
COPY public.accounts (id, number, bank_id, currency_id, amount) FROM '$$PATH$$/3368.dat';

--
-- Data for Name: banks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banks (id, name, ind_commission, org_commission) FROM stdin;
\.
COPY public.banks (id, name, ind_commission, org_commission) FROM '$$PATH$$/3366.dat';

--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, name, individual) FROM stdin;
\.
COPY public.clients (id, name, individual) FROM '$$PATH$$/3359.dat';

--
-- Data for Name: clients_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients_accounts (id, client_id, account_id) FROM stdin;
\.
COPY public.clients_accounts (id, client_id, account_id) FROM '$$PATH$$/3358.dat';

--
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currencies (id, name) FROM stdin;
\.
COPY public.currencies (id, name) FROM '$$PATH$$/3361.dat';

--
-- Data for Name: translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.translations (id, account_from, account_to, amount, date) FROM stdin;
\.
COPY public.translations (id, account_from, account_to, amount, date) FROM '$$PATH$$/3360.dat';

--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_seq', 141, true);


--
-- Name: banks_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banks_clients_id_seq', 141, true);


--
-- Name: banks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banks_id_seq', 187, true);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 151, true);


--
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.currencies_id_seq', 3, true);


--
-- Name: translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.translations_id_seq', 76, true);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: clients_accounts banks_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients_accounts
    ADD CONSTRAINT banks_accounts_pkey PRIMARY KEY (id);


--
-- Name: banks banks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banks
    ADD CONSTRAINT banks_pkey PRIMARY KEY (id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- Name: translations translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translations
    ADD CONSTRAINT translations_pkey PRIMARY KEY (id);


--
-- Name: fki_accounts_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_accounts_fk ON public.clients_accounts USING btree (client_id);


--
-- Name: fki_accounts_fk_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_accounts_fk_1 ON public.translations USING btree (account_from);


--
-- Name: fki_banks_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_banks_fk ON public.clients_accounts USING btree (account_id);


--
-- Name: fki_clients_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_clients_fk ON public.clients_accounts USING btree (client_id);


--
-- Name: fki_currencies_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_currencies_fk ON public.accounts USING btree (currency_id);


--
-- Name: fki_t; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_t ON public.translations USING btree (account_to);


--
-- Name: clients_accounts account_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients_accounts
    ADD CONSTRAINT account_fk FOREIGN KEY (account_id) REFERENCES public.accounts(id) ON DELETE CASCADE;


--
-- Name: translations accounts_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translations
    ADD CONSTRAINT accounts_fk_1 FOREIGN KEY (account_from) REFERENCES public.accounts(id) ON DELETE CASCADE;


--
-- Name: translations accounts_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.translations
    ADD CONSTRAINT accounts_fk_2 FOREIGN KEY (account_to) REFERENCES public.accounts(id) ON DELETE CASCADE;


--
-- Name: accounts banks_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT banks_fk FOREIGN KEY (bank_id) REFERENCES public.banks(id) ON DELETE CASCADE;


--
-- Name: clients_accounts client_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients_accounts
    ADD CONSTRAINT client_fk FOREIGN KEY (client_id) REFERENCES public.clients(id) ON DELETE CASCADE;


--
-- Name: accounts currencies_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT currencies_fk FOREIGN KEY (currency_id) REFERENCES public.currencies(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
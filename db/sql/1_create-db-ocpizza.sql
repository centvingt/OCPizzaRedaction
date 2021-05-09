
CREATE SEQUENCE public.adresse_id_seq;

CREATE TABLE public.adresse (
                id INTEGER NOT NULL DEFAULT nextval('public.adresse_id_seq'),
                voie VARCHAR(200) NOT NULL,
                ville VARCHAR(100) NOT NULL,
                code_postal VARCHAR(5) NOT NULL,
                complement VARCHAR(1000),
                CONSTRAINT adresse_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.adresse_id_seq OWNED BY public.adresse.id;

CREATE SEQUENCE public.unite_de_mesure_id_seq;

CREATE TABLE public.unite_de_mesure (
                id INTEGER NOT NULL DEFAULT nextval('public.unite_de_mesure_id_seq'),
                libelle VARCHAR(10) NOT NULL,
                CONSTRAINT unite_de_mesure_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.unite_de_mesure_id_seq OWNED BY public.unite_de_mesure.id;

CREATE SEQUENCE public.client_id_seq;

CREATE TABLE public.client (
                id INTEGER NOT NULL DEFAULT nextval('public.client_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                telephone VARCHAR(10),
                adresse_id INTEGER,
                CONSTRAINT client_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;

CREATE TABLE public.client_compte (
                client_id INTEGER NOT NULL,
                email VARCHAR(100) NOT NULL,
                mot_de_passe VARCHAR NOT NULL,
                CONSTRAINT client_compte_pk PRIMARY KEY (client_id)
);


CREATE SEQUENCE public.commande_mode_de_livraison_id_seq;

CREATE TABLE public.commande_mode_de_livraison (
                id INTEGER NOT NULL DEFAULT nextval('public.commande_mode_de_livraison_id_seq'),
                libelle VARCHAR(20) NOT NULL,
                CONSTRAINT commande_mode_de_livraison_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.commande_mode_de_livraison_id_seq OWNED BY public.commande_mode_de_livraison.id;

CREATE SEQUENCE public.commande_mode_de_paiement_id_seq;

CREATE TABLE public.commande_mode_de_paiement (
                id INTEGER NOT NULL DEFAULT nextval('public.commande_mode_de_paiement_id_seq'),
                libelle VARCHAR(20) NOT NULL,
                CONSTRAINT commande_mode_de_paiement_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.commande_mode_de_paiement_id_seq OWNED BY public.commande_mode_de_paiement.id;

CREATE SEQUENCE public.commande_statut_id_seq;

CREATE TABLE public.commande_statut (
                id INTEGER NOT NULL DEFAULT nextval('public.commande_statut_id_seq'),
                libelle VARCHAR(20) NOT NULL,
                CONSTRAINT commande_statut_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.commande_statut_id_seq OWNED BY public.commande_statut.id;

CREATE SEQUENCE public.produit_id_seq;

CREATE TABLE public.produit (
                id INTEGER NOT NULL DEFAULT nextval('public.produit_id_seq'),
                nom VARCHAR(100) NOT NULL,
                unite_de_mesure_id INTEGER NOT NULL,
                CONSTRAINT produit_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.produit_id_seq OWNED BY public.produit.id;

CREATE TABLE public.ingredient (
                produit_id INTEGER NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (produit_id)
);


CREATE TABLE public.accompagnement (
                produit_id INTEGER NOT NULL,
                prix_de_vente_ttc NUMERIC(5,2) NOT NULL,
                image_uri VARCHAR(100) NOT NULL,
                CONSTRAINT accompagnement_pk PRIMARY KEY (produit_id)
);


CREATE SEQUENCE public.pizza_id_seq;

CREATE TABLE public.pizza (
                id INTEGER NOT NULL DEFAULT nextval('public.pizza_id_seq'),
                nom VARCHAR(100) NOT NULL,
                image_uri VARCHAR(100) NOT NULL,
                prix_de_vente_ttc NUMERIC(5,2) NOT NULL,
                recette VARCHAR(2000) NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.pizza_id_seq OWNED BY public.pizza.id;

CREATE TABLE public.pizza_composition (
                pizza_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantite NUMERIC(10,2) NOT NULL,
                CONSTRAINT pizza_composition_pk PRIMARY KEY (pizza_id, ingredient_id)
);


CREATE SEQUENCE public.pizzeria_id_seq;

CREATE TABLE public.pizzeria (
                id INTEGER NOT NULL DEFAULT nextval('public.pizzeria_id_seq'),
                nom VARCHAR(100) NOT NULL,
                adresse_id INTEGER NOT NULL,
                CONSTRAINT pizzeria_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.pizzeria_id_seq OWNED BY public.pizzeria.id;

CREATE TABLE public.pizzeria_stock_ingredient (
                pizzeria_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantite NUMERIC(20,3) NOT NULL,
                CONSTRAINT pizzeria_stock_ingredient_pk PRIMARY KEY (pizzeria_id, ingredient_id)
);


CREATE SEQUENCE public.commande_numero_seq;

CREATE TABLE public.commande (
                numero INTEGER NOT NULL DEFAULT nextval('public.commande_numero_seq'),
                date_de_creation TIMESTAMP NOT NULL,
                date_de_preparation TIMESTAMP,
                date_de_cloture TIMESTAMP,
                pizzeria_id INTEGER NOT NULL,
                mode_de_paiement_id INTEGER NOT NULL,
                mode_de_livraison_id INTEGER NOT NULL,
                statut_id INTEGER NOT NULL,
                client_id INTEGER,
                CONSTRAINT commande_pk PRIMARY KEY (numero)
);


ALTER SEQUENCE public.commande_numero_seq OWNED BY public.commande.numero;

CREATE TABLE public.accompagnement_commande (
                numero_de_commande INTEGER NOT NULL,
                accompagnement_id INTEGER NOT NULL,
                quantite NUMERIC(20,3) NOT NULL,
                CONSTRAINT accompagnement_commande_pk PRIMARY KEY (numero_de_commande, accompagnement_id)
);


CREATE TABLE public.pizza_commandee (
                numero_de_commande INTEGER NOT NULL,
                pizza_id INTEGER NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT pizza_commandee_pk PRIMARY KEY (numero_de_commande, pizza_id)
);


CREATE SEQUENCE public.employe_id_seq;

CREATE TABLE public.employe (
                id INTEGER NOT NULL DEFAULT nextval('public.employe_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                email VARCHAR(100) NOT NULL,
                mot_de_passe VARCHAR(20) NOT NULL,
                is_admin BOOLEAN DEFAULT FALSE NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                CONSTRAINT employe_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.employe_id_seq OWNED BY public.employe.id;

CREATE TABLE public.commande_retiree (
                numero_de_commande INTEGER NOT NULL,
                employe_id INTEGER NOT NULL,
                CONSTRAINT commande_retiree_pk PRIMARY KEY (numero_de_commande, employe_id)
);


CREATE TABLE public.pizzaiolo (
                employe_id INTEGER NOT NULL,
                CONSTRAINT pizzaiolo_pk PRIMARY KEY (employe_id)
);


CREATE TABLE public.commande_preparation (
                numero_de_commande INTEGER NOT NULL,
                pizzaiolo_id INTEGER NOT NULL,
                CONSTRAINT commande_preparation_pk PRIMARY KEY (numero_de_commande, pizzaiolo_id)
);


CREATE TABLE public.livreur (
                employe_id INTEGER NOT NULL,
                CONSTRAINT livreur_pk PRIMARY KEY (employe_id)
);


CREATE TABLE public.commande_livreur (
                numero_de_commande INTEGER NOT NULL,
                livreur_id INTEGER NOT NULL,
                CONSTRAINT commande_livreur_pk PRIMARY KEY (numero_de_commande, livreur_id)
);


CREATE TABLE public.pizzeria_stock_accompagnement (
                pizzeria_id INTEGER NOT NULL,
                accompagnement_id INTEGER NOT NULL,
                quantite NUMERIC(20,3) NOT NULL,
                CONSTRAINT pizzeria_stock_accompagnement_pk PRIMARY KEY (pizzeria_id, accompagnement_id)
);


ALTER TABLE public.client ADD CONSTRAINT adresse_client_fk
FOREIGN KEY (adresse_id)
REFERENCES public.adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizzeria ADD CONSTRAINT adresse_pizzeria_fk
FOREIGN KEY (adresse_id)
REFERENCES public.adresse (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.produit ADD CONSTRAINT unite_de_mesure_produit_fk
FOREIGN KEY (unite_de_mesure_id)
REFERENCES public.unite_de_mesure (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (client_id)
REFERENCES public.client (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.client_compte ADD CONSTRAINT client_client_compte_fk
FOREIGN KEY (client_id)
REFERENCES public.client (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT commande_mode_de_livraison_commande_fk
FOREIGN KEY (mode_de_livraison_id)
REFERENCES public.commande_mode_de_livraison (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT commande_mode_de_paiement_commande_fk
FOREIGN KEY (mode_de_paiement_id)
REFERENCES public.commande_mode_de_paiement (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT commande_statut_commande_fk
FOREIGN KEY (statut_id)
REFERENCES public.commande_statut (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.accompagnement ADD CONSTRAINT produit_accompagnement_fk
FOREIGN KEY (produit_id)
REFERENCES public.produit (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ingredient ADD CONSTRAINT produit_ingredient_fk
FOREIGN KEY (produit_id)
REFERENCES public.produit (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizzeria_stock_ingredient ADD CONSTRAINT ingredient_pizzeria_stock_ingredient_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (produit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza_composition ADD CONSTRAINT ingredient_pizza_composition_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (produit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizzeria_stock_accompagnement ADD CONSTRAINT accompagnement_pizzeria_stock_accompagnement_fk
FOREIGN KEY (accompagnement_id)
REFERENCES public.accompagnement (produit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.accompagnement_commande ADD CONSTRAINT accompagnement_accompagnement_commande_fk
FOREIGN KEY (accompagnement_id)
REFERENCES public.accompagnement (produit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza_composition ADD CONSTRAINT pizza_pizza_composition_fk
FOREIGN KEY (pizza_id)
REFERENCES public.pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza_commandee ADD CONSTRAINT pizza_pizza_commandee_fk
FOREIGN KEY (pizza_id)
REFERENCES public.pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizzeria_stock_accompagnement ADD CONSTRAINT pizzeria_pizzeria_stock_accompagnement_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.employe ADD CONSTRAINT pizzeria_employe_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande ADD CONSTRAINT pizzeria_commande_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizzeria_stock_ingredient ADD CONSTRAINT pizzeria_pizzeria_stock_ingredient_fk
FOREIGN KEY (pizzeria_id)
REFERENCES public.pizzeria (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande_livreur ADD CONSTRAINT commande_commande_livreur_fk
FOREIGN KEY (numero_de_commande)
REFERENCES public.commande (numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande_retiree ADD CONSTRAINT commande_commande_retiree_fk
FOREIGN KEY (numero_de_commande)
REFERENCES public.commande (numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande_preparation ADD CONSTRAINT commande_commande_preparation_fk
FOREIGN KEY (numero_de_commande)
REFERENCES public.commande (numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza_commandee ADD CONSTRAINT commande_pizza_commandee_fk
FOREIGN KEY (numero_de_commande)
REFERENCES public.commande (numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.accompagnement_commande ADD CONSTRAINT commande_accompagnement_commande_fk
FOREIGN KEY (numero_de_commande)
REFERENCES public.commande (numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.livreur ADD CONSTRAINT employe_livreur_fk
FOREIGN KEY (employe_id)
REFERENCES public.employe (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizzaiolo ADD CONSTRAINT employe_pizzaiolo_fk
FOREIGN KEY (employe_id)
REFERENCES public.employe (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande_retiree ADD CONSTRAINT employe_commande_retiree_fk
FOREIGN KEY (employe_id)
REFERENCES public.employe (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande_preparation ADD CONSTRAINT pizzaiolo_commande_preparation_fk
FOREIGN KEY (pizzaiolo_id)
REFERENCES public.pizzaiolo (employe_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commande_livreur ADD CONSTRAINT livreur_commande_livreur_fk
FOREIGN KEY (livreur_id)
REFERENCES public.livreur (employe_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
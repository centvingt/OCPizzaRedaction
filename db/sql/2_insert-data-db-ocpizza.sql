BEGIN TRANSACTION;

-- ==================================================================
-- commande_mode_de_paiement
-- ==================================================================
	INSERT INTO public.commande_mode_de_paiement (id, libelle) VALUES (	1,	'À la livraison'	);
	INSERT INTO public.commande_mode_de_paiement (id, libelle) VALUES (	2,	'En ligne'	);
	INSERT INTO public.commande_mode_de_paiement (id, libelle) VALUES (	3,	'Sur place'	);
	
	SELECT setval('public.commande_mode_de_paiement_id_seq', 3, true);

-- ==================================================================
-- commande_mode_de_livraison
-- ==================================================================
	INSERT INTO public.commande_mode_de_livraison (id, libelle) VALUES (	1,	'Livraison à domicile'	);
	INSERT INTO public.commande_mode_de_livraison (id, libelle) VALUES (	2,	'Retrait sur place'	);

	SELECT setval('public.commande_mode_de_livraison_id_seq', 2, true);

-- ==================================================================
-- commande_statut
-- ==================================================================
	INSERT INTO public.commande_statut (id, libelle) VALUES (	1,	'Reçue'	);
	INSERT INTO public.commande_statut (id, libelle) VALUES (	2,	'En préparation'	);
	INSERT INTO public.commande_statut (id, libelle) VALUES (	3,	'Prête'	);
	INSERT INTO public.commande_statut (id, libelle) VALUES (	4,	'En livraison'	);
	INSERT INTO public.commande_statut (id, libelle) VALUES (	5,	'Livrée'	);
	INSERT INTO public.commande_statut (id, libelle) VALUES (	6,	'Retirée'	);
	INSERT INTO public.commande_statut (id, libelle) VALUES (	7,	'Annulée'	);

	SELECT setval('public.commande_statut_id_seq', 7, true);

-- ==================================================================
-- unite_de_mesure
-- ==================================================================
	INSERT INTO public.unite_de_mesure (id, libelle) VALUES (		1,	'pièce(s)'	);
	INSERT INTO public.unite_de_mesure (id, libelle) VALUES (	2,	'gramme(s)'	);
	INSERT INTO public.unite_de_mesure (id, libelle) VALUES (	3,	'litre(s)'	);

	SELECT setval('public.unite_de_mesure_id_seq', 3, true);

-- ==================================================================
-- adresse
-- ==================================================================
	INSERT 
		INTO public.adresse (id, voie, ville, code_postal, complement) 
		VALUES (1, '46, boulevard de La Villette', 'Paris', '75019', NULL);

	INSERT 
		INTO public.adresse (id, voie, ville, code_postal, complement) 
		VALUES (2, '12, boulevard Richard-Lenoir', 'Paris', '75011', NULL);

	INSERT 
		INTO public.adresse (id, voie, ville, code_postal, complement) 
		VALUES (3, '156, boulevard Auguste Blanqui', 'Paris', '75013', NULL);

	INSERT 
		INTO public.adresse (id, voie, ville, code_postal, complement) 
		VALUES (4, '12, avenue Gambetta', 'Paris', '75020', 'Digicode 1234B');

	INSERT 
		INTO public.adresse (id, voie, ville, code_postal, complement) 
		VALUES (5, '6, avenue de Flandre', 'Paris', '75019', NULL);

	INSERT 
		INTO public.adresse (id, voie, ville, code_postal, complement) 
		VALUES (6, '18, rue de la Butte-aux-cailles', 'Paris', '75013', NULL);

	SELECT setval('public.adresse_id_seq', 3, true);

-- ==================================================================
-- pizzeria
-- ==================================================================
	INSERT INTO public.pizzeria (id, nom, adresse_id) VALUES (1, 'Stalingrad', 1);
	INSERT INTO public.pizzeria (id, nom, adresse_id) VALUES (2,'Bastille', 2);
	INSERT INTO public.pizzeria (id, nom, adresse_id) VALUES (3, 'Place d’Italie', 3);

	SELECT setval('public.pizzeria_id_seq', 3, true);

-- ==================================================================
-- pizza
-- ==================================================================
	INSERT 
		INTO public.pizza (
				id, nom, prix_de_vente_ttc, image_uri,
				recette
			) 
		VALUES (
				1, 'Margherita', 12.5, 'margherita.jpg',
				'Pizza ipsum dolor amet beef pepperoni onions chicken wing hawaiian white garlic stuffed crust. Melted cheese bianca bbq rib chicken wing chicken and bacon, white pizza meat lovers banana peppers philly steak ricotta burnt mouth. Peppers banana peppers red onions, burnt mouth spinach stuffed mayo. Peppers parmesan broccoli pie melted cheese, pepperoni platter black olives chicken wing. Sauteed onions chicken pesto, meatball meat lovers Chicago style bbq rib pepperoni.'
			);

	INSERT 
		INTO public.pizza (
				id, nom, prix_de_vente_ttc, image_uri,
				recette
			) 
		VALUES (
				2, 'Quatre saisons', 14.5, 'quatre-saisons.jpg',
				'Pizza ipsum dolor amet broccoli sausage hawaiian chicken and bacon, stuffed large pan banana peppers NY style bacon. Sauteed onions extra cheese stuffed crust ricotta bbq rib stuffed. Sauteed onions large meatball, ham spinach pizza roll hand tossed bacon & tomato. Fresh tomatoes hand tossed platter spinach chicken wing bbq sauce extra cheese pan, philly steak melted cheese pizza. Pepperoni green bell peppers red onions, mushrooms banana peppers thin crust chicken and bacon sausage bacon ranch.'
			);

	INSERT 
		INTO public.pizza (
				id, nom, prix_de_vente_ttc, image_uri,
				recette
			) 
		VALUES (
				3, 'Napolitaine', 13.5, 'napolitaine.jpg',
				'Pizza ipsum dolor amet melted cheese marinara philly chicken deep crust peppers fresh tomatoes burnt mouth bacon & tomato party string cheese chicken wing. Red onions pan bianca, sausage banana peppers platter meatball pineapple large. Bacon & tomato beef pineapple bbq stuffed, extra sauce black olives burnt mouth chicken wing anchovies. Pizza white garlic red onions stuffed crust pepperoni. Garlic sauce buffalo sauce white pizza ranch sauteed onions, meat lovers bbq sauce deep crust banana peppers pizza pineapple mayo green bell peppers onions philly steak. Parmesan bbq sauce mayo bbq rib chicken wing philly chicken pineapple white pizza stuffed crust. Meat lovers platter pan, garlic parmesan meatball party peppers ham sausage ricotta sausage philly chicken garlic sauce.'
			);

	INSERT 
		INTO public.pizza (
				id, nom, prix_de_vente_ttc, image_uri,
				recette
			) 
		VALUES (
				4, 'Quatre fromages', 13.5, 'quatre-fromages.jpg',
				'Pizza ipsum dolor amet bbq large pesto ham white pizza pineapple. Mushrooms philly steak green bell peppers steak pizza roll sausage mayo Chicago style pepperoni large burnt mouth. Pork hawaiian broccoli garlic parmesan pepperoni personal beef. Sausage sauteed onions platter mushrooms ricotta thin crust philly chicken marinara anchovies pepperoni pizza meat lovers. Beef pizza extra cheese pepperoni meatball peppers stuffed crust pizza roll bacon & tomato sauteed onions spinach thin crust onions meatball. Pineapple pepperoni mozzarella personal sausage meat lovers string cheese hand tossed meatball fresh tomatoes hawaiian white garlic stuffed crust.'
			);

	INSERT 
		INTO public.pizza (
				id, nom, prix_de_vente_ttc, image_uri,
				recette
			) 
		VALUES (
				5, 'Calzone', 14.5, 'calzone.jpg',
				'Pizza ipsum dolor amet party broccoli garlic sauce, sausage buffalo sauce bbq deep crust spinach bacon pineapple. Pork thin crust ricotta stuffed, steak red onions bbq bacon & tomato platter chicken wing extra sauce ranch white garlic beef. Hand tossed spinach party white pizza, bbq pepperoni NY style onions. Steak pork platter broccoli bianca chicken.'
			);

	SELECT setval('public.pizza_id_seq', 5, true);

-- ==================================================================
-- produit
-- ==================================================================
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (1, 'Pâte à pizza', 1);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (2, 'Œuf', 1);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (3, 'Huile d’olive', 3);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (4, 'Sauce tomate', 2);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (5, 'Mozzarella', 2);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (6, 'Gorgonzola', 2);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (7, 'Fontina', 2);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (8, 'Parmesan', 2);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (9, 'Origan', 2);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (10, 'Anchois', 2);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (11, 'Jambon cuit', 2);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (12, 'Artichauts', 2);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (13, 'Champignons de Paris', 2);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (14, 'Olives noires', 2);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (15, 'Canette Coca Cola', 1);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (16, 'Bouteille Coca Cola', 1);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (17, 'Tiramitsu', 1);
	INSERT INTO public.produit (id, nom, unite_de_mesure_id) VALUES (18, 'Crème au chocolat', 1);

	SELECT setval('public.produit_id_seq', 18, true);

-- ==================================================================
-- ingredient
-- ==================================================================
	INSERT INTO public.ingredient (produit_id) VALUES (1);
	INSERT INTO public.ingredient (produit_id) VALUES (2);
	INSERT INTO public.ingredient (produit_id) VALUES (3);
	INSERT INTO public.ingredient (produit_id) VALUES (4);
	INSERT INTO public.ingredient (produit_id) VALUES (5);
	INSERT INTO public.ingredient (produit_id) VALUES (6);
	INSERT INTO public.ingredient (produit_id) VALUES (7);
	INSERT INTO public.ingredient (produit_id) VALUES (8);
	INSERT INTO public.ingredient (produit_id) VALUES (9);
	INSERT INTO public.ingredient (produit_id) VALUES (10);
	INSERT INTO public.ingredient (produit_id) VALUES (11);
	INSERT INTO public.ingredient (produit_id) VALUES (12);
	INSERT INTO public.ingredient (produit_id) VALUES (13);
	INSERT INTO public.ingredient (produit_id) VALUES (14);


-- ==================================================================
-- pizza_composition
-- ==================================================================
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (1, 1, 1);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (1, 4, 50);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (1, 5, 100);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (1, 10, 25);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (1, 14, 10);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (2, 1, 1);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (2, 12, 75);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (2, 9, 20);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (2, 13, 20);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (2, 14, 30);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (3, 1, 1);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (3, 4, 50);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (3, 3, 0.1);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (3, 11, 50);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (3, 14, 10);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (4, 1, 1);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (4, 5, 50);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (4, 6, 50);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (4, 7, 50);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (4, 8, 50);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (5, 1, 1);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (5, 2, 2);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (5, 11, 100);
	INSERT INTO public.pizza_composition (pizza_id, ingredient_id, quantite) VALUES (5, 5, 50);

-- ==================================================================
-- accompagnement
-- ==================================================================
	INSERT INTO public.accompagnement (produit_id, prix_de_vente_ttc, image_uri) VALUES (15, 2.5, 'canette-coca.jpg');
	INSERT INTO public.accompagnement (produit_id, prix_de_vente_ttc, image_uri) VALUES (16, 5, 'bouteille-coca.jpg');
	INSERT INTO public.accompagnement (produit_id, prix_de_vente_ttc, image_uri) VALUES (17, 6.5, 'tiramitsu.jpg');
	INSERT INTO public.accompagnement (produit_id, prix_de_vente_ttc, image_uri) VALUES (18, 3.75, 'creme-chocolat.jpg');

-- ==================================================================
-- pizzeria_stock_ingredient
-- ==================================================================
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (1, 1, 100);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (1, 2, 86);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (1, 3, 10);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (1, 4, 1200);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (1, 5, 4500);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (1, 6, 800);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (1, 7, 300);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (1, 8, 650);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (1, 9, 100);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (1, 10, 800);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (1, 11, 3000);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (1, 12, 5000);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (1, 13, 260);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (1, 14, 800);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (2, 1, 110);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (2, 2, 87);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (2, 3, 11);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (2, 4, 1300);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (2, 5, 4600);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (2, 6, 900);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (2, 7, 400);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (2, 8, 750);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (2, 9, 200);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (2, 10, 900);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (2, 11, 4000);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (2, 12, 6000);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (2, 13, 360);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (2, 14, 900);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (3, 1, 120);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (3, 2, 88);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (3, 3, 12);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (3, 4, 1400);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (3, 5, 4700);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (3, 6, 1000);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (3, 7, 500);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (3, 8, 850);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (3, 9, 300);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (3, 10, 1000);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (3, 11, 4100);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (3, 12, 6100);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (3, 13, 370);
	INSERT INTO public.pizzeria_stock_ingredient (pizzeria_id, ingredient_id, quantite) VALUES (3, 14, 1000);

-- ==================================================================
-- pizzeria_stock_accompagnement
-- ==================================================================
	INSERT INTO public.pizzeria_stock_accompagnement (pizzeria_id, accompagnement_id, quantite) VALUES (1, 15, 20);
	INSERT INTO public.pizzeria_stock_accompagnement (pizzeria_id, accompagnement_id, quantite) VALUES (1, 16, 30);
	INSERT INTO public.pizzeria_stock_accompagnement (pizzeria_id, accompagnement_id, quantite) VALUES (1, 17, 40);
	INSERT INTO public.pizzeria_stock_accompagnement (pizzeria_id, accompagnement_id, quantite) VALUES (1, 18, 50);
	INSERT INTO public.pizzeria_stock_accompagnement (pizzeria_id, accompagnement_id, quantite) VALUES (2, 15, 21);
	INSERT INTO public.pizzeria_stock_accompagnement (pizzeria_id, accompagnement_id, quantite) VALUES (2, 16, 31);
	INSERT INTO public.pizzeria_stock_accompagnement (pizzeria_id, accompagnement_id, quantite) VALUES (2, 17, 41);
	INSERT INTO public.pizzeria_stock_accompagnement (pizzeria_id, accompagnement_id, quantite) VALUES (2, 18, 51);
	INSERT INTO public.pizzeria_stock_accompagnement (pizzeria_id, accompagnement_id, quantite) VALUES (3, 15, 22);
	INSERT INTO public.pizzeria_stock_accompagnement (pizzeria_id, accompagnement_id, quantite) VALUES (3, 16, 32);
	INSERT INTO public.pizzeria_stock_accompagnement (pizzeria_id, accompagnement_id, quantite) VALUES (3, 17, 42);
	INSERT INTO public.pizzeria_stock_accompagnement (pizzeria_id, accompagnement_id, quantite) VALUES (3, 18, 52);

-- ==================================================================
-- client
-- ==================================================================
	INSERT 
		INTO public.client (id, nom, prenom, telephone, adresse_id) 
		VALUES (1, 'Garnier', 'Jérôme', NULL, 4);
			
	INSERT 
		INTO public.client (id, nom, prenom, telephone, adresse_id) 
		VALUES (2, 'Djamel', 'El-Mani', NULL, 5);

	INSERT 
		INTO public.client (id, nom, prenom, telephone, adresse_id) 
		VALUES (3, 'Louise', 'Marionaud', '0677889900', 6);

	SELECT setval('public.client_id_seq', 3, true);

-- ==================================================================
-- client_compte
-- ==================================================================
	INSERT INTO public.client_compte (client_id, email, mot_de_passe) VALUES (1, 'jerome@gmail.com', 'azerty');
	INSERT INTO public.client_compte (client_id, email, mot_de_passe) VALUES (2, 'djamel@gmail.com', 'aze123');

-- ==================================================================
-- employe
-- ==================================================================
	INSERT 
		INTO public.employe (
				id, nom, prenom,
				email, mot_de_passe,
				is_admin,
				pizzeria_id
			) 
		VALUES (
				1, 'Lola', 'Jonvoint', 
				'lola@ocpizza.fr', 'azerty',
				TRUE, 1
			);

	INSERT 
		INTO public.employe (
				id, nom, prenom,
				email, mot_de_passe,
				is_admin,
				pizzeria_id
			) 
		VALUES (
				2, 'Franck', 'Jonvoint', 
				'franck@ocpizza.fr', 'azerty',
				TRUE, 1
			);

	INSERT 
		INTO public.employe (
				id, nom, prenom,
				email, mot_de_passe,
				is_admin,
				pizzeria_id
			) 
		VALUES (
				3, 'Joël', 'Loretto', 
				'joel@ocpizza.fr', 'azerty',
				FALSE, 1
			);

	INSERT 
		INTO public.employe (
				id, nom, prenom,
				email, mot_de_passe,
				is_admin,
				pizzeria_id
			) 
		VALUES (
				4, 'Jessim', 'Azir', 
				'jessim@ocpizza.fr', 'azerty',
				FALSE, 2
			);

	INSERT 
		INTO public.employe (
				id, nom, prenom,
				email, mot_de_passe,
				is_admin,
				pizzeria_id
			) 
		VALUES (
				5, 'Lauria', 'Bonami', 
				'lauria@ocpizza.fr', 'azerty',
				FALSE, 2
			);

	INSERT 
		INTO public.employe (
				id, nom, prenom,
				email, mot_de_passe,
				is_admin,
				pizzeria_id
			) 
		VALUES (
				6, 'Moussa', 'Kamara', 
				'moussa@ocpizza.fr', 'azerty',
				FALSE, 3
			);

	INSERT 
		INTO public.employe (
				id, nom, prenom,
				email, mot_de_passe,
				is_admin,
				pizzeria_id
			) 
		VALUES (
				7, 'Mahmoud', 'Kosso', 
				'mahmoud@ocpizza.fr', 'azerty',
				FALSE, 3
			);

	INSERT 
		INTO public.employe (
				id, nom, prenom,
				email, mot_de_passe,
				is_admin,
				pizzeria_id
			) 
		VALUES (
				8, 'Rémy', 'Vaurier', 
				'remy@ocpizza.fr', 'azerty',
				FALSE, 3
			);

	SELECT setval('public.employe_id_seq', 8, true);

-- ==================================================================
-- livreur
-- ==================================================================
	INSERT INTO public.livreur (employe_id) VALUES (3);
	INSERT INTO public.livreur (employe_id) VALUES (5);
	INSERT INTO public.livreur (employe_id) VALUES (7);
	INSERT INTO public.livreur (employe_id) VALUES (8);

-- ==================================================================
-- pizzaiolo
-- ==================================================================
	INSERT INTO public.pizzaiolo (employe_id) VALUES (2);
	INSERT INTO public.pizzaiolo (employe_id) VALUES (4);
	INSERT INTO public.pizzaiolo (employe_id) VALUES (6);

-- ==================================================================
-- commande
-- ==================================================================
	INSERT 
		INTO public.commande (
				numero,
				date_de_creation,
				date_de_preparation,
				date_de_cloture,
				client_id, pizzeria_id,
				mode_de_paiement_id, mode_de_livraison_id,
				statut_id
			) 
		VALUES (
				1,
				'2021-05-08 12:34:00',
				'2021-05-08 12:45:00',
				'2021-05-08 13:00:00',
				NULL, 1,
				3, 2,
				6
			);

	INSERT 
		INTO public.commande (
				numero,
				date_de_creation,
				date_de_preparation,
				date_de_cloture,
				client_id, pizzeria_id,
				mode_de_paiement_id, mode_de_livraison_id,
				statut_id
			) 
		VALUES (
				2,
				'2021-05-08 13:34:00',
				'2021-05-08 13:45:00',
				'2021-05-08 14:00:00',
				1, 2,
				2, 1,
				5
			);

	INSERT 
		INTO public.commande (
				numero,
				date_de_creation,
				date_de_preparation,
				date_de_cloture,
				client_id, pizzeria_id,
				mode_de_paiement_id, mode_de_livraison_id,
				statut_id
			) 
		VALUES (
				3,
				'2021-05-08 14:34:00',
				'2021-05-08 14:45:00',
				NULL,
				2, 3,
				1, 1,
				4
			);

	SELECT setval('public.commande_numero_seq', 3, true);

-- ==================================================================
-- pizza_commandee
-- ==================================================================
	INSERT INTO public.pizza_commandee (numero_de_commande, pizza_id, quantite) VALUES (1, 1, 3);
	INSERT INTO public.pizza_commandee (numero_de_commande, pizza_id, quantite) VALUES (1, 2, 1);
	INSERT INTO public.pizza_commandee (numero_de_commande, pizza_id, quantite) VALUES (2, 3, 1);
	INSERT INTO public.pizza_commandee (numero_de_commande, pizza_id, quantite) VALUES (3, 4, 2);

-- ==================================================================
-- accompagnement_commande
-- ==================================================================
	INSERT INTO public.accompagnement_commande (numero_de_commande, accompagnement_id, quantite) VALUES (1, 15, 3);
	INSERT INTO public.accompagnement_commande (numero_de_commande, accompagnement_id, quantite) VALUES (1, 16, 1);
	INSERT INTO public.accompagnement_commande (numero_de_commande, accompagnement_id, quantite) VALUES (3, 17, 2);

-- ==================================================================
-- commande_retiree
-- ==================================================================
	INSERT INTO public.commande_retiree (numero_de_commande, employe_id) VALUES (1, 1);

-- ==================================================================
-- commande_livreur
-- ==================================================================
	INSERT INTO public.commande_livreur (numero_de_commande, livreur_id) VALUES (2, 5);
	INSERT INTO public.commande_livreur (numero_de_commande, livreur_id) VALUES (3, 8);

-- ==================================================================
-- commande_preparation
-- ==================================================================
	INSERT INTO public.commande_preparation (numero_de_commande, pizzaiolo_id) VALUES (1, 2);
	INSERT INTO public.commande_preparation (numero_de_commande, pizzaiolo_id) VALUES (2, 4);
	INSERT INTO public.commande_preparation (numero_de_commande, pizzaiolo_id) VALUES (3, 6);

COMMIT;

BEGIN TRANSACTION;

-- ==================================================================
-- Purge des tables
-- ==================================================================
	DELETE FROM public.commande_preparation;
	DELETE FROM public.commande_livreur;
	DELETE FROM public.commande_retiree;
	DELETE FROM public.accompagnement_commande;
	DELETE FROM public.pizza_commandee;
	DELETE FROM public.commande;
	DELETE FROM public.pizzaiolo;
	DELETE FROM public.livreur;
	DELETE FROM public.employe;
	DELETE FROM public.client_compte;
	DELETE FROM public.client;
	DELETE FROM public.pizzeria_stock_accompagnement;
	DELETE FROM public.pizzeria_stock_ingredient;
	DELETE FROM public.accompagnement;
	DELETE FROM public.pizza_composition;
	DELETE FROM public.ingredient;
	DELETE FROM public.produit;
	DELETE FROM public.pizza;
	DELETE FROM public.pizzeria;
	DELETE FROM public.unite_de_mesure;
	DELETE FROM public.commande_statut;
	DELETE FROM public.commande_mode_de_livraison;
	DELETE FROM public.commande_mode_de_paiement;




-- ==================================================================
-- Réinitialisation des séquences
-- ==================================================================
	SELECT setval('public.commande_mode_de_paiement_id_seq', 1, false);
	SELECT setval('public.commande_mode_de_livraison_id_seq', 1, false);
	SELECT setval('public.commande_statut_id_seq', 1, false);
	SELECT setval('public.unite_de_mesure_id_seq', 1, false);
	SELECT setval('public.pizzeria_id_seq', 1, false);
	SELECT setval('public.pizza_id_seq', 1, false);
	SELECT setval('public.produit_id_seq', 1, false);
	SELECT setval('public.client_id_seq', 1, false);
	SELECT setval('public.employe_id_seq', 1, false);
	SELECT setval('public.commande_numero_seq', 1, false);

COMMIT;
